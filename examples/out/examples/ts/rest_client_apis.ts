
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


// EnumSexType
export enum EnumSexType {
    NONE = 0,  // unknow
    MALE = 1,  // male
    FEMALE = 2,  // female
}

// EnumSexType
export const FEMALETranslate = {
    0: 'unknow',
    1: 'male',
    2: 'female',
}


// 
export enum CreateUserReqIdCardEnumCardType {
    IDCARD = 0,  // 
}

// 
export const IDCardTranslate = {
    0: '',
}


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

    return true;
  }

  public check(key: string, val: any, ignore_array: boolean = false): FieldError | null {
    if (this.array) {
      if (!(val instanceof Array)) {
        return new FieldError(1, key, _(`${key} is not Array`));
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
      return new FieldError(2, key, _(`${key} Invaild`));
    } else if (this.type == "string" && !FieldOptions.check_string(this, val)) {
      return new FieldError(3, key, _(`${key} Invaild`));
    } else if (this.type == "number" && !FieldOptions.check_number(this, val)) {
      return new FieldError(4, key, _(`${key} Invaild`));
    } else if ((this.type == "datetime" || this.type == "date") && !FieldOptions.check_datetime(this, val)) {
      return new FieldError(5, key, _(`${key} Invaild`));;
    } else if (
      this.type == "boolean" &&
      !FieldOptions.check_boolean(this, val)
    ) {
      return new FieldError(5, key, _(`${key} Invaild`));
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
        return new FieldError(10, fkey, _(`${fkey} Invaild, Option not found`));
      }
      value = Object.getOwnPropertyDescriptor(this, fkey);
      if (!value) {
        return new FieldError(10, fkey, _(`${fkey} Invaild, Value not found`));
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
        throw new FieldError(10, fkey, _(`${fkey} Invaild, Option not found`));
      }
      value = Object.getOwnPropertyDescriptor(this, fkey);
      if (!value) {
        throw new FieldError(10, fkey, _(`${fkey} Invaild, Value not found`));
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


export interface INullReq {
}

export class NullReq extends DataModule {


    static readonly foptions: FieldOptionType = {
    };
    static readonly fkeys: string[] = [
        
    ];

    constructor(data?: INullReq) {
        super();
        if (!data){
            return;
        }

    }

    public getFieldKeys(): string[] {
        return NullReq.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return NullReq.foptions
    }

}

export interface IErrorInfo {
    error: number;  // error code
    error_text: string;  // error text
}

export class ErrorInfo extends DataModule {

    public error: number = 0;  // error code
    public error_text: string = "";  // error text

    static readonly foptions: FieldOptionType = {
        error: new FieldOptions('number',false,null,null,null,0.0,null),
        error_text: new FieldOptions('string',false,null,1,null,null,null),
    };
    static readonly fkeys: string[] = [
        'error',
        'error_text'
    ];

    constructor(data?: IErrorInfo) {
        super();
        if (!data){
            return;
        }

        this.error = data.error
        this.error_text = data.error_text
    }

    public getFieldKeys(): string[] {
        return ErrorInfo.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return ErrorInfo.foptions
    }

}

export interface INullRsp {
    error: ErrorInfo;  // 
}

export class NullRsp extends DataModule {

    public error: ErrorInfo = new ErrorInfo();  // 

    static readonly foptions: FieldOptionType = {
        error: new FieldOptions('message',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'error'
    ];

    constructor(data?: INullRsp) {
        super();
        if (!data){
            return;
        }

        this.error = data.error
    }

    public getFieldKeys(): string[] {
        return NullRsp.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return NullRsp.foptions
    }

}

export interface INullQuery {
}

export class NullQuery extends DataModule {


    static readonly foptions: FieldOptionType = {
    };
    static readonly fkeys: string[] = [
        
    ];

    constructor(data?: INullQuery) {
        super();
        if (!data){
            return;
        }

    }

    public getFieldKeys(): string[] {
        return NullQuery.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return NullQuery.foptions
    }

}

export interface INullHeader {
}

export class NullHeader extends DataModule {


    static readonly foptions: FieldOptionType = {
    };
    static readonly fkeys: string[] = [
        
    ];

    constructor(data?: INullHeader) {
        super();
        if (!data){
            return;
        }

    }

    public getFieldKeys(): string[] {
        return NullHeader.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return NullHeader.foptions
    }

}

export interface IDefaultQuery {
    where: string;  // sql where
    sort: string;  // sql sort
    csv: string;  // csv config
    show: string;  // show config
}

export class DefaultQuery extends DataModule {

    public where: string = "";  // sql where
    public sort: string = "";  // sql sort
    public csv: string = "";  // csv config
    public show: string = "";  // show config

    static readonly foptions: FieldOptionType = {
        where: new FieldOptions('string',false,1024,0,null,null,null),
        sort: new FieldOptions('string',false,1024,0,null,null,null),
        csv: new FieldOptions('string',false,1024,0,null,null,null),
        show: new FieldOptions('string',false,1024,0,null,null,null),
    };
    static readonly fkeys: string[] = [
        'where',
        'sort',
        'csv',
        'show'
    ];

    constructor(data?: IDefaultQuery) {
        super();
        if (!data){
            return;
        }

        this.where = data.where
        this.sort = data.sort
        this.csv = data.csv
        this.show = data.show
    }

    public getFieldKeys(): string[] {
        return DefaultQuery.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return DefaultQuery.foptions
    }

}

export interface IDefaultHeader {
    token: string;  // 
}

export class DefaultHeader extends DataModule {

    public token: string = "";  // 

    static readonly foptions: FieldOptionType = {
        token: new FieldOptions('string',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'token'
    ];

    constructor(data?: IDefaultHeader) {
        super();
        if (!data){
            return;
        }

        this.token = data.token
    }

    public getFieldKeys(): string[] {
        return DefaultHeader.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return DefaultHeader.foptions
    }

}

export interface IContact {
    phone: string;  // phone
    email: string;  // email
}

export class Contact extends DataModule {

    public phone: string = "";  // phone
    public email: string = "";  // email

    static readonly foptions: FieldOptionType = {
        phone: new FieldOptions('string',false,50,1,null,null,/^\+([0-9]{1,}) ([0-9]{6,})$/),
        email: new FieldOptions('string',false,200,1,null,null,/^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/),
    };
    static readonly fkeys: string[] = [
        'phone',
        'email'
    ];

    constructor(data?: IContact) {
        super();
        if (!data){
            return;
        }

        this.phone = data.phone
        this.email = data.email
    }

    public getFieldKeys(): string[] {
        return Contact.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return Contact.foptions
    }

}

export interface ICreateUserReqIdCard {
    cardno: string;  // 
    cardtype: CreateUserReqIdCardEnumCardType;  // 
}

export class CreateUserReqIdCard extends DataModule {

    public cardno: string = "";  // 
    public cardtype: CreateUserReqIdCardEnumCardType = CreateUserReqIdCardEnumCardType.IDCARD;  // 

    static readonly foptions: FieldOptionType = {
        cardno: new FieldOptions('string',false,50,1,null,null,null),
        cardtype: new FieldOptions('enum',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'cardno',
        'cardtype'
    ];

    constructor(data?: ICreateUserReqIdCard) {
        super();
        if (!data){
            return;
        }

        this.cardno = data.cardno
        this.cardtype = data.cardtype
    }

    public getFieldKeys(): string[] {
        return CreateUserReqIdCard.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return CreateUserReqIdCard.foptions
    }

}

export interface ICreateUserReq {
    username: string;  // 
    age: number;  // 
    sex: EnumSexType;  // 
    contact: Contact;  // 
    card: CreateUserReqIdCard;  // 
    birthday: moment.Moment;  // 
}

export class CreateUserReq extends DataModule {

    public username: string = "";  // 
    public age: number = 0;  // 
    public sex: EnumSexType = EnumSexType.NONE;  // 
    public contact: Contact = new Contact();  // 
    public card: CreateUserReqIdCard = new CreateUserReqIdCard();  // 
    public birthday: moment.Moment = MINDATE;  // 

    static readonly foptions: FieldOptionType = {
        username: new FieldOptions('string',false,50,1,null,null,null),
        age: new FieldOptions('number',false,null,null,200.0,1.0,null),
        sex: new FieldOptions('enum',false,null,null,null,null,null),
        contact: new FieldOptions('message',false,null,null,null,null,null),
        card: new FieldOptions('message',false,null,null,null,null,null),
        birthday: new FieldOptions('datetime',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'username',
        'age',
        'sex',
        'contact',
        'card',
        'birthday'
    ];

    constructor(data?: ICreateUserReq) {
        super();
        if (!data){
            return;
        }

        this.username = data.username
        this.age = data.age
        this.sex = data.sex
        this.contact = data.contact
        this.card = data.card
        this.birthday = data.birthday
    }

    public getFieldKeys(): string[] {
        return CreateUserReq.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return CreateUserReq.foptions
    }

}

export interface ICreateUserQuery {
    is_debug: boolean;  // 
    rnd: number;  // 
}

export class CreateUserQuery extends DataModule {

    public is_debug: boolean = false;  // 
    public rnd: number = 0;  // 

    static readonly foptions: FieldOptionType = {
        is_debug: new FieldOptions('boolean',false,null,null,null,null,null),
        rnd: new FieldOptions('number',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'is_debug',
        'rnd'
    ];

    constructor(data?: ICreateUserQuery) {
        super();
        if (!data){
            return;
        }

        this.is_debug = data.is_debug
        this.rnd = data.rnd
    }

    public getFieldKeys(): string[] {
        return CreateUserQuery.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return CreateUserQuery.foptions
    }

}
        
export interface IUsers {
    userid: number;  // 
    create_time: moment.Moment;  // 
    username: string;  // 
    age: number;  // 
    sex: EnumSexType;  // 
    contact: Contact;  // 
    card: CreateUserReqIdCard;  // 
    birthday: moment.Moment;  // 
}

export class Users extends DataModule {

    public userid: number = 0;  // 
    public create_time: moment.Moment = MINDATE;  // 
    public username: string = "";  // 
    public age: number = 0;  // 
    public sex: EnumSexType = EnumSexType.NONE;  // 
    public contact: Contact = new Contact();  // 
    public card: CreateUserReqIdCard = new CreateUserReqIdCard();  // 
    public birthday: moment.Moment = MINDATE;  // 

    static readonly foptions: FieldOptionType = {
        userid: new FieldOptions('number',false,null,null,null,1.0,null),
        create_time: new FieldOptions('datetime',false,null,null,null,1.0,null),
        username: new FieldOptions('string',false,50,1,null,null,null),
        age: new FieldOptions('number',false,null,null,200.0,1.0,null),
        sex: new FieldOptions('enum',false,null,null,null,null,null),
        contact: new FieldOptions('message',false,null,null,null,null,null),
        card: new FieldOptions('message',false,null,null,null,null,null),
        birthday: new FieldOptions('datetime',false,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'userid',
        'create_time',
        'username',
        'age',
        'sex',
        'contact',
        'card',
        'birthday'
    ];

    constructor(data?: IUsers) {
        super();
        if (!data){
            return;
        }

        this.userid = data.userid
        this.create_time = data.create_time
        this.username = data.username
        this.age = data.age
        this.sex = data.sex
        this.contact = data.contact
        this.card = data.card
        this.birthday = data.birthday
    }

    public getFieldKeys(): string[] {
        return Users.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return Users.foptions
    }

}

export interface IGetUsersRsp {
    error: ErrorInfo;  // 
    datas: Users[];  // 
}

export class GetUsersRsp extends DataModule {

    public error: ErrorInfo = new ErrorInfo();  // 
    public datas: Users[] = [];  // 

    static readonly foptions: FieldOptionType = {
        error: new FieldOptions('message',false,null,null,null,null,null),
        datas: new FieldOptions('message',true,null,null,null,null,null),
    };
    static readonly fkeys: string[] = [
        'error',
        'datas'
    ];

    constructor(data?: IGetUsersRsp) {
        super();
        if (!data){
            return;
        }

        this.error = data.error
        this.datas = data.datas
    }

    public getFieldKeys(): string[] {
        return GetUsersRsp.fkeys
    }

    public getFieldOptionType(): FieldOptionType {
        return GetUsersRsp.foptions
    }

}
        

// ----------------------------------------------
//        Api define
// ----------------------------------------------

export abstract class RestFulApis {
  public nginx_uri: string = "";
  abstract CheckError(rsp: any): void;

                                                                                            
    
    
    
    
    
    
    

  public CreateUserHttp(datas: CreateUserReq,querys: CreateUserQuery,headers: DefaultHeader): Promise<NullRsp> {
    return axios
      .post<NullRsp>(`${this.nginx_uri}/user/create`, {
        data: datas.toJson(),
        params: querys.toJson(),
        headers: headers.toJson()
      })
      .then(rsp => {
        this.CheckError(rsp);
        return rsp.data;
      });
  }

                    
    
    
    
    
    
    
    

  public GetUserHttp(querys: DefaultQuery,headers: NullHeader): Promise<GetUsersRsp> {
    return axios
      .get<GetUsersRsp>(`${this.nginx_uri}/user/users`, {
        params: querys.toJson(),
        headers: headers.toJson()
      })
      .then(rsp => {
        this.CheckError(rsp);
        return rsp.data;
      });
  }


}
