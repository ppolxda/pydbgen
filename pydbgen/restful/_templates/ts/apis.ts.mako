<%
    INT_TYPES = [
        'uint32', 'int32', 'uint64', 'int64', 'sint32',
        'sint64', 'fixed32', 'fixed64', 'sfixed32',
        'sfixed64'
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
                return 'string[] = []'
            else:
                return 'string = ""'

        elif val in DATETIME_TYPES:
            if repeated:
                return 'moment.Moment[] = []'
            else:
                return 'moment.Moment = MINDATE'

        elif val in NUMBER_TYPES:
            if repeated:
                return 'number[] = []'
            else:
                return 'number = 0'

        ## elif val in ['json', 'jsonb']:
        ##     return val

        elif val == 'message':
            field = DATA_MAP.get(data['options']['type_name'], None)
            cname = typename2class(data['options']['type_name'])
            if repeated:
                return  cname + '[] = []'
            else:
                return  cname + ' = new ' + cname + '()'

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
import axios from "axios";
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

const MINDATE = moment("1900-01-01", "YYYY-MM-DD");


// ----------------------------------------------
//        enum define
// ----------------------------------------------

% for key, val in ENUM_MAP.items():

// ${ val['comment'] }
export enum ${ typename2class(key) } {
    % for key, _val in val['fields'].items():
    ${ key.upper() } = ${ _val['value'] },  // ${_val['comment']}
    % endfor
}

// ${ val['comment'] }
export const ${ typename2class(key) }Translate = {
    % for key, _val in val['fields'].items():
    ${_val['value']}: '${_val['comment']}',
    % endfor
}

% endfor

// ----------------------------------------------
//        FieldChecker define
// ----------------------------------------------

class FieldOptions {
  public type: string = "";
  public array: boolean = false;
  public maxlen: number | null = null;
  public minlen: number | null = null;
  public maxval: number | null = null;
  public minval: number | null = null;
  // TODO - regex compatible
  public regex: RegExp | null = null;

  constructor(
    type: string,
    array: boolean,
    maxlen: number | null = null,
    minlen: number | null = null,
    maxval: number | null = null,
    minval: number | null = null,
    regex: RegExp | null = null
  ) {
    this.type = type;
    this.array = array;
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

    } else if (this.type == "enum" && !FieldOptions.check_enum(this, val)) {
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
      return new FieldError(5, key, _(`${"${key}"} Invaild`));
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

% for class_n, table in DATA_LIST:
    % if table['options'].get('rmsg', None) == "MAPI":
        <% continue %>
    % endif

export interface I${typename2class(class_n)} {
    % for key, field in table['fields'].items():
    ${key.lower()}: ${datatype_interface(field)};  // ${field['comment']}
    % endfor
}

export class ${typename2class(class_n)} extends DataModule {

    % for key, field in table['fields'].items():
    public ${key.lower()}: ${datatype_change(field)};  // ${field['comment']}
    % endfor

    static readonly foptions: FieldOptionType = {
        % for key, val in loop_opts(table['fields']):
        ${key.lower()}: new FieldOptions(${ val }),
        % endfor
    };
    static readonly fkeys: string[] = [
        ${',\n        '.join(["'{}'".format(field_name.lower()) for field_name, field in table['fields'].items()])}
    ];

    constructor(data?: I${typename2class(class_n)}) {
        super();
        if (!data){
            return;
        }

        % for key, field in table['fields'].items():
        this.${key.lower()} = data.${key.lower()}
        % endfor
    }

    public getFieldKeys(): string[] {
        return ${typename2class(class_n)}.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return ${typename2class(class_n)}.foptions
    }

    ## public toJson(): FieldData {
    ##     return {
    ##     % for key, field in table['fields'].items():
    ##         % if field['options']['label'] == 'repeated':
    ##             % if field['type'] == 'message':
    ##     ${key.lower()}: this.arrayToJson(this.${key.lower()}),
    ##             % elif field['type'] == 'date':
    ##     ${key.lower()}: this.arrayToDate(this.${key.lower()}),
    ##             % elif field['type'] == 'datetime':
    ##     ${key.lower()}: this.arrayToDatetime(this.${key.lower()}),
    ##             % else:
    ##     ${key.lower()}: this.${key.lower()},
    ##             % endif
    ##         % else:
    ##             % if field['type'] == 'message':
    ##     ${key.lower()}: this.${key.lower()}.toJson(),
    ##             % elif field['type'] == 'date':
    ##     ${key.lower()}: this.dateFmt(this.${key.lower()}),
    ##             % elif field['type'] == 'datetime':
    ##     ${key.lower()}: this.datetimeFmt(this.${key.lower()}),
    ##             % else:
    ##     ${key.lower()}: this.${key.lower()},
    ##             % endif
    ##         % endif
    ##     % endfor
    ##     };
    ## }
}
% endfor


// ----------------------------------------------
//        Api define
// ----------------------------------------------

export abstract class ${typename2class(API_NAME)} {
  public nginx_uri: string = "";
  abstract CheckError(rsp: any): void;

% for class_n, table in DATA_LIST:
    % if table['options'].get('rmsg', None) != "MAPI":
        <% continue %>
    % endif
    <% req_body_name = typename2class(table['fields']['req_body']['options']['type_name']) %>
    <% rsp_body_name = typename2class(table['fields']['rsp_body']['options']['type_name']) %>
    <% query_name = typename2class(table['fields']['querys']['options']['type_name']) %>
    <% header_name = typename2class(table['fields']['headers']['options']['type_name']) %>
    <% req_body_field = DATA_MAP.get(table['fields']['req_body']['options']['type_name'], None) %>
    <% query_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
    <% header_field = DATA_MAP.get(table['fields']['querys']['options']['type_name'], None) %>
    <%
        parames = []
        parames_pp = []

        if req_body_field['fields']:
            parames.append('datas: {}'.format(req_body_name))
            parames_pp.append('data: datas.toJson()')

        if query_field['fields']:
            parames.append('querys: {}'.format(query_name))
            parames_pp.append('params: querys.toJson()')

        if header_field['fields']:
            parames.append('headers: {}'.format(header_name))
            parames_pp.append('headers: headers.toJson()')
    %>

  public ${typename2class(table['name'])}(${','.join(parames)}): Promise<${rsp_body_name}> {
    return axios
      .${get_method(table['options']['rmethod'])}<${rsp_body_name}>(`${'${this.nginx_uri}'}${table['options']['ruri']}`, {
        ${',\n        '.join(parames_pp)}
      })
      .then(rsp => {
        this.CheckError(rsp);
        return rsp.data;
      });
  }

% endfor

}
