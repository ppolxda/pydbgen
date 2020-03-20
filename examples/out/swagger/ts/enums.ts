
// EnumCityLevel
// * NONE: 无效枚举值
// * COUNTRY: 国家/地区
// * PROV: 省/直辖市
// * CITY: 市
// * COUNTY: 县/县级市
// * TOWN: 镇
// * VILLAGE: 乡/村
export enum EnumCityLevel {
    NONE = 0,
    COUNTRY = 1,
    PROV = 2,
    CITY = 3,
    COUNTY = 4,
    TOWN = 5,
    VILLAGE = 6,
}

// EnumCityLevel
// * NONE: 无效枚举值
// * COUNTRY: 国家/地区
// * PROV: 省/直辖市
// * CITY: 市
// * COUNTY: 县/县级市
// * TOWN: 镇
// * VILLAGE: 乡/村
export const EnumCityLevelTranslate = {
    NONE: '无效枚举值',
    COUNTRY: '国家/地区',
    PROV: '省/直辖市',
    CITY: '市',
    COUNTY: '县/县级市',
    TOWN: '镇',
    VILLAGE: '乡/村',
}

// EnumIdentityType
// * NONE: 无效枚举值
// * COMPANY: 公司
// * PERSON: 个人
export enum EnumIdentityType {
    NONE = 0,
    COMPANY = 1,
    PERSON = 2,
}

// EnumIdentityType
// * NONE: 无效枚举值
// * COMPANY: 公司
// * PERSON: 个人
export const EnumIdentityTypeTranslate = {
    NONE: '无效枚举值',
    COMPANY: '公司',
    PERSON: '个人',
}

// EnumConsignorProperty
// * NONE: 无效枚举值
// * LOGISTICS_COMPANY: 物流公司
// * DISTRIBUTOR: 经销商
// * PERSON: 个人
// * OTHER: 其他
export enum EnumConsignorProperty {
    NONE = 0,
    LOGISTICS_COMPANY = 1,
    DISTRIBUTOR = 2,
    PERSON = 3,
    OTHER = 4,
}

// EnumConsignorProperty
// * NONE: 无效枚举值
// * LOGISTICS_COMPANY: 物流公司
// * DISTRIBUTOR: 经销商
// * PERSON: 个人
// * OTHER: 其他
export const EnumConsignorPropertyTranslate = {
    NONE: '无效枚举值',
    LOGISTICS_COMPANY: '物流公司',
    DISTRIBUTOR: '经销商',
    PERSON: '个人',
    OTHER: '其他',
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
export enum EnumDataScope {
    NONE = 0,
    ALL = 1,
    SELF_DEPT = 2,
    SELF_AND_CHILDREN = 3,
    SELF_REGION = 4,
    SELF_REGION_AND_CHILDREN = 5,
    SELF_COMPANY = 6,
    SELF_COMPANY_AND_CHILDREN = 7,
    CUSTOM = 8,
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
    NONE: '无效枚举值',
    ALL: '全部',
    SELF_DEPT: '本部门',
    SELF_AND_CHILDREN: '本部门及以下',
    SELF_REGION: '本区域',
    SELF_REGION_AND_CHILDREN: '本区域及以下',
    SELF_COMPANY: '本公司',
    SELF_COMPANY_AND_CHILDREN: '本公司及以下',
    CUSTOM: '自定义',
}

