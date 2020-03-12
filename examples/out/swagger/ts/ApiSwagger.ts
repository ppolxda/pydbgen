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

export class NullObject {}

const MINDATE = moment("1900-01-01", "YYYY-MM-DD");

// ----------------------------------------------
//        enum define
// ----------------------------------------------

// EnumDataScope
// * NONE: 无效枚举值
// * ALL: 全部
// * SELF_DEPT: 本部门
// * SELF_AND_CHILDREN: 本部门及以下
// * SELF_REGION: 本区域
// * SELF_REGION_AND_CHILDREN: 本区域及以下
// * SELF_COMPANY: 本公司
// * SELF_COMPANY_AND_CHILDREN: 本公司及以下
// * CUSTOM: 自定义
export enum EnumDataScope {
    NONE = 0,
    ALL = 1,
    SELF_DEPT = 2,
    SELF_AND_CHILDREN = 3,
    SELF_REGION = 4,
    SELF_REGION_AND_CHILDREN = 5,
    SELF_COMPANY = 6,
    SELF_COMPANY_AND_CHILDREN = 7,
    CUSTOM = 8
}

// EnumDataScope
// * NONE: 无效枚举值
// * ALL: 全部
// * SELF_DEPT: 本部门
// * SELF_AND_CHILDREN: 本部门及以下
// * SELF_REGION: 本区域
// * SELF_REGION_AND_CHILDREN: 本区域及以下
// * SELF_COMPANY: 本公司
// * SELF_COMPANY_AND_CHILDREN: 本公司及以下
// * CUSTOM: 自定义
export const EnumDataScopeTranslate = {
    NONE: "无效枚举值",
    ALL: "全部",
    SELF_DEPT: "本部门",
    SELF_AND_CHILDREN: "本部门及以下",
    SELF_REGION: "本区域",
    SELF_REGION_AND_CHILDREN: "本区域及以下",
    SELF_COMPANY: "本公司",
    SELF_COMPANY_AND_CHILDREN: "本公司及以下",
    CUSTOM: "自定义"
};

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

        return true;
    }

    public check(
        key: string,
        val: any,
        ignore_array: boolean = false
    ): FieldError | null {
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
        }

        if (!this.required && val == null) {
            return new FieldError(7, key, _(`${key} Invaild`));
        }

        if (this.type == "enum" && !FieldOptions.check_enum(this, val)) {
            return new FieldError(2, key, _(`${key} Invaild`));
        } else if (
            this.type == "string" &&
            !FieldOptions.check_string(this, val)
        ) {
            return new FieldError(3, key, _(`${key} Invaild`));
        } else if (
            this.type == "number" &&
            !FieldOptions.check_number(this, val)
        ) {
            return new FieldError(4, key, _(`${key} Invaild`));
        } else if (
            (this.type == "datetime" || this.type == "date") &&
            !FieldOptions.check_datetime(this, val)
        ) {
            return new FieldError(5, key, _(`${key} Invaild`));
        } else if (
            this.type == "boolean" &&
            !FieldOptions.check_boolean(this, val)
        ) {
            return new FieldError(6, key, _(`${key} Invaild`));
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
                return new FieldError(
                    10,
                    fkey,
                    _(`${fkey} Invaild, Option not found`)
                );
            }
            value = Object.getOwnPropertyDescriptor(this, fkey);
            if (!value) {
                return new FieldError(
                    10,
                    fkey,
                    _(`${fkey} Invaild, Value not found`)
                );
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
                throw new FieldError(
                    10,
                    fkey,
                    _(`${fkey} Invaild, Option not found`)
                );
            }
            value = Object.getOwnPropertyDescriptor(this, fkey);
            if (!value) {
                throw new FieldError(
                    10,
                    fkey,
                    _(`${fkey} Invaild, Value not found`)
                );
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

export interface IAlipayConfig {
    appid: string;

    charset: string;

    format: string;

    gatewayurl: string;

    id: number;

    notifyurl: string;

    privatekey: string;

    publickey: string;

    returnurl: string;

    signtype: string;

    sysserviceproviderid: string;
}

export class AlipayConfig extends DataModule {
    public appid: string;

    public charset: string;

    public format: string;

    public gatewayurl: string;

    public id: number;

    public notifyurl: string;

    public privatekey: string;

    public publickey: string;

    public returnurl: string;

    public signtype: string;

    public sysserviceproviderid: string;

    static readonly foptions: FieldOptionType = {
        appid: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        charset: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        format: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        gatewayurl: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        notifyurl: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        privatekey: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        publickey: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        returnurl: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        signtype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        sysserviceproviderid: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        )
    };
    static readonly fkeys: string[] = [
        "appid",
        "charset",
        "format",
        "gatewayurl",
        "id",
        "notifyurl",
        "privatekey",
        "publickey",
        "returnurl",
        "signtype",
        "sysserviceproviderid"
    ];

    constructor(data?: IAlipayConfig) {
        super();
        if (!data) {
            return;
        }

        this.appid = data.appid;
        this.charset = data.charset;
        this.format = data.format;
        this.gatewayurl = data.gatewayurl;
        this.id = data.id;
        this.notifyurl = data.notifyurl;
        this.privatekey = data.privatekey;
        this.publickey = data.publickey;
        this.returnurl = data.returnurl;
        this.signtype = data.signtype;
        this.sysserviceproviderid = data.sysserviceproviderid;
    }

    public getFieldKeys(): string[] {
        return AlipayConfig.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return AlipayConfig.foptions;
    }

    public toJson(): FieldData {
        return {
            appid: this.appid,

            charset: this.charset,

            format: this.format,

            gatewayurl: this.gatewayurl,

            id: this.id,

            notifyurl: this.notifyurl,

            privatekey: this.privatekey,

            publickey: this.publickey,

            returnurl: this.returnurl,

            signtype: this.signtype,

            sysserviceproviderid: this.sysserviceproviderid
        };
    }
}

export interface IApp {
    backuppath: string;

    createtime: moment.Moment;

    deploypath: string;

    deployscript: string;

    id: number;

    name: string;

    port: number;

    startscript: string;

    uploadpath: string;
}

export class App extends DataModule {
    public backuppath: string;

    public createtime: moment.Moment;

    public deploypath: string;

    public deployscript: string;

    public id: number;

    public name: string;

    public port: number;

    public startscript: string;

    public uploadpath: string;

    static readonly foptions: FieldOptionType = {
        backuppath: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deploypath: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        deployscript: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        port: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        startscript: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        uploadpath: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "backuppath",
        "createtime",
        "deploypath",
        "deployscript",
        "id",
        "name",
        "port",
        "startscript",
        "uploadpath"
    ];

    constructor(data?: IApp) {
        super();
        if (!data) {
            return;
        }

        this.backuppath = data.backuppath;
        this.createtime = data.createtime;
        this.deploypath = data.deploypath;
        this.deployscript = data.deployscript;
        this.id = data.id;
        this.name = data.name;
        this.port = data.port;
        this.startscript = data.startscript;
        this.uploadpath = data.uploadpath;
    }

    public getFieldKeys(): string[] {
        return App.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return App.foptions;
    }

    public toJson(): FieldData {
        return {
            backuppath: this.backuppath,

            createtime: this.datetimeFmt(this.createtime),

            deploypath: this.deploypath,

            deployscript: this.deployscript,

            id: this.id,

            name: this.name,

            port: this.port,

            startscript: this.startscript,

            uploadpath: this.uploadpath
        };
    }
}

export interface IArea {
    citylevel: string;

    cname: string;

    code: string;

    enable: boolean;

    enname: string;

    fullname: string;

    id: number;

    level: number;

    pid: number;

    pinyin: string;

    postcode: string;

    provinceshort: string;

    py: string;

    remarks: string;

    space: number;

    tb: number;

    tp: number;

    zoneno: string;
}

export class Area extends DataModule {
    public citylevel: string;

    public cname: string;

    public code: string;

    public enable: boolean;

    public enname: string;

    public fullname: string;

    public id: number;

    public level: number;

    public pid: number;

    public pinyin: string;

    public postcode: string;

    public provinceshort: string;

    public py: string;

    public remarks: string;

    public space: number;

    public tb: number;

    public tp: number;

    public zoneno: string;

    static readonly foptions: FieldOptionType = {
        citylevel: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        cname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        code: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        enable: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        enname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        fullname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        level: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        pid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        pinyin: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        postcode: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        provinceshort: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        py: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remarks: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        space: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        tb: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        tp: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        zoneno: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "citylevel",
        "cname",
        "code",
        "enable",
        "enname",
        "fullname",
        "id",
        "level",
        "pid",
        "pinyin",
        "postcode",
        "provinceshort",
        "py",
        "remarks",
        "space",
        "tb",
        "tp",
        "zoneno"
    ];

    constructor(data?: IArea) {
        super();
        if (!data) {
            return;
        }

        this.citylevel = data.citylevel;
        this.cname = data.cname;
        this.code = data.code;
        this.enable = data.enable;
        this.enname = data.enname;
        this.fullname = data.fullname;
        this.id = data.id;
        this.level = data.level;
        this.pid = data.pid;
        this.pinyin = data.pinyin;
        this.postcode = data.postcode;
        this.provinceshort = data.provinceshort;
        this.py = data.py;
        this.remarks = data.remarks;
        this.space = data.space;
        this.tb = data.tb;
        this.tp = data.tp;
        this.zoneno = data.zoneno;
    }

    public getFieldKeys(): string[] {
        return Area.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Area.foptions;
    }

    public toJson(): FieldData {
        return {
            citylevel: this.citylevel,

            cname: this.cname,

            code: this.code,

            enable: this.enable,

            enname: this.enname,

            fullname: this.fullname,

            id: this.id,

            level: this.level,

            pid: this.pid,

            pinyin: this.pinyin,

            postcode: this.postcode,

            provinceshort: this.provinceshort,

            py: this.py,

            remarks: this.remarks,

            space: this.space,

            tb: this.tb,

            tp: this.tp,

            zoneno: this.zoneno
        };
    }
}

export interface IAuthUserDto {
    code: string;

    password: string;

    username: string;

    uuid: string;
}

export class AuthUserDto extends DataModule {
    public code: string;

    public password: string;

    public username: string;

    public uuid: string;

    static readonly foptions: FieldOptionType = {
        code: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        password: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        username: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        uuid: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["code", "password", "username", "uuid"];

    constructor(data?: IAuthUserDto) {
        super();
        if (!data) {
            return;
        }

        this.code = data.code;
        this.password = data.password;
        this.username = data.username;
        this.uuid = data.uuid;
    }

    public getFieldKeys(): string[] {
        return AuthUserDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return AuthUserDto.foptions;
    }

    public toJson(): FieldData {
        return {
            code: this.code,

            password: this.password,

            username: this.username,

            uuid: this.uuid
        };
    }
}

export interface IColumnInfo {
    columnname: string;

    columntype: string;

    dateannotation: string;

    dictname: string;

    extra: string;

    formshow: boolean;

    formtype: string;

    id: number;

    keytype: string;

    listshow: boolean;

    notnull: boolean;

    querytype: string;

    remark: string;

    tablename: string;
}

export class ColumnInfo extends DataModule {
    public columnname: string;

    public columntype: string;

    public dateannotation: string;

    public dictname: string;

    public extra: string;

    public formshow: boolean;

    public formtype: string;

    public id: number;

    public keytype: string;

    public listshow: boolean;

    public notnull: boolean;

    public querytype: string;

    public remark: string;

    public tablename: string;

    static readonly foptions: FieldOptionType = {
        columnname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        columntype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        dateannotation: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        dictname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        extra: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        formshow: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        formtype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        keytype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        listshow: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        notnull: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        querytype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        tablename: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "columnname",
        "columntype",
        "dateannotation",
        "dictname",
        "extra",
        "formshow",
        "formtype",
        "id",
        "keytype",
        "listshow",
        "notnull",
        "querytype",
        "remark",
        "tablename"
    ];

    constructor(data?: IColumnInfo) {
        super();
        if (!data) {
            return;
        }

        this.columnname = data.columnname;
        this.columntype = data.columntype;
        this.dateannotation = data.dateannotation;
        this.dictname = data.dictname;
        this.extra = data.extra;
        this.formshow = data.formshow;
        this.formtype = data.formtype;
        this.id = data.id;
        this.keytype = data.keytype;
        this.listshow = data.listshow;
        this.notnull = data.notnull;
        this.querytype = data.querytype;
        this.remark = data.remark;
        this.tablename = data.tablename;
    }

    public getFieldKeys(): string[] {
        return ColumnInfo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return ColumnInfo.foptions;
    }

    public toJson(): FieldData {
        return {
            columnname: this.columnname,

            columntype: this.columntype,

            dateannotation: this.dateannotation,

            dictname: this.dictname,

            extra: this.extra,

            formshow: this.formshow,

            formtype: this.formtype,

            id: this.id,

            keytype: this.keytype,

            listshow: this.listshow,

            notnull: this.notnull,

            querytype: this.querytype,

            remark: this.remark,

            tablename: this.tablename
        };
    }
}

export interface IDatabase {
    createtime: moment.Moment;

    id: string;

    jdbcurl: string;

    name: string;

    pwd: string;

    username: string;
}

export class Database extends DataModule {
    public createtime: moment.Moment;

    public id: string;

    public jdbcurl: string;

    public name: string;

    public pwd: string;

    public username: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        jdbcurl: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pwd: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        username: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "id",
        "jdbcurl",
        "name",
        "pwd",
        "username"
    ];

    constructor(data?: IDatabase) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.id = data.id;
        this.jdbcurl = data.jdbcurl;
        this.name = data.name;
        this.pwd = data.pwd;
        this.username = data.username;
    }

    public getFieldKeys(): string[] {
        return Database.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Database.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            id: this.id,

            jdbcurl: this.jdbcurl,

            name: this.name,

            pwd: this.pwd,

            username: this.username
        };
    }
}

export interface IDeploy {
    app: App;

    createtime: moment.Moment;

    deploys: ServerDeploy[];

    id: number;
}

export class Deploy extends DataModule {
    public app: App;

    public createtime: moment.Moment;

    public deploys: ServerDeploy[];

    public id: number;

    static readonly foptions: FieldOptionType = {
        app: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deploys: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["app", "createtime", "deploys", "id"];

    constructor(data?: IDeploy) {
        super();
        if (!data) {
            return;
        }

        this.app = data.app;
        this.createtime = data.createtime;
        this.deploys = data.deploys;
        this.id = data.id;
    }

    public getFieldKeys(): string[] {
        return Deploy.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Deploy.foptions;
    }

    public toJson(): FieldData {
        return {
            app: this.app.toJson(),

            createtime: this.datetimeFmt(this.createtime),

            deploys: this.deploys,

            id: this.id
        };
    }
}

export interface IDeployHistory {
    appname: string;

    deploydate: moment.Moment;

    deployid: number;

    deployuser: string;

    id: string;

    ip: string;
}

export class DeployHistory extends DataModule {
    public appname: string;

    public deploydate: moment.Moment;

    public deployid: number;

    public deployuser: string;

    public id: string;

    public ip: string;

    static readonly foptions: FieldOptionType = {
        appname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        deploydate: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deployid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        deployuser: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        ip: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "appname",
        "deploydate",
        "deployid",
        "deployuser",
        "id",
        "ip"
    ];

    constructor(data?: IDeployHistory) {
        super();
        if (!data) {
            return;
        }

        this.appname = data.appname;
        this.deploydate = data.deploydate;
        this.deployid = data.deployid;
        this.deployuser = data.deployuser;
        this.id = data.id;
        this.ip = data.ip;
    }

    public getFieldKeys(): string[] {
        return DeployHistory.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DeployHistory.foptions;
    }

    public toJson(): FieldData {
        return {
            appname: this.appname,

            deploydate: this.datetimeFmt(this.deploydate),

            deployid: this.deployid,

            deployuser: this.deployuser,

            id: this.id,

            ip: this.ip
        };
    }
}

export interface IDept {
    createtime: moment.Moment;

    createdby: string;

    deptinfo: DeptInfo;

    enabled: boolean;

    id: number;

    isdelete: boolean;

    name: string;

    pid: number;

    props: number;

    updatetime: moment.Moment;

    updatedby: string;
}

export class Dept extends DataModule {
    public createtime: moment.Moment;

    public createdby: string;

    public deptinfo: DeptInfo;

    public enabled: boolean;

    public id: number;

    public isdelete: boolean;

    public name: string;

    public pid: number;

    public props: number;

    public updatetime: moment.Moment;

    public updatedby: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createdby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        deptinfo: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        enabled: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        isdelete: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        props: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        updatetime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        updatedby: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "createdby",
        "deptinfo",
        "enabled",
        "id",
        "isdelete",
        "name",
        "pid",
        "props",
        "updatetime",
        "updatedby"
    ];

    constructor(data?: IDept) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.createdby = data.createdby;
        this.deptinfo = data.deptinfo;
        this.enabled = data.enabled;
        this.id = data.id;
        this.isdelete = data.isdelete;
        this.name = data.name;
        this.pid = data.pid;
        this.props = data.props;
        this.updatetime = data.updatetime;
        this.updatedby = data.updatedby;
    }

    public getFieldKeys(): string[] {
        return Dept.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Dept.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            createdby: this.createdby,

            deptinfo: this.deptinfo.toJson(),

            enabled: this.enabled,

            id: this.id,

            isdelete: this.isdelete,

            name: this.name,

            pid: this.pid,

            props: this.props,

            updatetime: this.datetimeFmt(this.updatetime),

            updatedby: this.updatedby
        };
    }
}

export interface IDeptDto {
    children: DeptDto[];

    createtime: moment.Moment;

    deptinfo: DeptInfoDto;

    enabled: boolean;

    id: number;

    label: string;

    name: string;

    pid: number;

    props: number;
}

export class DeptDto extends DataModule {
    public children: DeptDto[];

    public createtime: moment.Moment;

    public deptinfo: DeptInfoDto;

    public enabled: boolean;

    public id: number;

    public label: string;

    public name: string;

    public pid: number;

    public props: number;

    static readonly foptions: FieldOptionType = {
        children: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deptinfo: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        enabled: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        label: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        props: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "children",
        "createtime",
        "deptinfo",
        "enabled",
        "id",
        "label",
        "name",
        "pid",
        "props"
    ];

    constructor(data?: IDeptDto) {
        super();
        if (!data) {
            return;
        }

        this.children = data.children;
        this.createtime = data.createtime;
        this.deptinfo = data.deptinfo;
        this.enabled = data.enabled;
        this.id = data.id;
        this.label = data.label;
        this.name = data.name;
        this.pid = data.pid;
        this.props = data.props;
    }

    public getFieldKeys(): string[] {
        return DeptDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DeptDto.foptions;
    }

    public toJson(): FieldData {
        return {
            children: this.children,

            createtime: this.datetimeFmt(this.createtime),

            deptinfo: this.deptinfo.toJson(),

            enabled: this.enabled,

            id: this.id,

            label: this.label,

            name: this.name,

            pid: this.pid,

            props: this.props
        };
    }
}

export interface IDeptInfo {
    areaid: number;

    businessregno: string;

    createtime: moment.Moment;

    createdby: string;

    email: string;

    enname: string;

    fax: string;

    govno: string;

    id: number;

    invoicebank: string;

    invoicebankno: string;

    invoicetitle: string;

    isdelete: boolean;

    mark: string;

    mobile: string;

    phone: string;

    pinyin: string;

    py: string;

    regaddr: string;

    shortname: string;

    updatetime: moment.Moment;

    updatedby: string;

    usccode: string;
}

export class DeptInfo extends DataModule {
    public areaid: number;

    public businessregno: string;

    public createtime: moment.Moment;

    public createdby: string;

    public email: string;

    public enname: string;

    public fax: string;

    public govno: string;

    public id: number;

    public invoicebank: string;

    public invoicebankno: string;

    public invoicetitle: string;

    public isdelete: boolean;

    public mark: string;

    public mobile: string;

    public phone: string;

    public pinyin: string;

    public py: string;

    public regaddr: string;

    public shortname: string;

    public updatetime: moment.Moment;

    public updatedby: string;

    public usccode: string;

    static readonly foptions: FieldOptionType = {
        areaid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        businessregno: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createdby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        email: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        enname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        fax: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        govno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        invoicebank: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        invoicebankno: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        invoicetitle: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        isdelete: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        mark: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        mobile: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        phone: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pinyin: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        py: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        regaddr: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        shortname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        updatetime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        updatedby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        usccode: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "areaid",
        "businessregno",
        "createtime",
        "createdby",
        "email",
        "enname",
        "fax",
        "govno",
        "id",
        "invoicebank",
        "invoicebankno",
        "invoicetitle",
        "isdelete",
        "mark",
        "mobile",
        "phone",
        "pinyin",
        "py",
        "regaddr",
        "shortname",
        "updatetime",
        "updatedby",
        "usccode"
    ];

    constructor(data?: IDeptInfo) {
        super();
        if (!data) {
            return;
        }

        this.areaid = data.areaid;
        this.businessregno = data.businessregno;
        this.createtime = data.createtime;
        this.createdby = data.createdby;
        this.email = data.email;
        this.enname = data.enname;
        this.fax = data.fax;
        this.govno = data.govno;
        this.id = data.id;
        this.invoicebank = data.invoicebank;
        this.invoicebankno = data.invoicebankno;
        this.invoicetitle = data.invoicetitle;
        this.isdelete = data.isdelete;
        this.mark = data.mark;
        this.mobile = data.mobile;
        this.phone = data.phone;
        this.pinyin = data.pinyin;
        this.py = data.py;
        this.regaddr = data.regaddr;
        this.shortname = data.shortname;
        this.updatetime = data.updatetime;
        this.updatedby = data.updatedby;
        this.usccode = data.usccode;
    }

    public getFieldKeys(): string[] {
        return DeptInfo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DeptInfo.foptions;
    }

    public toJson(): FieldData {
        return {
            areaid: this.areaid,

            businessregno: this.businessregno,

            createtime: this.datetimeFmt(this.createtime),

            createdby: this.createdby,

            email: this.email,

            enname: this.enname,

            fax: this.fax,

            govno: this.govno,

            id: this.id,

            invoicebank: this.invoicebank,

            invoicebankno: this.invoicebankno,

            invoicetitle: this.invoicetitle,

            isdelete: this.isdelete,

            mark: this.mark,

            mobile: this.mobile,

            phone: this.phone,

            pinyin: this.pinyin,

            py: this.py,

            regaddr: this.regaddr,

            shortname: this.shortname,

            updatetime: this.datetimeFmt(this.updatetime),

            updatedby: this.updatedby,

            usccode: this.usccode
        };
    }
}

export interface IDeptInfoDto {
    areaid: number;

    businessregno: string;

    deptid: number;

    email: string;

    enname: string;

    fax: string;

    govno: string;

    id: number;

    invoicebank: string;

    invoicebankno: string;

    invoicetitle: string;

    mark: string;

    mobile: string;

    phone: string;

    pinyin: string;

    py: string;

    regaddr: string;

    shortname: string;

    usccode: string;
}

export class DeptInfoDto extends DataModule {
    public areaid: number;

    public businessregno: string;

    public deptid: number;

    public email: string;

    public enname: string;

    public fax: string;

    public govno: string;

    public id: number;

    public invoicebank: string;

    public invoicebankno: string;

    public invoicetitle: string;

    public mark: string;

    public mobile: string;

    public phone: string;

    public pinyin: string;

    public py: string;

    public regaddr: string;

    public shortname: string;

    public usccode: string;

    static readonly foptions: FieldOptionType = {
        areaid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        businessregno: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deptid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        email: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        enname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        fax: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        govno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        invoicebank: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        invoicebankno: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        invoicetitle: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        mark: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        mobile: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        phone: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pinyin: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        py: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        regaddr: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        shortname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        usccode: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "areaid",
        "businessregno",
        "deptid",
        "email",
        "enname",
        "fax",
        "govno",
        "id",
        "invoicebank",
        "invoicebankno",
        "invoicetitle",
        "mark",
        "mobile",
        "phone",
        "pinyin",
        "py",
        "regaddr",
        "shortname",
        "usccode"
    ];

    constructor(data?: IDeptInfoDto) {
        super();
        if (!data) {
            return;
        }

        this.areaid = data.areaid;
        this.businessregno = data.businessregno;
        this.deptid = data.deptid;
        this.email = data.email;
        this.enname = data.enname;
        this.fax = data.fax;
        this.govno = data.govno;
        this.id = data.id;
        this.invoicebank = data.invoicebank;
        this.invoicebankno = data.invoicebankno;
        this.invoicetitle = data.invoicetitle;
        this.mark = data.mark;
        this.mobile = data.mobile;
        this.phone = data.phone;
        this.pinyin = data.pinyin;
        this.py = data.py;
        this.regaddr = data.regaddr;
        this.shortname = data.shortname;
        this.usccode = data.usccode;
    }

    public getFieldKeys(): string[] {
        return DeptInfoDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DeptInfoDto.foptions;
    }

    public toJson(): FieldData {
        return {
            areaid: this.areaid,

            businessregno: this.businessregno,

            deptid: this.deptid,

            email: this.email,

            enname: this.enname,

            fax: this.fax,

            govno: this.govno,

            id: this.id,

            invoicebank: this.invoicebank,

            invoicebankno: this.invoicebankno,

            invoicetitle: this.invoicetitle,

            mark: this.mark,

            mobile: this.mobile,

            phone: this.phone,

            pinyin: this.pinyin,

            py: this.py,

            regaddr: this.regaddr,

            shortname: this.shortname,

            usccode: this.usccode
        };
    }
}

export interface IDeptSmallDto {
    id: number;

    name: string;
}

export class DeptSmallDto extends DataModule {
    public id: number;

    public name: string;

    static readonly foptions: FieldOptionType = {
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["id", "name"];

    constructor(data?: IDeptSmallDto) {
        super();
        if (!data) {
            return;
        }

        this.id = data.id;
        this.name = data.name;
    }

    public getFieldKeys(): string[] {
        return DeptSmallDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DeptSmallDto.foptions;
    }

    public toJson(): FieldData {
        return {
            id: this.id,

            name: this.name
        };
    }
}

export interface IDict {
    createtime: moment.Moment;

    dictdetails: DictDetail[];

    id: number;

    name: string;

    remark: string;
}

export class Dict extends DataModule {
    public createtime: moment.Moment;

    public dictdetails: DictDetail[];

    public id: number;

    public name: string;

    public remark: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        dictdetails: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "dictdetails",
        "id",
        "name",
        "remark"
    ];

    constructor(data?: IDict) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.dictdetails = data.dictdetails;
        this.id = data.id;
        this.name = data.name;
        this.remark = data.remark;
    }

    public getFieldKeys(): string[] {
        return Dict.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Dict.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            dictdetails: this.dictdetails,

            id: this.id,

            name: this.name,

            remark: this.remark
        };
    }
}

export interface IDictDetail {
    createtime: moment.Moment;

    dict: Dict;

    id: number;

    label: string;

    sort: number;

    value: string;
}

export class DictDetail extends DataModule {
    public createtime: moment.Moment;

    public dict: Dict;

    public id: number;

    public label: string;

    public sort: number;

    public value: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        dict: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        label: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        value: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "dict",
        "id",
        "label",
        "sort",
        "value"
    ];

    constructor(data?: IDictDetail) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.dict = data.dict;
        this.id = data.id;
        this.label = data.label;
        this.sort = data.sort;
        this.value = data.value;
    }

    public getFieldKeys(): string[] {
        return DictDetail.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return DictDetail.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            dict: this.dict.toJson(),

            id: this.id,

            label: this.label,

            sort: this.sort,

            value: this.value
        };
    }
}

export interface IEmailConfig {
    fromuser: string;

    host: string;

    id: number;

    pass: string;

    port: string;

    user: string;
}

export class EmailConfig extends DataModule {
    public fromuser: string;

    public host: string;

    public id: number;

    public pass: string;

    public port: string;

    public user: string;

    static readonly foptions: FieldOptionType = {
        fromuser: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        host: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        pass: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        port: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        user: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "fromuser",
        "host",
        "id",
        "pass",
        "port",
        "user"
    ];

    constructor(data?: IEmailConfig) {
        super();
        if (!data) {
            return;
        }

        this.fromuser = data.fromuser;
        this.host = data.host;
        this.id = data.id;
        this.pass = data.pass;
        this.port = data.port;
        this.user = data.user;
    }

    public getFieldKeys(): string[] {
        return EmailConfig.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return EmailConfig.foptions;
    }

    public toJson(): FieldData {
        return {
            fromuser: this.fromuser,

            host: this.host,

            id: this.id,

            pass: this.pass,

            port: this.port,

            user: this.user
        };
    }
}

export interface IEmailVo {
    content: string;

    subject: string;

    tos: string[];
}

export class EmailVo extends DataModule {
    public content: string;

    public subject: string;

    public tos: string[];

    static readonly foptions: FieldOptionType = {
        content: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        subject: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        tos: new FieldOptions("string", true, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["content", "subject", "tos"];

    constructor(data?: IEmailVo) {
        super();
        if (!data) {
            return;
        }

        this.content = data.content;
        this.subject = data.subject;
        this.tos = data.tos;
    }

    public getFieldKeys(): string[] {
        return EmailVo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return EmailVo.foptions;
    }

    public toJson(): FieldData {
        return {
            content: this.content,

            subject: this.subject,

            tos: this.tos
        };
    }
}

export interface IGenConfig {
    apialias: string;

    apipath: string;

    author: string;

    cover: boolean;

    id: number;

    modulename: string;

    pack: string;

    path: string;

    prefix: string;

    tablename: string;
}

export class GenConfig extends DataModule {
    public apialias: string;

    public apipath: string;

    public author: string;

    public cover: boolean;

    public id: number;

    public modulename: string;

    public pack: string;

    public path: string;

    public prefix: string;

    public tablename: string;

    static readonly foptions: FieldOptionType = {
        apialias: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        apipath: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        author: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        cover: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        modulename: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pack: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        path: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        prefix: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        tablename: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "apialias",
        "apipath",
        "author",
        "cover",
        "id",
        "modulename",
        "pack",
        "path",
        "prefix",
        "tablename"
    ];

    constructor(data?: IGenConfig) {
        super();
        if (!data) {
            return;
        }

        this.apialias = data.apialias;
        this.apipath = data.apipath;
        this.author = data.author;
        this.cover = data.cover;
        this.id = data.id;
        this.modulename = data.modulename;
        this.pack = data.pack;
        this.path = data.path;
        this.prefix = data.prefix;
        this.tablename = data.tablename;
    }

    public getFieldKeys(): string[] {
        return GenConfig.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return GenConfig.foptions;
    }

    public toJson(): FieldData {
        return {
            apialias: this.apialias,

            apipath: this.apipath,

            author: this.author,

            cover: this.cover,

            id: this.id,

            modulename: this.modulename,

            pack: this.pack,

            path: this.path,

            prefix: this.prefix,

            tablename: this.tablename
        };
    }
}

export interface IJob {
    createtime: moment.Moment;

    enabled: boolean;

    id: number;

    name: string;

    sort: number;
}

export class Job extends DataModule {
    public createtime: moment.Moment;

    public enabled: boolean;

    public id: number;

    public name: string;

    public sort: number;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        enabled: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "enabled",
        "id",
        "name",
        "sort"
    ];

    constructor(data?: IJob) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.enabled = data.enabled;
        this.id = data.id;
        this.name = data.name;
        this.sort = data.sort;
    }

    public getFieldKeys(): string[] {
        return Job.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Job.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            enabled: this.enabled,

            id: this.id,

            name: this.name,

            sort: this.sort
        };
    }
}

export interface IJobDto {
    createtime: moment.Moment;

    deptsuperiorname: string;

    enabled: boolean;

    id: number;

    name: string;

    sort: number;
}

export class JobDto extends DataModule {
    public createtime: moment.Moment;

    public deptsuperiorname: string;

    public enabled: boolean;

    public id: number;

    public name: string;

    public sort: number;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        deptsuperiorname: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        enabled: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "deptsuperiorname",
        "enabled",
        "id",
        "name",
        "sort"
    ];

    constructor(data?: IJobDto) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.deptsuperiorname = data.deptsuperiorname;
        this.enabled = data.enabled;
        this.id = data.id;
        this.name = data.name;
        this.sort = data.sort;
    }

    public getFieldKeys(): string[] {
        return JobDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return JobDto.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            deptsuperiorname: this.deptsuperiorname,

            enabled: this.enabled,

            id: this.id,

            name: this.name,

            sort: this.sort
        };
    }
}

export interface IJobSmallDto {
    id: number;

    name: string;
}

export class JobSmallDto extends DataModule {
    public id: number;

    public name: string;

    static readonly foptions: FieldOptionType = {
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["id", "name"];

    constructor(data?: IJobSmallDto) {
        super();
        if (!data) {
            return;
        }

        this.id = data.id;
        this.name = data.name;
    }

    public getFieldKeys(): string[] {
        return JobSmallDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return JobSmallDto.foptions;
    }

    public toJson(): FieldData {
        return {
            id: this.id,

            name: this.name
        };
    }
}

export interface ILocalStorage {
    createtime: moment.Moment;

    id: number;

    name: string;

    operate: string;

    path: string;

    realname: string;

    size: string;

    suffix: string;

    type: string;
}

export class LocalStorage extends DataModule {
    public createtime: moment.Moment;

    public id: number;

    public name: string;

    public operate: string;

    public path: string;

    public realname: string;

    public size: string;

    public suffix: string;

    public type: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        operate: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        path: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        realname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        size: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        suffix: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        type: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "id",
        "name",
        "operate",
        "path",
        "realname",
        "size",
        "suffix",
        "type"
    ];

    constructor(data?: ILocalStorage) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.id = data.id;
        this.name = data.name;
        this.operate = data.operate;
        this.path = data.path;
        this.realname = data.realname;
        this.size = data.size;
        this.suffix = data.suffix;
        this.type = data.type;
    }

    public getFieldKeys(): string[] {
        return LocalStorage.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return LocalStorage.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            id: this.id,

            name: this.name,

            operate: this.operate,

            path: this.path,

            realname: this.realname,

            size: this.size,

            suffix: this.suffix,

            type: this.type
        };
    }
}

export interface IMenu {
    cache: boolean;

    component: string;

    componentname: string;

    createtime: moment.Moment;

    hidden: boolean;

    icon: string;

    id: number;

    iframe: boolean;

    name: string;

    path: string;

    permission: string;

    pid: number;

    sort: number;

    type: number;
}

export class Menu extends DataModule {
    public cache: boolean;

    public component: string;

    public componentname: string;

    public createtime: moment.Moment;

    public hidden: boolean;

    public icon: string;

    public id: number;

    public iframe: boolean;

    public name: string;

    public path: string;

    public permission: string;

    public pid: number;

    public sort: number;

    public type: number;

    static readonly foptions: FieldOptionType = {
        cache: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        component: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        componentname: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        hidden: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        icon: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        iframe: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        path: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        permission: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        type: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "cache",
        "component",
        "componentname",
        "createtime",
        "hidden",
        "icon",
        "id",
        "iframe",
        "name",
        "path",
        "permission",
        "pid",
        "sort",
        "type"
    ];

    constructor(data?: IMenu) {
        super();
        if (!data) {
            return;
        }

        this.cache = data.cache;
        this.component = data.component;
        this.componentname = data.componentname;
        this.createtime = data.createtime;
        this.hidden = data.hidden;
        this.icon = data.icon;
        this.id = data.id;
        this.iframe = data.iframe;
        this.name = data.name;
        this.path = data.path;
        this.permission = data.permission;
        this.pid = data.pid;
        this.sort = data.sort;
        this.type = data.type;
    }

    public getFieldKeys(): string[] {
        return Menu.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Menu.foptions;
    }

    public toJson(): FieldData {
        return {
            cache: this.cache,

            component: this.component,

            componentname: this.componentname,

            createtime: this.datetimeFmt(this.createtime),

            hidden: this.hidden,

            icon: this.icon,

            id: this.id,

            iframe: this.iframe,

            name: this.name,

            path: this.path,

            permission: this.permission,

            pid: this.pid,

            sort: this.sort,

            type: this.type
        };
    }
}

export interface IMenuDto {
    cache: boolean;

    children: MenuDto[];

    component: string;

    componentname: string;

    createtime: moment.Moment;

    hidden: boolean;

    icon: string;

    id: number;

    iframe: boolean;

    name: string;

    path: string;

    permission: string;

    pid: number;

    sort: number;

    type: number;
}

export class MenuDto extends DataModule {
    public cache: boolean;

    public children: MenuDto[];

    public component: string;

    public componentname: string;

    public createtime: moment.Moment;

    public hidden: boolean;

    public icon: string;

    public id: number;

    public iframe: boolean;

    public name: string;

    public path: string;

    public permission: string;

    public pid: number;

    public sort: number;

    public type: number;

    static readonly foptions: FieldOptionType = {
        cache: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        children: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        component: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        componentname: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        hidden: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        icon: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        iframe: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        path: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        permission: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        pid: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        type: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "cache",
        "children",
        "component",
        "componentname",
        "createtime",
        "hidden",
        "icon",
        "id",
        "iframe",
        "name",
        "path",
        "permission",
        "pid",
        "sort",
        "type"
    ];

    constructor(data?: IMenuDto) {
        super();
        if (!data) {
            return;
        }

        this.cache = data.cache;
        this.children = data.children;
        this.component = data.component;
        this.componentname = data.componentname;
        this.createtime = data.createtime;
        this.hidden = data.hidden;
        this.icon = data.icon;
        this.id = data.id;
        this.iframe = data.iframe;
        this.name = data.name;
        this.path = data.path;
        this.permission = data.permission;
        this.pid = data.pid;
        this.sort = data.sort;
        this.type = data.type;
    }

    public getFieldKeys(): string[] {
        return MenuDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return MenuDto.foptions;
    }

    public toJson(): FieldData {
        return {
            cache: this.cache,

            children: this.children,

            component: this.component,

            componentname: this.componentname,

            createtime: this.datetimeFmt(this.createtime),

            hidden: this.hidden,

            icon: this.icon,

            id: this.id,

            iframe: this.iframe,

            name: this.name,

            path: this.path,

            permission: this.permission,

            pid: this.pid,

            sort: this.sort,

            type: this.type
        };
    }
}

export interface IPageDtoDeptDto {
    content: DeptDto[];

    totalelements: number;
}

export class PageDtoDeptDto extends DataModule {
    public content: DeptDto[];

    public totalelements: number;

    static readonly foptions: FieldOptionType = {
        content: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        totalelements: new FieldOptions(
            "number",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        )
    };
    static readonly fkeys: string[] = ["content", "totalelements"];

    constructor(data?: IPageDtoDeptDto) {
        super();
        if (!data) {
            return;
        }

        this.content = data.content;
        this.totalelements = data.totalelements;
    }

    public getFieldKeys(): string[] {
        return PageDtoDeptDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return PageDtoDeptDto.foptions;
    }

    public toJson(): FieldData {
        return {
            content: this.content,

            totalelements: this.totalelements
        };
    }
}

export interface IPageDtoJobDto {
    content: JobDto[];

    totalelements: number;
}

export class PageDtoJobDto extends DataModule {
    public content: JobDto[];

    public totalelements: number;

    static readonly foptions: FieldOptionType = {
        content: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        totalelements: new FieldOptions(
            "number",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        )
    };
    static readonly fkeys: string[] = ["content", "totalelements"];

    constructor(data?: IPageDtoJobDto) {
        super();
        if (!data) {
            return;
        }

        this.content = data.content;
        this.totalelements = data.totalelements;
    }

    public getFieldKeys(): string[] {
        return PageDtoJobDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return PageDtoJobDto.foptions;
    }

    public toJson(): FieldData {
        return {
            content: this.content,

            totalelements: this.totalelements
        };
    }
}

export interface IPageDtoRoleDto {
    content: RoleDto[];

    totalelements: number;
}

export class PageDtoRoleDto extends DataModule {
    public content: RoleDto[];

    public totalelements: number;

    static readonly foptions: FieldOptionType = {
        content: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        totalelements: new FieldOptions(
            "number",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        )
    };
    static readonly fkeys: string[] = ["content", "totalelements"];

    constructor(data?: IPageDtoRoleDto) {
        super();
        if (!data) {
            return;
        }

        this.content = data.content;
        this.totalelements = data.totalelements;
    }

    public getFieldKeys(): string[] {
        return PageDtoRoleDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return PageDtoRoleDto.foptions;
    }

    public toJson(): FieldData {
        return {
            content: this.content,

            totalelements: this.totalelements
        };
    }
}

export interface IPageDtoUserDto {
    content: UserDto[];

    totalelements: number;
}

export class PageDtoUserDto extends DataModule {
    public content: UserDto[];

    public totalelements: number;

    static readonly foptions: FieldOptionType = {
        content: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        totalelements: new FieldOptions(
            "number",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        )
    };
    static readonly fkeys: string[] = ["content", "totalelements"];

    constructor(data?: IPageDtoUserDto) {
        super();
        if (!data) {
            return;
        }

        this.content = data.content;
        this.totalelements = data.totalelements;
    }

    public getFieldKeys(): string[] {
        return PageDtoUserDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return PageDtoUserDto.foptions;
    }

    public toJson(): FieldData {
        return {
            content: this.content,

            totalelements: this.totalelements
        };
    }
}

export interface IQiniuConfig {
    accesskey: string;

    bucket: string;

    host: string;

    id: number;

    secretkey: string;

    type: string;

    zone: string;
}

export class QiniuConfig extends DataModule {
    public accesskey: string;

    public bucket: string;

    public host: string;

    public id: number;

    public secretkey: string;

    public type: string;

    public zone: string;

    static readonly foptions: FieldOptionType = {
        accesskey: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        bucket: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        host: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        secretkey: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        type: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        zone: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "accesskey",
        "bucket",
        "host",
        "id",
        "secretkey",
        "type",
        "zone"
    ];

    constructor(data?: IQiniuConfig) {
        super();
        if (!data) {
            return;
        }

        this.accesskey = data.accesskey;
        this.bucket = data.bucket;
        this.host = data.host;
        this.id = data.id;
        this.secretkey = data.secretkey;
        this.type = data.type;
        this.zone = data.zone;
    }

    public getFieldKeys(): string[] {
        return QiniuConfig.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return QiniuConfig.foptions;
    }

    public toJson(): FieldData {
        return {
            accesskey: this.accesskey,

            bucket: this.bucket,

            host: this.host,

            id: this.id,

            secretkey: this.secretkey,

            type: this.type,

            zone: this.zone
        };
    }
}

export interface IQuartzJob {
    beanname: string;

    createtime: moment.Moment;

    cronexpression: string;

    id: number;

    ispause: boolean;

    jobname: string;

    methodname: string;

    params: string;

    remark: string;
}

export class QuartzJob extends DataModule {
    public beanname: string;

    public createtime: moment.Moment;

    public cronexpression: string;

    public id: number;

    public ispause: boolean;

    public jobname: string;

    public methodname: string;

    public params: string;

    public remark: string;

    static readonly foptions: FieldOptionType = {
        beanname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        cronexpression: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        ispause: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        jobname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        methodname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        params: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "beanname",
        "createtime",
        "cronexpression",
        "id",
        "ispause",
        "jobname",
        "methodname",
        "params",
        "remark"
    ];

    constructor(data?: IQuartzJob) {
        super();
        if (!data) {
            return;
        }

        this.beanname = data.beanname;
        this.createtime = data.createtime;
        this.cronexpression = data.cronexpression;
        this.id = data.id;
        this.ispause = data.ispause;
        this.jobname = data.jobname;
        this.methodname = data.methodname;
        this.params = data.params;
        this.remark = data.remark;
    }

    public getFieldKeys(): string[] {
        return QuartzJob.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return QuartzJob.foptions;
    }

    public toJson(): FieldData {
        return {
            beanname: this.beanname,

            createtime: this.datetimeFmt(this.createtime),

            cronexpression: this.cronexpression,

            id: this.id,

            ispause: this.ispause,

            jobname: this.jobname,

            methodname: this.methodname,

            params: this.params,

            remark: this.remark
        };
    }
}

export interface IResource {
    description: string;

    file: any;

    filename: string;

    inputstream: any;

    open: boolean;

    readable: boolean;

    uri: any;

    url: any;
}

export class Resource extends DataModule {
    public description: string;

    public file: any;

    public filename: string;

    public inputstream: any;

    public open: boolean;

    public readable: boolean;

    public uri: any;

    public url: any;

    static readonly foptions: FieldOptionType = {
        description: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        file: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        filename: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        inputstream: new FieldOptions(
            "message",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        open: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        readable: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        uri: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        url: new FieldOptions("message", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "description",
        "file",
        "filename",
        "inputstream",
        "open",
        "readable",
        "uri",
        "url"
    ];

    constructor(data?: IResource) {
        super();
        if (!data) {
            return;
        }

        this.description = data.description;
        this.file = data.file;
        this.filename = data.filename;
        this.inputstream = data.inputstream;
        this.open = data.open;
        this.readable = data.readable;
        this.uri = data.uri;
        this.url = data.url;
    }

    public getFieldKeys(): string[] {
        return Resource.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Resource.foptions;
    }

    public toJson(): FieldData {
        return {
            description: this.description,

            file: this.file.toJson(),

            filename: this.filename,

            inputstream: this.inputstream.toJson(),

            open: this.open,

            readable: this.readable,

            uri: this.uri.toJson(),

            url: this.url.toJson()
        };
    }
}

export interface IRole {
    createtime: moment.Moment;

    depts: Dept[];

    id: number;

    level: number;

    menus: Menu[];

    name: string;

    permission: string;

    remark: string;
}

export class Role extends DataModule {
    public createtime: moment.Moment;

    public depts: Dept[];

    public id: number;

    public level: number;

    public menus: Menu[];

    public name: string;

    public permission: string;

    public remark: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        depts: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        level: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        menus: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        permission: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "depts",
        "id",
        "level",
        "menus",
        "name",
        "permission",
        "remark"
    ];

    constructor(data?: IRole) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.depts = data.depts;
        this.id = data.id;
        this.level = data.level;
        this.menus = data.menus;
        this.name = data.name;
        this.permission = data.permission;
        this.remark = data.remark;
    }

    public getFieldKeys(): string[] {
        return Role.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Role.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            depts: this.depts,

            id: this.id,

            level: this.level,

            menus: this.menus,

            name: this.name,

            permission: this.permission,

            remark: this.remark
        };
    }
}

export interface IRoleDto {
    createtime: moment.Moment;

    datascope: string;

    depts: DeptDto[];

    id: number;

    level: number;

    menus: MenuDto[];

    name: string;

    permission: string;

    remark: string;
}

export class RoleDto extends DataModule {
    public createtime: moment.Moment;

    public datascope: string;

    public depts: DeptDto[];

    public id: number;

    public level: number;

    public menus: MenuDto[];

    public name: string;

    public permission: string;

    public remark: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        datascope: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        depts: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        level: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        menus: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        permission: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "datascope",
        "depts",
        "id",
        "level",
        "menus",
        "name",
        "permission",
        "remark"
    ];

    constructor(data?: IRoleDto) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.datascope = data.datascope;
        this.depts = data.depts;
        this.id = data.id;
        this.level = data.level;
        this.menus = data.menus;
        this.name = data.name;
        this.permission = data.permission;
        this.remark = data.remark;
    }

    public getFieldKeys(): string[] {
        return RoleDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return RoleDto.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            datascope: this.datascope,

            depts: this.depts,

            id: this.id,

            level: this.level,

            menus: this.menus,

            name: this.name,

            permission: this.permission,

            remark: this.remark
        };
    }
}

export interface IRoleSmallDto {
    datascope: string;

    id: number;

    level: number;

    name: string;
}

export class RoleSmallDto extends DataModule {
    public datascope: string;

    public id: number;

    public level: number;

    public name: string;

    static readonly foptions: FieldOptionType = {
        datascope: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        level: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["datascope", "id", "level", "name"];

    constructor(data?: IRoleSmallDto) {
        super();
        if (!data) {
            return;
        }

        this.datascope = data.datascope;
        this.id = data.id;
        this.level = data.level;
        this.name = data.name;
    }

    public getFieldKeys(): string[] {
        return RoleSmallDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return RoleSmallDto.foptions;
    }

    public toJson(): FieldData {
        return {
            datascope: this.datascope,

            id: this.id,

            level: this.level,

            name: this.name
        };
    }
}

export interface IServer {
    address: string;

    cpucore: number;

    cpurate: number;

    disktotal: number;

    diskused: number;

    id: number;

    memtotal: number;

    memused: number;

    name: string;

    port: number;

    sort: number;

    state: string;

    swaptotal: number;

    swapused: number;
}

export class Server extends DataModule {
    public address: string;

    public cpucore: number;

    public cpurate: number;

    public disktotal: number;

    public diskused: number;

    public id: number;

    public memtotal: number;

    public memused: number;

    public name: string;

    public port: number;

    public sort: number;

    public state: string;

    public swaptotal: number;

    public swapused: number;

    static readonly foptions: FieldOptionType = {
        address: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        cpucore: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        cpurate: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        disktotal: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        diskused: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        memtotal: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        memused: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        port: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        sort: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        state: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        swaptotal: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        swapused: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "address",
        "cpucore",
        "cpurate",
        "disktotal",
        "diskused",
        "id",
        "memtotal",
        "memused",
        "name",
        "port",
        "sort",
        "state",
        "swaptotal",
        "swapused"
    ];

    constructor(data?: IServer) {
        super();
        if (!data) {
            return;
        }

        this.address = data.address;
        this.cpucore = data.cpucore;
        this.cpurate = data.cpurate;
        this.disktotal = data.disktotal;
        this.diskused = data.diskused;
        this.id = data.id;
        this.memtotal = data.memtotal;
        this.memused = data.memused;
        this.name = data.name;
        this.port = data.port;
        this.sort = data.sort;
        this.state = data.state;
        this.swaptotal = data.swaptotal;
        this.swapused = data.swapused;
    }

    public getFieldKeys(): string[] {
        return Server.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Server.foptions;
    }

    public toJson(): FieldData {
        return {
            address: this.address,

            cpucore: this.cpucore,

            cpurate: this.cpurate,

            disktotal: this.disktotal,

            diskused: this.diskused,

            id: this.id,

            memtotal: this.memtotal,

            memused: this.memused,

            name: this.name,

            port: this.port,

            sort: this.sort,

            state: this.state,

            swaptotal: this.swaptotal,

            swapused: this.swapused
        };
    }
}

export interface IServerDeploy {
    account: string;

    createtime: moment.Moment;

    id: number;

    ip: string;

    name: string;

    password: string;

    port: number;
}

export class ServerDeploy extends DataModule {
    public account: string;

    public createtime: moment.Moment;

    public id: number;

    public ip: string;

    public name: string;

    public password: string;

    public port: number;

    static readonly foptions: FieldOptionType = {
        account: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        ip: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        password: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        port: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "account",
        "createtime",
        "id",
        "ip",
        "name",
        "password",
        "port"
    ];

    constructor(data?: IServerDeploy) {
        super();
        if (!data) {
            return;
        }

        this.account = data.account;
        this.createtime = data.createtime;
        this.id = data.id;
        this.ip = data.ip;
        this.name = data.name;
        this.password = data.password;
        this.port = data.port;
    }

    public getFieldKeys(): string[] {
        return ServerDeploy.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return ServerDeploy.foptions;
    }

    public toJson(): FieldData {
        return {
            account: this.account,

            createtime: this.datetimeFmt(this.createtime),

            id: this.id,

            ip: this.ip,

            name: this.name,

            password: this.password,

            port: this.port
        };
    }
}

export interface ITimestamp {
    date: number;

    day: number;

    hours: number;

    minutes: number;

    month: number;

    nanos: number;

    seconds: number;

    time: number;

    timezoneoffset: number;

    year: number;
}

export class Timestamp extends DataModule {
    public date: number;

    public day: number;

    public hours: number;

    public minutes: number;

    public month: number;

    public nanos: number;

    public seconds: number;

    public time: number;

    public timezoneoffset: number;

    public year: number;

    static readonly foptions: FieldOptionType = {
        date: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        day: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        hours: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        minutes: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        month: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        nanos: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        seconds: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        time: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        timezoneoffset: new FieldOptions(
            "number",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        year: new FieldOptions("number", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "date",
        "day",
        "hours",
        "minutes",
        "month",
        "nanos",
        "seconds",
        "time",
        "timezoneoffset",
        "year"
    ];

    constructor(data?: ITimestamp) {
        super();
        if (!data) {
            return;
        }

        this.date = data.date;
        this.day = data.day;
        this.hours = data.hours;
        this.minutes = data.minutes;
        this.month = data.month;
        this.nanos = data.nanos;
        this.seconds = data.seconds;
        this.time = data.time;
        this.timezoneoffset = data.timezoneoffset;
        this.year = data.year;
    }

    public getFieldKeys(): string[] {
        return Timestamp.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return Timestamp.foptions;
    }

    public toJson(): FieldData {
        return {
            date: this.date,

            day: this.day,

            hours: this.hours,

            minutes: this.minutes,

            month: this.month,

            nanos: this.nanos,

            seconds: this.seconds,

            time: this.time,

            timezoneoffset: this.timezoneoffset,

            year: this.year
        };
    }
}

export interface ITradeVo {
    body: string;

    subject: string;

    totalamount: string;
}

export class TradeVo extends DataModule {
    public body: string;

    public subject: string;

    public totalamount: string;

    static readonly foptions: FieldOptionType = {
        body: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        subject: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        totalamount: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["body", "subject", "totalamount"];

    constructor(data?: ITradeVo) {
        super();
        if (!data) {
            return;
        }

        this.body = data.body;
        this.subject = data.subject;
        this.totalamount = data.totalamount;
    }

    public getFieldKeys(): string[] {
        return TradeVo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return TradeVo.foptions;
    }

    public toJson(): FieldData {
        return {
            body: this.body,

            subject: this.subject,

            totalamount: this.totalamount
        };
    }
}

export interface IUser {
    company: Dept;

    createtime: moment.Moment;

    createdby: string;
    // EnumDataScope
    // * NONE: 无效枚举值
    // * ALL: 全部
    // * SELF_DEPT: 本部门
    // * SELF_AND_CHILDREN: 本部门及以下
    // * SELF_REGION: 本区域
    // * SELF_REGION_AND_CHILDREN: 本区域及以下
    // * SELF_COMPANY: 本公司
    // * SELF_COMPANY_AND_CHILDREN: 本公司及以下
    // * CUSTOM: 自定义

    datascope: number;

    datascopedepts: Dept[];

    dept: Dept;

    email: string;

    enabled: boolean;

    id: number;

    isdelete: boolean;

    job: Job;

    nickname: string;

    phone: string;

    region: Dept;

    roles: Role[];

    sex: string;

    updatetime: moment.Moment;

    updatedby: string;

    useravatar: UserAvatar;

    userinfo: UserInfo;

    username: string;
}

export class User extends DataModule {
    public company: Dept;

    public createtime: moment.Moment;

    public createdby: string;
    // EnumDataScope
    // * NONE: 无效枚举值
    // * ALL: 全部
    // * SELF_DEPT: 本部门
    // * SELF_AND_CHILDREN: 本部门及以下
    // * SELF_REGION: 本区域
    // * SELF_REGION_AND_CHILDREN: 本区域及以下
    // * SELF_COMPANY: 本公司
    // * SELF_COMPANY_AND_CHILDREN: 本公司及以下
    // * CUSTOM: 自定义

    public datascope: number;

    public datascopedepts: Dept[];

    public dept: Dept;

    public email: string;

    public enabled: boolean;

    public id: number;

    public isdelete: boolean;

    public job: Job;

    public nickname: string;

    public phone: string;

    public region: Dept;

    public roles: Role[];

    public sex: string;

    public updatetime: moment.Moment;

    public updatedby: string;

    public useravatar: UserAvatar;

    public userinfo: UserInfo;

    public username: string;

    static readonly foptions: FieldOptionType = {
        company: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createdby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        datascope: new FieldOptions("number", false, true, 0, 0, 0, 0, null),
        datascopedepts: new FieldOptions(
            "message",
            true,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        dept: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        email: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        enabled: new FieldOptions("boolean", false, true, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        isdelete: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        job: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        nickname: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        phone: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        region: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        roles: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        sex: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        updatetime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        updatedby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        useravatar: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        userinfo: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        username: new FieldOptions("string", false, true, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "company",
        "createtime",
        "createdby",
        "datascope",
        "datascopedepts",
        "dept",
        "email",
        "enabled",
        "id",
        "isdelete",
        "job",
        "nickname",
        "phone",
        "region",
        "roles",
        "sex",
        "updatetime",
        "updatedby",
        "useravatar",
        "userinfo",
        "username"
    ];

    constructor(data?: IUser) {
        super();
        if (!data) {
            return;
        }

        this.company = data.company;
        this.createtime = data.createtime;
        this.createdby = data.createdby;
        this.datascope = data.datascope;
        this.datascopedepts = data.datascopedepts;
        this.dept = data.dept;
        this.email = data.email;
        this.enabled = data.enabled;
        this.id = data.id;
        this.isdelete = data.isdelete;
        this.job = data.job;
        this.nickname = data.nickname;
        this.phone = data.phone;
        this.region = data.region;
        this.roles = data.roles;
        this.sex = data.sex;
        this.updatetime = data.updatetime;
        this.updatedby = data.updatedby;
        this.useravatar = data.useravatar;
        this.userinfo = data.userinfo;
        this.username = data.username;
    }

    public getFieldKeys(): string[] {
        return User.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return User.foptions;
    }

    public toJson(): FieldData {
        return {
            company: this.company.toJson(),

            createtime: this.datetimeFmt(this.createtime),

            createdby: this.createdby,

            datascope: this.datascope,

            datascopedepts: this.datascopedepts,

            dept: this.dept.toJson(),

            email: this.email,

            enabled: this.enabled,

            id: this.id,

            isdelete: this.isdelete,

            job: this.job.toJson(),

            nickname: this.nickname,

            phone: this.phone,

            region: this.region.toJson(),

            roles: this.roles,

            sex: this.sex,

            updatetime: this.datetimeFmt(this.updatetime),

            updatedby: this.updatedby,

            useravatar: this.useravatar.toJson(),

            userinfo: this.userinfo.toJson(),

            username: this.username
        };
    }
}

export interface IUserAvatar {
    createtime: moment.Moment;

    id: number;

    path: string;

    realname: string;

    size: string;
}

export class UserAvatar extends DataModule {
    public createtime: moment.Moment;

    public id: number;

    public path: string;

    public realname: string;

    public size: string;

    static readonly foptions: FieldOptionType = {
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        path: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        realname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        size: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "createtime",
        "id",
        "path",
        "realname",
        "size"
    ];

    constructor(data?: IUserAvatar) {
        super();
        if (!data) {
            return;
        }

        this.createtime = data.createtime;
        this.id = data.id;
        this.path = data.path;
        this.realname = data.realname;
        this.size = data.size;
    }

    public getFieldKeys(): string[] {
        return UserAvatar.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return UserAvatar.foptions;
    }

    public toJson(): FieldData {
        return {
            createtime: this.datetimeFmt(this.createtime),

            id: this.id,

            path: this.path,

            realname: this.realname,

            size: this.size
        };
    }
}

export interface IUserDto {
    avatar: string;

    company: DeptSmallDto;

    createtime: moment.Moment;
    // EnumDataScope
    // * NONE: 无效枚举值
    // * ALL: 全部
    // * SELF_DEPT: 本部门
    // * SELF_AND_CHILDREN: 本部门及以下
    // * SELF_REGION: 本区域
    // * SELF_REGION_AND_CHILDREN: 本区域及以下
    // * SELF_COMPANY: 本公司
    // * SELF_COMPANY_AND_CHILDREN: 本公司及以下
    // * CUSTOM: 自定义

    datascope: number;

    datascopedepts: DeptSmallDto[];

    dept: DeptSmallDto;

    email: string;

    enabled: boolean;

    job: JobSmallDto;

    lastpasswordresettime: string;

    nickname: string;

    phone: string;

    region: DeptSmallDto;

    resetpwd: string;

    roles: RoleSmallDto[];

    sex: string;

    userinfo: UserInfoDto;

    username: string;
}

export class UserDto extends DataModule {
    public avatar: string;

    public company: DeptSmallDto;

    public createtime: moment.Moment;
    // EnumDataScope
    // * NONE: 无效枚举值
    // * ALL: 全部
    // * SELF_DEPT: 本部门
    // * SELF_AND_CHILDREN: 本部门及以下
    // * SELF_REGION: 本区域
    // * SELF_REGION_AND_CHILDREN: 本区域及以下
    // * SELF_COMPANY: 本公司
    // * SELF_COMPANY_AND_CHILDREN: 本公司及以下
    // * CUSTOM: 自定义

    public datascope: number;

    public datascopedepts: DeptSmallDto[];

    public dept: DeptSmallDto;

    public email: string;

    public enabled: boolean;

    public job: JobSmallDto;

    public lastpasswordresettime: string;

    public nickname: string;

    public phone: string;

    public region: DeptSmallDto;

    public resetpwd: string;

    public roles: RoleSmallDto[];

    public sex: string;

    public userinfo: UserInfoDto;

    public username: string;

    static readonly foptions: FieldOptionType = {
        avatar: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        company: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        datascope: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        datascopedepts: new FieldOptions(
            "message",
            true,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        dept: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        email: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        enabled: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        job: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        lastpasswordresettime: new FieldOptions(
            "string",
            false,
            false,
            0,
            0,
            0,
            0,
            /^((?:(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2}(?:\.\d+)?))(Z|[\+-]\d{2}:\d{2})?)$/
        ),
        nickname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        phone: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        region: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        resetpwd: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        roles: new FieldOptions("message", true, false, 0, 0, 0, 0, null),
        sex: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        userinfo: new FieldOptions("message", false, false, 0, 0, 0, 0, null),
        username: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "avatar",
        "company",
        "createtime",
        "datascope",
        "datascopedepts",
        "dept",
        "email",
        "enabled",
        "job",
        "lastpasswordresettime",
        "nickname",
        "phone",
        "region",
        "resetpwd",
        "roles",
        "sex",
        "userinfo",
        "username"
    ];

    constructor(data?: IUserDto) {
        super();
        if (!data) {
            return;
        }

        this.avatar = data.avatar;
        this.company = data.company;
        this.createtime = data.createtime;
        this.datascope = data.datascope;
        this.datascopedepts = data.datascopedepts;
        this.dept = data.dept;
        this.email = data.email;
        this.enabled = data.enabled;
        this.job = data.job;
        this.lastpasswordresettime = data.lastpasswordresettime;
        this.nickname = data.nickname;
        this.phone = data.phone;
        this.region = data.region;
        this.resetpwd = data.resetpwd;
        this.roles = data.roles;
        this.sex = data.sex;
        this.userinfo = data.userinfo;
        this.username = data.username;
    }

    public getFieldKeys(): string[] {
        return UserDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return UserDto.foptions;
    }

    public toJson(): FieldData {
        return {
            avatar: this.avatar,

            company: this.company.toJson(),

            createtime: this.datetimeFmt(this.createtime),

            datascope: this.datascope,

            datascopedepts: this.datascopedepts,

            dept: this.dept.toJson(),

            email: this.email,

            enabled: this.enabled,

            job: this.job.toJson(),

            lastpasswordresettime: this.lastpasswordresettime,

            nickname: this.nickname,

            phone: this.phone,

            region: this.region.toJson(),

            resetpwd: this.resetpwd,

            roles: this.roles,

            sex: this.sex,

            userinfo: this.userinfo.toJson(),

            username: this.username
        };
    }
}

export interface IUserInfo {
    bankname: string;

    bankno: string;

    createtime: moment.Moment;

    createdby: string;

    driverno: string;

    id: number;

    idcard: string;

    isdelete: boolean;

    linkman: string;

    linkmobile: string;

    name: string;

    orgno: string;

    remark: string;

    shortname: string;

    swdjno: string;

    updatetime: moment.Moment;

    updatedby: string;

    usertype: string;

    yyzzno: string;
}

export class UserInfo extends DataModule {
    public bankname: string;

    public bankno: string;

    public createtime: moment.Moment;

    public createdby: string;

    public driverno: string;

    public id: number;

    public idcard: string;

    public isdelete: boolean;

    public linkman: string;

    public linkmobile: string;

    public name: string;

    public orgno: string;

    public remark: string;

    public shortname: string;

    public swdjno: string;

    public updatetime: moment.Moment;

    public updatedby: string;

    public usertype: string;

    public yyzzno: string;

    static readonly foptions: FieldOptionType = {
        bankname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        bankno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        createdby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        driverno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        idcard: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        isdelete: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        linkman: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        linkmobile: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        orgno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        shortname: new FieldOptions("string", false, true, 0, 0, 0, 0, null),
        swdjno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        updatetime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        updatedby: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        usertype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        yyzzno: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "bankname",
        "bankno",
        "createtime",
        "createdby",
        "driverno",
        "id",
        "idcard",
        "isdelete",
        "linkman",
        "linkmobile",
        "name",
        "orgno",
        "remark",
        "shortname",
        "swdjno",
        "updatetime",
        "updatedby",
        "usertype",
        "yyzzno"
    ];

    constructor(data?: IUserInfo) {
        super();
        if (!data) {
            return;
        }

        this.bankname = data.bankname;
        this.bankno = data.bankno;
        this.createtime = data.createtime;
        this.createdby = data.createdby;
        this.driverno = data.driverno;
        this.id = data.id;
        this.idcard = data.idcard;
        this.isdelete = data.isdelete;
        this.linkman = data.linkman;
        this.linkmobile = data.linkmobile;
        this.name = data.name;
        this.orgno = data.orgno;
        this.remark = data.remark;
        this.shortname = data.shortname;
        this.swdjno = data.swdjno;
        this.updatetime = data.updatetime;
        this.updatedby = data.updatedby;
        this.usertype = data.usertype;
        this.yyzzno = data.yyzzno;
    }

    public getFieldKeys(): string[] {
        return UserInfo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return UserInfo.foptions;
    }

    public toJson(): FieldData {
        return {
            bankname: this.bankname,

            bankno: this.bankno,

            createtime: this.datetimeFmt(this.createtime),

            createdby: this.createdby,

            driverno: this.driverno,

            id: this.id,

            idcard: this.idcard,

            isdelete: this.isdelete,

            linkman: this.linkman,

            linkmobile: this.linkmobile,

            name: this.name,

            orgno: this.orgno,

            remark: this.remark,

            shortname: this.shortname,

            swdjno: this.swdjno,

            updatetime: this.datetimeFmt(this.updatetime),

            updatedby: this.updatedby,

            usertype: this.usertype,

            yyzzno: this.yyzzno
        };
    }
}

export interface IUserInfoDto {
    bankname: string;

    bankno: string;

    driverno: string;

    id: number;

    idcard: string;

    linkman: string;

    linkmobile: string;

    name: string;

    orgno: string;

    remark: string;

    shortname: string;

    swdjno: string;

    usertype: string;

    yyzzno: string;
}

export class UserInfoDto extends DataModule {
    public bankname: string;

    public bankno: string;

    public driverno: string;

    public id: number;

    public idcard: string;

    public linkman: string;

    public linkmobile: string;

    public name: string;

    public orgno: string;

    public remark: string;

    public shortname: string;

    public swdjno: string;

    public usertype: string;

    public yyzzno: string;

    static readonly foptions: FieldOptionType = {
        bankname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        bankno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        driverno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        idcard: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        linkman: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        linkmobile: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        name: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        orgno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        remark: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        shortname: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        swdjno: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        usertype: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        yyzzno: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "bankname",
        "bankno",
        "driverno",
        "id",
        "idcard",
        "linkman",
        "linkmobile",
        "name",
        "orgno",
        "remark",
        "shortname",
        "swdjno",
        "usertype",
        "yyzzno"
    ];

    constructor(data?: IUserInfoDto) {
        super();
        if (!data) {
            return;
        }

        this.bankname = data.bankname;
        this.bankno = data.bankno;
        this.driverno = data.driverno;
        this.id = data.id;
        this.idcard = data.idcard;
        this.linkman = data.linkman;
        this.linkmobile = data.linkmobile;
        this.name = data.name;
        this.orgno = data.orgno;
        this.remark = data.remark;
        this.shortname = data.shortname;
        this.swdjno = data.swdjno;
        this.usertype = data.usertype;
        this.yyzzno = data.yyzzno;
    }

    public getFieldKeys(): string[] {
        return UserInfoDto.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return UserInfoDto.foptions;
    }

    public toJson(): FieldData {
        return {
            bankname: this.bankname,

            bankno: this.bankno,

            driverno: this.driverno,

            id: this.id,

            idcard: this.idcard,

            linkman: this.linkman,

            linkmobile: this.linkmobile,

            name: this.name,

            orgno: this.orgno,

            remark: this.remark,

            shortname: this.shortname,

            swdjno: this.swdjno,

            usertype: this.usertype,

            yyzzno: this.yyzzno
        };
    }
}

export interface IUserPassVo {
    newpass: string;

    oldpass: string;
}

export class UserPassVo extends DataModule {
    public newpass: string;

    public oldpass: string;

    static readonly foptions: FieldOptionType = {
        newpass: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        oldpass: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = ["newpass", "oldpass"];

    constructor(data?: IUserPassVo) {
        super();
        if (!data) {
            return;
        }

        this.newpass = data.newpass;
        this.oldpass = data.oldpass;
    }

    public getFieldKeys(): string[] {
        return UserPassVo.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return UserPassVo.foptions;
    }

    public toJson(): FieldData {
        return {
            newpass: this.newpass,

            oldpass: this.oldpass
        };
    }
}

export interface IVerificationCode {
    code: string;

    createtime: moment.Moment;

    id: number;

    scenes: string;

    status: boolean;

    type: string;

    value: string;
}

export class VerificationCode extends DataModule {
    public code: string;

    public createtime: moment.Moment;

    public id: number;

    public scenes: string;

    public status: boolean;

    public type: string;

    public value: string;

    static readonly foptions: FieldOptionType = {
        code: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        createtime: new FieldOptions(
            "moment.Moment",
            false,
            false,
            0,
            0,
            0,
            0,
            null
        ),
        id: new FieldOptions("number", false, false, 0, 0, 0, 0, null),
        scenes: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        status: new FieldOptions("boolean", false, false, 0, 0, 0, 0, null),
        type: new FieldOptions("string", false, false, 0, 0, 0, 0, null),
        value: new FieldOptions("string", false, false, 0, 0, 0, 0, null)
    };
    static readonly fkeys: string[] = [
        "code",
        "createtime",
        "id",
        "scenes",
        "status",
        "type",
        "value"
    ];

    constructor(data?: IVerificationCode) {
        super();
        if (!data) {
            return;
        }

        this.code = data.code;
        this.createtime = data.createtime;
        this.id = data.id;
        this.scenes = data.scenes;
        this.status = data.status;
        this.type = data.type;
        this.value = data.value;
    }

    public getFieldKeys(): string[] {
        return VerificationCode.fkeys;
    }

    public getFieldOptionType(): FieldOptionType {
        return VerificationCode.foptions;
    }

    public toJson(): FieldData {
        return {
            code: this.code,

            createtime: this.datetimeFmt(this.createtime),

            id: this.id,

            scenes: this.scenes,

            status: this.status,

            type: this.type,

            value: this.value
        };
    }
}

// ----------------------------------------------
//        query define
// ----------------------------------------------

export interface QuerygetAppsUsingGET {
    name: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET {
    name: string;
}

export interface QuerygetAreasUsingGET {
    cname: string;

    code: string;

    enname: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_1 {
    cname: string;

    code: string;

    enname: string;
}

export interface QueryresetPassUsingPOST {
    // email

    email: string;
}

export interface QueryvalidatedUsingGET {
    code: string;

    id: number;

    scenes: string;

    status: boolean;

    type: string;

    value: string;
}

export interface QuerygetDatabasesUsingGET {
    jdbcurl: string;

    name: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_2 {
    jdbcurl: string;

    name: string;
}

export interface QuerygetDeploysUsingGET {
    appname: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_3 {
    appname: string;
}

export interface QuerygetDeployHistorysUsingGET {
    blurry: string;

    deployid: number;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_4 {
    blurry: string;

    deployid: number;
}

export interface QuerygetDeptsUsingGET {
    enabled: boolean;

    ids: number[];

    name: string;

    pid: number;
}

export interface QuerygetDeptsByPidUsingGET {
    // pid

    pid: number;

    // props

    props: number;
}

export interface QuerydownloadUsingGET_5 {
    enabled: boolean;

    ids: number[];

    name: string;

    pid: number;
}

export interface QuerygetDeptsByPropsUsingGET {
    // props

    props: number;
}

export interface QuerygetDictsUsingGET {
    blurry: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_6 {
    blurry: string;
}

export interface QuerygetDictDetailsUsingGET {
    dictname: string;

    label: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerygetDictDetailMapsUsingGET {
    dictname: string;

    label: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerygetTablesUsingGET {
    // tableName

    tablename: string;
}

export interface QuerygetTablesUsingGET_2 {
    // name

    name: string;

    // page

    page: number;

    // size

    size: number;
}

export interface QuerygetJobsUsingGET {
    deptid: number;

    enabled: boolean;

    name: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_7 {
    deptid: number;

    enabled: boolean;

    name: string;
}

export interface QuerygetJobsUsingGET_1 {
    issuccess: boolean;

    jobname: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_15 {
    issuccess: boolean;

    jobname: string;
}

export interface QuerygetJobLogsUsingGET {
    issuccess: boolean;

    jobname: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadLogUsingGET {
    issuccess: boolean;

    jobname: string;
}

export interface QuerygetLocalStoragesUsingGET {
    blurry: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerycreateUsingPOST_8 {
    // name

    name: string;
}

export interface QuerydownloadUsingGET_8 {
    blurry: string;
}

export interface QuerygetLogsUsingGET {
    blurry: string;

    logtype: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_9 {
    blurry: string;

    logtype: string;
}

export interface QuerygetErrorLogsUsingGET_1 {
    blurry: string;

    logtype: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QueryerrorDownloadUsingGET {
    blurry: string;

    logtype: string;
}

export interface QuerygetUserLogsUsingGET {
    blurry: string;

    logtype: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerygetMenusUsingGET {
    blurry: string;
}

export interface QuerydownloadUsingGET_10 {
    blurry: string;
}

export interface QuerygetRolesUsingGET {
    filename: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];

    username: string;
}

export interface QuerydownloadUsingGET_12 {
    filename: string;

    username: string;
}

export interface QuerygetRolesUsingGET_1 {
    key: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_14 {
    key: string;
}

export interface QuerygetRolesUsingGET_3 {
    blurry: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerygetAllUsingGET_1 {
    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_16 {
    blurry: string;
}

export interface QuerygetServersUsingGET {
    blurry: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerygetServersUsingGET_1 {
    blurry: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_17 {
    blurry: string;
}

export interface QuerygetUsersUsingGET {
    blurry: string;

    deptid: number;

    deptids: number[];

    enabled: boolean;

    id: number;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_18 {
    blurry: string;

    deptid: number;

    deptids: number[];

    enabled: boolean;

    id: number;
}

export interface QuerygetAllUsingGET {
    // filter

    filter: string;

    // 页码 (0..N)

    page: number;

    // 每页显示的数目

    size: number;

    // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc

    sort: string[];
}

export interface QuerydownloadUsingGET_11 {
    // filter

    filter: string;
}

// ----------------------------------------------
//        header define
// ----------------------------------------------

export interface HeaderindexUsingGET {
    // token

    authorization: string;
}

export interface HeadergetUsingGET {
    // token

    authorization: string;
}

export interface HeaderpayConfigUsingPUT {
    // token

    authorization: string;
}

export interface HeadertoPayAsPcUsingPOST {
    // token

    authorization: string;
}

export interface HeadertoPayAsWebUsingPOST {
    // token

    authorization: string;
}

export interface HeadergetAppsUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET {
    // token

    authorization: string;
}

export interface HeadergetAreasUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_1 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_1 {
    // token

    authorization: string;
}

export interface HeaderdeleteAllUsingDELETE {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_1 {
    // token

    authorization: string;
}

export interface HeaderresetPassUsingPOST {
    // token

    authorization: string;
}

export interface HeaderresetEmailUsingPOST {
    // token

    authorization: string;
}

export interface HeadervalidatedUsingGET {
    // token

    authorization: string;
}

export interface HeadergetDatabasesUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_2 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_2 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_1 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_2 {
    // token

    authorization: string;
}

export interface HeadertestConnectUsingPOST {
    // token

    authorization: string;
}

export interface HeaderuploadUsingPOST {
    // token

    authorization: string;
}

export interface HeadergetDeploysUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_3 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_3 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_2 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_3 {
    // token

    authorization: string;
}

export interface HeaderserverReductionUsingPOST {
    // token

    authorization: string;
}

export interface HeaderserverStatusUsingPOST {
    // token

    authorization: string;
}

export interface HeaderstartServerUsingPOST {
    // token

    authorization: string;
}

export interface HeaderstopServerUsingPOST {
    // token

    authorization: string;
}

export interface HeaderuploadUsingPOST_1 {
    // token

    authorization: string;
}

export interface HeadergetDeployHistorysUsingGET {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_3 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_4 {
    // token

    authorization: string;
}

export interface HeadergetDeptsUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_4 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_4 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_4 {
    // token

    authorization: string;
}

export interface HeadergetDeptsByPidUsingGET {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_5 {
    // token

    authorization: string;
}

export interface HeadergetDeptsByPropsUsingGET {
    // token

    authorization: string;
}

export interface HeadergetDictsUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_5 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_5 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_5 {
    // token

    authorization: string;
}

export interface HeaderallUsingGET {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_6 {
    // token

    authorization: string;
}

export interface HeadergetDictDetailsUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_6 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_6 {
    // token

    authorization: string;
}

export interface HeadergetDictDetailMapsUsingGET {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_6 {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadergetUsingGET_1 {
    // token

    authorization: string;
}

export interface HeadersendUsingPOST {
    // token

    authorization: string;
}

export interface HeaderemailConfigUsingPUT {
    // token

    authorization: string;
}

export interface HeaderemailConfigUsingPUT_1 {
    // token

    authorization: string;
}

export interface HeadergetUsingGET_2 {
    // token

    authorization: string;

    // tableName

    tablename: string;
}

export interface HeadersaveUsingPUT {
    // token

    authorization: string;
}

export interface HeadergetTablesUsingGET {
    // token

    authorization: string;
}

export interface HeadersyncUsingPOST {
    // token

    authorization: string;
}

export interface HeadergetTablesUsingGET_2 {
    // token

    authorization: string;
}

export interface HeadergetTablesUsingGET_1 {
    // token

    authorization: string;
}

export interface HeadergeneratorUsingPOST {
    // token

    authorization: string;

    // tableName

    tablename: string;

    // type

    type: number;
}

export interface HeadergetJobsUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_7 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_7 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_7 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_7 {
    // token

    authorization: string;
}

export interface HeadergetJobsUsingGET_1 {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_10 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_10 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_11 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_15 {
    // token

    authorization: string;
}

export interface HeaderexecutionUsingPUT {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadergetJobLogsUsingGET {
    // token

    authorization: string;
}

export interface HeaderdownloadLogUsingGET {
    // token

    authorization: string;
}

export interface HeaderupdateIsPauseUsingPUT {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadertestLimitUsingGET {
    // token

    authorization: string;
}

export interface HeadergetLocalStoragesUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_8 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_8 {
    // token

    authorization: string;
}

export interface HeaderdeleteAllUsingDELETE_1 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_8 {
    // token

    authorization: string;
}

export interface HeadergetLogsUsingGET {
    // token

    authorization: string;
}

export interface HeaderdelAllByErrorUsingDELETE {
    // token

    authorization: string;
}

export interface HeaderdelAllByInfoUsingDELETE {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_9 {
    // token

    authorization: string;
}

export interface HeadergetErrorLogsUsingGET_1 {
    // token

    authorization: string;
}

export interface HeadererrorDownloadUsingGET {
    // token

    authorization: string;
}

export interface HeadergetErrorLogsUsingGET {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadergetUserLogsUsingGET {
    // token

    authorization: string;
}

export interface HeadergetMenusUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_9 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_9 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_8 {
    // token

    authorization: string;
}

export interface HeaderbuildMenusUsingGET {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_10 {
    // token

    authorization: string;
}

export interface HeadergetMenuTreeUsingGET {
    // token

    authorization: string;
}

export interface HeadergetRolesUsingGET {
    // token

    authorization: string;
}

export interface HeaderuploadUsingPOST_2 {
    // token

    authorization: string;
}

export interface HeaderdeleteAllUsingDELETE_2 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_12 {
    // token

    authorization: string;
}

export interface HeadersynchronizeUsingPOST {
    // token

    authorization: string;
}

export interface HeadergetRolesUsingGET_1 {
    // token

    authorization: string;
}

export interface HeaderuploadUsingPOST_3 {
    // token

    authorization: string;
}

export interface HeaderdeleteAllUsingDELETE_3 {
    // token

    authorization: string;
}

export interface HeadergetUsingGET_3 {
    // token

    authorization: string;
}

export interface HeaderemailConfigUsingPUT_2 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_14 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_13 {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadersynchronizeUsingPOST_1 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_10 {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadergetRolesUsingGET_3 {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_11 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_11 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_12 {
    // token

    authorization: string;
}

export interface HeadergetAllUsingGET_1 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_16 {
    // token

    authorization: string;
}

export interface HeadergetLevelUsingGET {
    // token

    authorization: string;
}

export interface HeaderupdateMenuUsingPUT {
    // token

    authorization: string;
}

export interface HeadergetRolesUsingGET_2 {
    // token

    authorization: string;

    // id

    id: number;
}

export interface HeadergetServersUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_12 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_12 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_13 {
    // token

    authorization: string;
}

export interface HeadergetServersUsingGET_1 {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_13 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_13 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_14 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_17 {
    // token

    authorization: string;
}

export interface HeadertestConnectUsingPOST_1 {
    // token

    authorization: string;
}

export interface HeadergetUsersUsingGET {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_14 {
    // token

    authorization: string;
}

export interface HeaderupdateUsingPUT_14 {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_15 {
    // token

    authorization: string;
}

export interface HeadercenterUsingPUT {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_18 {
    // token

    authorization: string;
}

export interface HeaderresetPwdUsingPUT {
    // token

    authorization: string;
}

export interface HeaderupdateAvatarUsingPOST {
    // token

    authorization: string;
}

export interface HeaderupdateEmailUsingPOST {
    // token

    authorization: string;

    // code

    code: string;
}

export interface HeaderupdatePassUsingPOST {
    // token

    authorization: string;
}

export interface HeadergetUsingGET_4 {
    // token

    authorization: string;
}

export interface HeadercreateUsingPOST_15 {
    // token

    authorization: string;
}

export interface HeadergetChartDataUsingGET {
    // token

    authorization: string;
}

export interface HeadergetCodeUsingGET {
    // token

    authorization: string;
}

export interface HeadergetUserInfoUsingGET {
    // token

    authorization: string;
}

export interface HeaderloginUsingPOST {
    // token

    authorization: string;
}

export interface HeaderlogoutUsingDELETE {
    // token

    authorization: string;
}

export interface HeadergetAllUsingGET {
    // token

    authorization: string;
}

export interface HeaderdeleteUsingDELETE_9 {
    // token

    authorization: string;
}

export interface HeaderdownloadUsingGET_11 {
    // token

    authorization: string;
}

// ----------------------------------------------
//        xpath define
// ----------------------------------------------

// ----------------------------------------------
//        Api define
// ----------------------------------------------

export abstract class swaggerApi {
    public nginx_uri: string = "";
    abstract CheckError(rsp: any): void;

    public indexUsingGET(
        headers: HeaderindexUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios.get<NullObject>(`${this.nginx_uri}/`, config).then(rsp => {
            this.CheckError(rsp);
            return rsp.data;
        });
    }

    public getUsingGET(
        headers: HeadergetUsingGET,
        config?: AxiosRequestConfig
    ): Promise<AlipayConfig> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<AlipayConfig>(`${this.nginx_uri}/api/aliPay`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public payConfigUsingPUT(
        headers: HeaderpayConfigUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/aliPay`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public toPayAsPcUsingPOST(
        headers: HeadertoPayAsPcUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/aliPay/toPayAsPC`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public toPayAsWebUsingPOST(
        headers: HeadertoPayAsWebUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/aliPay/toPayAsWeb`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getAppsUsingGET(
        querys: QuerygetAppsUsingGET,
        headers: HeadergetAppsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/app`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST(
        headers: HeadercreateUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/app`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT(
        headers: HeaderupdateUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/app`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE(
        headers: HeaderdeleteUsingDELETE,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/app`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET(
        querys: QuerydownloadUsingGET,
        headers: HeaderdownloadUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/app/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getAreasUsingGET(
        querys: QuerygetAreasUsingGET,
        headers: HeadergetAreasUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/area`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_1(
        headers: HeadercreateUsingPOST_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/area`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_1(
        headers: HeaderupdateUsingPUT_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/area`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteAllUsingDELETE(
        headers: HeaderdeleteAllUsingDELETE,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/area`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_1(
        querys: QuerydownloadUsingGET_1,
        headers: HeaderdownloadUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/area/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public resetPassUsingPOST(
        querys: QueryresetPassUsingPOST,
        headers: HeaderresetPassUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/code/email/resetPass`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public resetEmailUsingPOST(
        headers: HeaderresetEmailUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/code/resetEmail`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public validatedUsingGET(
        querys: QueryvalidatedUsingGET,
        headers: HeadervalidatedUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/code/validated`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDatabasesUsingGET(
        querys: QuerygetDatabasesUsingGET,
        headers: HeadergetDatabasesUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/database`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_2(
        headers: HeadercreateUsingPOST_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/database`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_2(
        headers: HeaderupdateUsingPUT_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/database`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_1(
        headers: HeaderdeleteUsingDELETE_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/database`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_2(
        querys: QuerydownloadUsingGET_2,
        headers: HeaderdownloadUsingGET_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/database/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public testConnectUsingPOST(
        headers: HeadertestConnectUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/database/testConnect`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public uploadUsingPOST(
        headers: HeaderuploadUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/database/upload`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDeploysUsingGET(
        querys: QuerygetDeploysUsingGET,
        headers: HeadergetDeploysUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/deploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_3(
        headers: HeadercreateUsingPOST_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/deploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_3(
        headers: HeaderupdateUsingPUT_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/deploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_2(
        headers: HeaderdeleteUsingDELETE_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/deploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_3(
        querys: QuerydownloadUsingGET_3,
        headers: HeaderdownloadUsingGET_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/deploy/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public serverReductionUsingPOST(
        headers: HeaderserverReductionUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/deploy/serverReduction`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public serverStatusUsingPOST(
        headers: HeaderserverStatusUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/deploy/serverStatus`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public startServerUsingPOST(
        headers: HeaderstartServerUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/deploy/startServer`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public stopServerUsingPOST(
        headers: HeaderstopServerUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/deploy/stopServer`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public uploadUsingPOST_1(
        headers: HeaderuploadUsingPOST_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/deploy/upload`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDeployHistorysUsingGET(
        querys: QuerygetDeployHistorysUsingGET,
        headers: HeadergetDeployHistorysUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/deployHistory`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_3(
        headers: HeaderdeleteUsingDELETE_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/deployHistory`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_4(
        querys: QuerydownloadUsingGET_4,
        headers: HeaderdownloadUsingGET_4,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/deployHistory/download`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDeptsUsingGET(
        querys: QuerygetDeptsUsingGET,
        headers: HeadergetDeptsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<PageDtoDeptDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoDeptDto>(`${this.nginx_uri}/api/dept`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_4(
        headers: HeadercreateUsingPOST_4,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/dept`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_4(
        headers: HeaderupdateUsingPUT_4,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/dept`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_4(
        headers: HeaderdeleteUsingDELETE_4,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/dept`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDeptsByPidUsingGET(
        querys: QuerygetDeptsByPidUsingGET,
        headers: HeadergetDeptsByPidUsingGET,
        config?: AxiosRequestConfig
    ): Promise<PageDtoDeptDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoDeptDto>(`${this.nginx_uri}/api/dept/byPid`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_5(
        querys: QuerydownloadUsingGET_5,
        headers: HeaderdownloadUsingGET_5,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dept/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDeptsByPropsUsingGET(
        querys: QuerygetDeptsByPropsUsingGET,
        headers: HeadergetDeptsByPropsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<PageDtoDeptDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoDeptDto>(`${this.nginx_uri}/api/dept/props`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDictsUsingGET(
        querys: QuerygetDictsUsingGET,
        headers: HeadergetDictsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dict`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_5(
        headers: HeadercreateUsingPOST_5,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/dict`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_5(
        headers: HeaderupdateUsingPUT_5,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/dict`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_5(
        headers: HeaderdeleteUsingDELETE_5,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/dict`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public allUsingGET(
        headers: HeaderallUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dict/all`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_6(
        querys: QuerydownloadUsingGET_6,
        headers: HeaderdownloadUsingGET_6,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dict/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDictDetailsUsingGET(
        querys: QuerygetDictDetailsUsingGET,
        headers: HeadergetDictDetailsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dictDetail`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_6(
        headers: HeadercreateUsingPOST_6,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/dictDetail`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_6(
        headers: HeaderupdateUsingPUT_6,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/dictDetail`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getDictDetailMapsUsingGET(
        querys: QuerygetDictDetailMapsUsingGET,
        headers: HeadergetDictDetailMapsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/dictDetail/map`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_6(
        headers: HeaderdeleteUsingDELETE_6,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/dictDetail/{id}`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUsingGET_1(
        headers: HeadergetUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/email`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public sendUsingPOST(
        headers: HeadersendUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/email`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public emailConfigUsingPUT(
        headers: HeaderemailConfigUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/email`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public emailConfigUsingPUT_1(
        headers: HeaderemailConfigUsingPUT_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/genConfig`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUsingGET_2(
        headers: HeadergetUsingGET_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/genConfig/{tableName}`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public saveUsingPUT(
        headers: HeadersaveUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/generator`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getTablesUsingGET(
        querys: QuerygetTablesUsingGET,
        headers: HeadergetTablesUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/generator/columns`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public syncUsingPOST(
        headers: HeadersyncUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/generator/sync`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getTablesUsingGET_2(
        querys: QuerygetTablesUsingGET_2,
        headers: HeadergetTablesUsingGET_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/generator/tables`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getTablesUsingGET_1(
        headers: HeadergetTablesUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/generator/tables/all`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public generatorUsingPOST(
        headers: HeadergeneratorUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/generator/{tableName}/{type}`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getJobsUsingGET(
        querys: QuerygetJobsUsingGET,
        headers: HeadergetJobsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<PageDtoJobDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoJobDto>(`${this.nginx_uri}/api/job`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_7(
        headers: HeadercreateUsingPOST_7,
        config?: AxiosRequestConfig
    ): Promise<JobDto> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<JobDto>(`${this.nginx_uri}/api/job`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_7(
        headers: HeaderupdateUsingPUT_7,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/job`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_7(
        headers: HeaderdeleteUsingDELETE_7,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/job`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_7(
        querys: QuerydownloadUsingGET_7,
        headers: HeaderdownloadUsingGET_7,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/job/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getJobsUsingGET_1(
        querys: QuerygetJobsUsingGET_1,
        headers: HeadergetJobsUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/jobs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_10(
        headers: HeadercreateUsingPOST_10,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/jobs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_10(
        headers: HeaderupdateUsingPUT_10,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/jobs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_11(
        headers: HeaderdeleteUsingDELETE_11,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/jobs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_15(
        querys: QuerydownloadUsingGET_15,
        headers: HeaderdownloadUsingGET_15,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/jobs/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public executionUsingPUT(
        headers: HeaderexecutionUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/jobs/exec/{id}`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getJobLogsUsingGET(
        querys: QuerygetJobLogsUsingGET,
        headers: HeadergetJobLogsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/jobs/logs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadLogUsingGET(
        querys: QuerydownloadLogUsingGET,
        headers: HeaderdownloadLogUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/jobs/logs/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateIsPauseUsingPUT(
        headers: HeaderupdateIsPauseUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/jobs/{id}`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public testLimitUsingGET(
        headers: HeadertestLimitUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/limit`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getLocalStoragesUsingGET(
        querys: QuerygetLocalStoragesUsingGET,
        headers: HeadergetLocalStoragesUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/localStorage`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_8(
        querys: QuerycreateUsingPOST_8,
        headers: HeadercreateUsingPOST_8,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/localStorage`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_8(
        headers: HeaderupdateUsingPUT_8,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/localStorage`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteAllUsingDELETE_1(
        headers: HeaderdeleteAllUsingDELETE_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/localStorage`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_8(
        querys: QuerydownloadUsingGET_8,
        headers: HeaderdownloadUsingGET_8,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/localStorage/download`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getLogsUsingGET(
        querys: QuerygetLogsUsingGET,
        headers: HeadergetLogsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/logs`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public delAllByErrorUsingDELETE(
        headers: HeaderdelAllByErrorUsingDELETE,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/logs/del/error`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public delAllByInfoUsingDELETE(
        headers: HeaderdelAllByInfoUsingDELETE,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/logs/del/info`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_9(
        querys: QuerydownloadUsingGET_9,
        headers: HeaderdownloadUsingGET_9,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/logs/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getErrorLogsUsingGET_1(
        querys: QuerygetErrorLogsUsingGET_1,
        headers: HeadergetErrorLogsUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/logs/error`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public errorDownloadUsingGET(
        querys: QueryerrorDownloadUsingGET,
        headers: HeadererrorDownloadUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/logs/error/download`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getErrorLogsUsingGET(
        headers: HeadergetErrorLogsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/logs/error/{id}`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUserLogsUsingGET(
        querys: QuerygetUserLogsUsingGET,
        headers: HeadergetUserLogsUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/logs/user`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getMenusUsingGET(
        querys: QuerygetMenusUsingGET,
        headers: HeadergetMenusUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/menus`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_9(
        headers: HeadercreateUsingPOST_9,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/menus`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_9(
        headers: HeaderupdateUsingPUT_9,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/menus`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_8(
        headers: HeaderdeleteUsingDELETE_8,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/menus`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public buildMenusUsingGET(
        headers: HeaderbuildMenusUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/menus/build`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_10(
        querys: QuerydownloadUsingGET_10,
        headers: HeaderdownloadUsingGET_10,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/menus/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getMenuTreeUsingGET(
        headers: HeadergetMenuTreeUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/menus/tree`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getRolesUsingGET(
        querys: QuerygetRolesUsingGET,
        headers: HeadergetRolesUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/pictures`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public uploadUsingPOST_2(
        headers: HeaderuploadUsingPOST_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/pictures`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteAllUsingDELETE_2(
        headers: HeaderdeleteAllUsingDELETE_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/pictures`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_12(
        querys: QuerydownloadUsingGET_12,
        headers: HeaderdownloadUsingGET_12,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/pictures/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public synchronizeUsingPOST(
        headers: HeadersynchronizeUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/pictures/synchronize`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getRolesUsingGET_1(
        querys: QuerygetRolesUsingGET_1,
        headers: HeadergetRolesUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/qiNiuContent`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public uploadUsingPOST_3(
        headers: HeaderuploadUsingPOST_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/qiNiuContent`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteAllUsingDELETE_3(
        headers: HeaderdeleteAllUsingDELETE_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/qiNiuContent`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUsingGET_3(
        headers: HeadergetUsingGET_3,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/config`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public emailConfigUsingPUT_2(
        headers: HeaderemailConfigUsingPUT_2,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/config`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_14(
        querys: QuerydownloadUsingGET_14,
        headers: HeaderdownloadUsingGET_14,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/download`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_13(
        headers: HeaderdownloadUsingGET_13,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/download/{id}`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public synchronizeUsingPOST_1(
        headers: HeadersynchronizeUsingPOST_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/synchronize`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_10(
        headers: HeaderdeleteUsingDELETE_10,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(
                `${this.nginx_uri}/api/qiNiuContent/{id}`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getRolesUsingGET_3(
        querys: QuerygetRolesUsingGET_3,
        headers: HeadergetRolesUsingGET_3,
        config?: AxiosRequestConfig
    ): Promise<PageDtoRoleDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoRoleDto>(`${this.nginx_uri}/api/roles`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_11(
        headers: HeadercreateUsingPOST_11,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/roles`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_11(
        headers: HeaderupdateUsingPUT_11,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/roles`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_12(
        headers: HeaderdeleteUsingDELETE_12,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/roles`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getAllUsingGET_1(
        querys: QuerygetAllUsingGET_1,
        headers: HeadergetAllUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/roles/all`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_16(
        querys: QuerydownloadUsingGET_16,
        headers: HeaderdownloadUsingGET_16,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/roles/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getLevelUsingGET(
        headers: HeadergetLevelUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/roles/level`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateMenuUsingPUT(
        headers: HeaderupdateMenuUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/roles/menu`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getRolesUsingGET_2(
        headers: HeadergetRolesUsingGET_2,
        config?: AxiosRequestConfig
    ): Promise<RoleDto> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<RoleDto>(`${this.nginx_uri}/api/roles/{id}`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getServersUsingGET(
        querys: QuerygetServersUsingGET,
        headers: HeadergetServersUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/server`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_12(
        headers: HeadercreateUsingPOST_12,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/server`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_12(
        headers: HeaderupdateUsingPUT_12,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/server`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_13(
        headers: HeaderdeleteUsingDELETE_13,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/server`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getServersUsingGET_1(
        querys: QuerygetServersUsingGET_1,
        headers: HeadergetServersUsingGET_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/serverDeploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_13(
        headers: HeadercreateUsingPOST_13,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/serverDeploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_13(
        headers: HeaderupdateUsingPUT_13,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/serverDeploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_14(
        headers: HeaderdeleteUsingDELETE_14,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/serverDeploy`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_17(
        querys: QuerydownloadUsingGET_17,
        headers: HeaderdownloadUsingGET_17,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(
                `${this.nginx_uri}/api/serverDeploy/download`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public testConnectUsingPOST_1(
        headers: HeadertestConnectUsingPOST_1,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/serverDeploy/testConnect`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUsersUsingGET(
        querys: QuerygetUsersUsingGET,
        headers: HeadergetUsersUsingGET,
        config?: AxiosRequestConfig
    ): Promise<PageDtoUserDto> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<PageDtoUserDto>(`${this.nginx_uri}/api/users`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_14(
        headers: HeadercreateUsingPOST_14,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/users`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateUsingPUT_14(
        headers: HeaderupdateUsingPUT_14,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/users`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_15(
        headers: HeaderdeleteUsingDELETE_15,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/api/users`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public centerUsingPUT(
        headers: HeadercenterUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/users/center`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_18(
        querys: QuerydownloadUsingGET_18,
        headers: HeaderdownloadUsingGET_18,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/users/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public resetPwdUsingPUT(
        headers: HeaderresetPwdUsingPUT,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .put<NullObject>(`${this.nginx_uri}/api/users/resetPwd`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateAvatarUsingPOST(
        headers: HeaderupdateAvatarUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/users/updateAvatar`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updateEmailUsingPOST(
        headers: HeaderupdateEmailUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(
                `${this.nginx_uri}/api/users/updateEmail/{code}`,
                config
            )
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public updatePassUsingPOST(
        headers: HeaderupdatePassUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/users/updatePass`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUsingGET_4(
        headers: HeadergetUsingGET_4,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/visits`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public createUsingPOST_15(
        headers: HeadercreateUsingPOST_15,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/api/visits`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getChartDataUsingGET(
        headers: HeadergetChartDataUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/api/visits/chartData`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getCodeUsingGET(
        headers: HeadergetCodeUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/auth/code`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getUserInfoUsingGET(
        headers: HeadergetUserInfoUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/auth/info`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public loginUsingPOST(
        headers: HeaderloginUsingPOST,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .post<NullObject>(`${this.nginx_uri}/auth/login`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public logoutUsingDELETE(
        headers: HeaderlogoutUsingDELETE,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/auth/logout`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public getAllUsingGET(
        querys: QuerygetAllUsingGET,
        headers: HeadergetAllUsingGET,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/auth/online`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public deleteUsingDELETE_9(
        headers: HeaderdeleteUsingDELETE_9,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .delete<NullObject>(`${this.nginx_uri}/auth/online`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }

    public downloadUsingGET_11(
        querys: QuerydownloadUsingGET_11,
        headers: HeaderdownloadUsingGET_11,
        config?: AxiosRequestConfig
    ): Promise<NullObject> {
        if (!config) {
            config = {};
        }
        config["params"] = { ...config["params"], ...querys };
        config["headers"] = { ...config["headers"], ...headers };

        return axios
            .get<NullObject>(`${this.nginx_uri}/auth/online/download`, config)
            .then(rsp => {
                this.CheckError(rsp);
                return rsp.data;
            });
    }
}

declare const apis: swaggerApi;

export default apis;
