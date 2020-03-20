
import axios, { AxiosRequestConfig } from "axios";
import * as types from "./types";

export function _(val: string): string {
    return val;
}

// ----------------------------------------------
//        Api define
// ----------------------------------------------

export abstract class BaseApi {
  private basePath = "";

  constructor(basePath: string) {
    this.basePath = basePath;
  }

  
  public indexUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IAlipayConfig> {
    return axios
      .get<types.IAlipayConfig>(
          `${this.basePath}/api/aliPay`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public payConfigUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/aliPay`, req, config
      ).then(rsp => rsp.data);
  }

  
  public toPayAsPcUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/aliPay/toPayAsPC`, req, config
      ).then(rsp => rsp.data);
  }

  
  public toPayAsWebUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/aliPay/toPayAsWeb`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getAppsUsingGET(params: types.QuerygetAppsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/app`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/app`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/app`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET(params: types.QuerydownloadUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/app/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getAreasUsingGET(params: types.QuerygetAreasUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoAreaDto> {
    return axios
      .get<types.IPageDtoAreaDto>(
          `${this.basePath}/api/area`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/area`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/area`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_1(params: types.QuerydownloadUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/area/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public resetPassUsingPOST(req: types.INullObject, params: types.QueryresetPassUsingPOST, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/code/email/resetPass`, req, config
      ).then(rsp => rsp.data);
  }

  
  public resetEmailUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/code/resetEmail`, req, config
      ).then(rsp => rsp.data);
  }

  
  public validatedUsingGET(params: types.QueryvalidatedUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/code/validated`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getConsignorsUsingGET(params: types.QuerygetConsignorsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/consignor`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_2(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/consignor`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_2(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/consignor`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_1(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_2(params: types.QuerydownloadUsingGET_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/consignor/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDatabasesUsingGET(params: types.QuerygetDatabasesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/database`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_3(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_3(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/database`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_1(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_3(params: types.QuerydownloadUsingGET_3, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/database/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public testConnectUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database/testConnect`, req, config
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/database/upload`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDeploysUsingGET(params: types.QuerygetDeploysUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deploy`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_4(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_4(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/deploy`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_2(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_4(params: types.QuerydownloadUsingGET_4, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deploy/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public serverReductionUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/serverReduction`, req, config
      ).then(rsp => rsp.data);
  }

  
  public serverStatusUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/serverStatus`, req, config
      ).then(rsp => rsp.data);
  }

  
  public startServerUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/startServer`, req, config
      ).then(rsp => rsp.data);
  }

  
  public stopServerUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/stopServer`, req, config
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/deploy/upload`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDeployHistorysUsingGET(params: types.QuerygetDeployHistorysUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deployHistory`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_3(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_5(params: types.QuerydownloadUsingGET_5, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/deployHistory/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDeptsUsingGET(params: types.QuerygetDeptsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_5(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dept`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_5(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dept`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_4(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getDeptsByPidUsingGET(params: types.QuerygetDeptsByPidUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept/byPid`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_6(params: types.QuerydownloadUsingGET_6, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dept/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDeptsByPropsUsingGET(params: types.QuerygetDeptsByPropsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoDeptDto> {
    return axios
      .get<types.IPageDtoDeptDto>(
          `${this.basePath}/api/dept/props`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDictsUsingGET(params: types.QuerygetDictsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_6(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dict`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_6(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dict`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_5(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public allUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict/all`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_7(params: types.QuerydownloadUsingGET_7, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dict/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getDictDetailsUsingGET(params: types.QuerygetDictDetailsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dictDetail`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_7(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/dictDetail`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_7(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/dictDetail`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getDictDetailMapsUsingGET(params: types.QuerygetDictDetailMapsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/dictDetail/map`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_6(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getUsingGET_1(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/email`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public sendUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/email`, req, config
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/email`, req, config
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/genConfig`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET_2(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/genConfig/{tableName}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public saveUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/generator`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET(params: types.QuerygetTablesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/columns`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public syncUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/generator/sync`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET_2(params: types.QuerygetTablesUsingGET_2, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/tables`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getTablesUsingGET_1(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/generator/tables/all`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public generatorUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/generator/{tableName}/{type}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getJobsUsingGET(params: types.QuerygetJobsUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoJobDto> {
    return axios
      .get<types.IPageDtoJobDto>(
          `${this.basePath}/api/job`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_8(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IJobDto> {
    return axios
      .post<types.IJobDto>(
          `${this.basePath}/api/job`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_8(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/job`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_7(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_8(params: types.QuerydownloadUsingGET_8, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/job/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getJobsUsingGET_1(params: types.QuerygetJobsUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_11(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/jobs`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_11(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_11(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_16(params: types.QuerydownloadUsingGET_16, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public executionUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs/exec/{id}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getJobLogsUsingGET(params: types.QuerygetJobLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/logs`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadLogUsingGET(params: types.QuerydownloadLogUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/jobs/logs/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public updateIsPauseUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/jobs/{id}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public testLimitUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/limit`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLocalStoragesUsingGET(params: types.QuerygetLocalStoragesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/localStorage`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_9(req: types.INullObject, params: types.QuerycreateUsingPOST_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/localStorage`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_9(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/localStorage`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_2(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_9(params: types.QuerydownloadUsingGET_9, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/localStorage/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLogsUsingGET(params: types.QuerygetLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public delAllByErrorUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public delAllByInfoUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_10(params: types.QuerydownloadUsingGET_10, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getErrorLogsUsingGET_1(params: types.QuerygetErrorLogsUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public errorDownloadUsingGET(params: types.QueryerrorDownloadUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getErrorLogsUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/error/{id}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUserLogsUsingGET(params: types.QuerygetUserLogsUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/logs/user`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getMenusUsingGET(params: types.QuerygetMenusUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_10(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/menus`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_10(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/menus`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_8(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public buildMenusUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/build`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_11(params: types.QuerydownloadUsingGET_11, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getMenuTreeUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/menus/tree`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET(params: types.QuerygetRolesUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/pictures`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_2(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/pictures`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_3(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_13(params: types.QuerydownloadUsingGET_13, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/pictures/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public synchronizeUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/pictures/synchronize`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_1(params: types.QuerygetRolesUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public uploadUsingPOST_3(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/qiNiuContent`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_4(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getUsingGET_3(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/config`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public emailConfigUsingPUT_2(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/config`, req, config
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_15(params: types.QuerydownloadUsingGET_15, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_14(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/download/{id}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public synchronizeUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/qiNiuContent/synchronize`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_10(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_3(params: types.QuerygetRolesUsingGET_3, config: AxiosRequestConfig = {}): Promise<types.IPageDtoRoleDto> {
    return axios
      .get<types.IPageDtoRoleDto>(
          `${this.basePath}/api/roles`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_12(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/roles`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_12(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/roles`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_12(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllUsingGET_1(params: types.QuerygetAllUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/all`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_17(params: types.QuerydownloadUsingGET_17, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getLevelUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/roles/level`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public updateMenuUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/roles/menu`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getRolesUsingGET_2(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IRoleDto> {
    return axios
      .get<types.IRoleDto>(
          `${this.basePath}/api/roles/{id}`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getServersUsingGET(params: types.QuerygetServersUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/server`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_13(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/server`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_13(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/server`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_13(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getServersUsingGET_1(params: types.QuerygetServersUsingGET_1, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/serverDeploy`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_14(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/serverDeploy`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_14(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/serverDeploy`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_14(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_18(params: types.QuerydownloadUsingGET_18, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/serverDeploy/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public testConnectUsingPOST_1(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/serverDeploy/testConnect`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsersUsingGET(params: types.QuerygetUsersUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoUserDto> {
    return axios
      .get<types.IPageDtoUserDto>(
          `${this.basePath}/api/users`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_15(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_15(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_15(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public centerUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users/center`, req, config
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_19(params: types.QuerydownloadUsingGET_19, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/users/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUsersByIdUsingGET(params: types.QuerygetUsersByIdUsingGET, config: AxiosRequestConfig = {}): Promise<types.IPageDtoUserDto> {
    return axios
      .get<types.IPageDtoUserDto>(
          `${this.basePath}/api/users/id`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public resetPwdUsingPUT(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/users/resetPwd`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateAvatarUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updateAvatar`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateEmailUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updateEmail/{code}`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updatePassUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/users/updatePass`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getUsingGET_4(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/visits`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_16(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/visits`, req, config
      ).then(rsp => rsp.data);
  }

  
  public getChartDataUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/visits/chartData`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getWarehouseinfosUsingGET(params: types.QuerygetWarehouseinfosUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public createUsingPOST_17(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .post<types.INullObject>(
          `${this.basePath}/api/warehouseinfo`, req, config
      ).then(rsp => rsp.data);
  }

  
  public updateUsingPUT_16(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .put<types.INullObject>(
          `${this.basePath}/api/warehouseinfo`, req, config
      ).then(rsp => rsp.data);
  }

  
  public deleteAllUsingDELETE_5(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllWarehouseinfosUsingGET(params: types.QuerygetAllWarehouseinfosUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo/all`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_20(params: types.QuerydownloadUsingGET_20, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/api/warehouseinfo/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getCodeUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.ICaptchaCodeDto> {
    return axios
      .get<types.ICaptchaCodeDto>(
          `${this.basePath}/auth/code`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public getUserInfoUsingGET(params: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IUserDetails> {
    return axios
      .get<types.IUserDetails>(
          `${this.basePath}/auth/info`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public loginUsingPOST(req: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.IAuthInfoDto> {
    return axios
      .post<types.IAuthInfoDto>(
          `${this.basePath}/auth/login`, req, config
      ).then(rsp => rsp.data);
  }

  
  public logoutUsingDELETE(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public getAllUsingGET(params: types.QuerygetAllUsingGET, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/auth/online`, {params, ...config}
      ).then(rsp => rsp.data);
  }

  
  public deleteUsingDELETE_9(data: types.INullObject, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
      return axios
        .delete<types.INullObject>(
          `${this.basePath}/auth/login`, 
          {data, ...config}
        ).then(rsp => rsp.data);
  }

  
  public downloadUsingGET_12(params: types.QuerydownloadUsingGET_12, config: AxiosRequestConfig = {}): Promise<types.INullObject> {
    return axios
      .get<types.INullObject>(
          `${this.basePath}/auth/online/download`, {params, ...config}
      ).then(rsp => rsp.data);
  }

}

declare const apis: BaseApi;
export default apis;
