<%!
    import six
    import time
    import json
    import functools
    from hashlib import md5

    INT_TYPES = [
        'uint32', 'int32', 'uint64', 'int64', 'sint32',
        'sint64', 'fixed32', 'fixed64', 'sfixed32',
        'sfixed64'
    ]
    BOOL_TYPES = ['boolean', 'bool']
    FLOAT_TYPES = ['float', 'double']
    DATETIME_TYPES = ['date', 'datetime']

    def xmd5(data):
        if isinstance(data, six.string_types):
            data = data.encode('utf8')

        if not isinstance(data, six.binary_type):
            raise TypeError('md5 data invaild')

        m = md5(data)
        return m.hexdigest()

    def get_default(DATA_MAP, data, ignore_list=False):
        _type = data['type']
        repeated = data['options']['label'] == 'repeated'
        if not ignore_list and repeated:
            return [
                get_default(DATA_MAP, data, True)
            ]

        elif _type in INT_TYPES:
            return 0

        elif _type in FLOAT_TYPES:
            return 0.0

        elif _type == 'string':
            return ''

        elif _type == 'date':
            return '1900-01-01'

        elif _type == 'datetime':
            return '1900-01-01 00:00:00'

        elif _type == 'bytes':
            return ''

        elif _type in BOOL_TYPES:
            return False

        elif _type == 'message':
            fclass = DATA_MAP[data['options']['type_name']]
            return {
                _key: get_default(DATA_MAP, _val)
                for _key, _val in fclass['fields'].items()
            }

        elif _type == 'enum':
            return 0

        else:
            raise TypeError('[{}]type error'.format(_type))

    def get_default_field(DATA_MAP, data):
        data = get_default(DATA_MAP, data)
        if isinstance(data, (list, dict)):
            return json.dumps(data)
        elif isinstance(data, bool):
            return 'true' if data else 'false'
        else:
            return str(data)

    def fmt_xml(DATA_MAP, datas):
        _xml = '<?xml version="1.0" encoding="UTF-8"?><note>{0}</note>'
        fields = ''.join(['<{key}>{val}</{key}>'.format(key, get_default(DATA_MAP, val)) for key, val in datas.items()])
        return _xml.format(fields)

    def mime_type(_type):
        BURLENCODE = 'BURLENCODE'
        BJSON = 'BJSON'
        BXML = 'BXML'
        BYAML = 'BYAML'

        if _type == BJSON:
            return "application/json"

        elif _type == BXML:
            return "application/xml"

        elif _type == BYAML:
            return "application/x-yaml"

        else:
            return "application/x-www-form-urlencoded"

    def mime_data(DATA_MAP, _id, _type, _datas):
        BURLENCODE = 'BURLENCODE'
        BJSON = 'BJSON'
        BXML = 'BXML'
        BYAML = 'BYAML'

        if _type == BJSON:
            return {
                "mimeType": "application/json",
                "text": json.dumps({
                    key: get_default(DATA_MAP, val)
                    for key, val in _datas.items()
                }, indent=2)
            }

        elif _type == BXML:
            return {
                "mimeType": "application/json",
                "text": fmt_xml(DATA_MAP, _datas)
            }

        ## elif _type == BYAML:
        ##     return "application/x-yaml"
        ##     return {
        ##         "mimeType": "application/x-yaml",
        ##         "text": fmt_xml(_datas)
        ##     }

        else:
            return {
                "mimeType": "application/x-www-form-urlencoded",
                "params": [
					{
						"name": key,
						"value": get_default(DATA_MAP, val),
						"id": "pair_" + xmd5(_id + key),
						"disabled": false
					}
                    for key, val in _datas.items()
				]
            }

    def fmt_path(parentid, _id, _path, name):
        return {
            "_id": _id,
            "parentId": parentid,
            "modified": int(time.time()),
            "created": int(time.time()),
            "name": name,
            "description": "path",
            "environment": {},
            "metaSortKey": '[PATH]' + _path,
            "_type": "request_group"
        }

    def get_field(DATA_MAP, data, field_key):
        field = data['fields'].get(field_key, {})
        if field:
            field = DATA_MAP.get(field['options']['type_name'], None)
            if not field:
                raise TypeError(field_key +'define not found')

            field = field.get('fields', {})

        return field

    def fmt_req_api(DATA_MAP, parentid, _id, _path, domain_key, data, mdgenerate):
        headers = get_field(DATA_MAP, data, 'headers')
        querys = get_field(DATA_MAP, data, 'querys')
        req_body = get_field(DATA_MAP, data, 'req_body')
        rsp_body = get_field(DATA_MAP, data, 'rsp_body')
        return {
            "_id": _id,
            "parentId": parentid,
            "modified": int(time.time()),
            "created": int(time.time()),
            "url": "{{" + domain_key + "}}/symbol/delete",
            "name": data['options']['rpath'].split('/')[-1],
            "description": mdgenerate(
                mkdata=data,
                headers=headers,
                querys=querys,
                req_body=req_body,
                rsp_body=rsp_body,
                DATA_MAP=DATA_MAP,
                get_default_field=get_default_field,
            ),
            "method": data['options']['rmethod'][1:],
            "body": mime_data(DATA_MAP, _id, data['options']['rbody'], req_body),
            "parameters": [
                {
					## "description": "",
					"id": "pair_" + xmd5(_id + 'p' + str(i)),
					"name": keyval[0],
					"value": str(get_default_field(DATA_MAP, keyval[1]))
				}
                for i, keyval in enumerate(querys.items())
            ],
            "headers": [
                {
                    "name": "Content-Type",
                    "value": mime_type(data['options']['rbody']),
                    "id": "pair_" + xmd5(_id + 'ct')
                },
                {
                    "name": "Accept-Language",
                    "value": "{{lang}}",
                    "id": "pair_" + xmd5(_id + 'al')
                }
            ] + [
                {
                    "name": keyval[0],
                    "value": str(get_default_field(DATA_MAP, keyval[1])),
                    "id": "pair_" + xmd5(_id + 'h' + str(i))
                }
                for i, keyval in enumerate(headers.items())
            ],
            "authentication": {},
            "metaSortKey": "[{}]{}".format(data['options']['rmethod'], _path),
            "settingStoreCookies": True,
            "settingSendCookies": True,
            "settingDisableRenderRequestBody": False,
            "settingEncodeUrl": True,
            "_type": "request"
        }

    PATH_TREE = {}

    def fmt_api(DATA_MAP, projectid, domain_key, data, mdgenerate):
        data['options']['rpath'] = data['options']['rpath'].strip()
        data['options']['rpath'] = data['options']['rpath'].replace('\\', '/')
        if data['options']['rpath'][0] != '/':
            data['options']['rpath'] = '/' + data['options']['rpath']

        rpaths = data['options']['rpath'].split('/')[1:]
        rpaths_indexs = ['root']
        while rpaths:
            _path = rpaths.pop(0)
            rpaths_indexs.append(_path)
            _cpath = '/'.join(rpaths_indexs)
            if _cpath in PATH_TREE:
                continue

            if len(rpaths_indexs) <= 2:
                parent_path = '/'.join(rpaths_indexs[:-1])
                parentid = projectid
            else:
                parent_path = '/'.join(rpaths_indexs[:-1])
                parentid = PATH_TREE[parent_path]

            if rpaths:
                ## is path
                _id = "fld_" + xmd5(_cpath)
                PATH_TREE[_cpath] = _id
                yield fmt_path(parentid, _id, _cpath, rpaths_indexs[-1])
            else:
                _id = "req_" + xmd5(_cpath)
                PATH_TREE[_cpath] = _id
                yield fmt_req_api(DATA_MAP, parentid, _id, _cpath, domain_key, data, mdgenerate)
%>
<%
    def datamap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_nesteds(datas, '')
        }

    def loop_http_api(datas):
        for key, val in loop_nesteds(datas, ''):
            if val['options'].get('rmsg', 'MDATA') == 'MAPI':
                yield (key, val)

    def fmt_http_api(DATA_MAP, projectid, domain_key, datas, mdgenerate):
        alist = []
        for key, val in loop_http_api(json_data):
            for _val in fmt_api(DATA_MAP, projectid, domain_key, val, mdgenerate):
                alist.append(json.dumps(_val, indent=4))
        return ',\n'.join(alist)
%>
<%
    DATA_MAP = datamap(json_data)
    WORKSPACE = rest_options.get('workspace_name', None)
    PROJECT = rest_options.get('project_name', None)
    ENVNAME = rest_options.get('env_name', None)
    ENVNAME = ENVNAME if ENVNAME else PROJECT
    DOMAIN_KEY = rest_options.get('domain_key', None)
    DOMAIN = rest_options.get('domain', None)
    mdgenerate = functools.partial(generate_file, tmplpath + "/restful_doc.md.mako")

    if not WORKSPACE:
        raise TypeError('workspace_name not set')

    if not DOMAIN:
        raise TypeError('domain not set')

    if not DOMAIN_KEY:
        raise TypeError('domain_key not set')

    if not ENVNAME:
        raise TypeError('env_name not set')

    if not PROJECT:
        raise TypeError('project_name not set')

    PROJECTID = "fld_" + xmd5(PROJECT)
    ENVID = "env_" + xmd5(PROJECT)
%>
{
    "_type": "export",
    "__export_format": 3,
    "__export_date": "2020-01-18 23:23:01.499526",
    "__export_source": "insomnia.desktop.app:v5.9.6",
    "resources": [
        {
            "_id": "__WORKSPACE_ID__",
            "parentId": null,
            "modified": ${int(time.time())},
            "created": ${int(time.time())},
            "description": "",
            "certificates": [],
            "_type": "workspace",
            "name": "${WORKSPACE}"
        },
        {
            "_id": "${PROJECTID}",
            "parentId": "__WORKSPACE_ID__",
            "modified": ${int(time.time())},
            "created": ${int(time.time())},
            "description": "",
            "environment": {},
            "metaSortKey": ${int(time.time())},
            "_type": "request_group",
            "name": "${PROJECT}"
        },
		{
			"_id": "${ENVID}",
			"parentId": "__BASE_ENVIRONMENT_ID__",
			"modified": ${int(time.time())},
			"created": ${int(time.time())},
			"name": "${ENVNAME + '_ENV'}",
			"data": {
				"${DOMAIN_KEY}": "http://127.0.0.1:21000",
				"lang": "zh"
			},
			"color": null,
			"isPrivate": false,
			"_type": "environment"
		},
${ fmt_http_api(DATA_MAP, PROJECTID, DOMAIN_KEY, json_data, mdgenerate) }
    ]
}
