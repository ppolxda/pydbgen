<%!
    import six
    import time
    import json
    from hashlib import md5

    def xmd5(data):
        if isinstance(data, six.string_types):
            data = data.encode('utf8')

        if not isinstance(data, six.binary_type):
            raise TypeError('md5 data invaild')

        m = md5.md5(data)
        return m.hexdigest().decode('utf8')

    def get_default(DATA_MAP, data, ignore_list=False):
        _type = data['type']
        repeated = data['options']['label'] == 'repeated'
        if repeated:
            return [
                get_default(data, True)
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
            return get_default(fclass)

        elif _type == 'enum':
            return 0

        else:
            raise TypeError('[{}]type error'.format(_type))

    def fmt_path(path, name, sortkey):
        return {
            "_id": "fld_" + xmd5(path),
            "parentId": "fld_" + xmd5(path),
            "modified": int(time.time()),
            "created": int(time.time()),
            "name": name,
            "description": "path",
            "environment": {},
            "metaSortKey": sortkey,
            "_type": "request_group"
        }

    def mime_type(_type):
        BURLENCODE = 0
        BJSON = 1
        BXML = 2
        BYAML = 3

        if _type == BURLENCODE:
            return "application/x-www-form-urlencoded"
        elif _type == BJSON:
            return "application/json"
        elif _type == BXML:
            return "application/xml"
        elif _type == BYAML:
            return "application/x-yaml"
        else:
            return "application/x-www-form-urlencoded"

    def mime_data(_type, _datas):
        BURLENCODE = 0
        BJSON = 1
        BXML = 2
        BYAML = 3

        if _type == BURLENCODE:
            return "application/x-www-form-urlencoded"
        elif _type == BJSON:
            return {
                "mimeType": "application/json",
                "text": json.dumps({
                    key: get_default(val)
                    for key, val in _datas.items()
                }, indent=2)
            }
        elif _type == BXML:
            return "application/xml"
            return {
                "mimeType": "application/json",
                "text": json.dumps({
                    key: get_default(val)
                    for key, val in _datas.items()
                }, indent=2)
            }

        elif _type == BYAML:
            return "application/x-yaml"
        else:
            return "application/x-www-form-urlencoded"



    def fmt_api(path, name, mtype, sortkey):
        return {
            "_id": "fld_" + xmd5(path),
            "authentication": {},
            "body": {
                "mimeType": mime_type(mtype),
                "params": [
                    {
                        "disabled": false,
                        "id": "pair_5d80ffdf539e4e2ebba746ea0d1ec14c",
                        "name": "where",
                        "value": "{}"
                    },
                    {
                        "disabled": false,
                        "id": "pair_3069709105694f2d878d275424735604",
                        "name": "page",
                        "value": "[0, 50]"
                    },
                    {
                        "disabled": false,
                        "id": "pair_a7e743c18ee844fc9502726cbfb4606c",
                        "name": "sort",
                        "value": "{}"
                    }
                ]
            },
            "created": 1577237419450,
            "description": "# GET /devel/cnname_json\n\n## apikey flag\n\nsys_cnname_clinet[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 > 0 and\nkey5 >= 0 and\nkey6 < 0 and\nkey7 <= 0 and\nkey8 <> 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
            "headers": [
                {
                    "id": "pair_80d8f8e6db08460fa36c14efd97053bc",
                    "name": "Content-Type",
                    "value": "application/x-www-form-urlencoded"
                },
                {
                    "id": "pair_a02984a4f54e44fba7838ecc59cd99e8",
                    "name": "Accept-Language",
                    "value": "{{lang}}"
                }
            ],
            "isPrivate": false,
            "metaSortKey": "[GET]1.Development and debugging/Cnname Config",
            "method": "GET",
            "modified": 1577237419450,
            "name": "Cnname Config",
            "parameters": [],
            "parentId": "fld_5e9ac60b7218888f401ebe574f344e1a",
            "settingDisableRenderRequestBody": false,
            "settingEncodeUrl": true,
            "settingFollowRedirects": "global",
            "settingRebuildPath": true,
            "settingSendCookies": true,
            "settingStoreCookies": true,
            "url": "{{quotes_mrgs_api}}/devel/cnname_json",
            "_type": "request"
        }
%>
<%
    def datamap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_nesteds(datas, '')
        }
%>
<% DATA_MAP = datamap(json_data) %>
${ json_dumps(DATA_MAP, indent=4) }
## {
##     "_type": "export",
##     "__export_format": 3,
##     "__export_date": "2020-01-18 23:23:01.499526",
##     "__export_source": "insomnia.desktop.app:v5.9.6",
##     "resources": [
##         {
##             "_id": "__WORKSPACE_ID__",
##             "parentId": null,
##             "modified": 1509346642900,
##             "created": 1509346642900,
##             "description": "",
##             "certificates": [],
##             "_type": "workspace",
##             "name": "${workspace}"
##         },
##         {
##             "_id": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "parentId": "__WORKSPACE_ID__",
##             "modified": 1509346676859,
##             "created": 1509346676859,
##             "description": "",
##             "environment": {},
##             "metaSortKey": -1509346676859,
##             "_type": "request_group",
##             "name": "${project}"
##         },
##         {
##             "_id": "fld_d7086606624f6ee23faa264987f06725",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360975965,
##             "created": 1579360975965,
##             "name": "4.报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/行情系统报表查询/系统报表查询/报价系统操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_ad7fa38b3810af16cc7ff77d39d4bffd",
##             "parentId": "fld_d7086606624f6ee23faa264987f06725",
##             "modified": 1579360975975,
##             "created": 1579360975975,
##             "name": "行情系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/行情系统报表查询/系统报表查询/报价系统操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f62f6854a28f53ba67f4f375598c72bc",
##             "parentId": "fld_ad7fa38b3810af16cc7ff77d39d4bffd",
##             "modified": 1579360975984,
##             "created": 1579360975984,
##             "name": "系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/行情系统报表查询/系统报表查询/报价系统操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_e5caf18832d9639e56ccd94bf9b590c0",
##             "parentId": "fld_f62f6854a28f53ba67f4f375598c72bc",
##             "modified": 1579360975995,
##             "created": 1579360975995,
##             "name": "报价系统操作日志查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/行情系统报表查询/系统报表查询/报价系统操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0196599438a12c9fd34c648b75453167",
##             "parentId": "fld_e5caf18832d9639e56ccd94bf9b590c0",
##             "modified": 1579360976004,
##             "created": 1579360976004,
##             "url": "{{quotes_mrgs_api}}/querys/soplog/today",
##             "name": "当日查询",
##             "description": "# GET /querys/soplog/today\n\n## apikey flag\n\ns_soplog_query[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"logid\": \"操作id\",\n        \"logtype\": \"操作类型\",\n        \"logtime\": \"操作时间\",\n        \"accessip\": \"访问ip\",\n        \"logincode\": \"登录账号\",\n        \"utype\": \"用户类型\",\n        \"jshow\": \"日志信息\",\n        \"jbefore\": \"修改前\",\n        \"jafter\": \"修改后\"\n    },\n    \"options_define\": {\n        \"logid\": {\n            \"dataType\": \"int\"\n        },\n        \"logtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumQuotedLogTypeTranslate\"\n        },\n        \"logtime\": {\n            \"dataType\": \"datetime\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"accessip\": {\n            \"dataType\": \"string\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"utype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumQuotedUserTypeTranslate\"\n        },\n        \"jshow\": {\n            \"dataType\": \"string\"\n        },\n        \"jbefore\": {\n            \"dataType\": \"string\"\n        },\n        \"jafter\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_c162d46f5406422789f8fd1994367050",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_9d3e2bf13cb04b9aa9a3a6cd0c2cabc5",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_6ba118b699d94a21964e464163384371",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_474a45f32bce4f9db94d5bc92a3a9557"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6d5ff064298441f4bddb85a40f8970e4"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.报表查询/行情系统报表查询/系统报表查询/报价系统操作日志查询/当日查询",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976014,
##             "created": 1579360976014,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/新增ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976028,
##             "created": 1579360976028,
##             "name": "ApiKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/新增ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_4f3bdb083bdff2f7a9aa65d48592ff15",
##             "parentId": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "modified": 1579360976041,
##             "created": 1579360976041,
##             "url": "{{quotes_mrgs_api}}/apikey/add",
##             "name": "新增ApiKey",
##             "description": "# PUT /apikey/add\n\n## apikey flag\n\napikey_add[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nbindip|string|False|None|商品分组|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nisdisable|EnumIsEnableType|False|None|是否禁用|is_array=False,decpoint=6,declen=16\nmemo|string|False|None|备注|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nexpired|datetime|False|None|授权期限|is_array=False,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"bindip\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品分组\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isdisable\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否禁用\",\n        \"options\": {\n            \"is_array\": false,\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"memo\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"expired\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"授权期限\",\n        \"options\": {\n            \"is_array\": false,\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"bindip\": \"\",\n    \"isdisable\": 0,\n    \"memo\": \"\",\n    \"expired\": \"19000101T000000\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_61ba7a3d8fa74aa4a1228a5d17b3ed38"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_8ba578e0575541f5b02ccffd6a702cf7"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/ApiKey设置/新增ApiKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976054,
##             "created": 1579360976054,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/查询ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976063,
##             "created": 1579360976063,
##             "name": "ApiKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/查询ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_32c402fcced9f42344853eb6a4ac0890",
##             "parentId": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "modified": 1579360976073,
##             "created": 1579360976073,
##             "url": "{{quotes_mrgs_api}}/apikey/qry",
##             "name": "查询ApiKey",
##             "description": "# GET /apikey/qry\n\n## apikey flag\n\napikey_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"apikey\": \"客户端key\",\n        \"bindip\": \"关联地址\",\n        \"expired\": \"授权期限\",\n        \"symbols\": \"品种过滤\",\n        \"isdisable\": \"是否禁用\",\n        \"memo\": \"备注\"\n    },\n    \"options_define\": {\n        \"apikey\": {\n            \"dataType\": \"string\"\n        },\n        \"bindip\": {\n            \"dataType\": \"string\"\n        },\n        \"expired\": {\n            \"dataType\": \"datetime\"\n        },\n        \"symbols\": {\n            \"dataType\": \"string\"\n        },\n        \"isdisable\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"memo\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_674143ac954b4c278609bee7fbce14f3",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_55312a8560a54b9daa646fba633cc188",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_36b1ba4c119b47a5a0914df3ef88e9d3",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_f7fb90c022814d21ae51159255502ea2"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d957c338d69a48978ab6c5d72e140a92"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/ApiKey设置/查询ApiKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976084,
##             "created": 1579360976084,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/查询密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976091,
##             "created": 1579360976091,
##             "name": "ApiKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/查询密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7c6476216c9a980e7b080ea8e301289a",
##             "parentId": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "modified": 1579360976100,
##             "created": 1579360976100,
##             "url": "{{quotes_mrgs_api}}/apikey/qry/secret",
##             "name": "查询密钥串",
##             "description": "# GET /apikey/qry/secret\n\n## apikey flag\n\napikey_secret_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"expired\": \"授权期限\",\n        \"apikey\": \"客户端key\",\n        \"secret\": \"密钥串\"\n    },\n    \"options_define\": {\n        \"expired\": {\n            \"dataType\": \"datetime\"\n        },\n        \"apikey\": {\n            \"dataType\": \"string\"\n        },\n        \"secret\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_bbeb310259ff4ee98a135e959e38baff",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_da088dfa116845aa883cdab10abdfab3",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_fe0df9c548534f85a11727c01ba43af8",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_a4fd210050cf47b49feaa91baadcc1dd"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_61677822bed449d194ee553949048fbb"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/ApiKey设置/查询密钥串",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976108,
##             "created": 1579360976108,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/重置密钥Key",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976119,
##             "created": 1579360976119,
##             "name": "ApiKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/重置密钥Key",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_bb226caa4b067ff3966c31a42d3db6f6",
##             "parentId": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "modified": 1579360976128,
##             "created": 1579360976128,
##             "url": "{{quotes_mrgs_api}}/apikey/update/secret",
##             "name": "重置密钥Key",
##             "description": "# POST /apikey/update/secret\n\n## apikey flag\n\napikey_update_secret[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\napikey|string|False|None|apikey|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"apikey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"apikey\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"apikey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_4943f71505d443f4906106bbea8fe7db"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_ff73c38cd5294222a998a6d9a6b1a2f0"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.行情子系统/ApiKey设置/重置密钥Key",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976138,
##             "created": 1579360976138,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/修改ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976154,
##             "created": 1579360976154,
##             "name": "ApiKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/ApiKey设置/修改ApiKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_171fc702ba4a6bd2432a25d96cc13165",
##             "parentId": "fld_227de3015aab989ea5c6c2c958fb4c91",
##             "modified": 1579360976169,
##             "created": 1579360976169,
##             "url": "{{quotes_mrgs_api}}/apikey/update",
##             "name": "修改ApiKey",
##             "description": "# POST /apikey/update\n\n## apikey flag\n\napikey_update[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nbindip|string|False|None|商品分组|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nsecret|string|False|None|secret|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nmemo|string|False|None|备注|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nisdisable|EnumIsEnableType|False|None|是否禁用|is_array=False,decpoint=6,declen=16\napikey|string|False|None|apikey|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nexpired|datetime|False|None|授权期限|is_array=False,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"bindip\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品分组\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"secret\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"secret\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"memo\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isdisable\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否禁用\",\n        \"options\": {\n            \"is_array\": false,\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"apikey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"apikey\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"expired\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"授权期限\",\n        \"options\": {\n            \"is_array\": false,\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"bindip\": \"\",\n    \"secret\": \"\",\n    \"memo\": \"\",\n    \"isdisable\": 0,\n    \"apikey\": \"\",\n    \"expired\": \"19000101T000000\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_b9009cdf996b4172b737eb0dedd803f8"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_aa9c67c680aa4d0b93a47a424142afc9"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.行情子系统/ApiKey设置/修改ApiKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976184,
##             "created": 1579360976184,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/新增代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976195,
##             "created": 1579360976195,
##             "name": "商品代码联想设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/新增代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_c4485f077d6d8fbf28b7e7bc7dce0369",
##             "parentId": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "modified": 1579360976207,
##             "created": 1579360976207,
##             "url": "{{quotes_mrgs_api}}/symbol/add",
##             "name": "新增代码联想",
##             "description": "# POST /symbol/add\n\n## apikey flag\n\nsymbol_add[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|False|None|商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nmemo|string|False|None|备注|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nsgroup|string|False|None|商品分组|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"memo\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"sgroup\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品分组\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"symbol\": \"\",\n    \"memo\": \"\",\n    \"sgroup\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_ca0049c200704a9fa0459decd6b9138a"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_46a442f2d63b4f109e8c0882209c4905"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.行情子系统/商品代码联想设置/新增代码联想",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976219,
##             "created": 1579360976219,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/删除代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976229,
##             "created": 1579360976229,
##             "name": "商品代码联想设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/删除代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_1fc5eabd7eb65ee9b05efc3176f62bb5",
##             "parentId": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "modified": 1579360976238,
##             "created": 1579360976238,
##             "url": "{{quotes_mrgs_api}}/symbol/delete",
##             "name": "删除代码联想",
##             "description": "# DELETE /symbol/delete\n\n## apikey flag\n\nsymbol_update[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|False|None|商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"symbol\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_464fa818b87e4502a0361b13937358d9"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_49fa6908bc2d49db920c20a50c5df70b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]1.行情子系统/商品代码联想设置/删除代码联想",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976247,
##             "created": 1579360976247,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/查询代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976255,
##             "created": 1579360976255,
##             "name": "商品代码联想设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/查询代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0505ddd9e71a6ebb40665a45969bc354",
##             "parentId": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "modified": 1579360976264,
##             "created": 1579360976264,
##             "url": "{{quotes_mrgs_api}}/symbol/qry",
##             "name": "查询代码联想",
##             "description": "# GET /symbol/qry\n\n## apikey flag\n\nsymbol_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"symbol\": \"商品代码\",\n        \"sgroup\": \"商品分组\",\n        \"memo\": \"备注\"\n    },\n    \"options_define\": {\n        \"symbol\": {\n            \"dataType\": \"string\"\n        },\n        \"sgroup\": {\n            \"dataType\": \"string\"\n        },\n        \"memo\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_3b12300df179425880df986b5af71c28",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_4c730a3942dd4deb98caaf91fba69a85",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_d60d70f3d2c24b5d9ec71cbec46cd518",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_bd510ade9a654bd8a13c6a760d352575"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_0bf0c83455d047458d2197d8c7372d59"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/商品代码联想设置/查询代码联想",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976273,
##             "created": 1579360976273,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/更新代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976281,
##             "created": 1579360976281,
##             "name": "商品代码联想设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品代码联想设置/更新代码联想",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_d2d7aa486b157593bbc006ab48ca6e22",
##             "parentId": "fld_67fc93b5bc2fd93c84758b84e7eb614c",
##             "modified": 1579360976294,
##             "created": 1579360976294,
##             "url": "{{quotes_mrgs_api}}/symbol/update",
##             "name": "更新代码联想",
##             "description": "# PUT /symbol/update\n\n## apikey flag\n\nsymbol_update[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|False|None|商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nmemo|string|False|None|备注|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nsgroup|string|False|None|商品分组|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"memo\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"sgroup\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"商品分组\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"symbol\": \"\",\n    \"memo\": \"\",\n    \"sgroup\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_8fd3a6b143de4e7cb1a20c19c1b1c616"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_2441ea0cb74a407eaab39aba17e684b2"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/商品代码联想设置/更新代码联想",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976306,
##             "created": 1579360976306,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/市场状态设置/查询市场状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_b7b70381d36530ed84c3a92dfa9910ef",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976316,
##             "created": 1579360976316,
##             "name": "市场状态设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/市场状态设置/查询市场状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_96da0f66502ed91f3532cae8b9868abe",
##             "parentId": "fld_b7b70381d36530ed84c3a92dfa9910ef",
##             "modified": 1579360976324,
##             "created": 1579360976324,
##             "url": "{{quotes_mrgs_api}}/biz/qry",
##             "name": "查询市场状态",
##             "description": "# GET /biz/qry\n\n## apikey flag\n\nbiz_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"name\": \"商品代码\",\n        \"status\": \"状态\"\n    },\n    \"options_define\": {\n        \"name\": {\n            \"dataType\": \"string\"\n        },\n        \"status\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumBStatusTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_86a340db79a04627924d90387fb6e1d4",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_8e0e000739ab4149b956854bef3898f8",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_cfbc87c8c4db48619a3fca24dd033e71",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_5a0b7b4fa79b4e73a42811a62de5b402"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_81b4456662fe4811a6d4289b6fb158ac"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/市场状态设置/查询市场状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976333,
##             "created": 1579360976333,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/市场状态设置/修改市场状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_b7b70381d36530ed84c3a92dfa9910ef",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976342,
##             "created": 1579360976342,
##             "name": "市场状态设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/市场状态设置/修改市场状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_f190af53624049b49d70d2ebc9b7277f",
##             "parentId": "fld_b7b70381d36530ed84c3a92dfa9910ef",
##             "modified": 1579360976347,
##             "created": 1579360976347,
##             "url": "{{quotes_mrgs_api}}/biz/update",
##             "name": "修改市场状态",
##             "description": "# POST /biz/update\n\n## apikey flag\n\nbiz_update[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nstatus|EnumBStatus|False|None|状态|is_array=False,maxlen=16,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"status\": {\n        \"default\": null,\n        \"type\": \"EnumBStatus\",\n        \"dbname\": \"\",\n        \"comment\": \"状态\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"status\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_49d6d76ec26b4f71811268aab1d567db"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_050900b43d0643c19dfdaf7980183b14"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.行情子系统/市场状态设置/修改市场状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976360,
##             "created": 1579360976360,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/报价通知/查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_4aa59e72aa6adf570c112e9308445e50",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976369,
##             "created": 1579360976369,
##             "name": "报价通知",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/报价通知/查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1447d31f69fb8f66ae356a18975b698c",
##             "parentId": "fld_4aa59e72aa6adf570c112e9308445e50",
##             "modified": 1579360976377,
##             "created": 1579360976377,
##             "url": "{{quotes_mrgs_api}}/pricenotify/qry",
##             "name": "查询",
##             "description": "# GET /pricenotify/qry\n\n## apikey flag\n\npricenotify_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"bscode\": \"买卖方向\",\n        \"symbol\": \"商品代码\",\n        \"phone\": \"手机号\",\n        \"price\": \"价格\",\n        \"status\": \"状态\"\n    },\n    \"options_define\": {\n        \"bscode\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumBsCodeTranslate\"\n        },\n        \"symbol\": {\n            \"dataType\": \"string\"\n        },\n        \"phone\": {\n            \"dataType\": \"string\"\n        },\n        \"price\": {\n            \"dataType\": \"float\"\n        },\n        \"status\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"quotes_enums.EnumNotifyStatusTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_c7d33df07a8549b9befd7e7ce475ab56",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_bdc40f581a4a4b858c5aec5bc8a06b5f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_96f07039e34e4706b0ee51eaa4050c64",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_e4786d7ddec745fa8df32f57ab1ad4bb"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d1934e9c22f1495cb2c5e32c9ef40217"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/报价通知/查询",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976388,
##             "created": 1579360976388,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/删除商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976393,
##             "created": 1579360976393,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/删除商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_d5e55f3fcb4f00e86521ae5d2d42cfc6",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976405,
##             "created": 1579360976405,
##             "url": "{{quotes_mrgs_api}}/conf/delete/one",
##             "name": "删除商品单个品种信息",
##             "description": "# DELETE /conf/delete/one\n\n## apikey flag\n\nconf_delete_one[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|False||商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"type\": \"string\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"symbol\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1ab7fe708f7b44238aee42811c608837"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_bdbc437cab3548f1a4940ec009c456af"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]1.行情子系统/商品品种设置/删除商品单个品种信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976414,
##             "created": 1579360976414,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/上传模拟配置至实盘服务",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976424,
##             "created": 1579360976424,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/上传模拟配置至实盘服务",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_d0beea13eaa42ae0adb51e6814c91966",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976433,
##             "created": 1579360976433,
##             "url": "{{quotes_mrgs_api}}/conf/demo2real",
##             "name": "上传模拟配置至实盘服务",
##             "description": "# PUT /conf/demo2real\n\n## apikey flag\n\nconf_demo2real[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_fc7f641853d8446484a499b11f38ede2"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_5d5bf51e586d4a0da4472686573633ad"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/商品品种设置/上传模拟配置至实盘服务",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976440,
##             "created": 1579360976440,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询完整商品信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976447,
##             "created": 1579360976447,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询完整商品信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_eb97bcc487f0fae9c84026bdb1efe3c7",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976455,
##             "created": 1579360976455,
##             "url": "{{quotes_mrgs_api}}/conf/qry",
##             "name": "查询完整商品信息",
##             "description": "# GET /conf/qry\n\n## apikey flag\n\nconf_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_416c89c4e4ca4dc5bcdfbf2132c82469",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_986b3ac90ac94397b9b634dd6b3eae0b",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_91048387494b432bb6b9a8f54c0282c2",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_238db4cd09504898b01deb7acd5aee05"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_418ea685857e45848c854a9aa972e193"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/商品品种设置/查询完整商品信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976473,
##             "created": 1579360976473,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询商品品种列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976487,
##             "created": 1579360976487,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询商品品种列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_b6c6cfcf20ff79eefd8bf65464fd6bf9",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976498,
##             "created": 1579360976498,
##             "url": "{{quotes_mrgs_api}}/conf/qry/list",
##             "name": "查询商品品种列表",
##             "description": "# GET /conf/qry/list\n\n## apikey flag\n\nconf_qry_list[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|True|XAGUSD|symbol|maxlen=32,minlen=0\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"default\": \"XAGUSD\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"symbol\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"symbol\": \"XAGUSD\"\n}",
##                         "id": "pair_8e029b786aa843dab611f427fb551ff9",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_064a064c970749daa40b741dd95c9d56",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_ab7b02d37b8649f3826726a6a289b16b",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_e79bb85f0e2a4a3aba7a3605cf49f5e6"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_a82d129a8a88459ba5c75980b7c57e4b"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/商品品种设置/查询商品品种列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976514,
##             "created": 1579360976514,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976527,
##             "created": 1579360976527,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/查询商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fa355ff9f81e4cf53c5b0264e4f8c2a3",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976536,
##             "created": 1579360976536,
##             "url": "{{quotes_mrgs_api}}/conf/qry/one",
##             "name": "查询商品单个品种信息",
##             "description": "# GET /conf/qry/one\n\n## apikey flag\n\nconf_qry_one[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsymbol|string|True|XAGUSD|symbol|maxlen=32,minlen=0\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"symbol\": {\n        \"default\": \"XAGUSD\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"symbol\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"symbol\": \"XAGUSD\"\n}",
##                         "id": "pair_21caf18fc633496cbe6e6cfb6d23b99a",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_4e9bf314414342908a64149fdd9df9f0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_10162f40ff5d4799b2abb3eec8c4a2bd",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_fc38d509e2a54aaeb19435f9bf2d2ae1"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_17ea0b2cc46b46c181d1e67ecac6d940"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/商品品种设置/查询商品单个品种信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976543,
##             "created": 1579360976543,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/修改商品单个品种放行状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976555,
##             "created": 1579360976555,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/修改商品单个品种放行状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_53142e2ef07ab58c79579dea08c24242",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976560,
##             "created": 1579360976560,
##             "url": "{{quotes_mrgs_api}}/conf/update/isopen",
##             "name": "修改商品单个品种放行状态",
##             "description": "# PUT /conf/update/isopen\n\n## apikey flag\n\nconf_update_isopen[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nisopen|EnumIsEnableType|False||是否对外报价|is_array=False,decpoint=6,declen=16\nsymbol|string|False||商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"isopen\": {\n        \"type\": \"EnumIsEnableType\",\n        \"comment\": \"是否对外报价\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"symbol\": {\n        \"type\": \"string\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"isopen\": \"\",\n    \"symbol\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1147db431dcf4e4491e031215fcdcf9b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_4e7fe36ada9b4217804462d4a84e7e7c"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/商品品种设置/修改商品单个品种放行状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976574,
##             "created": 1579360976574,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/修改商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976603,
##             "created": 1579360976603,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/修改商品单个品种信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_53caf37133b931e5594e88c67ae09a89",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976631,
##             "created": 1579360976631,
##             "url": "{{quotes_mrgs_api}}/conf/update/one",
##             "name": "修改商品单个品种信息",
##             "description": "# PUT /conf/update/one\n\n## apikey flag\n\nconf_update_one[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nfiltertimeout|int32|False||行情超时时间(秒)|is_array=False,decpoint=6,declen=16\ndailyrise|float|False||当日最大涨幅(%)|is_array=False,declen=24,decpoint=8\nbidexchange|float|False||买价汇率|is_array=False,declen=24,decpoint=8\nfilterstepnum|int32|False||滤价阶梯次数|is_array=False,decpoint=6,declen=16\nexchange|float|False||最新价汇率|is_array=False,declen=24,decpoint=8\nweight|float|False||最新价重量系数|is_array=False,declen=24,decpoint=8\ncnname|string|False||商品中文名称|is_array=False,decpoint=6,declen=16\nexchangesymbol|string|False||实时汇率品种名称|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nsymbol|string|False||商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nsource|string|False||来源商品代码|is_array=True,maxlen=32,minlen=1,decpoint=6,declen=16\nbidweight|float|False||买价重量系数|is_array=False,declen=24,decpoint=8\nbiddecpoint|int32|False||买价小数精度|is_array=False,decpoint=6,declen=16\nbidagio|float|False||买价贴水|is_array=False,declen=24,decpoint=8\ndailyfall|float|False||当日最大跌幅(%)|is_array=False,declen=24,decpoint=8\nagio|float|False||最新价贴水|is_array=False,declen=24,decpoint=8\naskexchange|float|False||卖价汇率|is_array=False,declen=24,decpoint=8\nsort|int32|False||排序|is_array=False,decpoint=6,declen=16\nsourcetype|EnumSourceType|False||来源类型|is_array=False,decpoint=6,declen=16\nfilterstepprice|float|False||滤价差价|is_array=False,declen=24,decpoint=8\nldecpoint|int32|False||最新价小数精度|is_array=False,decpoint=6,declen=16\naskagio|float|False||卖价贴水|is_array=False,declen=24,decpoint=8\naskweight|float|False||卖价重量系数|is_array=False,declen=24,decpoint=8\nothers|jsonb|False|||is_array=False,decpoint=6,declen=16\nexsidetype|EnumExSideType|False||汇率方向|is_array=False,decpoint=6,declen=16\naskdecpoint|int32|False||卖价小数精度|is_array=False,decpoint=6,declen=16\nexchangetype|EnumExchangeType|False||汇率类型|is_array=False,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"filtertimeout\": {\n        \"type\": \"int32\",\n        \"comment\": \"行情超时时间(秒)\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"dailyrise\": {\n        \"type\": \"float\",\n        \"comment\": \"当日最大涨幅(%)\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"bidexchange\": {\n        \"type\": \"float\",\n        \"comment\": \"买价汇率\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"filterstepnum\": {\n        \"type\": \"int32\",\n        \"comment\": \"滤价阶梯次数\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"exchange\": {\n        \"type\": \"float\",\n        \"comment\": \"最新价汇率\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"weight\": {\n        \"type\": \"float\",\n        \"comment\": \"最新价重量系数\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"cnname\": {\n        \"type\": \"string\",\n        \"comment\": \"商品中文名称\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"exchangesymbol\": {\n        \"type\": \"string\",\n        \"comment\": \"实时汇率品种名称\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"symbol\": {\n        \"type\": \"string\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"source\": {\n        \"type\": \"string\",\n        \"comment\": \"来源商品代码\",\n        \"options\": {\n            \"is_array\": true,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"bidweight\": {\n        \"type\": \"float\",\n        \"comment\": \"买价重量系数\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"biddecpoint\": {\n        \"type\": \"int32\",\n        \"comment\": \"买价小数精度\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"bidagio\": {\n        \"type\": \"float\",\n        \"comment\": \"买价贴水\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"dailyfall\": {\n        \"type\": \"float\",\n        \"comment\": \"当日最大跌幅(%)\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"agio\": {\n        \"type\": \"float\",\n        \"comment\": \"最新价贴水\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"askexchange\": {\n        \"type\": \"float\",\n        \"comment\": \"卖价汇率\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"sort\": {\n        \"type\": \"int32\",\n        \"comment\": \"排序\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"sourcetype\": {\n        \"type\": \"EnumSourceType\",\n        \"comment\": \"来源类型\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"filterstepprice\": {\n        \"type\": \"float\",\n        \"comment\": \"滤价差价\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"ldecpoint\": {\n        \"type\": \"int32\",\n        \"comment\": \"最新价小数精度\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"askagio\": {\n        \"type\": \"float\",\n        \"comment\": \"卖价贴水\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"askweight\": {\n        \"type\": \"float\",\n        \"comment\": \"卖价重量系数\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"others\": {\n        \"type\": \"jsonb\",\n        \"comment\": \"\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"exsidetype\": {\n        \"type\": \"EnumExSideType\",\n        \"comment\": \"汇率方向\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"askdecpoint\": {\n        \"type\": \"int32\",\n        \"comment\": \"卖价小数精度\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"exchangetype\": {\n        \"type\": \"EnumExchangeType\",\n        \"comment\": \"汇率类型\",\n        \"options\": {\n            \"is_array\": false,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"filtertimeout\": \"\",\n    \"dailyrise\": \"\",\n    \"bidexchange\": \"\",\n    \"filterstepnum\": \"\",\n    \"exchange\": \"\",\n    \"weight\": \"\",\n    \"cnname\": \"\",\n    \"exchangesymbol\": \"\",\n    \"symbol\": \"\",\n    \"source\": \"\",\n    \"bidweight\": \"\",\n    \"biddecpoint\": \"\",\n    \"bidagio\": \"\",\n    \"dailyfall\": \"\",\n    \"agio\": \"\",\n    \"askexchange\": \"\",\n    \"sort\": \"\",\n    \"sourcetype\": \"\",\n    \"filterstepprice\": \"\",\n    \"ldecpoint\": \"\",\n    \"askagio\": \"\",\n    \"askweight\": \"\",\n    \"others\": \"\",\n    \"exsidetype\": \"\",\n    \"askdecpoint\": \"\",\n    \"exchangetype\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_09d5e77bd8b94de4b989c44836793c32"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_b8c5e68a170b4d09b2fda9ca1c38c4bd"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/商品品种设置/修改商品单个品种信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976663,
##             "created": 1579360976663,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/人工报价推送",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6547e8d851036c6597292728e9e52e7d",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976673,
##             "created": 1579360976673,
##             "name": "商品品种设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/商品品种设置/人工报价推送",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_f5ffed6ffd82edaf1a43e7455537c86a",
##             "parentId": "fld_6547e8d851036c6597292728e9e52e7d",
##             "modified": 1579360976688,
##             "created": 1579360976688,
##             "url": "{{quotes_mrgs_api}}/push/tick",
##             "name": "人工报价推送",
##             "description": "# PUT /push/tick\n\n## apikey flag\n\nprice_push[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nask|string|False||卖价|is_array=False,declen=24,decpoint=8,maxlen=128,minlen=1\nbid|string|False||买价|is_array=False,declen=24,decpoint=8,maxlen=128,minlen=1\nlast|string|False||最新价|is_array=False,declen=24,decpoint=8,maxlen=128,minlen=1\nmode|string|False||模拟正式(real|demo)|is_array=False,maxlen=8,minlen=1,defval=real\nsymbol|string|False||商品代码|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"ask\": {\n        \"type\": \"string\",\n        \"comment\": \"卖价\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"bid\": {\n        \"type\": \"string\",\n        \"comment\": \"买价\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"last\": {\n        \"type\": \"string\",\n        \"comment\": \"最新价\",\n        \"options\": {\n            \"is_array\": false,\n            \"declen\": \"24\",\n            \"decpoint\": \"8\",\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"mode\": {\n        \"type\": \"string\",\n        \"comment\": \"模拟正式(real|demo)\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\",\n            \"defval\": \"real\"\n        }\n    },\n    \"symbol\": {\n        \"type\": \"string\",\n        \"comment\": \"商品代码\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"ask\": \"\",\n    \"bid\": \"\",\n    \"last\": \"\",\n    \"mode\": \"\",\n    \"symbol\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_d9bfe4d7d1b94bceba9cab2d6a87ec90"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c7976179c18543ba9615757878798f25"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/商品品种设置/人工报价推送",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976698,
##             "created": 1579360976698,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/新增底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976711,
##             "created": 1579360976711,
##             "name": "H5底栏设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/新增底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_4e26376ec9d080240840a6dcbff28c42",
##             "parentId": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "modified": 1579360976725,
##             "created": 1579360976725,
##             "url": "{{quotes_mrgs_api}}/tabconf/add",
##             "name": "新增底栏设置",
##             "description": "# POST /tabconf/add\n\n## apikey flag\n\ntabconf_add[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nicon|string|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nvalue|string|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nname|string|False|None|名称|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nsorts|int32|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"icon\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"value\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"name\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"名称\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"sorts\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"icon\": \"\",\n    \"value\": \"\",\n    \"name\": \"\",\n    \"sorts\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1dcec663eb334cc3ab5b2f89398cfd7a"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_ef26540b333043aca06fd34382672d8a"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.行情子系统/H5底栏设置/新增底栏设置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976739,
##             "created": 1579360976739,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/删除底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976745,
##             "created": 1579360976745,
##             "name": "H5底栏设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/删除底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a9d5ed9cb5b223ac56cc0bda259aaba5",
##             "parentId": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "modified": 1579360976755,
##             "created": 1579360976755,
##             "url": "{{quotes_mrgs_api}}/tabconf/delete",
##             "name": "删除底栏设置",
##             "description": "# DELETE /tabconf/delete\n\n## apikey flag\n\ntabconf_delete[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_7f94f457bde647edb1d9131b9cb0eb1f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_7389c46f6dda4a24b6632b23c64a640b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]1.行情子系统/H5底栏设置/删除底栏设置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976763,
##             "created": 1579360976763,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/查询底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976771,
##             "created": 1579360976771,
##             "name": "H5底栏设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/查询底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_92c85e764141df529563e729cae68462",
##             "parentId": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "modified": 1579360976779,
##             "created": 1579360976779,
##             "url": "{{quotes_mrgs_api}}/tabconf/qry",
##             "name": "查询底栏设置",
##             "description": "# GET /tabconf/qry\n\n## apikey flag\n\ntabconf_qry[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"sorts\": \"sorts\",\n        \"icon\": \"icon\",\n        \"name\": \"名称\",\n        \"value\": \"值\"\n    },\n    \"options_define\": {\n        \"sorts\": {\n            \"dataType\": \"int\"\n        },\n        \"icon\": {\n            \"dataType\": \"string\"\n        },\n        \"name\": {\n            \"dataType\": \"string\"\n        },\n        \"value\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_17f23168862146bca23cfbb1b92c7a47",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_efb34ed2015c4380803a35063ee7dd42",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_82ac2750c1ea483bb4fb33e25b9fe509",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_ce77c8c8f3f143c88c955dd8f810ff1c"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_15d23d5955a1416cbb75a8294da3ed54"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.行情子系统/H5底栏设置/查询底栏设置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976789,
##             "created": 1579360976789,
##             "name": "1.行情子系统",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/修改底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "parentId": "fld_2c134a10399bad4c79ddf0341dc38452",
##             "modified": 1579360976803,
##             "created": 1579360976803,
##             "name": "H5底栏设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.行情子系统/H5底栏设置/修改底栏设置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a4776e7405aeb4d1adfb2032a79187cf",
##             "parentId": "fld_ca56e38c1f720bd59689e691ab6a167b",
##             "modified": 1579360976815,
##             "created": 1579360976815,
##             "url": "{{quotes_mrgs_api}}/tabconf/update",
##             "name": "修改底栏设置",
##             "description": "# PUT /tabconf/update\n\n## apikey flag\n\ntabconf_update[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nicon|string|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nvalue|string|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\nname|string|False|None|名称|is_array=False,maxlen=32,minlen=1,decpoint=6,declen=16\nsorts|int32|False|None|值|is_array=False,maxlen=128,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"icon\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"value\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"name\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"名称\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"sorts\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"值\",\n        \"options\": {\n            \"is_array\": false,\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"icon\": \"\",\n    \"value\": \"\",\n    \"name\": \"\",\n    \"sorts\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_94ddbb07543847bcb9ed593bbbcb46c1"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_f8f8200dc46d4a24af8fe4ec20f54f7b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]1.行情子系统/H5底栏设置/修改底栏设置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_d7086606624f6ee23faa264987f06725",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976828,
##             "created": 1579360976828,
##             "name": "4.报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/登录操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_31f36f8541d7af65ac8b894575feea6b",
##             "parentId": "fld_d7086606624f6ee23faa264987f06725",
##             "modified": 1579360976838,
##             "created": 1579360976838,
##             "name": "账号系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/登录操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_51499785c033dfb778649e0281b55a6b",
##             "parentId": "fld_31f36f8541d7af65ac8b894575feea6b",
##             "modified": 1579360976846,
##             "created": 1579360976846,
##             "name": "系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/登录操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7ff69ff346482797aacc9704b376a05c",
##             "parentId": "fld_51499785c033dfb778649e0281b55a6b",
##             "modified": 1579360976858,
##             "created": 1579360976858,
##             "name": "登录操作日志查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/登录操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_160e4c68b5c2d7aba0e4cec93f0517c2",
##             "parentId": "fld_7ff69ff346482797aacc9704b376a05c",
##             "modified": 1579360976869,
##             "created": 1579360976869,
##             "url": "{{quotes_mrgs_api}}/querys/oplog_login/today",
##             "name": "当日查询",
##             "description": "# GET /querys/oplog_login/today\n\n## apikey flag\n\ns_oplog_login_query[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"logid\": \"日志id\",\n        \"logtype\": \"日志类型\",\n        \"logtime\": \"日志时间\",\n        \"accessip\": \"访问ip\",\n        \"logincode\": \"登录账号\",\n        \"utype\": \"用户类型\",\n        \"jshow\": \"日志信息\",\n        \"jbefore\": \"修改前\",\n        \"jafter\": \"修改后\"\n    },\n    \"options_define\": {\n        \"logid\": {\n            \"dataType\": \"int\"\n        },\n        \"logtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumOpLogTypeTranslate\"\n        },\n        \"logtime\": {\n            \"dataType\": \"datetime\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"accessip\": {\n            \"dataType\": \"string\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"utype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumOpUserTypeTranslate\"\n        },\n        \"jshow\": {\n            \"dataType\": \"string\"\n        },\n        \"jbefore\": {\n            \"dataType\": \"string\"\n        },\n        \"jafter\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_89bc486d3b3840bdaaec40febef9cbf4",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_890807ea643948e180ced1eac8d5cd87",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_acfb07d6937f40e59e8d307a65525832",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_4465d23b736d446ea426a85526184de0"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_59969f9cbfc748ff8ba9bbbc39898b26"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.报表查询/账号系统报表查询/系统报表查询/登录操作日志查询/当日查询",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_d7086606624f6ee23faa264987f06725",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976876,
##             "created": 1579360976876,
##             "name": "4.报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_31f36f8541d7af65ac8b894575feea6b",
##             "parentId": "fld_d7086606624f6ee23faa264987f06725",
##             "modified": 1579360976887,
##             "created": 1579360976887,
##             "name": "账号系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_51499785c033dfb778649e0281b55a6b",
##             "parentId": "fld_31f36f8541d7af65ac8b894575feea6b",
##             "modified": 1579360976899,
##             "created": 1579360976899,
##             "name": "系统报表查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_53142fe7f037777cff8e47f37f402d3c",
##             "parentId": "fld_51499785c033dfb778649e0281b55a6b",
##             "modified": 1579360976908,
##             "created": 1579360976908,
##             "name": "操作日志查询",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.报表查询/账号系统报表查询/系统报表查询/操作日志查询/当日查询",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_a731c0d502825afbbee1b3e850325fec",
##             "parentId": "fld_53142fe7f037777cff8e47f37f402d3c",
##             "modified": 1579360976921,
##             "created": 1579360976921,
##             "url": "{{quotes_mrgs_api}}/querys/oplog/today",
##             "name": "当日查询",
##             "description": "# GET /querys/oplog/today\n\n## apikey flag\n\ns_oplog_query[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"logid\": \"日志id\",\n        \"logtype\": \"日志类型\",\n        \"logtime\": \"日志时间\",\n        \"accessip\": \"访问ip\",\n        \"logincode\": \"登录账号\",\n        \"utype\": \"用户类型\",\n        \"jshow\": \"日志信息\",\n        \"jbefore\": \"修改前\",\n        \"jafter\": \"修改后\"\n    },\n    \"options_define\": {\n        \"logid\": {\n            \"dataType\": \"int\"\n        },\n        \"logtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumOpLogTypeTranslate\"\n        },\n        \"logtime\": {\n            \"dataType\": \"datetime\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"accessip\": {\n            \"dataType\": \"string\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"utype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumOpUserTypeTranslate\"\n        },\n        \"jshow\": {\n            \"dataType\": \"string\"\n        },\n        \"jbefore\": {\n            \"dataType\": \"string\"\n        },\n        \"jafter\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_31cf8f46d46e4795afe28af39ec15434",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_c8b3331ec22b4de885fb23172547d8b2",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_9141093242664c929449b47eff6ec3ae",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_c74f5f2d21a94796921a036108ac1d79"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_ff9c84e0f690474fb075e34231ec270c"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.报表查询/账号系统报表查询/系统报表查询/操作日志查询/当日查询",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976934,
##             "created": 1579360976934,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/获取业务Token(使用两步验证)",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_3eee0be0bf43e19fbb1c21a99179b292",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360976943,
##             "created": 1579360976943,
##             "url": "{{quotes_mrgs_api}}/login/biz/otpcode",
##             "name": "获取业务Token(使用两步验证)",
##             "description": "# POST /login/biz/otpcode\n\n## apikey flag\n\nmuser_biz_otp[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\napi_key|string|False|auth_phone_unbinding[PUT]|接口唯一标识|maxlen=128,minlen=1\ngcode|string|False|000000|两部验证验证码|maxlen=6,minlen=6\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntoken|string|False||业务验证码|maxlen=64,minlen=1\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"api_key\": {\n        \"type\": \"string\",\n        \"default\": \"auth_phone_unbinding[PUT]\",\n        \"comment\": \"接口唯一标识\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 128,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"gcode\": {\n        \"type\": \"string\",\n        \"default\": \"000000\",\n        \"comment\": \"两部验证验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 6,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"token\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"业务验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 64,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"api_key\": \"auth_phone_unbinding[PUT]\",\n    \"gcode\": \"000000\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_5820ac2176fd4d4db82d22aaa84e9d9e"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_3c1158bbfa1a4d2eb4f5b9a4f49c45f9"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/获取业务Token(使用两步验证)",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976954,
##             "created": 1579360976954,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/Session更新",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a40fe0ba387a1f85b9c52f25017e8b5f",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360976962,
##             "created": 1579360976962,
##             "url": "{{quotes_mrgs_api}}/login/heartbeat",
##             "name": "Session更新",
##             "description": "# PUT /login/heartbeat\n\n## apikey flag\n\nmuser_heartbeat[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsid|string|False||登录Token|maxlen=64,minlen=1\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"sid\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"登录Token\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 64,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_6daeef0b8feb4e93a92d1729f5b7fa05"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_dfe9885d57514e9bbc98a5d2244de2d0"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]2.用户登录/Session更新",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976972,
##             "created": 1579360976972,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/获取图片验证码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f3ea05e6f13cd490d07a07c66d545093",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360976978,
##             "created": 1579360976978,
##             "url": "{{quotes_mrgs_api}}/login/loging/catcha",
##             "name": "获取图片验证码",
##             "description": "# GET /login/loging/catcha\n\n## apikey flag\n\nmlogin_catcha[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlogincode|string|true|system|登录账号\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_cf731285973b427fb14bfe7702836fef",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_e8fb6b42229d4458982a8a68cec68bf0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_9041ab899f864488abb71881ac971ddf",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [
##                 {
##                     "name": "logincode",
##                     "value": "system",
##                     "desc": "登录账号"
##                 }
##             ],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_6322eaa1ae914a9c9a48af55b6164a6a"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_2b43c831511e437ca08453a8980630a8"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]2.用户登录/获取图片验证码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360976988,
##             "created": 1579360976988,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/检查登录令牌是否有效",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a9d81cc1079f6f380d6ed000a66d271c",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977000,
##             "created": 1579360977000,
##             "url": "{{quotes_mrgs_api}}/login/islogged",
##             "name": "检查登录令牌是否有效",
##             "description": "# POST /login/islogged\n\n## apikey flag\n\nmuser_islogged[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsid|string|False||登录Token|maxlen=64,minlen=0\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"sid\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"登录Token\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 64,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"sid\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_bef7610c4e4344d5acc3becdd4e611cf"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_cd8d3e28bcdb4228bf5e12af5422a95e"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/检查登录令牌是否有效",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977013,
##             "created": 1579360977013,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/两部验证验证提交",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_32459fb802e1f7c53f1a1f7b69782969",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977022,
##             "created": 1579360977022,
##             "url": "{{quotes_mrgs_api}}/login/loging/otpcode",
##             "name": "两部验证验证提交",
##             "description": "# POST /login/loging/otpcode\n\n## apikey flag\n\nmuser_login_otp[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ngcode|string|False|000000|两部验证验证码|maxlen=6,minlen=6\notp_token|string|False||一次性验证码|minlen=6\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"gcode\": {\n        \"type\": \"string\",\n        \"default\": \"000000\",\n        \"comment\": \"两部验证验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 6,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"otp_token\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"一次性验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"gcode\": \"000000\",\n    \"otp_token\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_4e662840dcac4195a3131744922a9fe6"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_b3764d529bf342f086df5e0af63ae744"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/两部验证验证提交",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977036,
##             "created": 1579360977036,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/发送Google认证码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_2e2a3f1899a26719408652730ba6bea1",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977041,
##             "created": 1579360977041,
##             "url": "{{quotes_mrgs_api}}/login/loging/otpcode/send",
##             "name": "发送Google认证码",
##             "description": "# POST /login/loging/otpcode/send\n\n## apikey flag\n\nmuser_login_gcode[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nmode|string32|False|sms|请求两部验证验证码，发送模式（手机|电子邮件）|maxlen=6,minlen=1\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"mode\": {\n        \"type\": \"string32\",\n        \"default\": \"sms\",\n        \"comment\": \"请求两部验证验证码，发送模式（手机|电子邮件）\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 6,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"mode\": \"sms\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_cf4175af224644a1a99148db1f227af4"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_61ec0cba884a49f1bfd15ce5374936b3"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/发送Google认证码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977053,
##             "created": 1579360977053,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/用户登录",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_79019900dc634b01be5c038d6e7a8eab",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977069,
##             "created": 1579360977069,
##             "url": "{{quotes_mrgs_api}}/login/loging",
##             "name": "用户登录",
##             "description": "# POST /login/loging\n\n## apikey flag\n\nmuser_login[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlogincode|string|False|system|登录账号|maxlen=32,minlen=6\npassword|string|False|system|密码|maxlen=128,minlen=6\nclientver|string|False|0.0.0.1|客户版本|maxlen=16,minlen=6\npiccode|string|False|000000|图片验证码|maxlen=6,minlen=6\nproductid|string|False||产品ID|maxlen=16,minlen=0\ndeviceid|string|False||设备ID|maxlen=16,minlen=0\npubkey|string|False||RSA公钥|maxlen=256,minlen=0\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\npcodes|list_string|False|[]|产品列表|\nneed_otp|bool|False|False|需要otp|\nsid|string|False||登录Token|maxlen=64,minlen=1\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"logincode\": {\n        \"type\": \"string\",\n        \"default\": \"system\",\n        \"comment\": \"登录账号\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"password\": {\n        \"type\": \"string\",\n        \"default\": \"system\",\n        \"comment\": \"密码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 128,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"clientver\": {\n        \"type\": \"string\",\n        \"default\": \"0.0.0.1\",\n        \"comment\": \"客户版本\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 16,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"piccode\": {\n        \"type\": \"string\",\n        \"default\": \"000000\",\n        \"comment\": \"图片验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 6,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"productid\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"产品ID\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 16,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"deviceid\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"设备ID\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 16,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"pubkey\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"RSA公钥\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 0,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"pcodes\": {\n        \"type\": \"list_string\",\n        \"default\": [],\n        \"comment\": \"产品列表\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"need_otp\": {\n        \"type\": \"bool\",\n        \"default\": false,\n        \"comment\": \"需要otp\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"sid\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"登录Token\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 64,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"logincode\": \"system\",\n    \"password\": \"system\",\n    \"clientver\": \"0.0.0.1\",\n    \"piccode\": \"000000\",\n    \"productid\": \"\",\n    \"deviceid\": \"\",\n    \"pubkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_92f77d3d5d064f6aa14e3bca2c5af1df"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_0e3932b01091468eb90b0238e6d57a76"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/用户登录",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977087,
##             "created": 1579360977087,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/需要图片验证码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_350fa54c9f3a3c93a308e01e8fcbce8a",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977096,
##             "created": 1579360977096,
##             "url": "{{quotes_mrgs_api}}/login/loging/need_catcha",
##             "name": "需要图片验证码",
##             "description": "# POST /login/loging/need_catcha\n\n## apikey flag\n\nmlogin_need_catcha[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlogincode|string|False|system|登录账号|maxlen=32,minlen=6\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nis_need_piccode|bool|False|False|需要图片验证码|\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"logincode\": {\n        \"type\": \"string\",\n        \"default\": \"system\",\n        \"comment\": \"登录账号\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"is_need_piccode\": {\n        \"type\": \"bool\",\n        \"default\": false,\n        \"comment\": \"需要图片验证码\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"logincode\": \"system\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_8075339321144440b4137c5d4ebe4f95"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_1372344b606d4ce5a081576b4fde4a12"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/需要图片验证码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977106,
##             "created": 1579360977106,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/查询用户状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f59610c02d9108287089aa298606f82b",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977117,
##             "created": 1579360977117,
##             "url": "{{quotes_mrgs_api}}/login/status",
##             "name": "查询用户状态",
##             "description": "# GET /login/status\n\n## apikey flag\n\nmauth_user_status[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登陆账号\",\n        \"nikename\": \"用户昵称\",\n        \"location\": \"邮寄地址\",\n        \"userpwdstrong\": \"登陆密码强度\",\n        \"reviewstatus\": \"用户审核状态\",\n        \"commitstatus\": \"用户审核状态\",\n        \"phone\": \"手机\",\n        \"email\": \"电子邮件\",\n        \"gauth\": \"是否谷歌认证工具\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"location\": {\n            \"dataType\": \"string\"\n        },\n        \"userpwdstrong\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"int\"\n        },\n        \"commitstatus\": {\n            \"dataType\": \"int\"\n        },\n        \"phone\": {\n            \"dataType\": \"string\"\n        },\n        \"email\": {\n            \"dataType\": \"string\"\n        },\n        \"gauth\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumOptTypeTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_02e08f77e79341deb9abe2bd5600cb3d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_6d9a4aa02b554130937df307318b4156",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_0055bf4044df4a589d6b9422e1249eed",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_6a45554b0feb4e6288a638b50392ccdf"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_b1c686d544de43f1a4386e816a2b3681"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]2.用户登录/查询用户状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977127,
##             "created": 1579360977127,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/注销",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_c2ba07d97d48973af09ea5ffdda2cef7",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977137,
##             "created": 1579360977137,
##             "url": "{{quotes_mrgs_api}}/login/logout",
##             "name": "注销",
##             "description": "# POST /login/logout\n\n## apikey flag\n\nmuser_logout[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1ef4d6850b3b4e2f93216a678fba1f52"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_145253c77142495f9b256d4fce3533c7"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/注销",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977140,
##             "created": 1579360977140,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/获取公钥",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_4a9c267c9b68b912900cd341765398ea",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977153,
##             "created": 1579360977153,
##             "url": "{{quotes_mrgs_api}}/login/pubkey",
##             "name": "获取公钥",
##             "description": "# POST /login/pubkey\n\n## apikey flag\n\nmpub_key[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\npubkey|string|False|False|RSA公钥|\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"pubkey\": {\n        \"type\": \"string\",\n        \"default\": false,\n        \"comment\": \"RSA公钥\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_684846d67c1d4032a19a16a2b8b2372e"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_52a9378d6bb84f94a34e10d14c6fb462"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/获取公钥",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977161,
##             "created": 1579360977161,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/获取服务器时间戳",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_b72dc39f9f9a97cc24a533754970f076",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977170,
##             "created": 1579360977170,
##             "url": "{{quotes_mrgs_api}}/login/timestamp",
##             "name": "获取服务器时间戳",
##             "description": "# POST /login/timestamp\n\n## apikey flag\n\ntimestamp[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntimestamp|int|False|False|服务器时间戳|\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"timestamp\": {\n        \"type\": \"int\",\n        \"default\": false,\n        \"comment\": \"服务器时间戳\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_2287f60f4257452db055025155b296fa"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_92081d923f6c438db749dbb066a33eb4"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/获取服务器时间戳",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977183,
##             "created": 1579360977183,
##             "name": "2.用户登录",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]2.用户登录/登录令牌是否安全",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_9f1fc2ff73ba0b52166decb5b72866c8",
##             "parentId": "fld_f70a643c2bb977f2d0b18c6d3a1dbab8",
##             "modified": 1579360977192,
##             "created": 1579360977192,
##             "url": "{{quotes_mrgs_api}}/login/loging/safe_limit",
##             "name": "登录令牌是否安全",
##             "description": "# POST /login/loging/safe_limit\n\n## apikey flag\n\nmis_safe_limit[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nis_safe_limit|bool|False|False|登录令牌是否安全|\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"is_safe_limit\": {\n        \"type\": \"bool\",\n        \"default\": false,\n        \"comment\": \"登录令牌是否安全\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1f0865cba2a046089347b384680a741d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_3a506f3abf464c8ab4c6c183c9522464"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]2.用户登录/登录令牌是否安全",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977203,
##             "created": 1579360977203,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/删除应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977211,
##             "created": 1579360977211,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/删除应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_5dbc8a386ef51be453c46695e0332ab3",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977220,
##             "created": 1579360977220,
##             "url": "{{quotes_mrgs_api}}/sys/apps",
##             "name": "删除应用AppKey",
##             "description": "# DELETE /sys/apps\n\n## apikey flag\n\napp_appkeys[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"appkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_a1f57d1890bc490ea0f15dffd0735774"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_769f9b59365c4aa6887a75dbc7f41691"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]3.系统设置/应用AppKey设置/删除应用AppKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977228,
##             "created": 1579360977228,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用接口权限列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977237,
##             "created": 1579360977237,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用接口权限列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd48caac05456c4053a7e91fe4f2e7e8",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977246,
##             "created": 1579360977246,
##             "url": "{{quotes_mrgs_api}}/sys/apps/scopes",
##             "name": "查询应用接口权限列表",
##             "description": "# GET /sys/apps/scopes\n\n## apikey flag\n\napp_appscopes[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"scopekey\": \"权限接口key\",\n        \"scopename\": \"权限接口名称\",\n        \"scopedesc\": \"权限接口描述\"\n    },\n    \"options_define\": {\n        \"scopekey\": {\n            \"dataType\": \"string\"\n        },\n        \"scopename\": {\n            \"dataType\": \"string\"\n        },\n        \"scopedesc\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_8b89c4408c1e449d9743216a05e6b580",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_4ce28b55beac438c91fe62983b72dcbc",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_80dc6c6269aa43febcb94dd70eca0b3b",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_833f9f5434a94be5aeeff70bdabe7318"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e84320e315cb4976b1f32581bcd66338"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/应用AppKey设置/查询应用接口权限列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977259,
##             "created": 1579360977259,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用接口权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977269,
##             "created": 1579360977269,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用接口权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_62aaa1ab9cc295ef44723693bb90721b",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977280,
##             "created": 1579360977280,
##             "url": "{{quotes_mrgs_api}}/sys/apps/scopes/map",
##             "name": "查询应用接口权限",
##             "description": "# GET /sys/apps/scopes/map\n\n## apikey flag\n\napp_appscopes_map[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"scopekey\": \"权限接口key\",\n        \"scopename\": \"权限接口名称\",\n        \"scopedesc\": \"权限接口描述\",\n        \"appkey\": \"应用键值\",\n        \"isenable\": \"是否持有权限\"\n    },\n    \"options_define\": {\n        \"scopekey\": {\n            \"dataType\": \"string\"\n        },\n        \"scopename\": {\n            \"dataType\": \"string\"\n        },\n        \"scopedesc\": {\n            \"dataType\": \"string\"\n        },\n        \"appkey\": {\n            \"dataType\": \"string\"\n        },\n        \"isenable\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"appkey\": \"\"\n}",
##                         "id": "pair_f0b08ff59a6c4a7eaff563c4d32d1157",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_9451c85ba23a4a399779797c30b6436e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_d94f542ef9414025a4bf4856973215c6",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_dfce392a15b0469dbb4e85c104fdee62"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_656a8958946c48a88a726d0abdb52471"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/应用AppKey设置/查询应用接口权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977292,
##             "created": 1579360977292,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977304,
##             "created": 1579360977304,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_563b6b3900752d71c0fadfbfa9ad781d",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977315,
##             "created": 1579360977315,
##             "url": "{{quotes_mrgs_api}}/sys/apps/appsecret",
##             "name": "查询应用密钥串",
##             "description": "# GET /sys/apps/appsecret\n\n## apikey flag\n\napp_appsecret[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"appkey\": \"应用键值\",\n        \"appsecret\": \"应用密串\",\n        \"appcode\": \"应用编码\",\n        \"appname\": \"应用名称\",\n        \"appdesc\": \"应用描述\",\n        \"appdomain\": \"应用域名检查\",\n        \"isused\": \"应用是否受限\",\n        \"isdisabled\": \"应用是否禁用\",\n        \"isautopass\": \"是否自动pass\",\n        \"isuserapp\": \"是否是终端应用\"\n    },\n    \"options_define\": {\n        \"appkey\": {\n            \"dataType\": \"string\"\n        },\n        \"appsecret\": {\n            \"dataType\": \"string\"\n        },\n        \"appcode\": {\n            \"dataType\": \"string\"\n        },\n        \"appname\": {\n            \"dataType\": \"string\"\n        },\n        \"appdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"appdomain\": {\n            \"dataType\": \"string\"\n        },\n        \"isused\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isdisabled\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isautopass\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isuserapp\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"appkey\": \"\"\n}",
##                         "id": "pair_b676a378170d433b885ec9fc9b3f391f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_b4b88d4100aa4a418c9dff25f938a93f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_c5d6991704b14d97b493e781955ad301",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_a407ee82597f4404b2ccad3c3a0157fc"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e01d00214ebf42ecb499b41d4efd07ea"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/应用AppKey设置/查询应用密钥串",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977328,
##             "created": 1579360977328,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977339,
##             "created": 1579360977339,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/查询应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6e467594bab70649723549d65ef98ff1",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977348,
##             "created": 1579360977348,
##             "url": "{{quotes_mrgs_api}}/sys/apps",
##             "name": "查询应用AppKey",
##             "description": "# GET /sys/apps\n\n## apikey flag\n\napp_appkeys[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"appkey\": \"应用键值\",\n        \"appsecret\": \"应用密串\",\n        \"appcode\": \"应用编码\",\n        \"appname\": \"应用名称\",\n        \"appdesc\": \"应用描述\",\n        \"appdomain\": \"应用域名检查\",\n        \"isused\": \"应用是否受限\",\n        \"isdisabled\": \"应用是否禁用\",\n        \"isautopass\": \"是否自动pass\",\n        \"isuserapp\": \"是否是终端应用\"\n    },\n    \"options_define\": {\n        \"appkey\": {\n            \"dataType\": \"string\"\n        },\n        \"appsecret\": {\n            \"dataType\": \"string\"\n        },\n        \"appcode\": {\n            \"dataType\": \"string\"\n        },\n        \"appname\": {\n            \"dataType\": \"string\"\n        },\n        \"appdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"appdomain\": {\n            \"dataType\": \"string\"\n        },\n        \"isused\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isdisabled\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isautopass\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        },\n        \"isuserapp\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsEnableTypeTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"appkey\": \"\"\n}",
##                         "id": "pair_74207315363245bdaa364094630efef8",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_6d713a60badd4fb3b7b980fed46be8d8",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_853616ece6d1403785df848048a300d9",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_2294050a15964947abb5d5d186bfb11a"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_a68f3869744447abbf62dc221457386d"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/应用AppKey设置/查询应用AppKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977363,
##             "created": 1579360977363,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/创建应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977377,
##             "created": 1579360977377,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/创建应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_6c1dc5b583dfa2c2ac31fa53ecbf5cc1",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977394,
##             "created": 1579360977394,
##             "url": "{{quotes_mrgs_api}}/sys/apps",
##             "name": "创建应用AppKey",
##             "description": "# POST /sys/apps\n\n## apikey flag\n\napp_appkeys[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappdesc|string|False|None|应用客户描述|maxlen=128,minlen=0,decpoint=6,declen=16\nappdomain|string|False|None|应用授权域名|maxlen=64,minlen=0,decpoint=6,declen=16\nisuserapp|EnumIsEnableType|False|None|是否是终端应用|decpoint=6,declen=16\nappcode|string|False|None|应用客户端编码|maxlen=64,minlen=0,decpoint=6,declen=16\nappname|string|False|None|应用客户名称|maxlen=64,minlen=0,decpoint=6,declen=16\nisautopass|EnumIsEnableType|False|None|是否自动pass|decpoint=6,declen=16\nisused|EnumIsEnableType|False|None|是否生效配置|decpoint=6,declen=16\nisdisabled|EnumIsEnableType|False|None|是否禁用|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appdesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户描述\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appdomain\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用授权域名\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isuserapp\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否是终端应用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端编码\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isautopass\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否自动pass\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isused\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否生效配置\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isdisabled\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否禁用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"appdesc\": \"\",\n    \"appdomain\": \"\",\n    \"isuserapp\": 0,\n    \"appcode\": \"\",\n    \"appname\": \"\",\n    \"isautopass\": 0,\n    \"isused\": 0,\n    \"isdisabled\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_0d4f6023504a4ef0b2e2065fc3ceb2e2"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_5393278094d34696b2c136161c20254f"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]3.系统设置/应用AppKey设置/创建应用AppKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977406,
##             "created": 1579360977406,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/重置应用密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977419,
##             "created": 1579360977419,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/重置应用密钥串",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_bf82953465559312ee0fa12463f4e79e",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977427,
##             "created": 1579360977427,
##             "url": "{{quotes_mrgs_api}}/sys/apps/appsecret",
##             "name": "重置应用密钥串",
##             "description": "# PUT /sys/apps/appsecret\n\n## apikey flag\n\napp_appsecret_reset[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"appkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_4dd85e30b8d54cc08ee72b69dd40d065"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d826789b01af499fa0ca073d086468c2"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/应用AppKey设置/重置应用密钥串",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977438,
##             "created": 1579360977438,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/修改应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977454,
##             "created": 1579360977454,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/修改应用AppKey",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_8d35e09d130a81a26215d28737028e72",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977471,
##             "created": 1579360977471,
##             "url": "{{quotes_mrgs_api}}/sys/apps",
##             "name": "修改应用AppKey",
##             "description": "# PUT /sys/apps\n\n## apikey flag\n\napp_appkeys[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappdesc|string|False|None|应用客户描述|maxlen=128,minlen=0,decpoint=6,declen=16\nappdomain|string|False|None|应用授权域名|maxlen=64,minlen=0,decpoint=6,declen=16\nisuserapp|EnumIsEnableType|False|None|是否是终端应用|decpoint=6,declen=16\nappkey|string|False|None|应用客户端KEY|maxlen=64,minlen=1,decpoint=6,declen=16\nappcode|string|False|None|应用客户端编码|maxlen=64,minlen=0,decpoint=6,declen=16\nappname|string|False|None|应用客户名称|maxlen=64,minlen=0,decpoint=6,declen=16\nisautopass|EnumIsEnableType|False|None|是否自动pass|decpoint=6,declen=16\nisused|EnumIsEnableType|False|None|是否生效配置|decpoint=6,declen=16\nisdisabled|EnumIsEnableType|False|None|是否禁用|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appdesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户描述\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appdomain\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用授权域名\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isuserapp\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否是终端应用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appkey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端KEY\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"appcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户端编码\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"appname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"应用客户名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isautopass\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否自动pass\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isused\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否生效配置\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isdisabled\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否禁用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"appdesc\": \"\",\n    \"appdomain\": \"\",\n    \"isuserapp\": 0,\n    \"appkey\": \"\",\n    \"appcode\": \"\",\n    \"appname\": \"\",\n    \"isautopass\": 0,\n    \"isused\": 0,\n    \"isdisabled\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_7f6d49f28c2e46f689083412003e6da8"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_22a90fc25b3842b5b487e28227e02a79"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/应用AppKey设置/修改应用AppKey",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977487,
##             "created": 1579360977487,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/修改应用接口权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977496,
##             "created": 1579360977496,
##             "name": "应用AppKey设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/应用AppKey设置/修改应用接口权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_1537e41218340220994a3e6942a39699",
##             "parentId": "fld_f274e161fcff9ede4cf26aac5701dd38",
##             "modified": 1579360977506,
##             "created": 1579360977506,
##             "url": "{{quotes_mrgs_api}}/sys/apps/scopes/map",
##             "name": "修改应用接口权限",
##             "description": "# PUT /sys/apps/scopes/map\n\n## apikey flag\n\napp_appscopes_map[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nappkey|string|False||appkey|\nscopes|list_string|False|['userinfo']|应用权限列表|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"appkey\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"appkey\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"scopes\": {\n        \"type\": \"list_string\",\n        \"default\": [\n            \"userinfo\"\n        ],\n        \"comment\": \"应用权限列表\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"appkey\": \"\",\n    \"scopes\": [\n        \"userinfo\"\n    ]\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_4462858538aa4a369972d60a1485f083"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6385ef8728854b3aa317bfb5e24588ed"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/应用AppKey设置/修改应用接口权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977518,
##             "created": 1579360977518,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/删除公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977525,
##             "created": 1579360977525,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/删除公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_4b5fed7d40870927f759bea6918703ea",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977535,
##             "created": 1579360977535,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins",
##             "name": "删除公告",
##             "description": "# DELETE /sys/bulletins\n\n## apikey flag\n\nsys_bulletins[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"bulletinid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_562d79a2dfd94cc99065c60fa12b768e"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_677e5f91ffde417385aaf2ccb39db51c"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]3.系统设置/公告设置/删除公告",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977541,
##             "created": 1579360977541,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询公告描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977554,
##             "created": 1579360977554,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询公告描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c8060f22b1c34664e70ecf1a337927eb",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977561,
##             "created": 1579360977561,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/detail",
##             "name": "查询公告描述",
##             "description": "# GET /sys/bulletins/detail\n\n## apikey flag\n\nsys_bulletins_detail[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"bulletinid\": \"公告id\",\n        \"startdate\": \"开始时间\",\n        \"context\": \"内容\"\n    },\n    \"options_define\": {\n        \"bulletinid\": {\n            \"dataType\": \"int\"\n        },\n        \"startdate\": {\n            \"dataType\": \"datetime\"\n        },\n        \"context\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"bulletinid\": 0\n}",
##                         "id": "pair_87b109f00df64c2ba94f5a70da7071c0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_7e4e3436db4f46a9bb99b01ec2dede3a",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_cf746ab63345423081524e5af33ab0cf",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_39fcc456d3b74187a35563fbbd676e5d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_5bf000f33e6840638489f6f4218049e5"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/公告设置/查询公告描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977575,
##             "created": 1579360977575,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询公告列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977588,
##             "created": 1579360977588,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询公告列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_f71426ba35375ade0e26b1dde6e91d82",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977601,
##             "created": 1579360977601,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins",
##             "name": "查询公告列表",
##             "description": "# GET /sys/bulletins\n\n## apikey flag\n\nsys_bulletins[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"bulletinid\": \"公告id\",\n        \"startdate\": \"开始时间\",\n        \"enddate\": \"结束时间\",\n        \"title\": \"标题\",\n        \"objectacctype\": \"过滤账号类型\",\n        \"objectjson\": \"过滤条件\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户\",\n        \"applylogincode\": \"申请账号\",\n        \"applydesc\": \"申请描述\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastoplogincode\": \"最后审核人账号\",\n        \"lastopstatus\": \"最后审核结果\",\n        \"lastopdesc\": \"最后审核描述\"\n    },\n    \"options_define\": {\n        \"bulletinid\": {\n            \"dataType\": \"int\"\n        },\n        \"startdate\": {\n            \"dataType\": \"datetime\"\n        },\n        \"enddate\": {\n            \"dataType\": \"datetime\"\n        },\n        \"title\": {\n            \"dataType\": \"string\"\n        },\n        \"objectacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"objectjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastoplogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"lastopstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastopdesc\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_5a1a1a0c150e4f8c895db26262a7195e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_d34b13d00488434a962217f633e5d5d6",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_addae9ad476b4e5db0424cafc0c72c30",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_b3739ac4914c4d119f50886bd64b8d8b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c29db4a4f9bb4b0bad07bebba34a1edf"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/公告设置/查询公告列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977610,
##             "created": 1579360977610,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询管理员自己的公告列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977622,
##             "created": 1579360977622,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询管理员自己的公告列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_36bc51695c38365d960077340e285f2f",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977623,
##             "created": 1579360977623,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/list/self",
##             "name": "查询管理员自己的公告列表",
##             "description": "# GET /sys/bulletins/list/self\n\n## apikey flag\n\nsys_bulletins_list_self[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"bulletinid\": \"公告id\",\n        \"startdate\": \"开始时间\",\n        \"title\": \"标题\"\n    },\n    \"options_define\": {\n        \"bulletinid\": {\n            \"dataType\": \"int\"\n        },\n        \"startdate\": {\n            \"dataType\": \"datetime\"\n        },\n        \"title\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_8a315f70a5b24c60982c2aad06fd1d98",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_b63f4910c3a9434c98dd901780f11228",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_bfba6cf4314e4f6d924e1d1d183c1351",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_80f435b54c004770b504ddeaacd20729"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_20522541c726435094290258fe928479"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/公告设置/查询管理员自己的公告列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977639,
##             "created": 1579360977639,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询管理员自己的公告描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977649,
##             "created": 1579360977649,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/查询管理员自己的公告描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7ce0e724dfde51bc6ec09b26518b890c",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977654,
##             "created": 1579360977654,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/detail/self",
##             "name": "查询管理员自己的公告描述",
##             "description": "# GET /sys/bulletins/detail/self\n\n## apikey flag\n\nsys_bulletins_self[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"bulletinid\": \"公告id\",\n        \"startdate\": \"开始时间\",\n        \"context\": \"内容\"\n    },\n    \"options_define\": {\n        \"bulletinid\": {\n            \"dataType\": \"int\"\n        },\n        \"startdate\": {\n            \"dataType\": \"datetime\"\n        },\n        \"context\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_87327bb211c14c5f93425042b7758724",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_4ddd592467a440638318793a9d5e0417",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_cbee0bbc489042379f7a13854c9740cf",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_1fb85fa23a4b4fb58ac4373faac8b2e2"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_4500b2898f924c748518f552d36849e6"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/公告设置/查询管理员自己的公告描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977666,
##             "created": 1579360977666,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/创建公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977679,
##             "created": 1579360977679,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/创建公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_54e5b8b316c18a1e97eff2b07bb4048a",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977693,
##             "created": 1579360977693,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins",
##             "name": "创建公告",
##             "description": "# POST /sys/bulletins\n\n## apikey flag\n\nsys_bulletins[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nobjectjson|jsonb|False|None|公告过滤条件|decpoint=6,declen=16\napplydesc|string|False|None|申请描述|maxlen=64,minlen=0,decpoint=6,declen=16\nstartdate|datetime|False|None|开始时间|decpoint=6,declen=16\ntitle|string|False|None|标题|maxlen=32,minlen=0,decpoint=6,declen=16\nenddate|datetime|False|None|结束时间|decpoint=6,declen=16\ncontext|string|False|None|内容|maxlen=512,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"objectjson\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"公告过滤条件\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"applydesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"申请描述\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"startdate\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"开始时间\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"title\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"标题\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"enddate\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"结束时间\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"context\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"内容\",\n        \"options\": {\n            \"maxlen\": \"512\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"objectjson\": {},\n    \"applydesc\": \"\",\n    \"startdate\": \"19000101T000000\",\n    \"title\": \"\",\n    \"enddate\": \"19000101T000000\",\n    \"context\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_0c2da1a6047747988181d3d9da218adb"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6d40fb1411da42d9a06d18b932312e0b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]3.系统设置/公告设置/创建公告",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977707,
##             "created": 1579360977707,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/重建缓存信息至Redis",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977717,
##             "created": 1579360977717,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/重建缓存信息至Redis",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_ca8ae984f7669d44208b13f8856e09b9",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977725,
##             "created": 1579360977725,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/tocache",
##             "name": "重建缓存信息至Redis",
##             "description": "# PUT /sys/bulletins/tocache\n\n## apikey flag\n\nsys_bulletins_to_cache[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"bulletinid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_6097cf8bf78c433ebe726b5fd1ae9e72"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_40b35c1e28d744559ca7a9c113d7998d"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/公告设置/重建缓存信息至Redis",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977733,
##             "created": 1579360977733,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/修改公告状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977741,
##             "created": 1579360977741,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/修改公告状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_9fa393d33e69443204fef6ccf37000b7",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977753,
##             "created": 1579360977753,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/isenable",
##             "name": "修改公告状态",
##             "description": "# PUT /sys/bulletins/isenable\n\n## apikey flag\n\nsys_bulletins_isenable[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nisenable|EnumIsEnableType|False|None|审核类型|decpoint=6,declen=16\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"isenable\": {\n        \"default\": null,\n        \"type\": \"EnumIsEnableType\",\n        \"dbname\": \"\",\n        \"comment\": \"审核类型\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"isenable\": 0,\n    \"bulletinid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_ebf4853d8b29439fae367904d3871b06"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_91e885d76e1545dd984792c81c094bd3"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/公告设置/修改公告状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977765,
##             "created": 1579360977765,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/修改公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977778,
##             "created": 1579360977778,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/修改公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_96140030366dd45cbab4662ec049f3f3",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977792,
##             "created": 1579360977792,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins",
##             "name": "修改公告",
##             "description": "# PUT /sys/bulletins\n\n## apikey flag\n\nsys_bulletins[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nobjectjson|jsonb|False|None|公告过滤条件|decpoint=6,declen=16\napplydesc|string|False|None|申请描述|maxlen=64,minlen=0,decpoint=6,declen=16\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\nstartdate|datetime|False|None|开始时间|decpoint=6,declen=16\ntitle|string|False|None|标题|maxlen=32,minlen=0,decpoint=6,declen=16\nenddate|datetime|False|None|结束时间|decpoint=6,declen=16\ncontext|string|False|None|内容|maxlen=512,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"objectjson\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"公告过滤条件\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"applydesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"申请描述\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"startdate\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"开始时间\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"title\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"标题\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"enddate\": {\n        \"default\": null,\n        \"type\": \"datetime\",\n        \"dbname\": \"\",\n        \"comment\": \"结束时间\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"context\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"内容\",\n        \"options\": {\n            \"maxlen\": \"512\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"objectjson\": {},\n    \"applydesc\": \"\",\n    \"bulletinid\": 0,\n    \"startdate\": \"19000101T000000\",\n    \"title\": \"\",\n    \"enddate\": \"19000101T000000\",\n    \"context\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_e00951fbab834a3bbc257fe556fef10e"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_fa26b847fb19424986b553402ab6c59a"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/公告设置/修改公告",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977807,
##             "created": 1579360977807,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/审核公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977818,
##             "created": 1579360977818,
##             "name": "公告设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/公告设置/审核公告",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_5d28d8a68b6160abeb7d219f7de7992e",
##             "parentId": "fld_93ea41c412fa0c55ee0dcecec75740d0",
##             "modified": 1579360977830,
##             "created": 1579360977830,
##             "url": "{{quotes_mrgs_api}}/sys/bulletins/review",
##             "name": "审核公告",
##             "description": "# PUT /sys/bulletins/review\n\n## apikey flag\n\nsys_bulletins_review[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlastopdesc|string|False|None|最后审核描述|maxlen=64,minlen=0,decpoint=6,declen=16\nlastopstatus|EnumReviewStatus|False|None|最后审核结果|decpoint=6,declen=16\nbulletinid|int32|False|None|公告di|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"lastopdesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核描述\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"lastopstatus\": {\n        \"default\": null,\n        \"type\": \"EnumReviewStatus\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核结果\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"bulletinid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"公告di\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"lastopdesc\": \"\",\n    \"lastopstatus\": 0,\n    \"bulletinid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_f749c99980174232b657c540bb6b6742"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d2026b90cdf54921ae346e8668a7f9ec"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/公告设置/审核公告",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977847,
##             "created": 1579360977847,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/删除系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977859,
##             "created": 1579360977859,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/删除系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_f13a14e4a95f6af740580c2596165268",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360977871,
##             "created": 1579360977871,
##             "url": "{{quotes_mrgs_api}}/sys/menus",
##             "name": "删除系统菜单",
##             "description": "# DELETE /sys/menus\n\n## apikey flag\n\nsys_menu[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nmenuid|int32|False|None|菜单id|decpoint=6,declen=16\ndelete_sub|int32|False|None|删除子菜单|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"menuid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"delete_sub\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"删除子菜单\",\n        \"options\": {\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"menuid\": 0,\n    \"delete_sub\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_4c7c7da2d9d149029c37cc61000a4d4f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d06037f5be66468eb09d3b49349fb028"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]3.系统设置/系统菜单设置/删除系统菜单",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977886,
##             "created": 1579360977886,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/查询系统菜单描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977901,
##             "created": 1579360977901,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/查询系统菜单描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_2bdbbf6d792af473c77b2e77a934e46e",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360977919,
##             "created": 1579360977919,
##             "url": "{{quotes_mrgs_api}}/sys/menus/detail",
##             "name": "查询系统菜单描述",
##             "description": "# GET /sys/menus/detail\n\n## apikey flag\n\nsys_menu_detail[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nmenuid|int32|False|None|菜单id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"menuid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"menuid\": \"菜单id\",\n        \"menuname\": \"菜单名称\",\n        \"sortid\": \"显示顺序\",\n        \"parentid\": \"父菜单id\",\n        \"parentids\": \"父菜单结构\",\n        \"isstop\": \"是否停用\",\n        \"isshow\": \"是否显示\",\n        \"apikey\": \"接口名称\",\n        \"pagehref\": \"页面地址\",\n        \"funckey\": \"用户id\",\n        \"remark\": \"备忘\",\n        \"productid\": \"产品id\",\n        \"iconhref\": \"图表地址\",\n        \"jsoncache\": \"附加参数\"\n    },\n    \"options_define\": {\n        \"menuid\": {\n            \"dataType\": \"int\"\n        },\n        \"menuname\": {\n            \"dataType\": \"string\"\n        },\n        \"sortid\": {\n            \"dataType\": \"int\"\n        },\n        \"parentid\": {\n            \"dataType\": \"int\"\n        },\n        \"parentids\": {\n            \"dataType\": \"string\"\n        },\n        \"isstop\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsStopTypeTranslate\"\n        },\n        \"isshow\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIsStopTypeTranslate\"\n        },\n        \"apikey\": {\n            \"dataType\": \"string\"\n        },\n        \"pagehref\": {\n            \"dataType\": \"string\"\n        },\n        \"funckey\": {\n            \"dataType\": \"string\"\n        },\n        \"remark\": {\n            \"dataType\": \"string\"\n        },\n        \"productid\": {\n            \"dataType\": \"int\"\n        },\n        \"iconhref\": {\n            \"dataType\": \"string\"\n        },\n        \"jsoncache\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"menuid\": 0\n}",
##                         "id": "pair_08fb0e29c4ca4617b0f22d0faa2a69ff",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_29424473ac0746baa8d892831d24679e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_7ec1ca4dec83496a8e68d48bf46ca162",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_2ef453a5924240c3a6cf857d242a7040"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e2b1524cdf564ae3be3eb8e72fd20063"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/系统菜单设置/查询系统菜单描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977940,
##             "created": 1579360977940,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/查询系统菜单列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360977956,
##             "created": 1579360977956,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/查询系统菜单列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_12e7441a03f3cf814643b25eb44d87c0",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360977974,
##             "created": 1579360977974,
##             "url": "{{quotes_mrgs_api}}/sys/menus",
##             "name": "查询系统菜单列表",
##             "description": "# GET /sys/menus\n\n## apikey flag\n\nsys_menu[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nmenuid|int32|False|None|菜单id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"menuid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"menuid\": \"菜单id\",\n        \"menuname\": \"菜单名称\",\n        \"sortid\": \"显示顺序\",\n        \"parentid\": \"父菜单id\",\n        \"parentids\": \"父菜单结构\",\n        \"iconhref\": \"图表地址\"\n    },\n    \"options_define\": {\n        \"menuid\": {\n            \"dataType\": \"int\"\n        },\n        \"menuname\": {\n            \"dataType\": \"string\"\n        },\n        \"sortid\": {\n            \"dataType\": \"int\"\n        },\n        \"parentid\": {\n            \"dataType\": \"int\"\n        },\n        \"parentids\": {\n            \"dataType\": \"string\"\n        },\n        \"iconhref\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"menuid\": 0\n}",
##                         "id": "pair_5cdecffb122b449d80e45532c8506422",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_7c4db9a668a34bc7b777dc96a6d7e088",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_fb31bf29f8144cf396431448b3672282",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_0de0a951fca04c6f9fc5e4705e264dee"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_15797b19792841edacb446f2cb51f9c5"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/系统菜单设置/查询系统菜单列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360977995,
##             "created": 1579360977995,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/创建系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978030,
##             "created": 1579360978030,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/创建系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a2a502ea66d0e93050de2079967f2430",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360978054,
##             "created": 1579360978054,
##             "url": "{{quotes_mrgs_api}}/sys/menus",
##             "name": "创建系统菜单",
##             "description": "# POST /sys/menus\n\n## apikey flag\n\nsys_menu[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nisstop|EnumIsStopType|False|None|是否停用|decpoint=6,declen=16\napikey|string|False|None|接口名称|maxlen=64,minlen=0,decpoint=6,declen=16\npagehref|string|False|None|页面地址|maxlen=128,minlen=0,decpoint=6,declen=16\nmenuname|string|False|None|菜单名称|maxlen=64,minlen=0,decpoint=6,declen=16\nisshow|EnumIsStopType|False|None|是否显示|decpoint=6,declen=16\nfunckey|string|False|None|前端用配置字段|maxlen=64,minlen=0,decpoint=6,declen=16\niconhref|string|False|None|图表地址|maxlen=128,minlen=0,defval='',decpoint=6,declen=16\njsoncache|jsonb|False|None|额外补充字段|defval='{}',decpoint=6,declen=16\nproductid|int32|False|None|产品id|defval=0,decpoint=6,declen=16\nsortid|int32|False|None|显示顺序|defval=0,decpoint=6,declen=16\ncommituri|string|False|None|提交接口地址|maxlen=128,minlen=0,decpoint=6,declen=16\nremark|string|False|None|备忘|maxlen=64,minlen=0,decpoint=6,declen=16\nparentid|int32|False|None|父菜单id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"isstop\": {\n        \"default\": null,\n        \"type\": \"EnumIsStopType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否停用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"apikey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"接口名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"pagehref\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"页面地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"menuname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isshow\": {\n        \"default\": null,\n        \"type\": \"EnumIsStopType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否显示\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"funckey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"前端用配置字段\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"iconhref\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"图表地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"defval\": \"''\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"jsoncache\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"额外补充字段\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'{}'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"productid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"产品id\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"sortid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"显示顺序\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"commituri\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"提交接口地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"remark\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备忘\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"parentid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"父菜单id\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"isstop\": 0,\n    \"apikey\": \"\",\n    \"pagehref\": \"\",\n    \"menuname\": \"\",\n    \"isshow\": 0,\n    \"funckey\": \"\",\n    \"iconhref\": \"\",\n    \"jsoncache\": {},\n    \"productid\": 0,\n    \"sortid\": 0,\n    \"commituri\": \"\",\n    \"remark\": \"\",\n    \"parentid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_48abcd621a2a4a258ad71ee6698a9efa"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_1aa49cb2f64549f381c13456c8e11a22"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]3.系统设置/系统菜单设置/创建系统菜单",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978079,
##             "created": 1579360978079,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/重建缓存信息至Redis",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978098,
##             "created": 1579360978098,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/重建缓存信息至Redis",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_bbc3a4cc6e0fcab53646c2b394b81a1a",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360978121,
##             "created": 1579360978121,
##             "url": "{{quotes_mrgs_api}}/sys/menus/tocache",
##             "name": "重建缓存信息至Redis",
##             "description": "# PUT /sys/menus/tocache\n\n## apikey flag\n\nsys_menu_to_cache[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|菜单id|decpoint=6,declen=16\nuserid|int32|False|None|菜单id|decpoint=6,declen=16\napikey|int32|False|None|菜单id|decpoint=6,declen=16\nuserall|int32|False|None|菜单id|decpoint=6,declen=16\nroleall|int32|False|None|菜单id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"apikey\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"userall\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"roleall\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"roleid\": 0,\n    \"userid\": 0,\n    \"apikey\": 0,\n    \"userall\": 0,\n    \"roleall\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_c25e75cb2b7346c68dff08f7311eb070"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_f49ab334a9f14e88b9d4b1ae3838ffdf"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/系统菜单设置/重建缓存信息至Redis",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978145,
##             "created": 1579360978145,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/修改系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978180,
##             "created": 1579360978180,
##             "name": "系统菜单设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统菜单设置/修改系统菜单",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_b0c42d8036e559dccb8324c9c4611334",
##             "parentId": "fld_7dcf9ee9fac1c437a8527350050cb685",
##             "modified": 1579360978215,
##             "created": 1579360978215,
##             "url": "{{quotes_mrgs_api}}/sys/menus",
##             "name": "修改系统菜单",
##             "description": "# PUT /sys/menus\n\n## apikey flag\n\nsys_menu[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nmenuid|int32|False|None|菜单id|decpoint=6,declen=16\nparentids|string|False|None|父菜单结构|maxlen=64,minlen=0,decpoint=6,declen=16\napikey|string|False|None|接口名称|maxlen=64,minlen=0,decpoint=6,declen=16\npagehref|string|False|None|页面地址|maxlen=128,minlen=0,decpoint=6,declen=16\nmenuname|string|False|None|菜单名称|maxlen=64,minlen=0,decpoint=6,declen=16\nisshow|EnumIsStopType|False|None|是否显示|decpoint=6,declen=16\nfunckey|string|False|None|前端用配置字段|maxlen=64,minlen=0,decpoint=6,declen=16\niconhref|string|False|None|图表地址|maxlen=128,minlen=0,defval='',decpoint=6,declen=16\njsoncache|jsonb|False|None|额外补充字段|defval='{}',decpoint=6,declen=16\ncommituri|string|False|None|提交接口地址|maxlen=128,minlen=0,decpoint=6,declen=16\nproductid|int32|False|None|产品id|defval=0,decpoint=6,declen=16\nsortid|int32|False|None|显示顺序|defval=0,decpoint=6,declen=16\nisstop|EnumIsStopType|False|None|是否停用|decpoint=6,declen=16\nremark|string|False|None|备忘|maxlen=64,minlen=0,decpoint=6,declen=16\nparentid|int32|False|None|父菜单id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"menuid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"parentids\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"父菜单结构\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"apikey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"接口名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"pagehref\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"页面地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"menuname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"菜单名称\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isshow\": {\n        \"default\": null,\n        \"type\": \"EnumIsStopType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否显示\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"funckey\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"前端用配置字段\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"iconhref\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"图表地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"defval\": \"''\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"jsoncache\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"额外补充字段\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'{}'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"commituri\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"提交接口地址\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"productid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"产品id\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"sortid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"显示顺序\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"isstop\": {\n        \"default\": null,\n        \"type\": \"EnumIsStopType\",\n        \"dbname\": \"\",\n        \"comment\": \"是否停用\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"remark\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备忘\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"parentid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"父菜单id\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"menuid\": 0,\n    \"parentids\": \"\",\n    \"apikey\": \"\",\n    \"pagehref\": \"\",\n    \"menuname\": \"\",\n    \"isshow\": 0,\n    \"funckey\": \"\",\n    \"iconhref\": \"\",\n    \"jsoncache\": {},\n    \"commituri\": \"\",\n    \"productid\": 0,\n    \"sortid\": 0,\n    \"isstop\": 0,\n    \"remark\": \"\",\n    \"parentid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_85be940a3dcb48d491d131c2955995cc"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_21b714b28a244e8bb3ab0530c11ba6a3"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/系统菜单设置/修改系统菜单",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978261,
##             "created": 1579360978261,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/删除系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978274,
##             "created": 1579360978274,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/删除系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_c2d3bb2681c671a98507516087da211d",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978290,
##             "created": 1579360978290,
##             "url": "{{quotes_mrgs_api}}/sys/roles",
##             "name": "删除系统角色",
##             "description": "# DELETE /sys/roles\n\n## apikey flag\n\nsys_role[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|角色id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"roleid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_a87be16df63248d8a84f46c7c738ab6f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_be847a30939a49379611a73e2e32de7b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]3.系统设置/系统角色设置/删除系统角色",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978307,
##             "created": 1579360978307,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/查询角色菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978323,
##             "created": 1579360978323,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/查询角色菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_2f3836e0d6fcf903fc7062ae4f2d9543",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978340,
##             "created": 1579360978340,
##             "url": "{{quotes_mrgs_api}}/sys/roles/menu",
##             "name": "查询角色菜单权限",
##             "description": "# GET /sys/roles/menu\n\n## apikey flag\n\nsys_role_menu[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|角色id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"roleid\": \"角色id\",\n        \"menuid\": \"菜单id\",\n        \"selecttype\": \"勾选状态\"\n    },\n    \"options_define\": {\n        \"roleid\": {\n            \"dataType\": \"int\"\n        },\n        \"menuid\": {\n            \"dataType\": \"int\"\n        },\n        \"selecttype\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"roleid\": 0\n}",
##                         "id": "pair_636d1c8410ef487982021d218992e508",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_6f3a3ec2fbc54b7eb5a19478770e9d0b",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_c5d1c62f4faf4aa194e357980e6b998e",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_5e3a86bc6e3d4377a851d42d92d7ab29"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_83b108d4643c418caf45fc9634b54900"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/系统角色设置/查询角色菜单权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978358,
##             "created": 1579360978358,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/查询系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978377,
##             "created": 1579360978377,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/查询系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fba65f9f123d4f27a7c0cf8cf9f48514",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978393,
##             "created": 1579360978393,
##             "url": "{{quotes_mrgs_api}}/sys/roles",
##             "name": "查询系统角色",
##             "description": "# GET /sys/roles\n\n## apikey flag\n\nsys_role[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|角色id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"rolename\": \"角色名称\",\n        \"roletype\": \"角色类型\",\n        \"roleid\": \"角色id\"\n    },\n    \"options_define\": {\n        \"rolename\": {\n            \"dataType\": \"string\"\n        },\n        \"roletype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"roleid\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"roleid\": 0\n}",
##                         "id": "pair_d20b4e83827b4c64b4fc577094059701",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_89c18372cd0a42798f1d632db4a09cc1",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_5766b14873ac4a2c827d35c946bf3d2c",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_3c376bb0be6745788ba7b792144f9c3c"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_669e108d26934119beeb52589549742b"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]3.系统设置/系统角色设置/查询系统角色",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978411,
##             "created": 1579360978411,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/创建系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978428,
##             "created": 1579360978428,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/创建系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_d937f453dcb7ec6a86ef1eb485358f92",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978444,
##             "created": 1579360978444,
##             "url": "{{quotes_mrgs_api}}/sys/roles",
##             "name": "创建系统角色",
##             "description": "# POST /sys/roles\n\n## apikey flag\n\nsys_role[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroletype|EnumUserType|False|None|角色类型|decpoint=6,declen=16\nrolename|string|False|None|角色名称|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roletype\": {\n        \"default\": null,\n        \"type\": \"EnumUserType\",\n        \"dbname\": \"\",\n        \"comment\": \"角色类型\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"rolename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"角色名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"roletype\": 0,\n    \"rolename\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_c41a2c5e082b4fcf8cfd3268a81ae833"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e9027e839c114c0487b2c35ebcfdf951"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]3.系统设置/系统角色设置/创建系统角色",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978467,
##             "created": 1579360978467,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/修改角色菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978484,
##             "created": 1579360978484,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/修改角色菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_d33177cddebfcce64ceb2f2db6355bb5",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978500,
##             "created": 1579360978500,
##             "url": "{{quotes_mrgs_api}}/sys/roles/menu",
##             "name": "修改角色菜单权限",
##             "description": "# PUT /sys/roles/menu\n\n## apikey flag\n\nsys_role_menu[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False||角色ID|\nmenuids|list_class|False|[OrderedDict([('id', 3), ('selecttype', 1)]), OrderedDict([('id', 4), ('selecttype', 1)])]|菜单id列表|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"type\": \"int32\",\n        \"default\": \"\",\n        \"comment\": \"角色ID\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"menuids\": {\n        \"type\": \"list_class\",\n        \"default\": [\n            {\n                \"id\": 3,\n                \"selecttype\": 1\n            },\n            {\n                \"id\": 4,\n                \"selecttype\": 1\n            }\n        ],\n        \"comment\": \"菜单id列表\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"roleid\": \"\",\n    \"menuids\": [\n        {\n            \"id\": 3,\n            \"selecttype\": 1\n        },\n        {\n            \"id\": 4,\n            \"selecttype\": 1\n        }\n    ]\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_d293c91b10704aa08b3fdc9d9348f86d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_91a60738571e46da93f573da25220457"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/系统角色设置/修改角色菜单权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978520,
##             "created": 1579360978520,
##             "name": "3.系统设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/修改系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "parentId": "fld_3ccf1a4cbd81abd33c250e5a8b3e5959",
##             "modified": 1579360978537,
##             "created": 1579360978537,
##             "name": "系统角色设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]3.系统设置/系统角色设置/修改系统角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_aeaf2bb229249c7fec230a3531dcb2f4",
##             "parentId": "fld_fd5690bbb760593c635c6d49653a23f0",
##             "modified": 1579360978552,
##             "created": 1579360978552,
##             "url": "{{quotes_mrgs_api}}/sys/roles",
##             "name": "修改系统角色",
##             "description": "# PUT /sys/roles\n\n## apikey flag\n\nsys_role[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|角色id|decpoint=6,declen=16\nrolename|string|False|None|角色名称|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"rolename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"角色名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"roleid\": 0,\n    \"rolename\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_89db12126b8c482db27d9278136ea3c4"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_14ffe739c8504306b63bef0be278d27f"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]3.系统设置/系统角色设置/修改系统角色",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978573,
##             "created": 1579360978573,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改自己的密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978588,
##             "created": 1579360978588,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改自己的密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_0fac1da4c9bc3c2f49ae48b2107d002a",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978604,
##             "created": 1579360978604,
##             "url": "{{quotes_mrgs_api}}/musers/users/changepwd",
##             "name": "修改自己的密码",
##             "description": "# PUT /musers/users/changepwd\n\n## apikey flag\n\nmuser_users_changepwd[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nsrc_userpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\nnew_userpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\npubkey|string|False||RSA公钥|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"src_userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"new_userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"pubkey\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"RSA公钥\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"src_userpwd\": \"\",\n    \"new_userpwd\": \"\",\n    \"pubkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_92d615b3a9324341906921695fb7ac9f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_62dde90bba764255978a4b7566edba64"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改自己的密码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978623,
##             "created": 1579360978623,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/删除管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978632,
##             "created": 1579360978632,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/删除管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_4e81ae1a28c714c7f2259e3aadbf68fb",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978639,
##             "created": 1579360978639,
##             "url": "{{quotes_mrgs_api}}/musers/users",
##             "name": "删除管理员",
##             "description": "# DELETE /musers/users\n\n## apikey flag\n\nmuser_users[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_60e385c83b504d57a57d14b5dd459e94"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_136df717ad644ca2a0a5a41ae2037c6b"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]4.用户信息设置/管理员设置/删除管理员",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978652,
##             "created": 1579360978652,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978662,
##             "created": 1579360978662,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_af2490c349deb7d7cd115af4fffa0f40",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978671,
##             "created": 1579360978671,
##             "url": "{{quotes_mrgs_api}}/musers/users/menu",
##             "name": "查询管理员菜单权限",
##             "description": "# GET /musers/users/menu\n\n## apikey flag\n\nmuser_menus[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"menuid\": \"菜单id\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"menuid\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_df0e0edeb2094a9e8e5cf99213a3d7ed",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_693a99baee1b434a91ec9752b62ea53a",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_7571d2a0b2ca484a9c789d33ef2d877b",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_ffed773ad80f45a6888aef659d84a310"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_8f6c3fbed29745d3ac83dd42ed30455d"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/查询管理员菜单权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978692,
##             "created": 1579360978692,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员自己的菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978702,
##             "created": 1579360978702,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员自己的菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_2815d110b40b6602f93b3b3834b9169a",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978711,
##             "created": 1579360978711,
##             "url": "{{quotes_mrgs_api}}/musers/users/menu/self",
##             "name": "查询管理员自己的菜单权限",
##             "description": "# GET /musers/users/menu/self\n\n## apikey flag\n\nmuser_menus_self[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"menuid\": \"菜单id\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"menuid\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_8a798ca8579a42aea9f46da79bb0b01c",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_03d0f62d4601426f8369e5175095a15f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_131402a8da1c4e2f93649f8e551c16f9",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_b51fa916485d4103825975881e023c81"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c7efef9058c24d7fa2104df1ad81927c"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/查询管理员自己的菜单权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978725,
##             "created": 1579360978725,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978742,
##             "created": 1579360978742,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员角色",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_2387de77749731d40223ffe1af1cd579",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978756,
##             "created": 1579360978756,
##             "url": "{{quotes_mrgs_api}}/musers/users/role/userid",
##             "name": "查询管理员角色",
##             "description": "# GET /musers/users/role/userid\n\n## apikey flag\n\nmuser_roles_userid[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"rolename\": \"角色名称\",\n        \"roletype\": \"角色类型\",\n        \"roleid\": \"角色id\"\n    },\n    \"options_define\": {\n        \"rolename\": {\n            \"dataType\": \"string\"\n        },\n        \"roletype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"roleid\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_734f83c12c06431ea3c3325981e66727",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_4853286b18244a3990d7d95c1adc338a",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_ce6897c03a5842279831dd53b2b70b32",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_82a81744e2c24dd4933422a63d2ff2a5"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_9268707879aa441ab424cb3a8d961732"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/查询管理员角色",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978774,
##             "created": 1579360978774,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员自己的角色权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978785,
##             "created": 1579360978785,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员自己的角色权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_3198d0a472c4d9add2030b5c70a2b7b2",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978797,
##             "created": 1579360978797,
##             "url": "{{quotes_mrgs_api}}/musers/users/role/userid/self",
##             "name": "查询管理员自己的角色权限",
##             "description": "# GET /musers/users/role/userid/self\n\n## apikey flag\n\nmuser_roles_userid_self[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"rolename\": \"角色名称\",\n        \"roletype\": \"角色类型\",\n        \"roleid\": \"角色id\"\n    },\n    \"options_define\": {\n        \"rolename\": {\n            \"dataType\": \"string\"\n        },\n        \"roletype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserTypeTranslate\"\n        },\n        \"roleid\": {\n            \"dataType\": \"int\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_05a2531adb8a4fe89bfc114f3c538558",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_af75a8e3770c49fb84f13547cb5139bc",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_103bd959d0c441ce85d750eeef04fa0a",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_972a3710f5d54d4ca966b73407e0a304"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_fad522fb1ec148ce98307f756f6bfe44"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/查询管理员自己的角色权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978815,
##             "created": 1579360978815,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978831,
##             "created": 1579360978831,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c4b781b444a7ab15abd40b708b4b9930",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978853,
##             "created": 1579360978853,
##             "url": "{{quotes_mrgs_api}}/musers/users",
##             "name": "查询管理员",
##             "description": "# GET /musers/users\n\n## apikey flag\n\nmuser_users[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登陆账号\",\n        \"username\": \"用户姓名\",\n        \"nikename\": \"昵称\",\n        \"phone\": \"手机号码\",\n        \"email\": \"电子邮件\",\n        \"idtype\": \"证件类型\",\n        \"idcard\": \"证件号\",\n        \"idcardvaild\": \"证件有效期\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"username\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"phone\": {\n            \"dataType\": \"string\"\n        },\n        \"email\": {\n            \"dataType\": \"string\"\n        },\n        \"idtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIdTypeTranslate\"\n        },\n        \"idcard\": {\n            \"dataType\": \"string\"\n        },\n        \"idcardvaild\": {\n            \"dataType\": \"date\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_3345be577ba6484c8b933fc580e71a42",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_ea9e984c288b405d8c9c5e7088aaa912",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_4dfbc1e56d054df1891bada1aeb876f2",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_3568ee7101864921875724a6a605e7d5"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_65b757c8b405488884e1bc964f8e3afa"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/查询管理员",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978876,
##             "created": 1579360978876,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/按角色id查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978895,
##             "created": 1579360978895,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/按角色id查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c4efd5c8f9e04651a07e734e7b2646a4",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978913,
##             "created": 1579360978913,
##             "url": "{{quotes_mrgs_api}}/musers/users/role",
##             "name": "按角色id查询管理员",
##             "description": "# GET /musers/users/role\n\n## apikey flag\n\nmuser_roles[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nroleid|int32|False|None|角色id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登陆账号\",\n        \"username\": \"用户姓名\",\n        \"nikename\": \"昵称\",\n        \"phone\": \"手机号码\",\n        \"email\": \"电子邮件\",\n        \"idtype\": \"证件类型\",\n        \"idcard\": \"证件号\",\n        \"idcardvaild\": \"证件有效期\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"username\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"phone\": {\n            \"dataType\": \"string\"\n        },\n        \"email\": {\n            \"dataType\": \"string\"\n        },\n        \"idtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumIdTypeTranslate\"\n        },\n        \"idcard\": {\n            \"dataType\": \"string\"\n        },\n        \"idcardvaild\": {\n            \"dataType\": \"date\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"roleid\": 0\n}",
##                         "id": "pair_9c3c6199b0cc42f3b725da0f931b63a0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_b709c060f6034e729e87d11619eaa5e9",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_34a0865bbcd547b6b328729f067ac4bf",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_99f17b789b694582b5c551e31107dbb5"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c916513395984394861fc6e57eb57fc7"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/按角色id查询管理员",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978926,
##             "created": 1579360978926,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/按管理员状态查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978936,
##             "created": 1579360978936,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/按管理员状态查询管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_e812ab353ad3d0e385578f5ab6336c48",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360978947,
##             "created": 1579360978947,
##             "url": "{{quotes_mrgs_api}}/musers/users/stauts",
##             "name": "按管理员状态查询管理员",
##             "description": "# GET /musers/users/stauts\n\n## apikey flag\n\nmuser_status_users[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nstatustype|EnumUserStatusType|False|None|状态类型|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"statustype\": {\n        \"default\": null,\n        \"type\": \"EnumUserStatusType\",\n        \"dbname\": \"\",\n        \"comment\": \"状态类型\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"statusvalue\": \"状态值\",\n        \"statustype\": \"状态类型\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"statusvalue\": {\n            \"dataType\": \"string\"\n        },\n        \"statustype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserStatusTypeTranslate\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0,\n    \"statustype\": 0\n}",
##                         "id": "pair_07b55125d2604582a455a10119fcc7b5",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_17311dfad9074f909693a90db675d998",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_85791a3d44bb49359497c89b57d6087c",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_9a675498c4604832a2355184b4877fbc"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c37c3e0bb61940fda8a2c9e590d5e496"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员设置/按管理员状态查询管理员",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360978962,
##             "created": 1579360978962,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/创建管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360978990,
##             "created": 1579360978990,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/创建管理员",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_2bb51175093929cca141d1ff22631fe4",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979016,
##             "created": 1579360979016,
##             "url": "{{quotes_mrgs_api}}/musers/users",
##             "name": "创建管理员",
##             "description": "# POST /musers/users\n\n## apikey flag\n\nmuser_users[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlogincode|string|False|None|登录账号|maxlen=32,minlen=1,decpoint=6,declen=16\nphone|string|False|None|手机号码|maxlen=32,minlen=0,decpoint=6,declen=16\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\nidtype|EnumIdType|False|None|证件类型|decpoint=6,declen=16\nusername|string|False|None|用户姓名|maxlen=32,minlen=0,decpoint=6,declen=16\nidcardvaild|date|False|None|证件有效期|defval='1900-01-01',decpoint=6,declen=16\nuserpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\nroleids|list_int32|True|[]|角色id列表|\nnikename|string|False|None|用户昵称|maxlen=32,minlen=0,decpoint=6,declen=16\nemail|string|False|None|电子邮箱|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"logincode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"登录账号\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"phone\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idtype\": {\n        \"default\": null,\n        \"type\": \"EnumIdType\",\n        \"dbname\": \"\",\n        \"comment\": \"证件类型\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"username\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户姓名\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcardvaild\": {\n        \"default\": null,\n        \"type\": \"date\",\n        \"dbname\": \"\",\n        \"comment\": \"证件有效期\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'1900-01-01'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"roleids\": {\n        \"default\": [],\n        \"type\": \"list_int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id列表\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"nikename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户昵称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"email\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电子邮箱\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"logincode\": \"\",\n    \"phone\": \"\",\n    \"idcard\": \"\",\n    \"idtype\": 0,\n    \"username\": \"\",\n    \"idcardvaild\": \"19000101\",\n    \"userpwd\": \"\",\n    \"roleids\": [],\n    \"nikename\": \"\",\n    \"email\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_fec3dc66d91a42a089ed790588f71f04"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_52c2ff98f59a4bd8bea96fe76f931d10"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]4.用户信息设置/管理员设置/创建管理员",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979052,
##             "created": 1579360979052,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/重置密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979067,
##             "created": 1579360979067,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/重置密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_69e404e197734a9e42d1710739a8468d",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979074,
##             "created": 1579360979074,
##             "url": "{{quotes_mrgs_api}}/musers/users/resetpwd",
##             "name": "重置密码",
##             "description": "# PUT /musers/users/resetpwd\n\n## apikey flag\n\nmuser_users_resetpwd[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nuserpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\npubkey|string|False||RSA公钥|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"pubkey\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"RSA公钥\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"userpwd\": \"\",\n    \"pubkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_2536f00e7dcc49f8aa15b7c3a0f8e984"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6ea8ef730810444ab95d140fab3567ce"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/重置密码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979088,
##             "created": 1579360979088,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979100,
##             "created": 1579360979100,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员菜单权限",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_9637e062dfff65fe96efe787da8adbea",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979111,
##             "created": 1579360979111,
##             "url": "{{quotes_mrgs_api}}/musers/users/menu",
##             "name": "修改管理员菜单权限",
##             "description": "# PUT /musers/users/menu\n\n## apikey flag\n\nmuser_menus[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nmenuids|list_class|False|[OrderedDict([('id', 3), ('selecttype', 1)]), OrderedDict([('id', 4), ('selecttype', 1)])]|角色id列表|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"menuids\": {\n        \"type\": \"list_class\",\n        \"default\": [\n            {\n                \"id\": 3,\n                \"selecttype\": 1\n            },\n            {\n                \"id\": 4,\n                \"selecttype\": 1\n            }\n        ],\n        \"comment\": \"角色id列表\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"menuids\": [\n        {\n            \"id\": 3,\n            \"selecttype\": 1\n        },\n        {\n            \"id\": 4,\n            \"selecttype\": 1\n        }\n    ]\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_df2717e948e24640b256410eb1d0049c"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_be20bcc1b86241fb925e9d05a887ad8d"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改管理员菜单权限",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979123,
##             "created": 1579360979123,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979138,
##             "created": 1579360979138,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_60855df7aa6f1c43c83c709c77f8f559",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979155,
##             "created": 1579360979155,
##             "url": "{{quotes_mrgs_api}}/musers/users",
##             "name": "修改管理员信息",
##             "description": "# PUT /musers/users\n\n## apikey flag\n\nmuser_users[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nusername|string|False|None|用户姓名|maxlen=32,minlen=0,decpoint=6,declen=16\nidcardvaild|date|False|None|证件有效期|defval='1900-01-01',decpoint=6,declen=16\nphone|string|False|None|手机号码|maxlen=32,minlen=0,decpoint=6,declen=16\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\nidtype|EnumIdType|False|None|证件类型|decpoint=6,declen=16\nnikename|string|False|None|用户昵称|maxlen=32,minlen=0,decpoint=6,declen=16\nemail|string|False|None|电子邮箱|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"username\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户姓名\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcardvaild\": {\n        \"default\": null,\n        \"type\": \"date\",\n        \"dbname\": \"\",\n        \"comment\": \"证件有效期\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'1900-01-01'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"phone\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idtype\": {\n        \"default\": null,\n        \"type\": \"EnumIdType\",\n        \"dbname\": \"\",\n        \"comment\": \"证件类型\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"nikename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户昵称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"email\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电子邮箱\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"username\": \"\",\n    \"idcardvaild\": \"19000101\",\n    \"phone\": \"\",\n    \"idcard\": \"\",\n    \"idtype\": 0,\n    \"nikename\": \"\",\n    \"email\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_9543f2a7ffd645f189dbf4fbbbf10abb"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_7a31d4124e0243b3ae48887536a0fa81"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改管理员信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979187,
##             "created": 1579360979187,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员角色权限（单角色）",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979202,
##             "created": 1579360979202,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员角色权限（单角色）",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_5ac70a45ec04a5c9aa0880400071a787",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979212,
##             "created": 1579360979212,
##             "url": "{{quotes_mrgs_api}}/musers/users/role",
##             "name": "修改管理员角色权限（单角色）",
##             "description": "# PUT /musers/users/role\n\n## apikey flag\n\nmuser_roles[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nroleid|int32|False|None|角色id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"roleid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"roleid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_43c37f53163f4fdc8986de1fa347730b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_d28b5c00a6cd438c9d9c7db04c6153fa"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改管理员角色权限（单角色）",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979235,
##             "created": 1579360979235,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员角色权限（多角色）",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979252,
##             "created": 1579360979252,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员角色权限（多角色）",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_7caad7742049af6158ca78bef870f231",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979270,
##             "created": 1579360979270,
##             "url": "{{quotes_mrgs_api}}/musers/users/roles",
##             "name": "修改管理员角色权限（多角色）",
##             "description": "# PUT /musers/users/roles\n\n## apikey flag\n\nmuser_roless[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nroleids|list_int32|True|[]|角色id列表|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"roleids\": {\n        \"default\": [],\n        \"type\": \"list_int32\",\n        \"dbname\": \"\",\n        \"comment\": \"角色id列表\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"roleids\": []\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_67f678cfa2a84d3eb42682542e8e0db9"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_2e821427774e497a8ce5c7f2d9ab3b42"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改管理员角色权限（多角色）",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979290,
##             "created": 1579360979290,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979305,
##             "created": 1579360979305,
##             "name": "管理员设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员设置/修改管理员状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_ce3a7348ae83cd1f75ab5a29dec313a8",
##             "parentId": "fld_22e5f22a795c8d811e7bf2a9aed6b0b1",
##             "modified": 1579360979322,
##             "created": 1579360979322,
##             "url": "{{quotes_mrgs_api}}/musers/users/stauts",
##             "name": "修改管理员状态",
##             "description": "# PUT /musers/users/stauts\n\n## apikey flag\n\nmuser_status_users[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nstatusvalue|string|False||用户状态|\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"statusvalue\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"用户状态\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"statusvalue\": \"\",\n    \"userid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_1a8d453589874158a2ca4182b7ed3cab"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_2904760bb5f546008a12d7d455a07b35"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员设置/修改管理员状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979340,
##             "created": 1579360979340,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/删除参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979354,
##             "created": 1579360979354,
##             "name": "管理员参数管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/删除参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_310933f91fb46c3c13418c70d4314009",
##             "parentId": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "modified": 1579360979371,
##             "created": 1579360979371,
##             "url": "{{quotes_mrgs_api}}/musers/parames",
##             "name": "删除参数",
##             "description": "# DELETE /musers/parames\n\n## apikey flag\n\nmuser_parames[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"0\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"paramsname\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_b032d419f1294009bbfb82367dbfc560"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_7950fee175c74b1d92e8343d6655feb0"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]4.用户信息设置/管理员参数管理/删除参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979389,
##             "created": 1579360979389,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/查询参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979403,
##             "created": 1579360979403,
##             "name": "管理员参数管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/查询参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_44cadfdaee55ec31d574c3ed9b46fff8",
##             "parentId": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "modified": 1579360979423,
##             "created": 1579360979423,
##             "url": "{{quotes_mrgs_api}}/musers/parames",
##             "name": "查询参数",
##             "description": "# GET /musers/parames\n\n## apikey flag\n\nmuser_parames[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"0\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"paramssection\": \"参数段\",\n        \"paramsname\": \"参数名称\",\n        \"paramsvalue\": \"参数值\"\n    },\n    \"options_define\": {\n        \"paramssection\": {\n            \"dataType\": \"string\"\n        },\n        \"paramsname\": {\n            \"dataType\": \"string\"\n        },\n        \"paramsvalue\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"paramsname\": \"\",\n    \"userid\": 0\n}",
##                         "id": "pair_99fc32491d064931995f1f43b64f67a0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_3f436568142048fc904a775903e3a60f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_7d3319b99edb45ac8eafa37860115a27",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_05b8efd293c64eec865adb50678bcf3d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_3fc83cdfa15d4484a89b90c092983b19"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/管理员参数管理/查询参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979433,
##             "created": 1579360979433,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/添加修改参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979447,
##             "created": 1579360979447,
##             "name": "管理员参数管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/管理员参数管理/添加修改参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_6d859eac6022a439ac601f42da4e8d3d",
##             "parentId": "fld_9dc4363930c09a5c2acba4ccbc4e41bd",
##             "modified": 1579360979462,
##             "created": 1579360979462,
##             "url": "{{quotes_mrgs_api}}/musers/parames",
##             "name": "添加修改参数",
##             "description": "# PUT /musers/parames\n\n## apikey flag\n\nmuser_parames[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=0,decpoint=6,declen=16\nparamsvalue|string|False|None|配置值|maxlen=32,minlen=0,decpoint=6,declen=16\nparamssection|string|False|None|配置段|maxlen=16,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"0\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"paramsvalue\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置值\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"paramssection\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置段\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"paramsname\": \"\",\n    \"paramsvalue\": \"\",\n    \"paramssection\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_ea0d01a3faf5489288099590d57922e8"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_8344409adc984e9bbd88cf12b0458bbc"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/管理员参数管理/添加修改参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979486,
##             "created": 1579360979486,
##             "name": "6.文件上传管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_88710775d7d5e402d7cb1304f0e6364d",
##             "parentId": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "modified": 1579360979498,
##             "created": 1579360979498,
##             "name": "管理用户",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c761f2468d6d7cd2e3802b5e00e53b8b",
##             "parentId": "fld_88710775d7d5e402d7cb1304f0e6364d",
##             "modified": 1579360979509,
##             "created": 1579360979509,
##             "name": "图片上传与下载",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_b7e5bbc49f457a81ce2501fa90db0562",
##             "parentId": "fld_c761f2468d6d7cd2e3802b5e00e53b8b",
##             "modified": 1579360979522,
##             "created": 1579360979522,
##             "url": "{{quotes_mrgs_api}}/musers/images/{path_index}/{filename}",
##             "name": "图片下载",
##             "description": "# GET /musers/images/{path_index}/{filename}\n\n## apikey flag\n\nmuser_mrg_images[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_463f5013373649308e1bcb5c6e8e54e0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_30b1aa8b90c74a998706831135429785",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_4a085bb9664b4663a0c7dd7a5eca4b79",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_875ed29504674fa19bf1d3bfd7f40d09"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e137f664fce5440cb1390a3f70421b5f"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]6.文件上传管理/管理用户/图片上传与下载/图片下载",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979536,
##             "created": 1579360979536,
##             "name": "6.文件上传管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_88710775d7d5e402d7cb1304f0e6364d",
##             "parentId": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "modified": 1579360979548,
##             "created": 1579360979548,
##             "name": "管理用户",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c761f2468d6d7cd2e3802b5e00e53b8b",
##             "parentId": "fld_88710775d7d5e402d7cb1304f0e6364d",
##             "modified": 1579360979562,
##             "created": 1579360979562,
##             "name": "图片上传与下载",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/管理用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_5836ae0d87748fb94f1bfc8993510550",
##             "parentId": "fld_c761f2468d6d7cd2e3802b5e00e53b8b",
##             "modified": 1579360979576,
##             "created": 1579360979576,
##             "url": "{{quotes_mrgs_api}}/musers/images/upload",
##             "name": "图片上传",
##             "description": "# POST /musers/images/upload\n\n## apikey flag\n\nmuser_mrg_images[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "multipart/form-data",
##                     "id": "pair_3bc9c93cf97d4c97b4d8a396332cb22c"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_059e4e84324c4e298e62bf739cd07125"
##                 }
##             ],
##             "body": {
##                 "mimeType": "multipart/form-data",
##                 "params": [
##                     {
##                         "disabled": false,
##                         "fileName": "",
##                         "id": "pair_25ad73f86b8e4620a7713c73e21f80be",
##                         "name": "files",
##                         "type": "file",
##                         "value": ""
##                     }
##                 ]
##             },
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]6.文件上传管理/管理用户/图片上传与下载/图片上传",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979589,
##             "created": 1579360979589,
##             "name": "6.文件上传管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6efeb1c7e434e120461fa291c50d67b5",
##             "parentId": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "modified": 1579360979599,
##             "created": 1579360979599,
##             "name": "普通用户",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ebc2d6f01c08d969910808dbe23ba38",
##             "parentId": "fld_6efeb1c7e434e120461fa291c50d67b5",
##             "modified": 1579360979610,
##             "created": 1579360979610,
##             "name": "图片上传与下载",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片下载",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_e9b0d963cdda3ce74522289d51272535",
##             "parentId": "fld_1ebc2d6f01c08d969910808dbe23ba38",
##             "modified": 1579360979624,
##             "created": 1579360979624,
##             "url": "{{quotes_mrgs_api}}/users/images/{path_index}/{filename}",
##             "name": "图片下载",
##             "description": "# GET /users/images/{path_index}/{filename}\n\n## apikey flag\n\nuser_mrg_images[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_62972754a3214c7c9604a1b861ee625b",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_ea2b382f387141b5aec9b2e69735ca0c",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_9e8b1599058545d8af671133d1485cda",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_b249617bd3ab4591862ea91986219489"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_a4da3d148a684e63b997e46a8db77a5d"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]6.文件上传管理/普通用户/图片上传与下载/图片下载",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979633,
##             "created": 1579360979633,
##             "name": "6.文件上传管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6efeb1c7e434e120461fa291c50d67b5",
##             "parentId": "fld_b6fb856d1d77ec8447d872e0c893bbf7",
##             "modified": 1579360979640,
##             "created": 1579360979640,
##             "name": "普通用户",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ebc2d6f01c08d969910808dbe23ba38",
##             "parentId": "fld_6efeb1c7e434e120461fa291c50d67b5",
##             "modified": 1579360979647,
##             "created": 1579360979647,
##             "name": "图片上传与下载",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]6.文件上传管理/普通用户/图片上传与下载/图片上传",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_bd7bae7681153e11583ac3e8cb8f7f57",
##             "parentId": "fld_1ebc2d6f01c08d969910808dbe23ba38",
##             "modified": 1579360979656,
##             "created": 1579360979656,
##             "url": "{{quotes_mrgs_api}}/users/images/upload",
##             "name": "图片上传",
##             "description": "# POST /users/images/upload\n\n## apikey flag\n\nuser_mrg_images[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "multipart/form-data",
##                     "id": "pair_30ea5a7a96f7439c9514543a7d4131a8"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_82b337a861ba45de8d6a3a93d35f7f40"
##                 }
##             ],
##             "body": {
##                 "mimeType": "multipart/form-data",
##                 "params": [
##                     {
##                         "disabled": false,
##                         "fileName": "",
##                         "id": "pair_bbba01aa928840a3b56196b52ff28b9b",
##                         "name": "files",
##                         "type": "file",
##                         "value": ""
##                     }
##                 ]
##             },
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]6.文件上传管理/普通用户/图片上传与下载/图片上传",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979669,
##             "created": 1579360979669,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户联系信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979688,
##             "created": 1579360979688,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户联系信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6b3235803b36f2a6e8c780edd280b538",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360979699,
##             "created": 1579360979699,
##             "url": "{{quotes_mrgs_api}}/users/users/contact",
##             "name": "查询用户联系信息",
##             "description": "# GET /users/users/contact\n\n## apikey flag\n\nuser_users_contact[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登录账号\",\n        \"username\": \"用户姓名\",\n        \"nikename\": \"用户昵称\",\n        \"country\": \"国籍\",\n        \"telcode\": \"区号\",\n        \"phone\": \"联系手机\",\n        \"email\": \"电子邮件\",\n        \"jsoncache\": \"附属字段\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"username\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"country\": {\n            \"dataType\": \"string\"\n        },\n        \"telcode\": {\n            \"dataType\": \"string\"\n        },\n        \"phone\": {\n            \"dataType\": \"string\"\n        },\n        \"email\": {\n            \"dataType\": \"string\"\n        },\n        \"jsoncache\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_ead55e4ba5ca48ff9c5b5ec9dd4c3a9c",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_391012e7fc6b4bb580e911cecc50353d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_b55edf19cd884747993ca1bbcbcceef6",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_827aae3e8095494aaf70fba5783b0e9d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_127a608f952646db9d62de7d497e5546"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户设置/查询用户联系信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979714,
##             "created": 1579360979714,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户身份证件",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979734,
##             "created": 1579360979734,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户身份证件",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_e073649242d5bab7d25157c5739f0f27",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360979744,
##             "created": 1579360979744,
##             "url": "{{quotes_mrgs_api}}/users/users/idcard",
##             "name": "查询用户身份证件",
##             "description": "# GET /users/users/idcard\n\n## apikey flag\n\nuser_users_idcard[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登录账号\",\n        \"username\": \"用户姓名\",\n        \"nikename\": \"用户昵称\",\n        \"idtype\": \"证件类型\",\n        \"idcard\": \"证件号码\",\n        \"idcardvaild\": \"证件有效期\",\n        \"jsoncache\": \"附属字段\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"username\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"idtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumIdTypeTranslate\"\n        },\n        \"idcard\": {\n            \"dataType\": \"string\"\n        },\n        \"idcardvaild\": {\n            \"dataType\": \"date\"\n        },\n        \"jsoncache\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_20b18236281347609fecd4b86779c13e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_9c7eeafc220447dcaf9187b2ace8597f",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_62ba6f12b325479e942f3aac3a260143",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_a7bc69f8a0b24c8bb2ebb08821b654f4"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6b4b31e6e0fa47d5a6683377a894f3b4"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户设置/查询用户身份证件",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979758,
##             "created": 1579360979758,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979788,
##             "created": 1579360979788,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1a9b1a73afc044f1f08baf9eb392e80a",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360979819,
##             "created": 1579360979819,
##             "url": "{{quotes_mrgs_api}}/users/users",
##             "name": "查询用户信息",
##             "description": "# GET /users/users\n\n## apikey flag\n\nuser_users[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nphone|string|False|None|手机号码|maxlen=32,minlen=0,decpoint=6,declen=16\nemail|string|False|None|电子邮箱|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"phone\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"email\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电子邮箱\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登录账号\",\n        \"useracctype\": \"账号类别\",\n        \"username\": \"用户姓名\",\n        \"nikename\": \"用户昵称\",\n        \"country\": \"国籍\",\n        \"telcode\": \"区号\",\n        \"phone\": \"联系手机\",\n        \"email\": \"电子邮件\",\n        \"idtype\": \"证件类型\",\n        \"idcard\": \"证件号码\",\n        \"idcardvaild\": \"证件有效期\",\n        \"createsorce\": \"开户来源\",\n        \"lastresetpwdtime\": \"最后修改密码时间\",\n        \"lastcreatetime\": \"开户时间\",\n        \"jsoncache\": \"附属字段\",\n        \"review_status\": \"审核状态\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"useracctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumUserAccTypeTranslate\"\n        },\n        \"username\": {\n            \"dataType\": \"string\"\n        },\n        \"nikename\": {\n            \"dataType\": \"string\"\n        },\n        \"country\": {\n            \"dataType\": \"string\"\n        },\n        \"telcode\": {\n            \"dataType\": \"string\"\n        },\n        \"phone\": {\n            \"disable_where\": \"1\",\n            \"dataType\": \"string\"\n        },\n        \"email\": {\n            \"disable_where\": \"1\",\n            \"dataType\": \"string\"\n        },\n        \"idtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumIdTypeTranslate\"\n        },\n        \"idcard\": {\n            \"disable_where\": \"1\",\n            \"dataType\": \"string\"\n        },\n        \"idcardvaild\": {\n            \"dataType\": \"date\"\n        },\n        \"createsorce\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumCreateSourceTypeTranslate\"\n        },\n        \"lastresetpwdtime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastcreatetime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"jsoncache\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"review_status\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"idcard\": \"\",\n    \"userid\": 0,\n    \"phone\": \"\",\n    \"email\": \"\"\n}",
##                         "id": "pair_f6c5c120d51f426b9ae66f632e4e4a07",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_25d6d90379a441f4ab9430d1d071ef72",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_65572c006a40474188fc5730b831b0c8",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_59081fc19e0e4dbfa931e0b8310699b7"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_16360949055742eea0b66f550b7f1901"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户设置/查询用户信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979846,
##             "created": 1579360979846,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户审核信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979868,
##             "created": 1579360979868,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户审核信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0affb6b1984f5803470b5bcaee7a4121",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360979890,
##             "created": 1579360979890,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one_pass",
##             "name": "查询用户审核信息",
##             "description": "# GET /users/users/reviews_one_pass\n\n## apikey flag\n\nuser_users_review[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"reviewstatus\": \"审核状态\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户id\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\",\n        \"beforejson\": \"修改前数据定义\",\n        \"afterjson\": \"修改后数据定义\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"beforejson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"afterjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0\n}",
##                         "id": "pair_dd7057d5a9b548dea83aff237a8a0801",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_7716e3dd3a4c47b98744c26619996303",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_063ac9b8cbf44c8286527089eb03d570",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_c307799591784b70a48ef672c6d45765"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e9a36e9d19f74924be0c19be60a51655"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户设置/查询用户审核信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979914,
##             "created": 1579360979914,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360979935,
##             "created": 1579360979935,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/查询用户状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_c6724d51110c95baba568aac599127fa",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360979954,
##             "created": 1579360979954,
##             "url": "{{quotes_mrgs_api}}/users/users/stauts",
##             "name": "查询用户状态",
##             "description": "# GET /users/users/stauts\n\n## apikey flag\n\nuser_status_users[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nstatustype|EnumUserStatusType|False|None|状态类型|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"statustype\": {\n        \"default\": null,\n        \"type\": \"EnumUserStatusType\",\n        \"dbname\": \"\",\n        \"comment\": \"状态类型\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"userid\": \"用户id\",\n        \"logincode\": \"登录账号\",\n        \"statustype\": \"状态类型\",\n        \"statusvalue\": \"状态值\"\n    },\n    \"options_define\": {\n        \"userid\": {\n            \"dataType\": \"int\"\n        },\n        \"logincode\": {\n            \"dataType\": \"string\"\n        },\n        \"statustype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"users_enums.EnumUserStatusTypeTranslate\"\n        },\n        \"statusvalue\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"userid\": 0,\n    \"statustype\": 0\n}",
##                         "id": "pair_7b5168557b424884812c806941a552ad",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_570987a006c54e7489309447ebe30e9d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_96d5b81f9e144eec997c68e4e8cea973",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_962949f6c87f4767ab20ad2e18d51a2a"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_8e670c633af54de3b22c6db48dbbb13b"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户设置/查询用户状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360979975,
##             "created": 1579360979975,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/创建用户",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980012,
##             "created": 1579360980012,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/创建用户",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_bbb12ef176c576a313fc8eafc704a4b2",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980045,
##             "created": 1579360980045,
##             "url": "{{quotes_mrgs_api}}/users/users",
##             "name": "创建用户",
##             "description": "# POST /users/users\n\n## apikey flag\n\nuser_users[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ncountry|string|False|None|国籍|maxlen=32,minlen=0,decpoint=6,declen=16\nlogincode|string|False|None|登录账号|maxlen=32,minlen=1,decpoint=6,declen=16\nphone|string|False|None|手机号码|maxlen=32,minlen=0,decpoint=6,declen=16\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\nlocation|string|False|None|邮寄地址|maxlen=64,minlen=0,decpoint=6,declen=16\njsoncache|jsonb|False|None|附加字段|defval='{}',decpoint=6,declen=16\nidtype|EnumIdType|False|None|证件类型|decpoint=6,declen=16\ntelcode|string|False|None|电话区号|maxlen=32,minlen=0,decpoint=6,declen=16\nuserpwdstrong|int32|False|None|用户密码强度|maxval=100,minval=0,decpoint=6,declen=16\nidcardvaild|date|False|None|证件有效期|defval='1900-01-01',decpoint=6,declen=16\nusername|string|False|None|用户姓名|maxlen=32,minlen=0,decpoint=6,declen=16\nuserpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\nbrokeruserid|int32|False|None|用户id|decpoint=6,declen=16\nnikename|string|False|None|用户昵称|maxlen=32,minlen=0,decpoint=6,declen=16\nemail|string|False|None|电子邮箱|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"country\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"国籍\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"logincode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"登录账号\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"phone\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"location\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"邮寄地址\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"jsoncache\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"附加字段\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'{}'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idtype\": {\n        \"default\": null,\n        \"type\": \"EnumIdType\",\n        \"dbname\": \"\",\n        \"comment\": \"证件类型\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"telcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电话区号\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userpwdstrong\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码强度\",\n        \"options\": {\n            \"maxval\": 100,\n            \"minval\": 0,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"idcardvaild\": {\n        \"default\": null,\n        \"type\": \"date\",\n        \"dbname\": \"\",\n        \"comment\": \"证件有效期\",\n        \"options\": {\n            \"defval\": \"'1900-01-01'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"username\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户姓名\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"brokeruserid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"nikename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户昵称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"email\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电子邮箱\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"country\": \"\",\n    \"logincode\": \"\",\n    \"phone\": \"\",\n    \"idcard\": \"\",\n    \"location\": \"\",\n    \"jsoncache\": {},\n    \"idtype\": 0,\n    \"telcode\": \"\",\n    \"userpwdstrong\": 0,\n    \"idcardvaild\": \"19000101\",\n    \"username\": \"\",\n    \"userpwd\": \"\",\n    \"brokeruserid\": 0,\n    \"nikename\": \"\",\n    \"email\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_8b2b2af249724952a07ec27266f6111f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_96d440428aa7453e866998cc5d63033a"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]4.用户信息设置/用户设置/创建用户",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980085,
##             "created": 1579360980085,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/重置密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980097,
##             "created": 1579360980097,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/重置密码",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_b5f1c3a76473541e9037948c3043f03a",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980110,
##             "created": 1579360980110,
##             "url": "{{quotes_mrgs_api}}/users/users/resetpwd",
##             "name": "重置密码",
##             "description": "# PUT /users/users/resetpwd\n\n## apikey flag\n\nuser_users_resetpwd[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nuserpwd|string|False|None|用户密码|maxlen=128,minlen=1,decpoint=6,declen=16\nuserpwdstrong|int32|False|None|用户密码强度|maxval=100,minval=0,decpoint=6,declen=16\npubkey|string|False||RSA公钥|\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"userpwd\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码\",\n        \"options\": {\n            \"maxlen\": \"128\",\n            \"minlen\": \"1\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userpwdstrong\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户密码强度\",\n        \"options\": {\n            \"maxval\": 100,\n            \"minval\": 0,\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"pubkey\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"RSA公钥\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"userpwd\": \"\",\n    \"userpwdstrong\": 0,\n    \"pubkey\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_cb3dac1adfb547f498b3337e8a60f9d3"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_48fd344a6cab4b2288c6838e3e640ad3"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户设置/重置密码",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980124,
##             "created": 1579360980124,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户联系信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980138,
##             "created": 1579360980138,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户联系信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_8b58d29982a977fcf5f1871864224e98",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980160,
##             "created": 1579360980160,
##             "url": "{{quotes_mrgs_api}}/users/users/contact",
##             "name": "修改用户联系信息",
##             "description": "# PUT /users/users/contact\n\n## apikey flag\n\nuser_users_contact[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ncountry|string|False|None|国籍|maxlen=32,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nphone|string|False|None|手机号码|maxlen=32,minlen=0,decpoint=6,declen=16\ntelcode|string|False|None|电话区号|maxlen=32,minlen=0,decpoint=6,declen=16\nemail|string|False|None|电子邮箱|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"country\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"国籍\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"phone\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"telcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电话区号\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"email\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"电子邮箱\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"country\": \"\",\n    \"userid\": 0,\n    \"phone\": \"\",\n    \"telcode\": \"\",\n    \"email\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_9246c62bd9184cdb9da0d739fbf1794f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_03559705a4444f32b1c3eb37ba8a4918"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户设置/修改用户联系信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980186,
##             "created": 1579360980186,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户身份证件",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980197,
##             "created": 1579360980197,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户身份证件",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_41202d368fdcb997cd578d4b389f2a36",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980216,
##             "created": 1579360980216,
##             "url": "{{quotes_mrgs_api}}/users/users/idcard",
##             "name": "修改用户身份证件",
##             "description": "# PUT /users/users/idcard\n\n## apikey flag\n\nuser_users_idcard[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nidcardvaild|date|False|None|证件有效期|defval='1900-01-01',decpoint=6,declen=16\nidtype|EnumIdType|False|None|证件类型|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"idcardvaild\": {\n        \"default\": null,\n        \"type\": \"date\",\n        \"dbname\": \"\",\n        \"comment\": \"证件有效期\",\n        \"options\": {\n            \"defval\": \"'1900-01-01'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"idtype\": {\n        \"default\": null,\n        \"type\": \"EnumIdType\",\n        \"dbname\": \"\",\n        \"comment\": \"证件类型\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"idcard\": \"\",\n    \"userid\": 0,\n    \"idcardvaild\": \"19000101\",\n    \"idtype\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_fdb975d3b63d4661a4dd66606d74f3ef"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_836bb45ff0e54052b83182aa4324664a"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户设置/修改用户身份证件",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980239,
##             "created": 1579360980239,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980259,
##             "created": 1579360980259,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户信息",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_96145e643d92a06bdb073b2a20768872",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980281,
##             "created": 1579360980281,
##             "url": "{{quotes_mrgs_api}}/users/users",
##             "name": "修改用户信息",
##             "description": "# PUT /users/users\n\n## apikey flag\n\nuser_users[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nlocation|string|False|None|邮寄地址|maxlen=64,minlen=0,decpoint=6,declen=16\njsoncache|jsonb|False|None|附加字段|defval='{}',decpoint=6,declen=16\nusername|string|False|None|用户姓名|maxlen=32,minlen=0,decpoint=6,declen=16\nnikename|string|False|None|用户昵称|maxlen=32,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"location\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"邮寄地址\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"jsoncache\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"附加字段\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'{}'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"username\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户姓名\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"nikename\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户昵称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"userid\": 0,\n    \"location\": \"\",\n    \"jsoncache\": {},\n    \"username\": \"\",\n    \"nikename\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_3b37784c58a44feaa29d5e14003ce36f"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_3fc1d722f64344b79e74fe7635720c84"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户设置/修改用户信息",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980303,
##             "created": 1579360980303,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1891a9ca11bf0699388b5db919187474",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980319,
##             "created": 1579360980319,
##             "name": "用户设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户设置/修改用户状态",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_3da63b1259d231bad0fbea44bbff9f71",
##             "parentId": "fld_1891a9ca11bf0699388b5db919187474",
##             "modified": 1579360980332,
##             "created": 1579360980332,
##             "url": "{{quotes_mrgs_api}}/users/users/stauts",
##             "name": "修改用户状态",
##             "description": "# PUT /users/users/stauts\n\n## apikey flag\n\nuser_status_users[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nstatusvalue|string|False||用户状态|\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"statusvalue\": {\n        \"type\": \"string\",\n        \"default\": \"\",\n        \"comment\": \"用户状态\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": null,\n            \"minlen\": null,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"statusvalue\": \"\",\n    \"userid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_167bfe21f8d644c5baf1352da13ce3de"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_08741d342c784422b49e5ffab291424f"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户设置/修改用户状态",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980353,
##             "created": 1579360980353,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/删除区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980360,
##             "created": 1579360980360,
##             "name": "用户区号设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/删除区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a1df8a6de851fca1cad44cdb6bc39da9",
##             "parentId": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "modified": 1579360980375,
##             "created": 1579360980375,
##             "url": "{{quotes_mrgs_api}}/users/areacode",
##             "name": "删除区号",
##             "description": "# DELETE /users/areacode\n\n## apikey flag\n\nuser_areacode[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nnumcode|string|False|None|数字编码|maxlen=8,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"numcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"数字编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"numcode\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_bc222281dd9143aca8773d503231640b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_67cb764a490e447f9d543ee9d92bf6af"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]4.用户信息设置/用户区号设置/删除区号",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980393,
##             "created": 1579360980393,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/查询区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980406,
##             "created": 1579360980406,
##             "name": "用户区号设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/查询区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_2cb5728540151973355bf96b3f349b29",
##             "parentId": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "modified": 1579360980427,
##             "created": 1579360980427,
##             "url": "{{quotes_mrgs_api}}/users/areacode",
##             "name": "查询区号",
##             "description": "# GET /users/areacode\n\n## apikey flag\n\nuser_areacode[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nnumcode|string|False|None|数字编码|maxlen=8,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"numcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"数字编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"telcode\": \"电话区号\",\n        \"enname\": \"英文名称\",\n        \"cnname\": \"中文名称\",\n        \"numcode\": \"国家编码\"\n    },\n    \"options_define\": {\n        \"telcode\": {\n            \"dataType\": \"string\"\n        },\n        \"enname\": {\n            \"dataType\": \"string\"\n        },\n        \"cnname\": {\n            \"dataType\": \"string\"\n        },\n        \"numcode\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"numcode\": \"\"\n}",
##                         "id": "pair_c8db15b5e446466fa67ca7f45f98e8d6",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_2202dfdc88c14e7692ab852b5981b741",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_26675c97b10347349e5986d6035f8686",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_38a913fd6da4480094b3d3b2a7dd0098"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_dca050f19bc64199b77571d17b6d98ef"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户区号设置/查询区号",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980448,
##             "created": 1579360980448,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/增加区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980475,
##             "created": 1579360980475,
##             "name": "用户区号设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/增加区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_1dc4078da5bd00ed20873d8714b6a7c2",
##             "parentId": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "modified": 1579360980502,
##             "created": 1579360980502,
##             "url": "{{quotes_mrgs_api}}/users/areacode",
##             "name": "增加区号",
##             "description": "# POST /users/areacode\n\n## apikey flag\n\nuser_areacode[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntwocode|string|False|None|二位编码|maxlen=8,minlen=1,decpoint=6,declen=16\nenname|string|False|None|英文名称|maxlen=32,minlen=1,decpoint=6,declen=16\ntelcode|string|False|None|手机区号|maxlen=16,minlen=1,decpoint=6,declen=16\nthreecode|string|False|None|三位编码|maxlen=8,minlen=1,decpoint=6,declen=16\nnumcode|string|False|None|数字编码|maxlen=8,minlen=1,decpoint=6,declen=16\nareadesc|string|False|None|备注信息|maxlen=32,minlen=1,decpoint=6,declen=16\ncnname|string|False|None|中文名称|maxlen=32,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"twocode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"二位编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"enname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"英文名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"telcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机区号\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"threecode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"三位编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"numcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"数字编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"areadesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注信息\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"cnname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"中文名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"twocode\": \"\",\n    \"enname\": \"\",\n    \"telcode\": \"\",\n    \"threecode\": \"\",\n    \"numcode\": \"\",\n    \"areadesc\": \"\",\n    \"cnname\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_946d4b86fec8438c9ec0ebeb804621d8"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_6c52591b3cd04d9da169d446016741e6"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]4.用户信息设置/用户区号设置/增加区号",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980521,
##             "created": 1579360980521,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/修改区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980536,
##             "created": 1579360980536,
##             "name": "用户区号设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户区号设置/修改区号",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_3a580a4515a9507b87eb9af4e88e4165",
##             "parentId": "fld_1ea4736f1b2c19109405a75474201fd8",
##             "modified": 1579360980552,
##             "created": 1579360980552,
##             "url": "{{quotes_mrgs_api}}/users/areacode",
##             "name": "修改区号",
##             "description": "# PUT /users/areacode\n\n## apikey flag\n\nuser_areacode[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntwocode|string|False|None|二位编码|maxlen=8,minlen=1,decpoint=6,declen=16\nenname|string|False|None|英文名称|maxlen=32,minlen=1,decpoint=6,declen=16\nthreecode|string|False|None|三位编码|maxlen=8,minlen=1,decpoint=6,declen=16\nareadesc|string|False|None|备注信息|maxlen=32,minlen=1,decpoint=6,declen=16\nnumcode|string|False|None|数字编码|maxlen=8,minlen=1,decpoint=6,declen=16\ncnname|string|False|None|中文名称|maxlen=32,minlen=1,decpoint=6,declen=16\ntelcode|string|False|None|手机区号|maxlen=16,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"twocode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"二位编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"enname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"英文名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"threecode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"三位编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"areadesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"备注信息\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"numcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"数字编码\",\n        \"options\": {\n            \"maxlen\": \"8\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"cnname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"中文名称\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"telcode\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"手机区号\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"twocode\": \"\",\n    \"enname\": \"\",\n    \"threecode\": \"\",\n    \"areadesc\": \"\",\n    \"numcode\": \"\",\n    \"cnname\": \"\",\n    \"telcode\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_5774d5a0eedd4706a75ce0913399e404"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_0e27fdb73e4740fab501812d7cbde31f"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户区号设置/修改区号",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980577,
##             "created": 1579360980577,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/删除参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fe99c69578c60d012159a0d053327879",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980590,
##             "created": 1579360980590,
##             "name": "用户参数存储",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/删除参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_7e19bcce56d09bf19671065bc3b3ba68",
##             "parentId": "fld_fe99c69578c60d012159a0d053327879",
##             "modified": 1579360980604,
##             "created": 1579360980604,
##             "url": "{{quotes_mrgs_api}}/users/parames",
##             "name": "删除参数",
##             "description": "# DELETE /users/parames\n\n## apikey flag\n\nuser_parames[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=1,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"paramsname\": \"\",\n    \"userid\": 0\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_f0332c327b4247b5af3940755bb2ff9e"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_1faaf063901d441b9dd2936a576e411e"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]4.用户信息设置/用户参数存储/删除参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980624,
##             "created": 1579360980624,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/查询参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fe99c69578c60d012159a0d053327879",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980641,
##             "created": 1579360980641,
##             "name": "用户参数存储",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/查询参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0f7147373b54e0986705025bf51c1659",
##             "parentId": "fld_fe99c69578c60d012159a0d053327879",
##             "modified": 1579360980659,
##             "created": 1579360980659,
##             "url": "{{quotes_mrgs_api}}/users/parames",
##             "name": "查询参数",
##             "description": "# GET /users/parames\n\n## apikey flag\n\nuser_parames[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=1,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"paramssection\": \"参数段\",\n        \"paramsname\": \"参数名称\",\n        \"paramsvalue\": \"参数值\"\n    },\n    \"options_define\": {\n        \"paramssection\": {\n            \"dataType\": \"string\"\n        },\n        \"paramsname\": {\n            \"dataType\": \"string\"\n        },\n        \"paramsvalue\": {\n            \"dataType\": \"string\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"paramsname\": \"\",\n    \"userid\": 0\n}",
##                         "id": "pair_75781aa4691d4dfcbd4ee711475ea9dd",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_f42ce94c2f134f59be487403e57fbb8e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_96f7af60b01e4dcd9eab6f87da21aaa7",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_7fe0e500a4764765874d18338b42aad9"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_01f4e68c9a114ab697a976c94a6453b5"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]4.用户信息设置/用户参数存储/查询参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980671,
##             "created": 1579360980671,
##             "name": "4.用户信息设置",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/添加修改参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_fe99c69578c60d012159a0d053327879",
##             "parentId": "fld_1bc93b84ee9d46458514de84ea9c4e8c",
##             "modified": 1579360980683,
##             "created": 1579360980683,
##             "name": "用户参数存储",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]4.用户信息设置/用户参数存储/添加修改参数",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_5dbf4006ee78f23a9c50b15f06b7aedc",
##             "parentId": "fld_fe99c69578c60d012159a0d053327879",
##             "modified": 1579360980692,
##             "created": 1579360980692,
##             "url": "{{quotes_mrgs_api}}/users/parames",
##             "name": "添加修改参数",
##             "description": "# PUT /users/parames\n\n## apikey flag\n\nuser_parames[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nparamsname|string|False|None|配置名称|maxlen=16,minlen=1,decpoint=6,declen=16\nparamsvalue|string|False|None|配置值|maxlen=32,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nparamssection|string|False|None|配置段|maxlen=16,minlen=1,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"paramsname\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置名称\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"paramsvalue\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置值\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"paramssection\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"配置段\",\n        \"options\": {\n            \"maxlen\": \"16\",\n            \"minlen\": \"1\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"paramsname\": \"\",\n    \"paramsvalue\": \"\",\n    \"userid\": 0,\n    \"paramssection\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_dbcf2257c534464e9748bbd7374054fb"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_f519898d27ba461eaecca962114d70cd"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]4.用户信息设置/用户参数存储/添加修改参数",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980712,
##             "created": 1579360980712,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360980731,
##             "created": 1579360980731,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_3d7423adb6a27e630ca0b721faf6312c",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360980756,
##             "created": 1579360980756,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one/desc",
##             "name": "查询审核描述",
##             "description": "# GET /users/users/reviews_one/desc\n\n## apikey flag\n\nusers_step_one_desc[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nreviewid|int32|False|None|审核id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"reviewid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"审核id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"reviewstatus\": \"审核状态\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户id\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\",\n        \"beforejson\": \"修改前数据定义\",\n        \"afterjson\": \"修改后数据定义\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"beforejson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"afterjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"reviewid\": 0\n}",
##                         "id": "pair_86e8ed5a49d346af9c66b45e9ae08aeb",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_d3f81f5b87a24ed0a24984a8754f9da5",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_b1b9adc4076c407e8a95e73252333719",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_dd3df751e71445eb85f9033f70240239"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_8614d2e20dde43bf998598ede829603d"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第一阶段/查询审核描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980783,
##             "created": 1579360980783,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核日志描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360980804,
##             "created": 1579360980804,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核日志描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_35d10303eff2d98c9a36c4ccb605bc4d",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360980820,
##             "created": 1579360980820,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one/log/desc",
##             "name": "查询审核日志描述",
##             "description": "# GET /users/users/reviews_one/log/desc\n\n## apikey flag\n\nusers_step_one_log_desc[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nreviewid|int32|False|None|审核id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"reviewid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"审核id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户id\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\",\n        \"beforejson\": \"修改前数据定义\",\n        \"afterjson\": \"修改后数据定义\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"beforejson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"afterjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"reviewid\": 0\n}",
##                         "id": "pair_5c5329e1a211461bab5ba7bd534dc383",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_1e8153f9915e4336b5bce62df11349f0",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_d08d85e50eea46549dc3636b60b7122b",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_39ff2ce316fc45eab839f31db9800a06"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_143e002ae5cb4facbb65ea1682b78464"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第一阶段/查询审核日志描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980846,
##             "created": 1579360980846,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核日志列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360980859,
##             "created": 1579360980859,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核日志列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_907fadfdcefc2df413ed01b87d445696",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360980881,
##             "created": 1579360980881,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one/log",
##             "name": "查询审核日志列表",
##             "description": "# GET /users/users/reviews_one/log\n\n## apikey flag\n\nusers_step_one_log[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"applytime\": \"申请时间\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_8164e428751b40e98832a4a61770e597",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_e372a121ef864e52a1befbd924b3a10d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_2e206f9a0dde4543b8417c9e7a20eba1",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_cf2182d8b89b4d0e86d465448e458098"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_68d109ec8a1341e8aae996fcb0669556"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第一阶段/查询审核日志列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980896,
##             "created": 1579360980896,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360980908,
##             "created": 1579360980908,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/查询审核列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_3ebf083052fb1eaaccbcf3bba63cfe52",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360980925,
##             "created": 1579360980925,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one",
##             "name": "查询审核列表",
##             "description": "# GET /users/users/reviews_one\n\n## apikey flag\n\nusers_step_one[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"reviewstatus\": \"审核状态\",\n        \"applytime\": \"申请时间\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_7f459ef9cb584558b6c9ba824e929adc",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_6df5ae9c4b11487fb66b3d00830d8179",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_aa0b3cb31a1a4c3ebc7d6dda3278dd48",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_ee0695fc13374b1a8cefe8c139725bf9"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e972f451214d4fec862e31309d57e7d6"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第一阶段/查询审核列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980941,
##             "created": 1579360980941,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360980960,
##             "created": 1579360980960,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_be954f827ea2541e5af7bd2b0b7ef16e",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360980980,
##             "created": 1579360980980,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two",
##             "name": "查询审核列表",
##             "description": "# GET /users/users/reviews_two\n\n## apikey flag\n\nusers_step_two[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nreviewid|int32|False|None|审核id|decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"reviewid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"审核id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"reviewstatus\": \"审核状态\",\n        \"applytime\": \"申请时间\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"reviewid\": 0\n}",
##                         "id": "pair_f60241d2f0c64684a15c72649275cc62",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_8e36020caa0b4ed68faba169687eac96",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_94e299aa58eb4a79ab377574b3515aad",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_861ef4a6bd744699a6beaee16b52fe05"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_f0bd522294d341128971c07abe960dd4"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第二阶段/查询审核列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360980996,
##             "created": 1579360980996,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核日志描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981015,
##             "created": 1579360981015,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核日志描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_6c03ccd15648030efb6cbb6f362dc6c1",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360981037,
##             "created": 1579360981037,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two/log/desc",
##             "name": "查询审核日志描述",
##             "description": "# GET /users/users/reviews_two/log/desc\n\n## apikey flag\n\nusers_step_two_log_desc[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户id\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\",\n        \"beforejson\": \"修改前数据定义\",\n        \"afterjson\": \"修改后数据定义\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"beforejson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"afterjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_18ad0b6f49cf4165a2b9540b689c1220",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_8889a6c047bf4a2bae58f874d5cec487",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_9f5ed8e23321482d878e15c3ff312c98",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_0a932dc1bf5740cdbb047c0a153186f7"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_c2af9deef84147a4b7ea5a78e4775904"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第二阶段/查询审核日志描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981061,
##             "created": 1579360981061,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核日志列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981081,
##             "created": 1579360981081,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核日志列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_d489b6c32203812379ca59fccb8b4e08",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360981102,
##             "created": 1579360981102,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two/log",
##             "name": "查询审核日志列表",
##             "description": "# GET /users/users/reviews_two/log\n\n## apikey flag\n\nusers_step_two_log[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"applytime\": \"申请时间\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_3782c3dc349e4f0681d35a1f4f61414c",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_df41697fbf5a4039a357ad8fa8eb98a1",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_b8c73894a035426ab9a9487cb006202b",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_88b0d03e51704b658dc3e4305daf7fb4"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_f13bf26d149c4f79916da4c020fccf6a"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第二阶段/查询审核日志列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981122,
##             "created": 1579360981122,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981138,
##             "created": 1579360981138,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/查询审核描述",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0c88d279956da871b409dbe7eb3b2265",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360981152,
##             "created": 1579360981152,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two/desc",
##             "name": "查询审核描述",
##             "description": "# GET /users/users/reviews_two/desc\n\n## apikey flag\n\nusers_step_two_desc[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {\n        \"reviewid\": \"审核id\",\n        \"reviewtype\": \"审核类型\",\n        \"reviewstatus\": \"审核状态\",\n        \"applytime\": \"申请时间\",\n        \"applyuserid\": \"申请用户id\",\n        \"applylogincode\": \"申请用户账号\",\n        \"applyacctype\": \"申请用户账号类型\",\n        \"applydesc\": \"申请信息备注\",\n        \"lastoptime\": \"最后审核时间\",\n        \"lastopuserid\": \"最后审核人用户id\",\n        \"lastlogincode\": \"最后审核人账号\",\n        \"laststatus\": \"最后审核状态\",\n        \"lastdesc\": \"最后审核描述\",\n        \"reqjson\": \"请求修改的字段\",\n        \"beforejson\": \"修改前数据定义\",\n        \"afterjson\": \"修改后数据定义\"\n    },\n    \"options_define\": {\n        \"reviewid\": {\n            \"dataType\": \"int\"\n        },\n        \"reviewtype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewTypeTranslate\"\n        },\n        \"reviewstatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"applytime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"applyuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"applylogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"applyacctype\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumUserAccTypeTranslate\"\n        },\n        \"applydesc\": {\n            \"dataType\": \"string\"\n        },\n        \"lastoptime\": {\n            \"dataType\": \"datetime\"\n        },\n        \"lastopuserid\": {\n            \"dataType\": \"int\"\n        },\n        \"lastlogincode\": {\n            \"dataType\": \"string\"\n        },\n        \"laststatus\": {\n            \"dataType\": \"enum\",\n            \"enum\": \"admins_enums.EnumReviewStatusTranslate\"\n        },\n        \"lastdesc\": {\n            \"dataType\": \"string\"\n        },\n        \"reqjson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"beforejson\": {\n            \"dataType\": \"jsonb\"\n        },\n        \"afterjson\": {\n            \"dataType\": \"jsonb\"\n        }\n    }\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_b0e2d070f40b46b9a2c9b5c85125fb1e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_e21ea273a39f49c09ac950db40693339",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_3b63f132cbe34d60af22623cfab1c7fa",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_c5a53837bbc04f09a4fa981221a6726b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_41be79064e1b48d59613d3b2a95dfc5a"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]7.用户信息审核/用户审核第二阶段/查询审核描述",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981171,
##             "created": 1579360981171,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/审核申请",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981198,
##             "created": 1579360981198,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/审核申请",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_a9d69bdb1f25e1c557b95c7ffecad35a",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360981231,
##             "created": 1579360981231,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one",
##             "name": "审核申请",
##             "description": "# POST /users/users/reviews_one\n\n## apikey flag\n\nusers_step_one[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ncountry|string|False|None|国籍|maxlen=32,minlen=0,decpoint=6,declen=16\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nidcard|string|False|None|证件号码|maxlen=32,minlen=0,decpoint=6,declen=16\njsoncache|jsonb|False|None|附加字段|defval='{}',decpoint=6,declen=16\nidtype|EnumIdType|False|None|证件类型|decpoint=6,declen=16\nusername|string|False|None|用户姓名|maxlen=32,minlen=0,decpoint=6,declen=16\nidcardvaild|date|False|None|证件有效期|defval='1900-01-01',decpoint=6,declen=16\nimg_idcard_front|string32|False|None|图片超链接|maxlen=32\nimg_idcard_back|string32|False|None|图片超链接|maxlen=32\nimg_idcard_hand|string32|False|None|图片超链接|maxlen=32\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"country\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"国籍\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"idcard\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"证件号码\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"jsoncache\": {\n        \"default\": null,\n        \"type\": \"jsonb\",\n        \"dbname\": \"\",\n        \"comment\": \"附加字段\",\n        \"options\": {\n            \"update\": \"true\",\n            \"defval\": \"'{}'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idtype\": {\n        \"default\": null,\n        \"type\": \"EnumIdType\",\n        \"dbname\": \"\",\n        \"comment\": \"证件类型\",\n        \"options\": {\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"username\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"用户姓名\",\n        \"options\": {\n            \"maxlen\": \"32\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"idcardvaild\": {\n        \"default\": null,\n        \"type\": \"date\",\n        \"dbname\": \"\",\n        \"comment\": \"证件有效期\",\n        \"options\": {\n            \"defval\": \"'1900-01-01'\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"img_idcard_front\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"img_idcard_back\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"img_idcard_hand\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"country\": \"\",\n    \"userid\": 0,\n    \"idcard\": \"\",\n    \"jsoncache\": {},\n    \"idtype\": 0,\n    \"username\": \"\",\n    \"idcardvaild\": \"19000101\",\n    \"img_idcard_front\": \"\",\n    \"img_idcard_back\": \"\",\n    \"img_idcard_hand\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_5c383e7dd40c4ff9b755b836a16ed10b"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_b23be8ada0be48cdbe487f2639836c70"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]7.用户信息审核/用户审核第一阶段/审核申请",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981246,
##             "created": 1579360981246,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/审核申请",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981255,
##             "created": 1579360981255,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/审核申请",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_01219821aa63d443d2f05ec59ef7bb05",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360981265,
##             "created": 1579360981265,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two",
##             "name": "审核申请",
##             "description": "# POST /users/users/reviews_two\n\n## apikey flag\n\nusers_step_two[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nimg_idcard_hand|string32|False|None|图片超链接|maxlen=32\nuserid|int32|False|None|用户id|decpoint=6,declen=16\nimg_idcard_front|string32|False|None|图片超链接|maxlen=32\nimg_idcard_back|string32|False|None|图片超链接|maxlen=32\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"img_idcard_hand\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"userid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"用户id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"img_idcard_front\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    },\n    \"img_idcard_back\": {\n        \"default\": null,\n        \"type\": \"string32\",\n        \"dbname\": \"users\",\n        \"comment\": \"图片超链接\",\n        \"options\": {\n            \"default\": \"none\",\n            \"maxlen\": \"32\",\n            \"key\": \"false\",\n            \"inc\": \"false\",\n            \"update\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"img_idcard_hand\": \"\",\n    \"userid\": 0,\n    \"img_idcard_front\": \"\",\n    \"img_idcard_back\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_7972940555bb4ccfaa93168d87db12fd"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_82043249313245b294a781d75b054eb1"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]7.用户信息审核/用户审核第二阶段/审核申请",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981285,
##             "created": 1579360981285,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/审核记录",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981294,
##             "created": 1579360981294,
##             "name": "用户审核第一阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第一阶段/审核记录",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_c8933f9663df9d713b7335c0c7f8b144",
##             "parentId": "fld_9e74d75b8a745750c86d737d0e224c2f",
##             "modified": 1579360981306,
##             "created": 1579360981306,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_one",
##             "name": "审核记录",
##             "description": "# PUT /users/users/reviews_one\n\n## apikey flag\n\nusers_step_one[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nreviewid|int32|False|None|审核id|decpoint=6,declen=16\nlastopstatus|EnumReviewStatus|False|None|最后审核状态|decpoint=6,declen=16\nlastopdesc|string|False|None|最后审核描述|maxlen=64,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"reviewid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"审核id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"lastopstatus\": {\n        \"default\": null,\n        \"type\": \"EnumReviewStatus\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核状态\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"lastopdesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核描述\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"reviewid\": 0,\n    \"lastopstatus\": 0,\n    \"lastopdesc\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_caef54f2560647bf985a858162e6fbd3"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_fe754fbfc801421f904ffdcf6efef661"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]7.用户信息审核/用户审核第一阶段/审核记录",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_5946397ec8c6f783193fac45584b5351",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981321,
##             "created": 1579360981321,
##             "name": "7.用户信息审核",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/审核记录",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "parentId": "fld_5946397ec8c6f783193fac45584b5351",
##             "modified": 1579360981332,
##             "created": 1579360981332,
##             "name": "用户审核第二阶段",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]7.用户信息审核/用户审核第二阶段/审核记录",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_3b7c3cb09a80b33efe14499e309f1870",
##             "parentId": "fld_8745cf26284fa2aef475bd983a6b0e74",
##             "modified": 1579360981344,
##             "created": 1579360981344,
##             "url": "{{quotes_mrgs_api}}/users/users/reviews_two",
##             "name": "审核记录",
##             "description": "# PUT /users/users/reviews_two\n\n## apikey flag\n\nusers_step_two[PUT]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nreviewid|int32|False|None|审核id|decpoint=6,declen=16\nlastopstatus|EnumReviewStatus|False|None|最后审核状态|decpoint=6,declen=16\nlastopdesc|string|False|None|最后审核描述|maxlen=64,minlen=0,decpoint=6,declen=16\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"reviewid\": {\n        \"default\": null,\n        \"type\": \"int32\",\n        \"dbname\": \"\",\n        \"comment\": \"审核id\",\n        \"options\": {\n            \"key\": \"true\",\n            \"inc\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"update\": \"false\"\n        }\n    },\n    \"lastopstatus\": {\n        \"default\": null,\n        \"type\": \"EnumReviewStatus\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核状态\",\n        \"options\": {\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    },\n    \"lastopdesc\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"最后审核描述\",\n        \"options\": {\n            \"maxlen\": \"64\",\n            \"minlen\": \"0\",\n            \"update\": \"true\",\n            \"decpoint\": \"6\",\n            \"declen\": \"16\",\n            \"key\": \"false\",\n            \"inc\": \"false\"\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "PUT",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"reviewid\": 0,\n    \"lastopstatus\": 0,\n    \"lastopdesc\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_cca4c07916114cd38bb36742670c174d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_7377fa41a70740ff88b2d43b064c5a87"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[PUT]7.用户信息审核/用户审核第二阶段/审核记录",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981356,
##             "created": 1579360981356,
##             "name": "99.导出CSV报表管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]99.导出CSV报表管理/删除CSV报表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_57730103257bf013eec666af5c9ce6b5",
##             "parentId": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "modified": 1579360981362,
##             "created": 1579360981362,
##             "url": "{{quotes_mrgs_api}}/report_csv",
##             "name": "删除CSV报表",
##             "description": "# DELETE /report_csv\n\n## apikey flag\n\nreport_csv[DELETE]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntaskid|string|False|None|taskid|maxlen=32,minlen=1\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"taskid\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"admins\",\n        \"comment\": \"taskid\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 1\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "DELETE",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"taskid\": \"\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_cea1172269bd4d8894e9e6caf59c9d1d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_0bf2de8cced5440e9c0d408b6f8d7bcb"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[DELETE]99.导出CSV报表管理/删除CSV报表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981372,
##             "created": 1579360981372,
##             "name": "99.导出CSV报表管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]99.导出CSV报表管理/下载CSV报表文件",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_8f585fe5161a58d1dc6fd150fffbe657",
##             "parentId": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "modified": 1579360981380,
##             "created": 1579360981380,
##             "url": "{{quotes_mrgs_api}}/report_csv/download",
##             "name": "下载CSV报表文件",
##             "description": "# GET /report_csv/download\n\n## apikey flag\n\nreport_csv_download[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\ntaskid|string|False|None|taskid|maxlen=32,minlen=1\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"taskid\": {\n        \"default\": null,\n        \"type\": \"string\",\n        \"dbname\": \"admins\",\n        \"comment\": \"taskid\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 1\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{\n    \"taskid\": \"\"\n}",
##                         "id": "pair_e5a90fc8d02a4ee898a61bc3f9168e1c",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_33bec139e32b437398b315f749e451c6",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_8427f5f27f704a25aef969e23cbf8718",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_d6b418f00f90450ab6c424f5e1496a15"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_261933a71ebb4732b13311397114eaaa"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]99.导出CSV报表管理/下载CSV报表文件",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981390,
##             "created": 1579360981390,
##             "name": "99.导出CSV报表管理",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]99.导出CSV报表管理/查询CSV报表列表",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_47a52ba6ae322ed3839f4db5e80e315b",
##             "parentId": "fld_f9189c6398b3f87ec17c355fa6cd9c1d",
##             "modified": 1579360981395,
##             "created": 1579360981395,
##             "url": "{{quotes_mrgs_api}}/report_csv/list",
##             "name": "查询CSV报表列表",
##             "description": "# GET /report_csv/list\n\n## apikey flag\n\nreport_csv[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_540c3ce831174fe88a8035ad2cdc35d3",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_eeccc5be2cf844658e4aa67553ad1192",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_21932ae461fe4a3e8fe2c188494772ee",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_7c39bac509704b159ec19827e0c91886"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_5d89b03eabab4d209c5c766268b8b111"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]99.导出CSV报表管理/查询CSV报表列表",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981407,
##             "created": 1579360981407,
##             "name": "1.开发调试",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.开发调试/Insomnia Client Config",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_01b02527faad6b85314bdcce31b7a9d7",
##             "parentId": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "modified": 1579360981415,
##             "created": 1579360981415,
##             "url": "{{quotes_mrgs_api}}/devel/rest_json",
##             "name": "Insomnia Client Config",
##             "description": "# GET /devel/rest_json\n\n## apikey flag\n\nsys_restful_clinet[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlang|string|true|en|语言配置\ndomain|string|true||域名\nnginx_uri|string|true||Nginx_uri\nssh_tag|string|true||SSH_标签(http|https)\nvkey|string|true||Env Key（禁用：使用完整的url配置）\nworkspace_name|string|true||输出配置路径名\nproject_name|string|true||输出配置项目名称\nnogenenv|string|true||输出配置生成Env配置\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_7577d559528b46cf9c17b576b5c0a00d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_081fa7c982c142bd9d5100536f5702da",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_e2f3102f3f4949cbb218374b5cc44d89",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [
##                 {
##                     "name": "lang",
##                     "value": "en",
##                     "desc": "语言配置"
##                 },
##                 {
##                     "name": "domain",
##                     "value": "",
##                     "desc": "域名"
##                 },
##                 {
##                     "name": "nginx_uri",
##                     "value": "",
##                     "desc": "Nginx_uri"
##                 },
##                 {
##                     "name": "ssh_tag",
##                     "value": "",
##                     "desc": "SSH_标签(http|https)"
##                 },
##                 {
##                     "name": "vkey",
##                     "value": "",
##                     "desc": "Env Key（禁用：使用完整的url配置）"
##                 },
##                 {
##                     "name": "workspace_name",
##                     "value": "",
##                     "desc": "输出配置路径名"
##                 },
##                 {
##                     "name": "project_name",
##                     "value": "",
##                     "desc": "输出配置项目名称"
##                 },
##                 {
##                     "name": "nogenenv",
##                     "value": "",
##                     "desc": "输出配置生成Env配置"
##                 }
##             ],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_7889e15d9cd6425899ee9e949b34b07d"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_ca0be06336a04a58beabedb87dfd5a05"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.开发调试/Insomnia Client Config",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981421,
##             "created": 1579360981421,
##             "name": "1.开发调试",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.开发调试/客户API配置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_e1471f8bb952dfea56b41de1be31b450",
##             "parentId": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "modified": 1579360981431,
##             "created": 1579360981431,
##             "url": "{{quotes_mrgs_api}}/devel/client_api_config_json",
##             "name": "客户API配置",
##             "description": "# GET /devel/client_api_config_json\n\n## apikey flag\n\nsys_client_api_config[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_ae530adc2d3b4a5c8ce9391bb2f7d39d",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_411f04aac6d145dc895cd371e120abad",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_29edd8919cc14093900846566a23f596",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_76ca373abade4793815c0928ffcddfd4"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_e0a6e0b7c0854acdb3448d3a1046a107"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.开发调试/客户API配置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981443,
##             "created": 1579360981443,
##             "name": "1.开发调试",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.开发调试/Cnname 配置",
##             "_type": "request_group"
##         },
##         {
##             "_id": "fld_0344ece424e3b496ea4797b5b9e92663",
##             "parentId": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "modified": 1579360981454,
##             "created": 1579360981454,
##             "url": "{{quotes_mrgs_api}}/devel/cnname_json",
##             "name": "Cnname 配置",
##             "description": "# GET /devel/cnname_json\n\n## apikey flag\n\nsys_cnname_clinet[GET]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n\n## Query Json Description\n\n```json\n{\n    \"cnname_define\": {},\n    \"options_define\": {}\n}\n```\n\n## Query Desc\n\nHttp Get Query Parames Request\nwhere: Query Condition,use mongo stype parames\npage: Query Page, Step or limit\nsort: Query Srot\n\n### Where Query Condition, use mongo stype parames\n\nhttps://docs.mongodb.com/manual/reference/operator/query/\n\n#### Where example\n\nSQL Stype\n\n```sql\nkey1=value1 and\nkey2=value2 and\nkey3 in (a,b,c) and\nkey4 &gt; 0 and\nkey5 &gt;= 0 and\nkey6 &lt; 0 and\nkey7 &lt;= 0 and\nkey8 &lt;&gt; 0 and\nkey9 like 'abc%' and\nkey10 between '1900-01-01' and '1900-01-02' and\nkey11 not in (a,b,c) and\n```\n\nSQL Stype to Mongo Stype JSON\n\n```json\n{\n    \"key1\": \"value1\",\n    \"key2\": \"value2\",\n    \"key3\": {'$in': [a,b,c]},\n    \"key4\": {'$gt': 0},\n    \"key5\": {'$gte': 0},\n    \"key6\": {'$lt': 0},\n    \"key7\": {'$lte': 0},\n    \"key8\": {'$ne': 0},\n    \"key9\": {'$like': 'abc%'},\n    \"key10\": {'$between': ['1900-01-01', '1900-01-02']},\n    \"key11\": {'$nin': [a,b,c]},\n}\n```\n\n### Page json\n\nmax limit 500\n\nlimit = [0, 100] --- [step, limit]\n\n### Sort json\n\nsorts = {'key1': 'desc', 'key2': 'asc'}\n\n\n",
##             "method": "GET",
##             "body": {
##                 "mimeType": "application/x-www-form-urlencoded",
##                 "params": [
##                     {
##                         "name": "where",
##                         "value": "{}",
##                         "id": "pair_58101e5d1606446ea3766139612fc95e",
##                         "disabled": false
##                     },
##                     {
##                         "name": "page",
##                         "value": "[0, 50]",
##                         "id": "pair_f30880426d1945ad9b162d0eb40c9315",
##                         "disabled": false
##                     },
##                     {
##                         "name": "sort",
##                         "value": "{}",
##                         "id": "pair_5221a72155cf409eb59579c91d1fd0f5",
##                         "disabled": false
##                     }
##                 ]
##             },
##             "parameters": [],
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/x-www-form-urlencoded",
##                     "id": "pair_4ca948a6026542e492378a61fcb57877"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_fc2da784f1ed4080808176e2948f1334"
##                 }
##             ],
##             "authentication": {},
##             "metaSortKey": "[GET]1.开发调试/Cnname 配置",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "parentId": "fld_a239a989aac0ec1ec3b24f4f731d07fd",
##             "modified": 1579360981467,
##             "created": 1579360981467,
##             "name": "1.开发调试",
##             "description": "path",
##             "environment": {},
##             "metaSortKey": "[PATH]1.开发调试/数据包签名",
##             "_type": "request_group"
##         },
##         {
##             "_id": "req_919b68cb796aef74f075c0302678d236",
##             "parentId": "fld_23f35dccdcd54e32c1ccf0cad31f19dd",
##             "modified": 1579360981480,
##             "created": 1579360981480,
##             "url": "{{quotes_mrgs_api}}/devel/sign_test",
##             "name": "数据包签名",
##             "description": "# POST /devel/sign_test\n\n## apikey flag\n\nsys_sign_test[POST]\n\n## Api description\n\napi desc\n\n## Http Query Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\n\n\n## Http Body Parames Request\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nlogincode|string|False|system|账号|maxlen=32,minlen=6\n\n## Http Body Parames Response\n\nname|type|required|default|memo|other\n:---|:--:|:--:|:---|:---|:---\nerror|string|True|0|错误码|maxlen=10,minlen=1\nerror_text|string|True|0|错误描述|maxlen=256,minlen=1\n\n## Http Body Parames Request Json\n\n```json\n{\n    \"logincode\": {\n        \"type\": \"string\",\n        \"default\": \"system\",\n        \"comment\": \"账号\",\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 32,\n            \"minlen\": 6,\n            \"maxval\": null,\n            \"minval\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n## Http Body Parames Response Json\n\n```json\n{\n    \"error\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误码\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 10,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    },\n    \"error_text\": {\n        \"default\": \"0\",\n        \"type\": \"string\",\n        \"dbname\": \"\",\n        \"comment\": \"错误描述\",\n        \"optional\": true,\n        \"options\": {\n            \"update\": \"false\",\n            \"maxlen\": 256,\n            \"minlen\": 1,\n            \"maxval\": null,\n            \"minval\": null,\n            \"regix\": null,\n            \"memo\": null\n        }\n    }\n}\n```\n\n\n",
##             "method": "POST",
##             "body": {
##                 "mimeType": "application/json",
##                 "text": "{\n    \"logincode\": \"system\"\n}"
##             },
##             "headers": [
##                 {
##                     "name": "Content-Type",
##                     "value": "application/json",
##                     "id": "pair_76b57ab047454bb0a505e501077731c1"
##                 },
##                 {
##                     "name": "Accept-Language",
##                     "value": "{{lang}}",
##                     "id": "pair_cbd86497efac4ff389c0e1b8ab8006f7"
##                 }
##             ],
##             "parameters": [],
##             "authentication": {},
##             "metaSortKey": "[POST]1.开发调试/数据包签名",
##             "settingStoreCookies": true,
##             "settingSendCookies": true,
##             "settingDisableRenderRequestBody": false,
##             "settingEncodeUrl": true,
##             "_type": "request"
##         },
##         {
##             "_id": "env_01570e152f39287301c98b7b06b937fd",
##             "parentId": "__BASE_ENVIRONMENT_ID__",
##             "modified": 1579360981480,
##             "created": 1579360981480,
##             "name": "行情子系统管理服务Env(http://127.0.0.1:21000)",
##             "data": {
##                 "quotes_mrgs_api": "http://127.0.0.1:21000",
##                 "lang": "zh"
##             },
##             "color": null,
##             "isPrivate": false,
##             "_type": "environment"
##         }
##     ]
## }
