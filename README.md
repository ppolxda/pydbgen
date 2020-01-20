# pydbgen

## install

```bash
 pip3 install git+https://github.com/ppolxda/pydbgen
```

## gen Database proto

### gen json

```bash
pydbgen -I./ --pydbjson_out=./examples/out ./examples/database_example.proto
```

### gen mysql init script

```bash
pydbgen -I./ --pydbmysql_out=./examples/out ./examples/database_example.proto
```

### gen pgsql init script

```bash
pydbgen -I./ --pydbpgsql_out=./examples/out ./examples/database_example.proto
```

### gen mongodb init script

```bash
pydbgen -I./ --pydbmongo_out=./examples/out ./examples/database_example.proto
```

### gen code init script

```bash
export DB_TMLP=./examples/code_tmpl
export DB_CONFIG={tmpl}/gen_code.json
pydbgen -I./ --pydbtmpl_out=./examples/out ./examples/database_example.proto
```

### Table define

```protobuf
syntax = "proto3";

// package account;

import "pydbgen/dbbase/data_define.proto";


// user_info define
message user_info {
    option (msg_type) = TABLE;

    int32 userId = 1 [(key)=true, (inc)=true];
    string loginCode = 2 [(maxlen)=32];
    string userName = 4 [(maxlen)=16];
    string nikeName = 5 [(maxlen)=16];
    string phone = 6 [(maxlen)=16];
    string email = 7 [(maxlen)=32];
    jsonb others = 15 [(maxlen)=256, (defval)="{}"];

    message t_sharding_key {
        option (msg_type) = INDEX;
        option (index_type) = SHARDING_KEY;
        option (is_unique) = true;

        int32 userId = 1[(sort)=HASHED];
    }

    message logincode_unique {
        option (msg_type) = INDEX;
        option (index_type) = UNIQUE_KEY;
        string loginCode = 1;
    }

    message phone_index {
        option (msg_type) = INDEX;
        option (index_type) = INDEX_KEY;
        string phone = 1;
    }
}


// user_info define
message order {
    option (msg_type) = TABLE;

    int32 oderId = 1 [(key)=true, (inc)=true];
    datetime orderTime = 2;
    int32 userId = 3;
    string symbol = 4[(maxlen)=16];
    float qty = 5[(declen)=32, (decpoint)=8];


    message t_sharding_key {
        option (msg_type) = INDEX;
        option (index_type) = SHARDING_KEY;
        option (is_unique) = true;

        int32 oderId = 1[(sort)=DESC];
    }

    message order_sharding {
        option (msg_type) = INDEX;
        option (index_type) = INDEX_KEY;
        string userId = 1[(sort)=DESC];
    }
}


// TABLESPACES
message user_spaces {
    option (msg_type) = TABLESPACE;
    option (location) = "/var/tables/user_spaces";
}


// table_group1
message table_group1 {
    option (msg_type) = TABLE_GROUP;

    user_info user_info = 1[(space)='user_spaces'];
}


// users
message users {
    option (msg_type) = DATABASE;

    table_group1 table_group1 = 1;
}


// trade
message trade {
    option (msg_type) = DATABASE;

    user_info user_info = 1[(sharding_mode)=SM_ENABLE, (sharding_key)='userId'];
    order order = 2[(sharding_mode)=SM_PARTITION_DAY, (sharding_key)='orderTime'];
}


// test
message trade_temp {
    option (msg_type) = DATABASE;

    user_info user_info = 1[(is_temp)=true];
    order order = 2[(is_temp)=true];
}


// output
message output {
    option (msg_type) = OUTPUT;

    users users = 1;
    trade trade = 2[(sharding_mode)=SM_RANGE_QUARTER, (sharding_date_begin)='20190101', (sharding_date_end)='20200101'];
    trade_temp trade_temp = 3;
}
```

## gen Restful proto

### gen Insomnia Config

```bash
pydbgen -I./ --rfcjson_out=./examples/out ./examples/rest_client.proto
```

### gen TypeScript Code

```bash
pydbgen -I./ --rfcts_out=./examples/out ./examples/rest_client.proto
```

### Restful Api define

```protobuf
syntax = "proto3";

import "pydbgen/restful/restful.proto";

option (workspace_name) = "test_workspace";
option (project_name) = "test_ptoject";
option (env_name) = "test_env";
option (domain_key) = "test_domain";
option (domain) = "http://localhost:50000";

//  ----------------------------------------------
//              Common Define
//  ----------------------------------------------

message NullReq {}
message NullRsp { Error error = 1; }
message NullQuery {}
message NullHeader {}

message Error {
  int32 error = 1;
  string error_text = 2;
}

message DefaultQuery {
  string where = 1 [ (maxlen) = 1024, (minlen) = 0 ];
  string sort = 2 [ (maxlen) = 1024, (minlen) = 0 ];
  string csv = 3 [ (maxlen) = 1024, (minlen) = 0 ];
  string show = 4 [ (maxlen) = 1024, (minlen) = 0 ];
}

message DefaultHeader { string token = 1; }

//  ----------------------------------------------
//              create user
//  ----------------------------------------------

enum EnumSexType {
  NONE = 0;
  MALE = 1;
  FEMALE = 2;
}

message Contact {
  string phone = 1
      [ (maxlen) = 50, (minlen) = 1, (regex) = "^+([0-9]{1,}) ([0-9]{6,})$" ];
  string email = 2 [
    (maxval) = 200,
    (minval) = 1,
    (regex) = "^((?!\\.)[\\w\\-_.]*[^.])(@\\w+)(\\.\\w+(\\.\\w+)?[^.\\W])$"
  ];
}

message CreateUserReq {

  message IdCard {
    string cardno = 1 [ (maxlen) = 50, (minlen) = 1 ];
    string cardtype = 2 [ (maxlen) = 50, (minlen) = 1 ];
  }

  string username = 1 [ (maxlen) = 50, (minlen) = 1 ];
  int32 age = 2 [ (maxval) = 200, (minval) = 1 ];
  EnumSexType sex = 3;
  Contact contact = 4;
  IdCard card = 5;
}

message CreateUserQuery {
  bool is_debug = 1;
  int32 rnd = 2;
}

message CreateUserHttp {
  option (rmsg) = MAPI;
  option (ruri) = "/user/create";
  option (rpath) = "/oauth/user/create_user";
  option (rmethod) = MPOST;
  option (rbody) = BJSON;

  CreateUserReq req_body = 1;
  NullRsp rsp_body = 2;
  CreateUserQuery querys = 3;
  DefaultHeader headers = 4;
}

//  ----------------------------------------------
//              query user
//  ----------------------------------------------

message Users {
  int32 userid = 1 [ (minval) = 1 ];
  string username = 2 [ (maxlen) = 50, (minlen) = 1 ];
  int32 age = 3;
  EnumSexType sex = 4;
}

message GetUsersRsp {
  Error error = 1;
  repeated Users datas = 2;
}

message GetUserHttp {
  option (rmsg) = MAPI;
  option (ruri) = "/user/users";
  option (rpath) = "/oauth/user/get_users";
  option (rmethod) = MGET;
  option (rbody) = BJSON;

  NullReq req_body = 1;
  GetUsersRsp rsp_body = 2;
  DefaultQuery querys = 3;
  NullHeader headers = 4;
}
```
