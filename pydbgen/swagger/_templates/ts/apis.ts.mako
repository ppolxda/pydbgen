<%
    import copy
    INT_TYPES = [
        'uint32', 'int32', 'uint64', 'int64', 'sint32',
        'sint64', 'fixed32', 'fixed64', 'sfixed32',
        'sfixed64', 'integer'
    ]
    BOOL_TYPES = ['boolean', 'bool']
    FLOAT_TYPES = ['float', 'double', 'number']
    DATETIME_TYPES = ['date', 'datetime', 'Timestamp']
    NUMBER_TYPES = INT_TYPES + FLOAT_TYPES
    ## API_NAME = rest_options.get('api_name', None)
    ## if not API_NAME:
    ##     raise TypeError('api_name not set')

    def api_name(uri, method):
        # uri = uri.replace('{', '').replace('}', '')
        return snake_to_camel(uri.replace('/', '_')).replace('_', '') + snake_to_camel(method).replace('_', '')

    def get_ref(data):
        cname = data.get('originalRef', '')
        if not cname:
            cname = data.get('$ref', '').split('/')[-1]
        return cname

    def typename2class(name):
        if not name:
            raise TypeError('name error')

        if name[0] == '.':
            name = name[1:]

        return name.replace('.', '')

    ## def datatype_interface(data, interface=False):
    ##     if not isinstance(data, dict):
    ##         raise TypeError('datatype_interface not dict')

    ##     repeated = False
    ##     _type = data.get('type', 'object')
    ##     if _type == 'array':
    ##         ## if 'type' not in data['items']:
    ##         ##     raise TypeError('array has not items {}'.format(data['items']))
    ##         repeated = True
    ##         data = data.get('items', {})
    ##         if not data:
    ##             raise TypeError('array items is null')

    ##         _type = data.get('type', 'object')

    ##     if not _type:
    ##         raise TypeError('module error {}'.format(data))

    ##     if _type == 'string':
    ##         if repeated:
    ##             return 'string[]'
    ##         else:
    ##             return 'string'

    ##     elif _type in NUMBER_TYPES:
    ##         if repeated:
    ##             return 'number[]'
    ##         else:
    ##             return 'number'

    ##     ## elif _type in ['json', 'jsonb']:
    ##     ##     return _type

    ##     elif _type == 'object':
    ##         cname = data.get('originalRef', '')
    ##         if not cname:
    ##             data = data.get('schema', {})
    ##             cname = data.get('originalRef', 'NullObject')

    ##         if cname in DATETIME_TYPES:
    ##             if repeated:
    ##                 return 'number[]'
    ##             else:
    ##                 return 'number'

    ##         if not cname:
    ##             raise TypeError('class originalRef not found {} {}'.format(cname, data))

    ##         cname_def = src['definitions'].get(cname, {})
    ##         if not cname_def and cname != 'NullObject':
    ##             raise TypeError('class not found {} {}'.format(cname, data))

    ##         ## TAG - UNKNUW CLASS
    ##         subtype = cname_def.get('type', 'object')
    ##         if subtype == 'object' and 'properties' not in cname_def:
    ##             if cname == 'NullObject':
    ##                 if repeated:
    ##                     return 'NullObject' + '[]'
    ##                 else:
    ##                     return 'NullObject'
    ##             else:
    ##                 if repeated:
    ##                     return 'any' + '[]'
    ##                 else:
    ##                     return 'any'
    ##         else:
    ##             cname = cname.replace('«', '').replace('»', '')
    ##             if interface:
    ##                 if repeated:
    ##                     return 'I' + typename2class(cname) + '[]'
    ##                 else:
    ##                     return 'I' + typename2class(cname)
    ##             else:
    ##                 if repeated:
    ##                     return typename2class(cname) + '[]'
    ##                 else:
    ##                     return typename2class(cname)

    ##     elif _type == 'enum':
    ##         if 'ename' not in data or not data['ename']:
    ##             raise TypeError('ename not found {}'.format(data))

    ##         if repeated:
    ##             return 'enums.' + typename2class(data['ename']) + '[]'
    ##         else:
    ##             return 'enums.' + typename2class(data['ename'])

    ##     elif _type in BOOL_TYPES:
    ##         if repeated:
    ##             return 'boolean[]'
    ##         else:
    ##             return 'boolean'

    ##     else:
    ##         raise Exception('unknow datatype [{}]'.format(_type))

    def datatype_interface(data, interface=False, repeated=False, required=False, plevel=None, prefix='types.'):
        if not isinstance(data, dict):
            raise TypeError('datatype not dict')

        # try get required
        if not required:
            required = data.get('required', False)

        # if query parame
        _type = data.get('type', None)
        if _type == 'array':
            return datatype_interface(
                data.get('items', {}), interface, 
                True, required, data, 
                prefix=prefix
            )

        # if body parame
        schema = data.get('schema', None)
        if schema:
            return datatype_interface(
                schema, interface, 
                False, required, data, 
                prefix=prefix
            )

        if _type is None:
            ref = get_ref(data)
            if ref:
                _type = 'refobject'
            else:
                if interface:
                    if repeated:
                        return prefix + 'INullObject[]'
                    else:
                        return prefix + 'INullObject'
                else:
                    if repeated:
                        return prefix + 'NullObject[]'
                    else:
                        return prefix + 'NullObject'

        if _type == 'string':
            if repeated:
                return 'string[]'
            else:
                return 'string'

        elif _type in NUMBER_TYPES:
            if repeated:
                return 'number[]'
            else:
                return 'number'

        ## elif _type in ['json', 'jsonb']:
        ##     return _type

        elif _type == 'object':
            if repeated:
                return prefix + 'INullObject[]'
            else:
                return prefix + 'INullObject'

        elif _type == 'refobject':
            refobject = get_ref(data)
                
            assert isinstance(refobject, str) and refobject
            if refobject in DATETIME_TYPES:
                if repeated:
                    return 'number[]'
                else:
                    return 'number'

            refobject_def = src['definitions'].get(refobject, {})
            if not refobject_def or not isinstance(refobject_def, dict):
                raise TypeError('class not found or type error {} {}'.format(cname, data))

            ## TAG - UNKNUW CLASS
            subtype = refobject_def.get('type', None)
            if subtype == 'object' and 'properties' not in refobject_def:
                raise TypeError(refobject_def, refobject)
                if repeated:
                    return 'any' + '[]'
                else:
                    return 'any'
            else:
                refobject = refobject.replace('«', '').replace('»', '')
                if interface:
                    if repeated:
                        return prefix + 'I' + typename2class(refobject) + '[]'
                    else:
                        return prefix + 'I' + typename2class(refobject)
                else:
                    if repeated:
                        return prefix + typename2class(refobject) + '[]'
                    else:
                        return prefix + typename2class(refobject)

        elif _type == 'enum':
            if 'ename' not in data or not data['ename']:
                raise TypeError('ename not found {}'.format(data))

            if repeated:
                return 'enums.' + typename2class(data['ename']) + '[]'
            else:
                return 'enums.' + typename2class(data['ename'])

        elif _type in BOOL_TYPES:
            if repeated:
                return 'boolean[]'
            else:
                return 'boolean'

        else:
            raise Exception('unknow datatype [{}]'.format(_type))

    def pattern_opt(xformat, pattern, data):
        if not xformat and not pattern:
            return 'null'
        if pattern:
            return "/" + pattern + "/"
        elif xformat in INT_TYPES:
            return 'null'
        elif xformat in FLOAT_TYPES:
            return 'null'
        elif xformat in ['date', 'date-time']:
            return "/" + '^((?:(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2}(?:\.\d+)?))(Z|[\+-]\d{2}:\d{2})?)$' + "/"
        elif xformat == 'password':
            return "/" + '^[0-9]{4}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}$' + "/"
        elif xformat == 'byte':
            return "/" + '(?:^(?:[A-Za-z0-9+\/]{4}\n?)*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)$)' + "/"
        elif xformat == 'binary':
            return
        elif xformat == 'email':
            return "/" + '^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$' + "/"
        elif xformat == 'uuid':
            return "/" + '[0-9a-f]{32}|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}' + "/"
        elif xformat == 'uri':
            return "/" + '(?:http|https):\/\/((?:[\w-]+)(?:\.[\w-]+)+)(?:[\w.,@?^=%&amp;:\/~+#-]*[\w@?^=%&amp;\/~+#-])?' + "/"
        elif xformat == 'hostname':
            return "/" + '^([a-zA-Z0-9](?:(?:[a-zA-Z0-9-]|(?<!-).(?![-.]))[a-zA-Z0-9]+)?)$' + "/"
        elif xformat == 'ipv4':
            return "/" + '(\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b)' + "/"
        elif xformat == 'ipv6':
            return "/" + '\[(?:[a-zA-Z0-9]{0,4}:?){1,8}\]|\[(?:[a-zA-Z0-9]{0,4}:?){1,4}(?:[0-9]{1,3}\.){3}[0-9]{1,3}\]' + "/"
        else:
            raise TypeError('pattern_opt format error %s %s %s' % (
                xformat, pattern, data
            ))

    def datatype(data):
        if not isinstance(data, dict):
            raise TypeError('datatype_interface not dict')

        repeated = False
        val = data.get('type', 'object')
        if val == 'array':
            ## if 'type' not in data['items']:
            ##     raise TypeError('array has not items {}'.format(data['items']))
            repeated = True
            data = data.get('items', {})
            if not data:
                raise TypeError('array items is null')

            val = data.get('type', 'object')


        if val == 'string':
            return 'string'

        elif val in DATETIME_TYPES:
            return 'datetime'

        elif val in NUMBER_TYPES:
            return 'number'

        ## elif val in ['json', 'jsonb']:
        ##     return val

        elif val == 'object':
            ref = get_ref(data)

            if ref in DATETIME_TYPES:
                if repeated:
                    return 'number[]'
                else:
                    return 'number'

            return 'message'

        elif val == 'enum':
            return 'enum'

        elif val in BOOL_TYPES:
            return 'boolean'

        else:
            raise Exception('unknow datatype [{}]'.format(val))

    def loop_opts(requireds, fields):
        for key, data in fields.items():
            if not isinstance(data, dict):
                raise TypeError('datatype_interface not dict')

            repeated = False
            _type = data.get('type', 'object')
            if _type == 'array':
                ## if 'type' not in data['items']:
                ##     raise TypeError('array has not items {}'.format(data['items']))
                repeated = True
                data = data.get('items', {})
                if not data:
                    raise TypeError('array items is null')

                _type = data.get('type', 'object')

            opts = ', '.join([
                "'" + datatype(data) + "'",
                'true' if repeated else 'false',
                'true' if key in requireds else 'false',
                str(data.get('maxLength', 0)) if data.get('maxLength', 0) is not None else 'null',
                str(data.get('minLength', 0)) if data.get('minLength', 0) is not None else 'null',
                str(data.get('maximum', 0)) if data.get('maximum', 0) is not None else 'null',
                str(data.get('minimum', 0)) if data.get('minimum', 0) is not None else 'null',
                str(pattern_opt(data.get('format', ''), data.get('pattern', ''), data))
            ])
            yield (key, opts)

    def format_query_fields(module):
      r = []
      for field in module['xquery']:
        if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            continue

        r.append('{}: {};{}'.format(
            field['name'], 
            datatype_interface(field, True), 
            ' // ' + field.get('description', '').replace('\n', ' ')
            if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_body_fields(module):
      if len(module['xbody']) > 1:
        raise TypeError('xbody parames error')

      r = []
      for field in module['xbody']:
        if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            continue

        r.append('{}: I{};{}'.format(
            field['name'], 
            datatype_interface(field, True), 
            ' // ' + field.get('description', '').replace('\n', ' ') 
            if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_interface_fields(field):
      r = []
      for key, field in table.get('properties', {}).items():
        r.append('{}: {};{}'.format(
            key, 
            datatype_interface(field, True), 
            ' // ' + field.get('description', '').replace('\n', ' ') if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_tojson(table):
      r = []
      for key, field in table.get('properties', {}).items():
        _type = field.get('type', 'object')
        if field.get('repeated', False):
            if _type == 'object':
                cname = get_ref(data)
                if cname == 'date':
                  r.append('{}: this.arrayToDate(this.{}),'.format(key, key))
                elif cname == 'datetime' or cname == 'Timestamp':
                  r.append('{}: this.arrayToDatetime(this.{}),'.format(key, key))
                else:
                  r.append('{}: this.arrayToJson(this.{}),'.format(key, key))
            else:
                r.append('{}: this.{},'.format(key, key))
        else:
            if _type == 'object':
                cname = get_ref(field)
                if cname == 'date':
                  r.append('{}: this.dateFmt(this.{}),'.format(key, key))
                elif cname == 'datetime' or cname == 'Timestamp':
                  r.append('{}: this.datetimeFmt(this.{}),'.format(key, key))
                else:
                  r.append('{}: this.{}.toJson(),'.format(key, key))
            else:
                r.append('{}: this.{},'.format(key, key))
      return '\n          '.join(r)

    def format_uri(uri, path):
        '''
        path = [{
            name: "id",
            in: "path",
            description: "id",
            required: true,
            type: "integer",
            format: "int64",
        }]
        '''
        if len(path) < 1 or not isinstance(path, list):
            return uri
            ## raise TypeError('path error. {}'.format(path))
        
        if '{' not in uri or '}' not in uri:
            return uri
            ## raise TypeError('uri error. {}'.format(uri))

        return uri.format(
            **{
                p['name']: '${%s}' % ('path.' + p['name'])
                for p in path
            }
        )
%>
import axios, { AxiosRequestConfig } from "axios";
## import * as enums from "./enums";
import * as types from "./types";


// ----------------------------------------------
//        Api define
// ----------------------------------------------

export class BaseApi {
  private basePath = "";

  constructor(basePath: string) {
    this.basePath = basePath;
  }

% for uri, method, module in paths_loop(src):
    ## <% req_body_name = typename2class(table['fields']['req_body']['options']['type_name']) %>
    ## <% rsp_body_name = typename2class(table['fields']['rsp_body']['options']['type_name']) %>
    ## <% query_name = typename2class(table['fields']['querys']['options']['type_name']) %>
    ## <% header_name = typename2class(table['fields']['headers']['options']['type_name']) %>
    ## <% req_body_field = DATA_MAP.get(table['fields']['req_body']['options']['type_name'], None) %>
    ## <% query_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
    ## <% header_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
  <%
        class_n = api_name(uri, method)
        class_n = typename2class(class_n.replace('«', '').replace('»', ''))
        parames = []
        parames_pp = []
        rsp = module['responses'].get('200', {})

        if method in ['delete']:
            if module['xbody']:
                xbody = module['xbody'][0]
                parames.append('data: {}'.format(datatype_interface(xbody, True)))
            elif module['xfrom']:
                parames.append('data: {}'.format('types.' + 'From' + class_n))
            else:
                parames.append('data: types.INullObject')

        elif method in ['put', 'post', 'patch']:
            if module['xbody']:
                xbody = module['xbody'][0]
                parames.append('req: {}'.format(datatype_interface(xbody, True)))
            elif module['xfrom']:
                parames.append('req: {}'.format('types.' + 'From' + class_n))
            else:
                parames.append('req: types.INullObject')
        else:
            if module['xbody']:
                xbody = module['xbody'][0]
                parames.append('req: {}'.format(datatype_interface(xbody, True)))
            elif module['xfrom']:
                parames.append('req: {}'.format('types.' + 'From' + class_n))

        if module['xpath']:
            class_n = api_name(uri.replace('{', '').replace('}', ''), method)
            parames.append('path: {}'.format('types.' + 'Path' + class_n))

        if module['xquery']:
            parames.append('params: {}'.format('types.' + 'Query' + class_n))
        elif method not in ['delete', 'put', 'post', 'patch']:
            parames.append('params: types.INullObject')

        ## if module['xheader']:
        ##     parames.append('headers: {}'.format('Header' + class_n))
        ##     parames_pp.append('headers: headers')

        parames.append('config: AxiosRequestConfig = {}')
  %>
  public ${typename2class(class_n)}(${', '.join(parames)}): Promise<${datatype_interface(rsp, True)}> {
    ## % if module['xheader']:
    ## config["headers"] = { ...config["headers"], ...headers };
    ## % endif
    % if 'consumes' in module and module['consumes']:
    if (config.headers == undefined) {
        config.headers = {};
    }
    config.headers['Content-Type'] = '${module['consumes'][0]}'
    % endif
    % if method in ['delete']:
      return axios
        .${method}<${datatype_interface(rsp, True)}>(
          `${'${this.basePath}'}${format_uri(uri, module['xpath'])}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
    % elif method in ['put', 'post', 'patch']:
    return axios
      .${method}<${datatype_interface(rsp, True)}>(
          `${'${this.basePath}'}${format_uri(uri, module['xpath'])}`, req, config
      ).then(rsp => rsp.data);
    % else:
    return axios
      .${method}<${datatype_interface(rsp, True)}>(
          `${'${this.basePath}'}${format_uri(uri, module['xpath'])}`, {params, ...config}
      ).then(rsp => rsp.data);
    % endif
  }

% endfor
}
