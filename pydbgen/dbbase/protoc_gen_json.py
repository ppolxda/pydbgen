#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
import six
import json
import argparse
import itertools
from collections import OrderedDict
from google.protobuf.compiler import plugin_pb2 as plugin
from google.protobuf.descriptor_pb2 import FieldOptions
from google.protobuf.descriptor_pb2 import MessageOptions
from google.protobuf.descriptor_pb2 import DescriptorProto
from google.protobuf.descriptor_pb2 import EnumDescriptorProto
# from google.protobuf.descriptor_pb2 import ServiceDescriptorProto
# from google.protobuf.descriptor_pb2 import SourceCodeInfo
from google.protobuf.descriptor import FieldDescriptor
# from google.protobuf import descriptor as _descriptor
from pydbgen.dbbase import data_define_pb2


EnumSortType = data_define_pb2.EnumSortType
EnumShardingMode = data_define_pb2.EnumShardingMode
EnumDefineType = data_define_pb2.EnumDefineType
EnumIsEnable = data_define_pb2.EnumIsEnable
EnumBulkOrdered = data_define_pb2.EnumBulkOrdered
EnumIndexType = data_define_pb2.EnumIndexType
EnumForeignAction = data_define_pb2.EnumForeignAction


# def conv_enums(key, val):
#     EnumDefineType.Name(msg_type)

# MY_MESSAGE_OPTIONS = [
#     data_define_pb2.msg_type,
# ]

# MY_OPTIONS = [
#     data_define_pb2.maxlen,
#     data_define_pb2.minlen,
#     data_define_pb2.maxval,
#     data_define_pb2.minval,
#     data_define_pb2.declen,
#     data_define_pb2.decpoint,
#     data_define_pb2.key,
#     data_define_pb2.inc,
#     data_define_pb2.update,
#     data_define_pb2.defval,
# ]
SHAIDING_RANGE_ID = {'SM_RANGE_ID'}
SHAIDING_RANGE_DATE = {'SM_RANGE_YEAR', 'SM_RANGE_QUARTER',
                       'SM_RANGE_MONTH', 'SM_RANGE_DAY'}
SHAIDING_PARTITION_DATE = {'SM_PARTITION_YEAR', 'SM_PARTITION_QUARTER',
                           'SM_PARTITION_MONTH', 'SM_PARTITION_DAY'}
SHAIDING_PARTITION_ID = {'SM_PARTITION_ID'}
SHAIDING_RANGE = (SHAIDING_RANGE_ID | SHAIDING_RANGE_DATE |
                  SHAIDING_PARTITION_DATE | SHAIDING_PARTITION_ID)


MY_MESSAGE_OPTIONS = [
    getattr(data_define_pb2, key)
    for key in MessageOptions._extensions_by_name.keys()
    if hasattr(data_define_pb2, key)
]

MY_MESSAGE_OPTIONS_NAME = {
    'msg_type': EnumDefineType,
    'index_type': EnumIndexType,
    'foreign_update': EnumForeignAction,
    'foreign_delete': EnumForeignAction,
    'sharding_mode': EnumShardingMode,
    'bulk_ordered': EnumBulkOrdered,
}

MY_OPTIONS = [
    getattr(data_define_pb2, key)
    for key in FieldOptions._extensions_by_name.keys()
    if hasattr(data_define_pb2, key)
]


MY_OPTIONS_NAME = {
    'sharding_mode': EnumShardingMode,
    'bulk_ordered': EnumBulkOrdered,
    'sort': EnumSortType
}

SORT_KEYS = ['type', 'name', 'msg_type', 'database', 'sharding',
             'fields', 'options', 'db_options', 'members']

ROOT_OBJECT = ['ENUMS', 'DATABASES', 'TABLES',
               'TABLE_GROUPS', 'CLASSS', 'TABLESPACES', 'OUTPUTS']


def msg_opts_name(key, val):
    if key not in MY_MESSAGE_OPTIONS_NAME:
        return val
    return MY_MESSAGE_OPTIONS_NAME[key].Name(val)


def field_opts_name(key, val):
    if key not in MY_OPTIONS_NAME:
        return val
    return MY_OPTIONS_NAME[key].Name(val)


TYPE_CHANGE = {
    str(FieldDescriptor.TYPE_DOUBLE): 'double',
    str(FieldDescriptor.TYPE_FLOAT): 'float',
    str(FieldDescriptor.TYPE_INT64): 'int64',
    str(FieldDescriptor.TYPE_UINT64): 'uint64',
    str(FieldDescriptor.TYPE_INT32): 'int32',
    str(FieldDescriptor.TYPE_FIXED64): 'fixed64',
    str(FieldDescriptor.TYPE_FIXED32): 'fixed32',
    str(FieldDescriptor.TYPE_BOOL): 'bool',
    str(FieldDescriptor.TYPE_STRING): 'string',
    str(FieldDescriptor.TYPE_GROUP): 'group',
    str(FieldDescriptor.TYPE_MESSAGE): 'message',
    str(FieldDescriptor.TYPE_BYTES): 'bytes',
    str(FieldDescriptor.TYPE_UINT32): 'uint32',
    str(FieldDescriptor.TYPE_ENUM): 'enum',
    str(FieldDescriptor.TYPE_SFIXED32): 'sfixed32',
    str(FieldDescriptor.TYPE_SFIXED64): 'sfixed64',
    str(FieldDescriptor.TYPE_SINT32): 'sint32',
    str(FieldDescriptor.TYPE_SINT64): 'sint64'
}


LABEL_CHANGE = {
    FieldDescriptor.LABEL_OPTIONAL: 'optional',
    FieldDescriptor.LABEL_REQUIRED: 'required',
    FieldDescriptor.LABEL_REPEATED: 'repeated',
}


LABEL_TABLES = [
    data_define_pb2.DATABASE,
    data_define_pb2.TABLE,
    data_define_pb2.TABLE_GROUP,
    data_define_pb2.CLASS,
    data_define_pb2.TABLESPACE,
    data_define_pb2.OUTPUT
]


LABEL_SUB_TABLES = [
    data_define_pb2.INDEX_KEY,
    data_define_pb2.UNIQUE_KEY,
    data_define_pb2.FOREIGN_KEY,
    data_define_pb2.SHARDING_KEY
]


class EnumPathIndex(object):
    """PROTOC PATH INDEX."""
    NAME = 1
    FIELD = 2
    NESTED = 3
    MESSAGE = 4
    ENUM = 5
    SERVICE = 6


class Cmdoptions(object):

    def __init__(self):
        parser = argparse.ArgumentParser(
            description='pydbgen.dbbase.protoc_gen_json')

        parser.add_argument('-s', '--step_files',
                            type=str,
                            default='pydbgen,google/protobuf',
                            help='step files list(",")')

        parser.add_argument('-o', '--output',
                            type=str,
                            default=None,
                            help='ouput path')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='output encoding(default: utf8)')

        args = parser.parse_args()
        self.output = args.output
        self.encoding = args.encoding
        self.step_files = args.step_files.split(',')


def traverse(proto_file):
    # _locations = locations

    def _traverse(package, items, path=tuple()):
        for index, item in enumerate(items):
            # location.leading_comments
            # location.trailing_comments
            # location.leading_detached_comments
            if isinstance(item, EnumDescriptorProto):
                local_path = (EnumPathIndex.ENUM, index)
                # yield item, package, path + local_path
                yield item, 'ENUMS', path + local_path

            elif isinstance(item, DescriptorProto):
                msg_type = EnumPathIndex.NESTED if path else EnumPathIndex.MESSAGE  # noqa
                local_path = (msg_type, index)
                # yield item, package, path + local_path

                if not item.options.HasExtension(data_define_pb2.msg_type):
                    raise Exception('option msg_type not set'
                                    '[pack:%s][name:%s]' % (
                                        package, item.name))

                msg_type = item.options.Extensions[data_define_pb2.msg_type]
                if msg_type not in LABEL_TABLES:
                    raise Exception('option msg_type error'
                                    '[pack:%s][name:%s][type:%s]' % (
                                        package,
                                        item.name,
                                        EnumDefineType.Name(msg_type)
                                    ))

                package_msg_type = EnumDefineType.Name(msg_type) + 'S'
                yield item, package_msg_type, path + local_path

                nested_package = '%s.%s' % (package_msg_type, item.name)
                for index2, enum in enumerate(item.enum_type):
                    message_path = (EnumPathIndex.ENUM, index2)
                    yield enum, 'ENUMS', path + local_path + message_path

                for index2, nested_item in enumerate(item.nested_type):
                    message_path = (EnumPathIndex.NESTED, index2)

                    if not nested_item.options.HasExtension(
                            data_define_pb2.index_type):
                        raise Exception('option index_type not set'
                                        '[pack:%s][name:%s]' % (
                                            nested_package,
                                            nested_item.name
                                        ))

                    index_type = nested_item.options.Extensions[data_define_pb2.index_type]  # noqa
                    if index_type not in LABEL_SUB_TABLES:
                        raise Exception('option msg_type error'
                                        '[pack:%s][name:%s]'
                                        '[sub_name:%s][type:%s]' % (
                                            nested_package,
                                            item.name,
                                            nested_item.name,
                                            EnumIndexType.Name(index_type)
                                        ))

                    yield (
                        nested_item, nested_package,
                        path + local_path + message_path
                    )

                    if index_type == data_define_pb2.FOREIGN_KEY:
                        f_package = '%s.%s' % (
                            nested_package, nested_item.name
                        )

                        for index3, fitem in enumerate(
                                nested_item.nested_type):
                            f_path = (EnumPathIndex.NESTED, index3)

                            yield (
                                fitem, f_package,
                                path + local_path + message_path + f_path
                            )
                            break

                # for index2, enum in enumerate(item.enum_type):
                #     message_path = (EnumPathIndex.ENUM, index2)
                #     yield (enum, nested_package,
                #            path + local_path + message_path)

                # for nested_item, nested_package, location in _traverse(
                #         nested_package, item.nested_type, path + local_path):
                #     yield nested_item, nested_package, location

            # elif isinstance(item, ServiceDescriptorProto):
            #     local_path = (EnumPathIndex.SERVICE, index)
            #     yield item, package, path + local_path

    return itertools.chain(
        _traverse(proto_file.package, proto_file.enum_type),  # noqa
        _traverse(proto_file.package, proto_file.message_type),  # noqa
        # _traverse(proto_file.package, proto_file.service),  # noqa
    )


def strip(val):
    while val and val[0] == '/':
        val = val[1:]
    return val.strip()

# def package_name(package):
#     if package and package[0] == '.':
#         return 'root' + package
#     elif package:
#         return 'root.' + package
#     else:
#         return 'root'


def create_dict_path(output_dict, path, **kwargs):
    """create_dict_path.

    :param output: dict
    :param path: string   a.b.c
    :returns: dict
    """
    dot_pot = path.find('.')
    if dot_pot > 0:
        path_one = path[:dot_pot]
        path_last = path[dot_pot + 1:]
    else:
        path_one = path
        path_last = None

    if 'members' not in output_dict:

        if path_one not in output_dict:
            kwargs['name'] = path_one
            kwargs['members'] = OrderedDict()
            output_dict[path_one] = OrderedDict(**kwargs)

        if path_last is None:
            return output_dict[path_one]

        return create_dict_path(output_dict[path_one], path_last, **kwargs)
    else:
        if path_one not in output_dict['members']:
            kwargs['name'] = path_one
            kwargs['members'] = OrderedDict()
            output_dict['members'][path_one] = OrderedDict(**kwargs)

        if path_last is None:
            return output_dict['members'][path_one]

        return create_dict_path(
            output_dict['members'][path_one],
            path_last,
            **kwargs
        )


def is_in_set(_set, name, error_msg):
    # check path
    if name in _set:
        raise Exception(error_msg.format(name))
    else:
        _set.add(name)


def generate_json(request, step_files=['pydbgen', 'google/protobuf']):

    name_list = set()
    table_name_list = set()
    output = OrderedDict()

    for proto_file in request.proto_file:
        step = False
        for i in step_files:
            if proto_file.name.replace('\\', '/').find(i) >= 0:
                step = True
        if step:
            continue

        locations = proto_file.source_code_info.location
        locations = {tuple(location.path): location for location in locations}

        # Parse request
        for item, package, local_path in traverse(proto_file):
            package_full = package + '.' + item.name
            is_in_set(name_list, package_full,
                      'package path name duplicate[{}]')

            if isinstance(item, DescriptorProto):
                msg_type = item.options.Extensions[data_define_pb2.msg_type]
                msg_type = EnumDefineType.Name(msg_type)
                if msg_type == 'TABLE':
                    is_in_set(
                        table_name_list, item.name,
                        'table name duplicate[{}]'
                    )

            output_one = create_dict_path(
                output, package_full, type='package')

            output_one.update({
                # 'package': package,
                # 'filename': proto_file.name,
                'name': item.name,
            })

            def _locations(i):
                try:
                    # location.leading_comments
                    # location.trailing_comments
                    # location.leading_detached_comments
                    result = locations[local_path + (EnumPathIndex.FIELD, i)]
                except KeyError:
                    class EnumLog(object):
                        trailing_comments = ''
                        leading_comments = ''
                        leading_detached_comments = ''
                    return EnumLog
                else:
                    return result

            if isinstance(item, DescriptorProto):
                msg_options = item.options
                msg_type = msg_options.Extensions[data_define_pb2.msg_type]
                output_one['type'] = 'message'
                output_one['msg_type'] = EnumDefineType.Name(msg_type)
                output_one['options'] = OrderedDict([
                    ('message_set_wire_format',
                     msg_options.message_set_wire_format),
                    ('no_standard_descriptor_accessor',
                     msg_options.no_standard_descriptor_accessor),
                    ('deprecated', msg_options.deprecated),
                    ('map_entry', msg_options.map_entry),
                    # ('javalite_serializable',
                    #  msg_options.javalite_serializable),
                    # ('javanano_as_lite', msg_options.javanano_as_lite),
                    # ('uninterpreted_option',
                    #  msg_options.uninterpreted_option),
                ])
                output_one['db_options'] = OrderedDict([
                    (val.name, msg_opts_name(
                        val.name, msg_options.Extensions[val]))
                    for val in MY_MESSAGE_OPTIONS
                    if val.name != 'msg_type'
                ])

                output_one['fields'] = [{
                    'name': f.name,
                    'type': (f.type_name[f.type_name.rfind('.') + 1:] or
                             TYPE_CHANGE[str(f.type)]),
                    'comments': strip(_locations(i).trailing_comments),
                    'options':OrderedDict([
                        ('label', LABEL_CHANGE[f.label]),
                        ('type_name', f.type_name),
                        ('extendee', f.extendee),
                        ('default_value', f.default_value),
                        ('json_name', f.json_name),
                    ]),
                    'db_options': OrderedDict([
                        (val.name, field_opts_name(
                            val.name, f.options.Extensions[val]))
                        for val in MY_OPTIONS
                        if f.options.HasExtension(val)
                    ]),
                } for i, f in enumerate(item.field)]

                if output_one['msg_type'] == 'TABLE':
                    output_one['database'] = []
                    output_one['sharding'] = {}

            elif isinstance(item, EnumDescriptorProto):
                output_one.update({
                    'type': 'enum',
                    'fields': [{
                        'name': v.name,
                        'value': v.number,
                        'comments': strip(_locations(i).trailing_comments),
                    } for i, v in enumerate(item.value)]
                })

            # elif isinstance(item, ServiceDescriptorProto):
            #     # print(location.leading_detached_comments)
            #     output_one.update({
            #         'type': 'service',
            #         # 'trailing_comments': location.trailing_comments,
            #         # 'leading_detached_comments': location.leading_detached_comments, # noqa
            #         'apis': [{
            #             'name': v.name,
            #             'input_type': v.input_type[v.input_type.rfind('.') + 1:],# noqa
            #             'output_type': v.output_type[v.input_type.rfind('.') + 1:],# noqa
            #             'comments': strip(_locations(i).leading_comments),
            #         } for i, v in enumerate(item.method)]
            #     })

            else:
                continue

    for key in ROOT_OBJECT:
        if key not in output:
            create_dict_path(output, key, type='package')

        for dbname, dbconfig in output[key]['members'].items():
            output[key]['members'][dbname] = OrderedDict([
                (key, dbconfig[key])
                for key in SORT_KEYS if key in dbconfig
            ])

    def append_database(db, table, tables):
        # table['db_key'] = get_db_key(db, table)
        # table['table_key'] = get_table_key(db, table)
        table['database'].append(db['name'])
        table['database'] = list(set(table['database']))
        table['database'].sort()
        table['sharding'][db['name']] = db['db_options'].get(
            'sharding_mode', 'SM_DISABLE'
        )
        table_fields = {i['name'] for i in table['fields']}
        for index in table['members'].values():
            index_fields = {i['name'] for i in index['fields']}
            diff = index_fields - table_fields
            if diff:
                raise TypeError(
                    'index field invaild[table {}][index {}][keys {}]'.format(
                        table['name'], index['name'], diff)
                )

            if index['db_options'].get('index_type', None) == 'FOREIGN_KEY':
                if len(index['members']) != 1:
                    raise TypeError(
                        'foreign key references table invaild'
                        '[table {}][index {}]'.format(
                            table['name'], index['name'])
                    )

                for tname, topt in index['members'].items():
                    if tname not in tables:
                        raise TypeError(
                            'foreign key references table invaild'
                            '[table {}][index {}][name {}]'.format(
                                table['name'], index['name'], tname)
                        )

                    ropt = tables[tname]
                    index_fields = {i['name'] for i in topt['fields']}
                    rtable_fields = {i['name'] for i in ropt['fields']}
                    diff = index_fields - rtable_fields
                    if diff:
                        raise TypeError(
                            'foreign field invaild'
                            '[table {}][index {}][keys {}]'.format(
                                table['name'], index['name'], diff)
                        )

    def loop_tables(_config):
        def loop_table(_table):
            if _table['type'] in output['TABLES']['members']:
                table = output['TABLES']['members'][_table['type']]
                yield table
            elif _table['type'] in output['TABLE_GROUPS']['members']:
                tgroup = output['TABLE_GROUPS']['members'][_table['type']]
                for table in tgroup['fields']:
                    yield from loop_table(table)
            else:
                raise TypeError('unknow table type[{}][{}]'.format(
                    _table['type'], _table['name']))

        # new table databases config
        for dbname, dbconfig in _config['DATABASES']['members'].items():
            for _table in dbconfig['fields']:
                for table in loop_table(_table):
                    yield dbname, dbconfig, table, output['TABLES']['members']

    # new table databases config
    for dbname, dbconfig, table, tmembers in loop_tables(output):
        append_database(dbconfig, table, output['TABLES']['members'])

    return output


def generate_code(opts, request, response):
    fout = response.file.add()

    if opts.output:
        fout.name = opts.output
    else:
        fout.name = request.file_to_generate[0] + '.json'

    fout.content = json.dumps(generate_json(
        request, opts.step_files), indent=4)


def main():
    # Read request message from stdin
    OPTS = Cmdoptions()
    if six.PY2:
        DATA = sys.stdin.read()
    else:
        DATA = sys.stdin.buffer.read()

    # open('test.dat', 'wb').write(DATA)
    # DATA = open('test.dat', 'rb').read()

    # Parse request
    REQUEST = plugin.CodeGeneratorRequest()
    REQUEST.ParseFromString(DATA)

    # Create response
    RESPONSE = plugin.CodeGeneratorResponse()

    # Generate code
    generate_code(OPTS, REQUEST, RESPONSE)

    # Serialise response message
    OUTPUT = RESPONSE.SerializeToString()

    # Write to stdout
    if six.PY2:
        sys.stdout.write(OUTPUT)
    else:
        sys.stdout.buffer.write(OUTPUT)


if __name__ == '__main__':
    main()
