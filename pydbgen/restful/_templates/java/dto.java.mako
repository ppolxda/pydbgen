<%
    INT_TYPES = [
        'uint32', 'int32',  'sint32',
         'fixed32', 'sfixed32'
    ]

    LONG_TYPES = [
        'uint64', 'int64', 'sint64',
        'fixed64', 'sfixed64'
    ]

    BOOL_TYPES = ['boolean', 'bool']
    FLOAT_TYPES = ['float', 'double']
    DATETIME_TYPES = ['date', 'datetime']
    NUMBER_TYPES = INT_TYPES + FLOAT_TYPES
    API_NAME = rest_options.get('api_name', None)
    if not API_NAME:
        raise TypeError('api_name not set')


    def enummap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_enums(datas, '')
        }

    def datalist(datas):
        result = []
        for key, val in loop_nesteds(datas, ''):
            for _key, _val in val['fields'].items():
                if _val['type'] == 'message':
                    if _val['options']['type_name'] in ['.date', '.datetime']:
                        _val['type'] = _val['options']['type_name'][1:]
                        continue

                    field = DATA_MAP.get(_val['options']['type_name'], None)
                    fkey = (_val['options']['type_name'], field)
                    if fkey not in result:
                        result.append(fkey)

            fkey = ('.'.join([key, val['name']]), val)
            if fkey not in result:
                result.append(fkey)

        return result

    def datamap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_nesteds(datas, '')
        }


    DATA_MAP = datamap(json_data)
    DATA_LIST = datalist(json_data)
    ENUM_MAP = enummap(json_data)

    def typename2class(name):
        if not name:
            raise TypeError('name error')

        if name[0] == '.':
            name = name[1:]

        return name.replace('.', '')

    def datatype_change(data):
        val = data['type']
        repeated = data['options']['label'] == 'repeated'

        if val == 'string':
            if repeated:
                return 'String[]'
            else:
                return 'String'

        elif val in DATETIME_TYPES:
            if repeated:
                return 'Date[]'
            else:
                return 'Date'

        elif val in INT_TYPES:
            if repeated:
                return 'int[]'
            else:
                return 'int'

        elif val in LONG_TYPES:
            if repeated:
                return 'long[]'
            else:
                return 'long'

        ## elif val in ['json', 'jsonb']:
        ##     return val

        elif val == 'message':
            field = DATA_MAP.get(data['options']['type_name'], None)
            cname = typename2class(data['options']['type_name'])
            if repeated:
                return  cname + '[]'
            else:
                return  cname

        elif val == 'enum':
            field = ENUM_MAP.get(data['options']['type_name'], None)
            defval = list(filter(lambda x: x['value'] == 0, field['fields'].values()))
            if not defval:
                raise TypeError('not found default enum value')

            if repeated:
                return typename2class(data['options']['type_name']) + '[] = []'
            else:
                return typename2class(data['options']['type_name']) + ' = ' + typename2class(data['options']['type_name']) + '.' + defval[0]['name'].upper()

        elif val in BOOL_TYPES:
            if repeated:
                return 'boolean[] = []'
            else:
                return 'boolean = false'

        else:
            raise Exception('unknow datatype [{}]'.format(val))

    def datatype(data):
        val = data['type']

        if val == 'string':
            return 'string'

        elif val in DATETIME_TYPES:
            return 'datetime'

        elif val in NUMBER_TYPES:
            return 'number'

        ## elif val in ['json', 'jsonb']:
        ##     return val

        elif val == 'message':
            return 'message'

        elif val == 'enum':
            return 'enum'

        elif val in BOOL_TYPES:
            return 'boolean'

        else:
            raise Exception('unknow datatype [{}]'.format(val))

    def datatype_interface(data):
        val = data['type']
        repeated = data['options']['label'] == 'repeated'

        if val == 'string':
            if repeated:
                return 'string[]'
            else:
                return 'string'

        elif val in DATETIME_TYPES:
            if repeated:
                return 'moment.Moment[]'
            else:
                return 'moment.Moment'

        elif val in NUMBER_TYPES:
            if repeated:
                return 'number[]'
            else:
                return 'number'

        ## elif val in ['json', 'jsonb']:
        ##     return val

        elif val == 'message':
            field = DATA_MAP.get(data['options']['type_name'], None)
            cname = typename2class(data['options']['type_name'])
            if repeated:
                return  cname + '[]'
            else:
                return  cname

        elif val == 'enum':
            field = ENUM_MAP.get(data['options']['type_name'], None)
            defval = list(filter(lambda x: x['value'] == 0, field['fields'].values()))
            if not defval:
                raise TypeError('not found default enum value')

            if repeated:
                return typename2class(data['options']['type_name']) + '[]'
            else:
                return typename2class(data['options']['type_name'])

        elif val in BOOL_TYPES:
            if repeated:
                return 'boolean[]'
            else:
                return 'boolean'

        else:
            raise Exception('unknow datatype [{}]'.format(val))

    def loop_opts(fields):
        for key, val in fields.items():
            repeated = val['options']['label'] == 'repeated'
            opts = ','.join([
                "'" + datatype(val) + "'",
                'true' if repeated else 'false',
                str(val['options']['maxlen']) if val['options'].get('maxlen', None) is not None else 'null',
                str(val['options']['minlen']) if val['options'].get('minlen', None) is not None else 'null',
                str(val['options']['maxval']) if val['options'].get('maxval', None) is not None else 'null',
                str(val['options']['minval']) if val['options'].get('minval', None) is not None else 'null',
                "/" + str(val['options']['regex']) + "/" if val['options'].get('regex', None) is not None else 'null',
            ])
            yield (key, opts)

    def get_method(method):
        return method[1:].lower()

%>
package com.example.demo.dto;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

// ----------------------------------------------
//        module define
// ----------------------------------------------

% for class_n, table in DATA_LIST:
    % if table['options'].get('rmsg', None) == "MAPI":
        <% continue %>
    % endif

public class ${typename2class(class_n)} {

    @NotNull
    @Valid
    private Where where;
    % for key, field in table['fields'].items():
    public ${datatype_change(field)} ${key.lower()};  // ${field['comment']}
    % endfor



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}

## export class ${typename2class(class_n)} extends DataModule {

##     % for key, field in table['fields'].items():
##     public ${key.lower()}: ${datatype_change(field)};  // ${field['comment']}
##     % endfor

##     static readonly foptions: FieldOptionType = {
##         % for key, val in loop_opts(table['fields']):
##         ${key.lower()}: new FieldOptions(${ val }),
##         % endfor
##     };
##     static readonly fkeys: string[] = [
##         ${',\n        '.join(["'{}'".format(field_name.lower()) for field_name, field in table['fields'].items()])}
##     ];

##     constructor(data?: I${typename2class(class_n)}) {
##         super();
##         if (!data){
##             return;
##         }

##         % for key, field in table['fields'].items():
##         this.${key.lower()} = data.${key.lower()}
##         % endfor
##     }

##     public getFieldKeys(): string[] {
##         return ${typename2class(class_n)}.fkeys
##     }

##     public getFieldOptionType(): FieldOptionType {
##         return ${typename2class(class_n)}.foptions
##     }

##     ## public toJson(): FieldData {
##     ##     return {
##     ##     % for key, field in table['fields'].items():
##     ##         % if field['options']['label'] == 'repeated':
##     ##             % if field['type'] == 'message':
##     ##     ${key.lower()}: this.arrayToJson(this.${key.lower()}),
##     ##             % elif field['type'] == 'date':
##     ##     ${key.lower()}: this.arrayToDate(this.${key.lower()}),
##     ##             % elif field['type'] == 'datetime':
##     ##     ${key.lower()}: this.arrayToDatetime(this.${key.lower()}),
##     ##             % else:
##     ##     ${key.lower()}: this.${key.lower()},
##     ##             % endif
##     ##         % else:
##     ##             % if field['type'] == 'message':
##     ##     ${key.lower()}: this.${key.lower()}.toJson(),
##     ##             % elif field['type'] == 'date':
##     ##     ${key.lower()}: this.dateFmt(this.${key.lower()}),
##     ##             % elif field['type'] == 'datetime':
##     ##     ${key.lower()}: this.datetimeFmt(this.${key.lower()}),
##     ##             % else:
##     ##     ${key.lower()}: this.${key.lower()},
##     ##             % endif
##     ##         % endif
##     ##     % endfor
##     ##     };
##     ## }
## }
% endfor
