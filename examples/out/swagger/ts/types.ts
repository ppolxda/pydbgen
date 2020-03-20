
import * as enums from "./enums";

export class INullObject {
}

// ----------------------------------------------
//        body define
// ----------------------------------------------



export interface BodypayConfigUsingPUT {
    alipayconfig: IAlipayConfig; // alipayConfig
}


export interface BodytoPayAsPcUsingPOST {
    trade: ITradeVo; // trade
}


export interface BodytoPayAsWebUsingPOST {
    trade: ITradeVo; // trade
}


export interface BodycreateUsingPOST {
    resources: IApp; // resources
}


export interface BodyupdateUsingPUT {
    resources: IApp; // resources
}


export interface BodydeleteUsingDELETE {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_1 {
    resources: IArea; // resources
}


export interface BodyupdateUsingPUT_1 {
    resources: IArea; // resources
}


export interface BodydeleteAllUsingDELETE {
    req: IDelAreaIds; // req
}


export interface BodyresetEmailUsingPOST {
    code: IVerificationCode; // code
}


export interface BodycreateUsingPOST_2 {
    resources: IConsignor; // resources
}


export interface BodyupdateUsingPUT_2 {
    resources: IConsignor; // resources
}


export interface BodydeleteAllUsingDELETE_1 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_3 {
    resources: IDatabase; // resources
}


export interface BodyupdateUsingPUT_3 {
    resources: IDatabase; // resources
}


export interface BodydeleteUsingDELETE_1 {
    ids: INullObject; // ids
}


export interface BodytestConnectUsingPOST {
    resources: IDatabase; // resources
}


export interface BodycreateUsingPOST_4 {
    resources: IDeploy; // resources
}


export interface BodyupdateUsingPUT_4 {
    resources: IDeploy; // resources
}


export interface BodydeleteUsingDELETE_2 {
    ids: INullObject; // ids
}


export interface BodyserverReductionUsingPOST {
    resources: IDeployHistory; // resources
}


export interface BodyserverStatusUsingPOST {
    resources: IDeploy; // resources
}


export interface BodystartServerUsingPOST {
    resources: IDeploy; // resources
}


export interface BodystopServerUsingPOST {
    resources: IDeploy; // resources
}


export interface BodydeleteUsingDELETE_3 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_5 {
    resources: IDept; // resources
}


export interface BodyupdateUsingPUT_5 {
    resources: IDept; // resources
}


export interface BodydeleteUsingDELETE_4 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_6 {
    resources: IDict; // resources
}


export interface BodyupdateUsingPUT_6 {
    resources: IDict; // resources
}


export interface BodydeleteUsingDELETE_5 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_7 {
    resources: IDictDetail; // resources
}


export interface BodyupdateUsingPUT_7 {
    resources: IDictDetail; // resources
}


export interface BodysendUsingPOST {
    emailvo: IEmailVo; // emailVo
}


export interface BodyemailConfigUsingPUT {
    emailconfig: IEmailConfig; // emailConfig
}


export interface BodyemailConfigUsingPUT_1 {
    genconfig: IGenConfig; // genConfig
}


export interface BodysaveUsingPUT {
    columninfos: INullObject; // columnInfos
}


export interface BodysyncUsingPOST {
    tables: INullObject; // tables
}


export interface BodycreateUsingPOST_8 {
    resources: IJob; // resources
}


export interface BodyupdateUsingPUT_8 {
    resources: IJob; // resources
}


export interface BodydeleteUsingDELETE_7 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_11 {
    resources: IQuartzJob; // resources
}


export interface BodyupdateUsingPUT_11 {
    resources: IQuartzJob; // resources
}


export interface BodydeleteUsingDELETE_11 {
    ids: INullObject; // ids
}


export interface BodyupdateUsingPUT_9 {
    resources: ILocalStorage; // resources
}


export interface BodydeleteAllUsingDELETE_2 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_10 {
    resources: IMenu; // resources
}


export interface BodyupdateUsingPUT_10 {
    resources: IMenu; // resources
}


export interface BodydeleteUsingDELETE_8 {
    ids: INullObject; // ids
}


export interface BodydeleteAllUsingDELETE_3 {
    ids: INullObject; // ids
}


export interface BodydeleteAllUsingDELETE_4 {
    ids: INullObject; // ids
}


export interface BodyemailConfigUsingPUT_2 {
    qiniuconfig: IQiniuConfig; // qiniuConfig
}


export interface BodycreateUsingPOST_12 {
    resources: IRole; // resources
}


export interface BodyupdateUsingPUT_12 {
    resources: IRole; // resources
}


export interface BodydeleteUsingDELETE_12 {
    ids: INullObject; // ids
}


export interface BodyupdateMenuUsingPUT {
    resources: IRole; // resources
}


export interface BodycreateUsingPOST_13 {
    resources: IServer; // resources
}


export interface BodyupdateUsingPUT_13 {
    resources: IServer; // resources
}


export interface BodydeleteUsingDELETE_13 {
    ids: INullObject; // ids
}


export interface BodycreateUsingPOST_14 {
    resources: IServerDeploy; // resources
}


export interface BodyupdateUsingPUT_14 {
    resources: IServerDeploy; // resources
}


export interface BodydeleteUsingDELETE_14 {
    ids: INullObject; // ids
}


export interface BodytestConnectUsingPOST_1 {
    resources: IServerDeploy; // resources
}


export interface BodycreateUsingPOST_15 {
    resources: IUser; // resources
}


export interface BodyupdateUsingPUT_15 {
    resources: IUser; // resources
}


export interface BodydeleteUsingDELETE_15 {
    ids: INullObject; // ids
}


export interface BodycenterUsingPUT {
    resources: IUser; // resources
}


export interface BodyresetPwdUsingPUT {
    resources: IUser; // resources
}


export interface BodyupdateEmailUsingPOST {
    user: IUser; // user
}


export interface BodyupdatePassUsingPOST {
    passvo: IUserPassVo; // passVo
}


export interface BodycreateUsingPOST_17 {
    resources: IWarehouseinfo; // resources
}


export interface BodyupdateUsingPUT_16 {
    resources: IWarehouseinfo; // resources
}


export interface BodydeleteAllUsingDELETE_5 {
    ids: INullObject; // ids
}


export interface BodyloginUsingPOST {
    authuser: IAuthUserDto; // authUser
}


export interface BodydeleteUsingDELETE_9 {
    keys: INullObject; // keys
}

// ----------------------------------------------
//        query define
// ----------------------------------------------



export interface QuerygetAppsUsingGET {
    name: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET {
    name: string;
}


export interface QuerygetAreasUsingGET {
    citylevel: string;
    cname: string;
    code: string;
    enname: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_1 {
    citylevel: string;
    cname: string;
    code: string;
    enname: string;
}


export interface QueryresetPassUsingPOST {
    email: string; // email
}


export interface QueryvalidatedUsingGET {
    code: string;
    id: number;
    scenes: string;
    status: boolean;
    type: string;
    value: string;
}


export interface QuerygetConsignorsUsingGET {
    city: number;
    code: string;
    name: string;
    page: number; // 页码 (0..N)
    province: number;
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_2 {
    city: number;
    code: string;
    name: string;
    province: number;
}


export interface QuerygetDatabasesUsingGET {
    jdbcurl: string;
    name: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_3 {
    jdbcurl: string;
    name: string;
}


export interface QuerygetDeploysUsingGET {
    appname: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_4 {
    appname: string;
}


export interface QuerygetDeployHistorysUsingGET {
    blurry: string;
    deployid: number;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_5 {
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
    pid: number; // pid
    props: number; // props
}


export interface QuerydownloadUsingGET_6 {
    enabled: boolean;
    ids: number[];
    name: string;
    pid: number;
}


export interface QuerygetDeptsByPropsUsingGET {
    props: number; // props
}


export interface QuerygetDictsUsingGET {
    blurry: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_7 {
    blurry: string;
}


export interface QuerygetDictDetailsUsingGET {
    dictname: string;
    label: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerygetDictDetailMapsUsingGET {
    dictname: string;
    label: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerygetTablesUsingGET {
    tablename: string; // tableName
}


export interface QuerygetTablesUsingGET_2 {
    name: string; // name
    page: number; // page
    size: number; // size
}


export interface QuerygetJobsUsingGET {
    enabled: boolean;
    id: number;
    name: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_8 {
    enabled: boolean;
    id: number;
    name: string;
}


export interface QuerygetJobByIdUsingGET {
    id: number; // id
}


export interface QuerygetJobsUsingGET_1 {
    issuccess: boolean;
    jobname: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_16 {
    issuccess: boolean;
    jobname: string;
}


export interface QuerygetJobLogsUsingGET {
    issuccess: boolean;
    jobname: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadLogUsingGET {
    issuccess: boolean;
    jobname: string;
}


export interface QuerygetLocalStoragesUsingGET {
    blurry: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerycreateUsingPOST_9 {
    name: string; // name
}


export interface QuerydownloadUsingGET_9 {
    blurry: string;
}


export interface QuerygetLogsUsingGET {
    blurry: string;
    logtype: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_10 {
    blurry: string;
    logtype: string;
}


export interface QuerygetErrorLogsUsingGET_1 {
    blurry: string;
    logtype: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QueryerrorDownloadUsingGET {
    blurry: string;
    logtype: string;
}


export interface QuerygetUserLogsUsingGET {
    blurry: string;
    logtype: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerygetMenusUsingGET {
    blurry: string;
}


export interface QuerydownloadUsingGET_11 {
    blurry: string;
}


export interface QuerygetRolesUsingGET {
    filename: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
    username: string;
}


export interface QuerydownloadUsingGET_13 {
    filename: string;
    username: string;
}


export interface QuerygetRolesUsingGET_1 {
    key: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_15 {
    key: string;
}


export interface QuerygetRolesUsingGET_3 {
    blurry: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerygetAllUsingGET_1 {
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_17 {
    blurry: string;
}


export interface QuerygetServersUsingGET {
    blurry: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerygetServersUsingGET_1 {
    blurry: string;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_18 {
    blurry: string;
}


export interface QuerygetUsersUsingGET {
    blurry: string;
    deptid: number;
    deptids: number[];
    enabled: boolean;
    id: number;
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_19 {
    blurry: string;
    deptid: number;
    deptids: number[];
    enabled: boolean;
    id: number;
}


export interface QuerygetUsersByIdUsingGET {
    id: number; // id
}


export interface QuerygetWarehouseinfosUsingGET {
    address: string;
    location: string;
    name: string;
    page: number; // 页码 (0..N)
    province: string;
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
    symbols: string;
}


export interface QuerygetAllWarehouseinfosUsingGET {
    address: string;
    location: string;
    name: string;
    province: string;
    symbols: string;
}


export interface QuerydownloadUsingGET_20 {
    address: string;
    location: string;
    name: string;
    province: string;
    symbols: string;
}


export interface QuerygetAllUsingGET {
    filter: string; // filter
    page: number; // 页码 (0..N)
    size: number; // 每页显示的数目
    sort: string[]; // 以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc
}


export interface QuerydownloadUsingGET_12 {
    filter: string; // filter
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

export interface IApp {
    backuppath: string;
    createtime: number;
    deploypath: string;
    deployscript: string;
    id: number;
    name: string;
    port: number;
    startscript: string;
    uploadpath: string;
}

export interface IArea {
    citylevel: enums.EnumCityLevel; // EnumCityLevel * NONE: 无效枚举值 * COUNTRY: 国家/地区 * PROV: 省/直辖市 * CITY: 市 * COUNTY: 县/县级市 * TOWN: 镇 * VILLAGE: 乡/村
    cname: string;
    code: string;
    createtime: number;
    createdby: string;
    enabled: boolean;
    enname: string;
    fullname: string;
    id: number;
    isdelete: boolean;
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
    updatetime: number;
    updatedby: string;
    zoneno: string;
}

export interface IAreaDto {
    children: IAreaDto[];
    citylevel: enums.EnumCityLevel; // EnumCityLevel * NONE: 无效枚举值 * COUNTRY: 国家/地区 * PROV: 省/直辖市 * CITY: 市 * COUNTY: 县/县级市 * TOWN: 镇 * VILLAGE: 乡/村
    cname: string;
    code: string;
    enabled: boolean;
    enname: string;
    fullname: string;
    id: number;
    label: string;
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

export interface IAuthInfoDto {
    token: string;
    user: IJwtUserDto;
}

export interface IAuthUserDto {
    code: string;
    password: string;
    username: string;
    uuid: string;
}

export interface ICaptchaCodeDto {
    img: string;
    uuid: string;
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

export interface IConsignor {
    address: string;
    bankcode: string;
    bankname: string;
    bankuser: string;
    city: IArea;
    code: string;
    comefrom: string;
    createtime: number;
    createdby: string;
    email: string;
    enname: string;
    fax: string;
    id: number;
    identitytype: enums.EnumIdentityType; // EnumIdentityType * NONE: 无效枚举值 * COMPANY: 公司 * PERSON: 个人
    invoicetitle: string;
    isdelete: boolean;
    memo: string;
    name: string;
    phone: string;
    pinyin: string;
    property: enums.EnumConsignorProperty; // EnumConsignorProperty * NONE: 无效枚举值 * LOGISTICS_COMPANY: 物流公司 * DISTRIBUTOR: 经销商 * PERSON: 个人 * OTHER: 其他
    province: IArea;
    py: string;
    recorddate: number;
    shortname: string;
    socialcode: string;
    tax: number;
    tel: string;
    updatetime: number;
    updatedby: string;
    web: string;
    workdate: number;
}

export interface IDatabase {
    createtime: number;
    id: string;
    jdbcurl: string;
    name: string;
    pwd: string;
    username: string;
}

export interface IDelAreaIds {
    ids: number[];
    includechildren: boolean;
}

export interface IDeploy {
    app: IApp;
    createtime: number;
    deploys: IServerDeploy[];
    id: number;
}

export interface IDeployHistory {
    appname: string;
    deploydate: number;
    deployid: number;
    deployuser: string;
    id: string;
    ip: string;
}

export interface IDept {
    createtime: number;
    createdby: string;
    deptinfo: IDeptInfo;
    enabled: boolean;
    id: number;
    isdelete: boolean;
    name: string;
    pid: number;
    props: number;
    updatetime: number;
    updatedby: string;
}

export interface IDeptDto {
    children: IDeptDto[];
    createtime: number;
    deptinfo: IDeptInfoDto;
    enabled: boolean;
    id: number;
    label: string;
    name: string;
    pid: number;
    props: number;
}

export interface IDeptInfo {
    areaid: number;
    businessregno: string;
    createtime: number;
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
    updatetime: number;
    updatedby: string;
    usccode: string;
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

export interface IDeptSmallDto {
    id: number;
    name: string;
}

export interface IDict {
    createtime: number;
    dictdetails: IDictDetail[];
    id: number;
    name: string;
    remark: string;
}

export interface IDictDetail {
    createtime: number;
    dict: IDict;
    id: number;
    label: string;
    sort: number;
    value: string;
}

export interface IEmailConfig {
    fromuser: string;
    host: string;
    id: number;
    pass: string;
    port: string;
    user: string;
}

export interface IEmailVo {
    content: string;
    subject: string;
    tos: string[];
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

export interface IGrantedAuthority {
    authority: string;
}

export interface IJob {
    createtime: number;
    enabled: boolean;
    id: number;
    name: string;
    sort: number;
}

export interface IJobDto {
    createtime: number;
    deptsuperiorname: string;
    enabled: boolean;
    id: number;
    name: string;
    sort: number;
}

export interface IJobSmallDto {
    id: number;
    name: string;
}

export interface IJwtUserDto {
    roles: string[];
    user: IUserDto;
}

export interface ILocalStorage {
    createtime: number;
    id: number;
    name: string;
    operate: string;
    path: string;
    realname: string;
    size: string;
    suffix: string;
    type: string;
}

export interface IMenu {
    cache: boolean;
    component: string;
    componentname: string;
    createtime: number;
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

export interface IMenuDto {
    cache: boolean;
    children: IMenuDto[];
    component: string;
    componentname: string;
    createtime: number;
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

export interface IPageDtoAreaDto {
    content: IAreaDto[];
    totalelements: number;
}

export interface IPageDtoDeptDto {
    content: IDeptDto[];
    totalelements: number;
}

export interface IPageDtoJobDto {
    content: IJobDto[];
    totalelements: number;
}

export interface IPageDtoRoleDto {
    content: IRoleDto[];
    totalelements: number;
}

export interface IPageDtoUserDto {
    content: IUserDto[];
    totalelements: number;
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

export interface IQuartzJob {
    beanname: string;
    createtime: number;
    cronexpression: string;
    id: number;
    ispause: boolean;
    jobname: string;
    methodname: string;
    params: string;
    remark: string;
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

export interface IRole {
    createtime: number;
    depts: IDept[];
    id: number;
    level: number;
    menus: IMenu[];
    name: string;
    permission: string;
    remark: string;
}

export interface IRoleDto {
    createtime: number;
    datascope: string;
    depts: IDeptDto[];
    id: number;
    level: number;
    menus: IMenuDto[];
    name: string;
    permission: string;
    remark: string;
}

export interface IRoleSmallDto {
    datascope: string;
    id: number;
    level: number;
    name: string;
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

export interface IServerDeploy {
    account: string;
    createtime: number;
    id: number;
    ip: string;
    name: string;
    password: string;
    port: number;
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

export interface ITradeVo {
    body: string;
    subject: string;
    totalamount: string;
}

export interface IUser {
    company: IDept;
    createtime: number;
    createdby: string;
    datascope: enums.EnumDataScope; // EnumDataScope * NONE: 无效枚举值 * ALL: 全部 * SELF_DEPT: 本部门 * SELF_AND_CHILDREN: 本部门及以下 * SELF_REGION: 本区域 * SELF_REGION_AND_CHILDREN: 本区域及以下 * SELF_COMPANY: 本公司 * SELF_COMPANY_AND_CHILDREN: 本公司及以下 * CUSTOM: 自定义
    datascopedepts: IDept[];
    dept: IDept;
    email: string;
    enabled: boolean;
    id: number;
    isdelete: boolean;
    job: IJob;
    nickname: string;
    phone: string;
    region: IDept;
    roles: IRole[];
    sex: string;
    updatetime: number;
    updatedby: string;
    useravatar: IUserAvatar;
    userinfo: IUserInfo;
    username: string;
}

export interface IUserAvatar {
    createtime: number;
    id: number;
    path: string;
    realname: string;
    size: string;
}

export interface IUserDetails {
    accountnonexpired: boolean;
    accountnonlocked: boolean;
    authorities: IGrantedAuthority[];
    credentialsnonexpired: boolean;
    enabled: boolean;
    password: string;
    username: string;
}

export interface IUserDto {
    avatar: string;
    company: IDeptSmallDto;
    createtime: number;
    datascope: enums.EnumDataScope; // EnumDataScope * NONE: 无效枚举值 * ALL: 全部 * SELF_DEPT: 本部门 * SELF_AND_CHILDREN: 本部门及以下 * SELF_REGION: 本区域 * SELF_REGION_AND_CHILDREN: 本区域及以下 * SELF_COMPANY: 本公司 * SELF_COMPANY_AND_CHILDREN: 本公司及以下 * CUSTOM: 自定义
    datascopedepts: IDeptSmallDto[];
    dept: IDeptSmallDto;
    email: string;
    enabled: boolean;
    job: IJobSmallDto;
    lastpasswordresettime: string;
    nickname: string;
    phone: string;
    region: IDeptSmallDto;
    resetpwd: string;
    roles: IRoleSmallDto[];
    sex: string;
    userinfo: IUserInfoDto;
    username: string;
}

export interface IUserInfo {
    bankname: string;
    bankno: string;
    createtime: number;
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
    updatetime: number;
    updatedby: string;
    usertype: string;
    yyzzno: string;
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

export interface IUserPassVo {
    newpass: string;
    oldpass: string;
}

export interface IVerificationCode {
    code: string;
    createtime: number;
    id: number;
    scenes: string;
    status: boolean;
    type: string;
    value: string;
}

export interface IWarehouseinfo {
    acreage: number;
    address: string;
    cond: string;
    createtime: number;
    createdby: string;
    flag: boolean;
    floor: string;
    id: number;
    isdelete: boolean;
    isinsured: string;
    latitude: number;
    location: string;
    longitude: number;
    name: string;
    platform: string;
    province: string;
    symbols: string;
    updatetime: number;
    updatedby: string;
    volume: number;
}
