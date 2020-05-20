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

    def fix_operationid(oid):
        while '_' == oid[0]:
            oid = oid[1:]
        return oid

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

    ## def fixid(func):
    ##     def wapper(*args, **kwargs):
    ##         try:
    ##             result = func(*args, **kwargs)
    ##             if result.endswith('id'):
    ##                 result += 'asdasdasd'
    ##             return result
    ##         except Exception:
    ##             raise
    ##     return wapper

    ## @fixid
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
            if get_ref(data):
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

        elif _type == 'file':
            if repeated:
                return 'FormData[]'
            else:
                return 'FormData'

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
            if 'properties' not in refobject_def:
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
            cname = get_ref(data)

            if cname in DATETIME_TYPES:
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

    def format_parame_fields(module, key='xquery', prefix='types.'):
      r = []
      for field in module[key]:
        if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            print('{}[{}]: ignore field {}'.format(
                module['operationId'], 
                module['summary'], 
                field['name']
            ))
            continue

        r.append('{}{}: {};{}'.format(
            field['name'], '?' if not field.get('required', False) or field['name'] == 'id' else '',
            datatype_interface(field, True, prefix=prefix), 
            ' // ' + field.get('description', '').replace('\n', ' ')
            if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_body_fields(module, prefix='types.'):
      if len(module['xbody']) > 1:
        raise TypeError('xbody parames error')

      r = []
      for field in module['xbody']:
        if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            continue

        r.append('{}: I{};{}'.format(
            field['name'], 
            datatype_interface(field, True, prefix=prefix), 
            ' // ' + field.get('description', '').replace('\n', ' ') 
            if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_interface_fields(field, interface=True, prefix='types.'):
      r = []
      for key, field in table.get('properties', {}).items():
        r.append('{}{}: {};{}'.format(
            key, '?' if key not in table.get('required', []) or key == 'id' else '',
            datatype_interface(field, interface, prefix=prefix), 
            ' // ' + field.get('description', '').replace('\n', ' ') if field.get('description', '') else ''
        ))
      return '\n    '.join(r)

    def format_tojson(table):
      r = []
      for key, field in table.get('properties', {}).items():
        _type = field.get('type', 'object')
        if field.get('repeated', False):
            if _type == 'object':
                cname = get_ref(field)
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
import * as enums from "./enums";
## import * as types from "./types";


const xenum = enums.EnumXNull;


export class INullObject {
}

## // ----------------------------------------------
## //        body define
## // ----------------------------------------------

## % for uri, method, module in paths_loop(src):
##     % if not module['xbody']:
##         <% continue %>
##     % endif
##     <% class_n = class_name(fix_operationid(module['operationId'])) %>

## export interface Body${typename2class(class_n)} {
##     ${format_body_fields(module)}
## }
## % endfor

// ----------------------------------------------
//        from define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xfrom']:
        <% continue %>
    % endif
    <% class_n = api_name(uri, method) %>

export interface From${typename2class(class_n)} {
    ${format_parame_fields(module, 'xfrom', prefix='')}
}
% endfor

// ----------------------------------------------
//        query define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xquery']:
        <% continue %>
    % endif
    <% class_n = api_name(uri, method) %>

export interface Query${typename2class(class_n)} {
    ${format_parame_fields(module, 'xquery', prefix='')}
}
% endfor

// ----------------------------------------------
//        path define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xpath']:
        <% continue %>
    % endif
    <% class_n = api_name(uri.replace('{', '').replace('}', ''), method) %>

export interface Path${typename2class(class_n)} {
    % for field in module['xpath']:
        % if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            <% continue %>
        % endif

    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }    ${field['name']}: ${datatype_interface(field, False, prefix='')};
    % endfor
}
% endfor

// ----------------------------------------------
//        module define
// ----------------------------------------------

% for class_n, table in module_loop(src):
<% class_n = class_n.replace('«', '').replace('»', '') %>
export interface I${typename2class(class_n)} {
    ${format_interface_fields(table.get('properties', {}), True, prefix='')}
}
% endfor
