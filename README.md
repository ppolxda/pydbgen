# pydbgen

## install

```bash
 pip3 install git+https://github.com/ppolxda/pydbgen
```

## gen proto

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
