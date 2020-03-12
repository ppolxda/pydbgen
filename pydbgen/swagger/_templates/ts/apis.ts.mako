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

    def typename2class(name):
        if not name:
            raise TypeError('name error')

        if name[0] == '.':
            name = name[1:]

        return name.replace('.', '')

    def datatype_interface(data, interface=False):
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

        if not _type:
            raise TypeError('module error {}'.format(data))

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
            cname = data.get('originalRef', '')
            if not cname:
                data = data.get('schema', {})
                cname = data.get('originalRef', 'NullObject')

            if cname in DATETIME_TYPES:
                if repeated:
                    return 'moment.Moment[]'
                else:
                    return 'moment.Moment'

            if not cname:
                raise TypeError('class originalRef not found {} {}'.format(cname, data))

            cname_def = src['definitions'].get(cname, {})
            if not cname_def and cname != 'NullObject':
                raise TypeError('class not found {} {}'.format(cname, data))

            ## TAG - UNKNUW CLASS
            subtype = cname_def.get('type', 'object')
            if subtype == 'object' and 'properties' not in cname_def:
                if cname == 'NullObject':
                    if repeated:
                        return 'NullObject' + '[]'
                    else:
                        return 'NullObject'
                else:
                    if repeated:
                        return 'any' + '[]'
                    else:
                        return 'any'
            else:
                cname = cname.replace('«', '').replace('»', '')
                if interface:
                    if repeated:
                        return 'I' + typename2class(cname) + '[]'
                    else:
                        return 'I' + typename2class(cname)
                else:
                    if repeated:
                        return typename2class(cname) + '[]'
                    else:
                        return typename2class(cname)

        elif _type == 'enum':
            if 'ename' not in data or not data['ename']:
                raise TypeError('ename not found {}'.format(data))

            if repeated:
                return typename2class(data['ename']) + '[]'
            else:
                return typename2class(data['ename'])

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
            cname = data.get('originalRef', '')

            if cname in DATETIME_TYPES:
                if repeated:
                    return 'moment.Moment[]'
                else:
                    return 'moment.Moment'

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

    API_NAME
%>
import axios, { AxiosRequestConfig } from "axios";
import moment from "moment";

export function _(val: string): string {
    return val;
}

export class FieldError extends Error {
  public code: number;
  public key: string;

  constructor(code: number, key: string, message: string) {
    super(message);
    this.code = code;
    this.key = key;
  }
}

export class NullObject {
}

const MINDATE = moment("1900-01-01", "YYYY-MM-DD");


// ----------------------------------------------
//        enum define
// ----------------------------------------------

% for ename, field in enum_loop(src):

${ '// ' + '\n// '.join(map(lambda x: x, field['description'].split('\n')))  }
export enum ${ snake_to_camel(ename) } {
    % for key, _val in field['enums'].items():
    ${ key.upper() } = ${ _val },
    % endfor
}

${ '// ' + '\n// '.join(map(lambda x: x, field['description'].split('\n')))  }
export const ${ snake_to_camel(ename) }Translate = {
    % for key, _val in field['enums_desc'].items():
    ${ key.upper() }: '${_val }',
    % endfor
}

% endfor

// ----------------------------------------------
//        FieldChecker define
// ----------------------------------------------

class FieldOptions {
  public type: string = "";
  public array: boolean = false;
  public required: boolean = false;
  public maxlen: number | null = null;
  public minlen: number | null = null;
  public maxval: number | null = null;
  public minval: number | null = null;
  // TODO - regex compatible
  public regex: RegExp | null = null;

  constructor(
    type: string,
    array: boolean,
    required: boolean,
    maxlen: number | null = null,
    minlen: number | null = null,
    maxval: number | null = null,
    minval: number | null = null,
    regex: RegExp | null = null
  ) {
    this.type = type;
    this.array = array;
    this.required = required;
    this.maxlen = maxlen;
    this.minlen = minlen;
    this.maxval = maxval;
    this.minval = minval;
    this.regex = regex;
  }

  static check_enum(opt: FieldOptions, val: number): boolean {
    // TODO - enum range check
    // if (val == null) {
    //   return true;
    // }

    if (typeof val !== "number") {
      return false;
    }
    return true;
  }

  static check_boolean(opt: FieldOptions, val: boolean): boolean {
    // if (val == null) {
    //   return true;
    // }

    if (typeof val !== "boolean") {
      return false;
    }
    return true;
  }

  static check_number(opt: FieldOptions, val: number): boolean {
    // if (val == null) {
    //   return true;
    // }

    if (typeof val !== "number") {
      return false;
    }

    if (opt.maxval !== null && val > opt.maxval) {
      return false;
    }

    if (opt.minval !== null && val < opt.minval) {
      return false;
    }
    return true;
  }

  static check_string(opt: FieldOptions, val: string): boolean {
    // if (val == null) {
    //   return true;
    // }

    if (typeof val !== "string") {
      return false;
    }

    if (opt.maxlen !== null && val.length > opt.maxlen) {
      return false;
    }

    if (opt.minlen !== null && val.length < opt.minlen) {
      return false;
    }

    // TODO - regex compatible
    if (opt.regex !== null) {
      if (!opt.regex.test(val)) {
        return false;
      }
    }
    return true;
  }

  static check_datetime(opt: FieldOptions, val: moment.Moment): boolean {
    // if (val == null) {
    //   return true;
    // }

    if (!moment.isMoment(val)) {
      return false;
    }

    ## if (val === MINDATE) {
    ##     return false;
    ## }
    return true;
  }

  public check(key: string, val: any, ignore_array: boolean = false): FieldError | null {
    if (this.array) {
      if (!(val instanceof Array)) {
        return new FieldError(1, key, _(`${"${key}"} is not Array`));
      }

      let error: FieldError | null = null;

      for (let el of val) {
        error = this.check(el, true);
        if (error) {
          break;
        }
      }

      if (error) {
        return error;
      }

    }

    if (!this.required && val == null) {
        return new FieldError(7, key, _(`${"${key}"} Invaild`));;
    }

    if (this.type == "enum" && !FieldOptions.check_enum(this, val)) {
      return new FieldError(2, key, _(`${"${key}"} Invaild`));
    } else if (this.type == "string" && !FieldOptions.check_string(this, val)) {
      return new FieldError(3, key, _(`${"${key}"} Invaild`));
    } else if (this.type == "number" && !FieldOptions.check_number(this, val)) {
      return new FieldError(4, key, _(`${"${key}"} Invaild`));
    } else if ((this.type == "datetime" || this.type == "date") && !FieldOptions.check_datetime(this, val)) {
      return new FieldError(5, key, _(`${"${key}"} Invaild`));;
    } else if (
      this.type == "boolean" &&
      !FieldOptions.check_boolean(this, val)
    ) {
      return new FieldError(6, key, _(`${"${key}"} Invaild`));
    } else if (this.type == "message") {
      let error = val.check();
      if (error) {
        return error;
      }
    }
    return null;
  }
}

type FieldData = { [key: string]: any };
type FieldOptionType = { [key: string]: FieldOptions };

abstract class DataModule {
  abstract getFieldKeys(): string[];
  abstract getFieldOptionType(): FieldOptionType;
##   abstract toJson(): FieldData;

  public dateFmt(date: moment.Moment): string {
    return date.format("YYYYMMDD");
  }

  public datetimeFmt(date: moment.Moment): string {
    return date.format("YYYYMMDDHHmmSS");
  }

  public arrayToDate(datas: moment.Moment[]): string[] {
    let result: any[] = [];
    for (let el of datas) {
      result.push(this.dateFmt(el));
    }
    return result;
  }

  public arrayToDatetime(datas: moment.Moment[]): string[] {
    let result: any[] = [];
    for (let el of datas) {
      result.push(this.datetimeFmt(el));
    }
    return result;
  }

  public arrayToJson(datas: any[]): any[] {
    let result: any[] = [];
    for (let el of datas) {
      result.push(el.toJson());
    }
    return result;
  }

  public toJsonString(): string {
    return JSON.stringify(this.toJson());
  }

  public check(): FieldError | null {
    let opt: FieldOptions | null = null;
    let error: FieldError | null = null;
    let value: PropertyDescriptor | undefined = undefined;
    let fkeys = this.getFieldKeys();
    let foptions = this.getFieldOptionType();

    for (let fkey of fkeys) {
      opt = foptions[fkey];
      if (!opt) {
        return new FieldError(10, fkey, _(`${"${fkey}"} Invaild, Option not found`));
      }
      value = Object.getOwnPropertyDescriptor(this, fkey);
      if (!value) {
        return new FieldError(10, fkey, _(`${"${fkey}"} Invaild, Value not found`));
      }
      error = opt.check(fkey, value.value);
      if (error) {
        return error;
      }
    }
    return null;
  }


  public conv_field(
    key: string,
    val: any,
    opt: FieldOptions,
    ignore_array: boolean = false
  ): any {
    if (!ignore_array && opt.array) {
      if (opt.type == "message") {
        return this.arrayToJson(val);
      } else {
        return this.conv_field(key, val, opt, ignore_array);
      }
    } else {
      switch (opt.type) {
        case "date": {
          return this.dateFmt(val);
        }
        case "datetime": {
          return this.datetimeFmt(val);
        }
        case "message": {
          return val.toJson();
        }
        default:
          return val;
      }
    }
  }

  public toJson(do_check: boolean = false): FieldData {
    let opt: FieldOptions | null = null;
    let error: FieldError | null = null;
    let value: PropertyDescriptor | undefined = undefined;
    let fkeys = this.getFieldKeys();
    let foptions = this.getFieldOptionType();
    let result: { [key: string]: any } = {};

    for (let fkey of fkeys) {
      opt = foptions[fkey];
      if (!opt) {
        throw new FieldError(10, fkey, _(`${"${fkey}"} Invaild, Option not found`));
      }
      value = Object.getOwnPropertyDescriptor(this, fkey);
      if (!value) {
        throw new FieldError(10, fkey, _(`${"${fkey}"} Invaild, Value not found`));
      }
      if (do_check) {
        error = opt.check(fkey, value.value);
        if (error) {
          throw error;
        }
      }
      result[fkey] = this.conv_field(fkey, value.value, opt);
    }
    return result;
  }
}


// ----------------------------------------------
//        module define
// ----------------------------------------------

% for class_n, table in module_loop(src):
<% class_n = class_n.replace('«', '').replace('»', '') %>
export interface I${typename2class(class_n)} {
    % for key, field in table.get('properties', {}).items():
    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }
    ${key.lower()}: ${datatype_interface(field)};
    % endfor
}

export class ${typename2class(class_n)} extends DataModule {

    % for key, field in table.get('properties', {}).items():
    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }
    public ${key.lower()}: ${datatype_interface(field, true)};
    % endfor

    static readonly foptions: FieldOptionType = {
        % for key, field in loop_opts(table.get('required', []), table.get('properties', {})):
        ${key.lower()}: new FieldOptions(${ field }),
        % endfor
    };
    static readonly fkeys: string[] = [
        ${',\n        '.join(["'{}'".format(key.lower()) for key, field in table.get('properties', {}).items()])}
    ];

    constructor(data?: I${typename2class(class_n)}) {
        super();
        if (!data){
            return;
        }

        % for key, field in table.get('properties', {}).items():
        this.${key.lower()} = data.${key.lower()}
        % endfor
    }

    public getFieldKeys(): string[] {
        return ${typename2class(class_n)}.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return ${typename2class(class_n)}.foptions
    }

    public toJson(): FieldData {
        return {
        % for key, field in table.get('properties', {}).items():
            <% _type = field.get('type', 'object') %>
            % if field.get('repeated', False):
                % if _type == 'object':
                    <% cname = field.get('originalRef', '') %>
                    % if cname == 'date':
            ${key.lower()}: this.arrayToDate(this.${key.lower()}),
                    % elif cname == 'datetime' or cname == 'Timestamp':
            ${key.lower()}: this.arrayToDatetime(this.${key.lower()}),
                    % else:
            ${key.lower()}: this.arrayToJson(this.${key.lower()}),
                    % endif
                % else:
            ${key.lower()}: this.${key.lower()},
                % endif
            % else:
                % if _type == 'object':
                    <% cname = field.get('originalRef', '') %>
                    % if cname == 'date':
            ${key.lower()}: this.dateFmt(this.${key.lower()}),
                    % elif cname == 'datetime' or cname == 'Timestamp':
            ${key.lower()}: this.datetimeFmt(this.${key.lower()}),
                    % else:
            ${key.lower()}: this.${key.lower()}.toJson(),
                    % endif
                % else:
            ${key.lower()}: this.${key.lower()},
                % endif
            % endif
        % endfor
        };
    }
}
% endfor

// ----------------------------------------------
//        query define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xquery']:
        <% continue %>
    % endif
    <% class_n = module['operationId'] %>

export interface Query${typename2class(class_n)} {
    % for field in module['xquery']:
        % if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            <% continue %>
        % endif

    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }
    ${field['name'].lower()}: ${datatype_interface(field)};
    % endfor
}
% endfor

// ----------------------------------------------
//        header define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xheader']:
        <% continue %>
    % endif
    <% class_n = module['operationId'] %>

export interface Header${typename2class(class_n)} {
    % for field in module['xheader']:
        % if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            <% continue %>
        % endif

    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }
    ${field['name'].lower()}: ${datatype_interface(field)};
    % endfor
}
% endfor

// ----------------------------------------------
//        xpath define
// ----------------------------------------------

% for uri, method, module in paths_loop(src):
    % if not module['xpath']:
        <% continue %>
    % endif
    <% class_n = module['operationId'] %>

export interface Path${typename2class(class_n)} {
    % for field in module['xpath']:
        % if field['name'].find('[') >= 0 or field['name'].find('.') >= 0:
            <% continue %>
        % endif

    ${ '// ' + '    // '.join(map(lambda x: x + '\n', field.get('description', '').split('\n'))) if field.get('description', '') else ''  }
    ${field['name'].lower()}: ${datatype_interface(field)};
    % endfor
}
% endfor


// ----------------------------------------------
//        Api define
// ----------------------------------------------

export abstract class ${typename2class(project)}Api {
  public nginx_uri: string = "";
  abstract CheckError(rsp: any): void;

% for uri, method, module in paths_loop(src):
    <% class_n = module['operationId'] %>
    <% class_n = class_n.replace('«', '').replace('»', '') %>
    ## <% req_body_name = typename2class(table['fields']['req_body']['options']['type_name']) %>
    ## <% rsp_body_name = typename2class(table['fields']['rsp_body']['options']['type_name']) %>
    ## <% query_name = typename2class(table['fields']['querys']['options']['type_name']) %>
    ## <% header_name = typename2class(table['fields']['headers']['options']['type_name']) %>
    ## <% req_body_field = DATA_MAP.get(table['fields']['req_body']['options']['type_name'], None) %>
    ## <% query_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
    ## <% header_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
    <%
        parames = []
        parames_pp = []
        rsp = module['responses'].get('200', {})

        if module['xpath']:
            parames.append('body: {}'.format('Path' + class_n))
            parames_pp.append('data: datas.toJson()')

        if module['xquery']:
            parames.append('querys: {}'.format('Query' + class_n))
            parames_pp.append('params: querys.toJson()')

        if module['xheader']:
            parames.append('headers: {}'.format('Header' + class_n))
            parames_pp.append('headers: headers.toJson()')

        parames.append('config?: AxiosRequestConfig')
    %>

  public ${typename2class(class_n)}(${', '.join(parames)}): Promise<${datatype_interface(rsp)}> {
    if (!config) {
      config = {};
    }
    % if module['xpath']:
    config["data"] = { ...config["data"], ...datas };
    % endif
    % if module['xquery']:
    config["params"] = { ...config["params"], ...querys };
    % endif
    % if module['xheader']:
    config["headers"] = { ...config["headers"], ...headers };
    % endif

    return axios
      .${method}<${datatype_interface(rsp)}>(
          `${'${this.nginx_uri}'}${uri}`,
          config
      )
      .then(rsp => {
        this.CheckError(rsp);
        return rsp.data;
      });
  }

% endfor

}

declare const apis: ${typename2class(project)}Api;

export default apis;
