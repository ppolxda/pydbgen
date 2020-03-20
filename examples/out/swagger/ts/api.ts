
import axios, { AxiosRequestConfig } from "axios";
import * as types from "./types";

// ----------------------------------------------
//        Api define
// ----------------------------------------------

export class BaseApi {
  private basePath = "";

  constructor(basePath: string) {
    this.basePath = basePath;
  }

  
  public indexUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IAlipayConfig> {
    let upath = ''
    return axios
      .get<types.IAlipayConfig>(
          `${this.basePath}/api/aliPay${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public payConfigUsingPUT(req: types.BodypayConfigUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/aliPay${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public toPayAsPcUsingPOST(req: types.BodytoPayAsPcUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/aliPay/toPayAsPC${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public toPayAsWebUsingPOST(req: types.BodytoPayAsWebUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/aliPay/toPayAsWeb${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getAppsUsingGET(params: types.QuerygetAppsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/app${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST(req: types.BodycreateUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/app${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT(req: types.BodyupdateUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/app${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE(data: types.BodydeleteUsingDELETE, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/app${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET(params: types.QuerydownloadUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/app/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getAreasUsingGET(params: types.QuerygetAreasUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoAreaDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoAreaDto>(
          `${this.basePath}/api/area${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_1(req: types.BodycreateUsingPOST_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/area${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_1(req: types.BodyupdateUsingPUT_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/area${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE(data: types.BodydeleteAllUsingDELETE, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/area${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_1(params: types.QuerydownloadUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/area/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public resetPassUsingPOST(req: types.INullObject, params: types.QueryresetPassUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/code/email/resetPass${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public resetEmailUsingPOST(req: types.BodyresetEmailUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/code/resetEmail${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public validatedUsingGET(params: types.QueryvalidatedUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/code/validated${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getConsignorsUsingGET(params: types.QuerygetConsignorsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/consignor${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_2(req: types.BodycreateUsingPOST_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/consignor${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_2(req: types.BodyupdateUsingPUT_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/consignor${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_1(data: types.BodydeleteAllUsingDELETE_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/consignor${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_2(params: types.QuerydownloadUsingGET_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/consignor/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDatabasesUsingGET(params: types.QuerygetDatabasesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/database${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_3(req: types.BodycreateUsingPOST_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_3(req: types.BodyupdateUsingPUT_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/database${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_1(data: types.BodydeleteUsingDELETE_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/database${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_3(params: types.QuerydownloadUsingGET_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/database/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public testConnectUsingPOST(req: types.BodytestConnectUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database/testConnect${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database/upload${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDeploysUsingGET(params: types.QuerygetDeploysUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deploy${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_4(req: types.BodycreateUsingPOST_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_4(req: types.BodyupdateUsingPUT_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/deploy${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_2(data: types.BodydeleteUsingDELETE_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/deploy${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_4(params: types.QuerydownloadUsingGET_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deploy/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public serverReductionUsingPOST(req: types.BodyserverReductionUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/serverReduction${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public serverStatusUsingPOST(req: types.BodyserverStatusUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/serverStatus${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public startServerUsingPOST(req: types.BodystartServerUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/startServer${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public stopServerUsingPOST(req: types.BodystopServerUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/stopServer${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/upload${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDeployHistorysUsingGET(params: types.QuerygetDeployHistorysUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deployHistory${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_3(data: types.BodydeleteUsingDELETE_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/deployHistory${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_5(params: types.QuerydownloadUsingGET_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deployHistory/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDeptsUsingGET(params: types.QuerygetDeptsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_5(req: types.BodycreateUsingPOST_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dept${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_5(req: types.BodyupdateUsingPUT_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dept${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_4(data: types.BodydeleteUsingDELETE_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/dept${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getDeptsByPidUsingGET(params: types.QuerygetDeptsByPidUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept/byPid${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_6(params: types.QuerydownloadUsingGET_6, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dept/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDeptsByPropsUsingGET(params: types.QuerygetDeptsByPropsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept/props${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDictsUsingGET(params: types.QuerygetDictsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_6(req: types.BodycreateUsingPOST_6, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dict${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_6(req: types.BodyupdateUsingPUT_6, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dict${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_5(data: types.BodydeleteUsingDELETE_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/dict${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public allUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict/all${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_7(params: types.QuerydownloadUsingGET_7, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDictDetailsUsingGET(params: types.QuerygetDictDetailsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dictDetail${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_7(req: types.BodycreateUsingPOST_7, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dictDetail${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_7(req: types.BodyupdateUsingPUT_7, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dictDetail${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDictDetailMapsUsingGET(params: types.QuerygetDictDetailMapsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dictDetail/map${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_6(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/dictDetail/{id}${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getUsingGET_1(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/email${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public sendUsingPOST(req: types.BodysendUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/email${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT(req: types.BodyemailConfigUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/email${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT_1(req: types.BodyemailConfigUsingPUT_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/genConfig${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET_2(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/genConfig/{tableName}${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public saveUsingPUT(req: types.BodysaveUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/generator${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET(params: types.QuerygetTablesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/columns${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public syncUsingPOST(req: types.BodysyncUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/generator/sync${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET_2(params: types.QuerygetTablesUsingGET_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/tables${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET_1(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/tables/all${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public generatorUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/generator/{tableName}/{type}${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getJobsUsingGET(params: types.QuerygetJobsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoJobDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoJobDto>(
          `${this.basePath}/api/job${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_8(req: types.BodycreateUsingPOST_8, config: AxiosRequestConfig = {}): Promise<types.IJobDto> {
    let upath = ''
    return axios
      .post<types.IJobDto>(
          `${this.basePath}/api/job${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_8(req: types.BodyupdateUsingPUT_8, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/job${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_7(data: types.BodydeleteUsingDELETE_7, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/job${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_8(params: types.QuerydownloadUsingGET_8, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/job/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getJobByIdUsingGET(params: types.QuerygetJobByIdUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoJobDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoJobDto>(
          `${this.basePath}/api/job/id${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getJobsUsingGET_1(params: types.QuerygetJobsUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_11(req: types.BodycreateUsingPOST_11, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/jobs${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_11(req: types.BodyupdateUsingPUT_11, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_11(data: types.BodydeleteUsingDELETE_11, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/jobs${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_16(params: types.QuerydownloadUsingGET_16, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public executionUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs/exec/{id}${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getJobLogsUsingGET(params: types.QuerygetJobLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/logs${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadLogUsingGET(params: types.QuerydownloadLogUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/logs/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public updateIsPauseUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs/{id}${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public testLimitUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/limit${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLocalStoragesUsingGET(params: types.QuerygetLocalStoragesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/localStorage${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_9(req: types.INullObject, params: types.QuerycreateUsingPOST_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/localStorage${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_9(req: types.BodyupdateUsingPUT_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/localStorage${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_2(data: types.BodydeleteAllUsingDELETE_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/localStorage${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_9(params: types.QuerydownloadUsingGET_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/localStorage/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLogsUsingGET(params: types.QuerygetLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public delAllByErrorUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/logs/del/error${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public delAllByInfoUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/logs/del/info${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_10(params: types.QuerydownloadUsingGET_10, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getErrorLogsUsingGET_1(params: types.QuerygetErrorLogsUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public errorDownloadUsingGET(params: types.QueryerrorDownloadUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getErrorLogsUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error/{id}${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUserLogsUsingGET(params: types.QuerygetUserLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/user${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getMenusUsingGET(params: types.QuerygetMenusUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_10(req: types.BodycreateUsingPOST_10, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/menus${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_10(req: types.BodyupdateUsingPUT_10, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/menus${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_8(data: types.BodydeleteUsingDELETE_8, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/menus${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public buildMenusUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/build${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_11(params: types.QuerydownloadUsingGET_11, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getMenuTreeUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/tree${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET(params: types.QuerygetRolesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/pictures${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_2(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/pictures${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_3(data: types.BodydeleteAllUsingDELETE_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/pictures${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_13(params: types.QuerydownloadUsingGET_13, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/pictures/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public synchronizeUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/pictures/synchronize${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_1(params: types.QuerygetRolesUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_3(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/qiNiuContent${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_4(data: types.BodydeleteAllUsingDELETE_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/qiNiuContent${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getUsingGET_3(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/config${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT_2(req: types.BodyemailConfigUsingPUT_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/config${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_15(params: types.QuerydownloadUsingGET_15, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_14(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/download/{id}${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public synchronizeUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/synchronize${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_10(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/{id}${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_3(params: types.QuerygetRolesUsingGET_3, config: AxiosRequestConfig = {}): Promise<types.IPageDtoRoleDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoRoleDto>(
          `${this.basePath}/api/roles${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_12(req: types.BodycreateUsingPOST_12, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/roles${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_12(req: types.BodyupdateUsingPUT_12, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/roles${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_12(data: types.BodydeleteUsingDELETE_12, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/roles${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllUsingGET_1(params: types.QuerygetAllUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/all${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_17(params: types.QuerydownloadUsingGET_17, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getRolesByIdUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IRoleDto> {
    let upath = ''
    return axios
      .get<types.IRoleDto>(
          `${this.basePath}/api/roles/id${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLevelUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/level${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public updateMenuUsingPUT(req: types.BodyupdateMenuUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/roles/menu${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_2(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IRoleDto> {
    let upath = ''
    return axios
      .get<types.IRoleDto>(
          `${this.basePath}/api/roles/{id}${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getServersUsingGET(params: types.QuerygetServersUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/server${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_13(req: types.BodycreateUsingPOST_13, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/server${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_13(req: types.BodyupdateUsingPUT_13, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/server${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_13(data: types.BodydeleteUsingDELETE_13, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/server${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getServersUsingGET_1(params: types.QuerygetServersUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/serverDeploy${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_14(req: types.BodycreateUsingPOST_14, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/serverDeploy${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_14(req: types.BodyupdateUsingPUT_14, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/serverDeploy${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_14(data: types.BodydeleteUsingDELETE_14, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/serverDeploy${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_18(params: types.QuerydownloadUsingGET_18, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/serverDeploy/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public testConnectUsingPOST_1(req: types.BodytestConnectUsingPOST_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/serverDeploy/testConnect${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsersUsingGET(params: types.QuerygetUsersUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoUserDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoUserDto>(
          `${this.basePath}/api/users${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_15(req: types.BodycreateUsingPOST_15, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_15(req: types.BodyupdateUsingPUT_15, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_15(data: types.BodydeleteUsingDELETE_15, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/users${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public centerUsingPUT(req: types.BodycenterUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users/center${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_19(params: types.QuerydownloadUsingGET_19, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/users/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUsersByIdUsingGET(params: types.QuerygetUsersByIdUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoUserDto> {
    let upath = ''
    return axios
      .get<types.IPageDtoUserDto>(
          `${this.basePath}/api/users/id${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public resetPwdUsingPUT(req: types.BodyresetPwdUsingPUT, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users/resetPwd${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateAvatarUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updateAvatar${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateEmailUsingPOST(req: types.BodyupdateEmailUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updateEmail/{code}${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updatePassUsingPOST(req: types.BodyupdatePassUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updatePass${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET_4(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/visits${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_16(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/visits${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getChartDataUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/visits/chartData${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getWarehouseinfosUsingGET(params: types.QuerygetWarehouseinfosUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_17(req: types.BodycreateUsingPOST_17, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/warehouseinfo${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_16(req: types.BodyupdateUsingPUT_16, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/warehouseinfo${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_5(data: types.BodydeleteAllUsingDELETE_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/api/warehouseinfo${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllWarehouseinfosUsingGET(params: types.QuerygetAllWarehouseinfosUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo/all${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_20(params: types.QuerydownloadUsingGET_20, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getCodeUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.ICaptchaCodeDto> {
    let upath = ''
    return axios
      .get<types.ICaptchaCodeDto>(
          `${this.basePath}/auth/code${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUserInfoUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IUserDetails> {
    let upath = ''
    return axios
      .get<types.IUserDetails>(
          `${this.basePath}/auth/info${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public loginUsingPOST(req: types.BodyloginUsingPOST, config: AxiosRequestConfig = {}): Promise<types.IAuthInfoDto> {
    let upath = ''
    return axios
      .post<types.IAuthInfoDto>(
          `${this.basePath}/auth/login${upath}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public logoutUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/logout${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllUsingGET(params: types.QuerygetAllUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/auth/online${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_9(data: types.BodydeleteUsingDELETE_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/online${upath}`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_12(params: types.QuerydownloadUsingGET_12, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    let upath = ''
    return axios
      .get<types.INullObject>(
          `${this.basePath}/auth/online/download${upath}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

}

declare const apis: BaseApi;
export default apis;
