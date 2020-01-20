<%
    import copy
    def get_default_field2(data):
        val = get_default_field(DATA_MAP, data)
        return val if val else '--'

    def loop_enums(_data):
        for data in _data['fields'].values():
            if data['type'] == 'message':
                fclass = DATA_MAP[data['options']['type_name']]
                yield from loop_enums(fclass)

            elif data['type'] == 'enum':
                fclass = ENUM_MAP[data['options']['type_name']]
                fclass = copy.deepcopy(fclass)
                for key, val in fclass['fields'].items():
                    fclass['fields'][key] = val['value']

                fclass.pop('options')
                fclass.pop('enums')
                fclass.pop('nesteds')
                yield (data['options']['type_name'], fclass)

    def loop_msgs(_data):

        for data in _data['fields'].values():
            if data['type'] == 'message':
                fclass = DATA_MAP[data['options']['type_name']]
                yield (data['options']['type_name'], fclass)
                yield from loop_msgs(fclass)

    def get_depends(data):
        return {
           'enums': {
                key: val
                for key, val in loop_enums(data)
            },
            'class': {
                key: val
                for key, val in loop_msgs(data)
            },
        }


    def table_type(data, ignore_list=False):
        repeated = data['options']['label'] == 'repeated'
        if not ignore_list and repeated:
            return 'array[{}]'.format(table_type(data, True))

        elif data['type'] == 'message':
            return data['options']['type_name']

        else:
            return data['type']

    def table_conv(data, prefix=''):
        ## raise TypeError(json_dumps(data))
        ignore_list = ["label", "type_name", "extendee", "default_value", "json_name"]
        opts = ','.join([
            '{}={}'.format(key, val)
            for key, val in filter(lambda x: x[0] not in ignore_list, data['options'].items())
        ])

        field_name = '.'.join([prefix, data['name']]) if prefix else data['name']

        yield ('| ' + ' | '.join([
            field_name,
            table_type(data),
            str(data['options'].get('optional', False)),
            get_default_field2(data),
            data['comment'] if data['comment'] else '--',
            opts if opts else '--',
        ]) + ' |')


        if data['type'] == 'message':
            fclass = DATA_MAP[data['options']['type_name']]
            for i in fclass['fields'].values():
                for line in table_conv(i, field_name):
                    yield line

    def tables_conv(datas, prefix=''):
        ## raise TypeError(datas)
        return '\n'.join([
            line for i in datas.values()
            for line in table_conv(i, prefix)
        ])

    def tables2json_conv(datas):
        ## raise TypeError(datas)
        return {
            i['name']: get_default(DATA_MAP, i)
            for i in datas.values()
        }
%>
${ '##' }  Api description

${mkdata['options']['rmethod'][1:]} ${ mkdata['options']['ruri'][1:] }

${ mkdata['comment'] if mkdata['comment'] else '-----' }

% if querys:

${ '##' }  Http Query Parames Request

| name | type | required | default | memo | other |
| :--- | :--: | :------: | :------ | :--- | :---- |
${ tables_conv(querys) }

% endif

% if headers:

${ '##' }  Http Headers Parames Request

| name | type | required | default | memo | other |
| :--- | :--: | :------: | :------ | :--- | :---- |
${ tables_conv(headers) }

% endif

${ '##' }  Http Body Parames Request

| name | type | required | default | memo | other |
| :--- | :--: | :------: | :------ | :--- | :---- |
${ tables_conv(req_body) }

${ '##' }  Http Body Parames Response

| name | type | required | default | memo | other |
| :--- | :--: | :------: | :------ | :--- | :---- |
${ tables_conv(rsp_body) }

${ '##' }  Http Body Parames Request Json

```json
${ json_dumps(tables2json_conv(req_body), indent=4) }
```

${ '##' }  Http Body Parames Response Json

```json
${ json_dumps(tables2json_conv(rsp_body), indent=4) }
```

${ '##' }  Http Body Parames Request Depend Json

```json
${ json_dumps(get_depends({'fields': req_body}), indent=4) }
```

${ '##' }  Http Body Parames Response Depend Json

```json
${ json_dumps(get_depends({'fields': rsp_body}), indent=4) }
```

% if mkdata['options']['rmethod'][1:] == 'GET':

${ '##' } Query Desc

Http Get Query Parames Request
where: Query Condition,use mongo stype parames
page: Query Page, Step or limit
sort: Query Srot

${ '###' } Where Query Condition, use mongo stype parames

https://docs.mongodb.com/manual/reference/operator/query/

${ '####' } Where example

SQL Stype

```sql
key1=value1 and
key2=value2 and
key3 in (a,b,c) and
key4 > 0 and
key5 >= 0 and
key6 < 0 and
key7 <= 0 and
key8 <> 0 and
key9 like 'abc%' and
key10 between '1900-01-01' and '1900-01-02' and
key11 not in (a,b,c) and
```

SQL Stype to Mongo Stype JSON

```json
{
    "key1": "value1",
    "key2": "value2",
    "key3": { "$in": [a, b, c] },
    "key4": { "$gt": 0 },
    "key5": { "$gte": 0 },
    "key6": { "$lt": 0 },
    "key7": { "$lte": 0 },
    "key8": { "$ne": 0 },
    "key9": { "$like": "abc%" },
    "key10": { "$between": ["1900-01-01", "1900-01-02"] },
    "key11": { "$nin": [a, b, c] }
}
```

${ '###' } Page json

max limit 500

limit = [0, 100] --- [step, limit]

${ '###' } Sort json

sorts = {'key1': 'desc', 'key2': 'asc'}

% endif
