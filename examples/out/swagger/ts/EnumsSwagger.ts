
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

