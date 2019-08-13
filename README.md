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
