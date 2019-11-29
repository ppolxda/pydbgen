# -*- coding: utf-8 -*-
import os
import sys
import six
import json
import argparse
import itertools
from collections import OrderedDict
from google.protobuf.compiler import plugin_pb2 as plugin
from google.protobuf.descriptor_pb2 import DescriptorProto
from google.protobuf.descriptor_pb2 import EnumDescriptorProto
from google.protobuf.descriptor import FieldDescriptor
# from google.protobuf.descriptor_pb2 import ServiceDescriptorProto
# from google.protobuf.descriptor_pb2 import SourceCodeInfo
# from google.protobuf import descriptor as _descriptor
# from pypplugins import data_define_pb2


# EnumDefineType = data_define_pb2.EnumDefineType


# MY_MESSAGE_OPTIONS = [
#     data_define_pb2.deftype,
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

LABEL_CHANGE = {
    FieldDescriptor.LABEL_OPTIONAL: 'optional',
    FieldDescriptor.LABEL_REQUIRED: 'required',
    FieldDescriptor.LABEL_REPEATED: 'repeated',
}

TYPE_CHANGE = {
    FieldDescriptor.TYPE_DOUBLE: 'double',
    FieldDescriptor.TYPE_FLOAT: 'float',
    FieldDescriptor.TYPE_INT64: 'int64',
    FieldDescriptor.TYPE_UINT64: 'uint64',
    FieldDescriptor.TYPE_INT32: 'int32',
    FieldDescriptor.TYPE_FIXED64: 'fixed64',
    FieldDescriptor.TYPE_FIXED32: 'fixed32',
    FieldDescriptor.TYPE_BOOL: 'bool',
    FieldDescriptor.TYPE_STRING: 'string',
    FieldDescriptor.TYPE_GROUP: 'group',
    FieldDescriptor.TYPE_MESSAGE: 'message',
    FieldDescriptor.TYPE_BYTES: 'bytes',
    FieldDescriptor.TYPE_UINT32: 'uint32',
    FieldDescriptor.TYPE_ENUM: 'enum',
    FieldDescriptor.TYPE_SFIXED32: 'sfixed32',
    FieldDescriptor.TYPE_SFIXED64: 'sfixed64',
    FieldDescriptor.TYPE_SINT32: 'sint32',
    FieldDescriptor.TYPE_SINT64: 'sint64'
}

TYPE_DEFVAL = {
    FieldDescriptor.TYPE_DOUBLE: 0.0,
    FieldDescriptor.TYPE_FLOAT: 0.0,
    FieldDescriptor.TYPE_INT64: 0,
    FieldDescriptor.TYPE_UINT64: 0,
    FieldDescriptor.TYPE_INT32: 0,
    FieldDescriptor.TYPE_FIXED64: 0,
    FieldDescriptor.TYPE_FIXED32: 0,
    FieldDescriptor.TYPE_BOOL: False,
    FieldDescriptor.TYPE_STRING: '',
    FieldDescriptor.TYPE_GROUP: '',
    FieldDescriptor.TYPE_MESSAGE: '',
    FieldDescriptor.TYPE_BYTES: '',
    FieldDescriptor.TYPE_UINT32: 0,
    FieldDescriptor.TYPE_ENUM: 0,
    FieldDescriptor.TYPE_SFIXED32: 0,
    FieldDescriptor.TYPE_SFIXED64: 0,
    FieldDescriptor.TYPE_SINT32: 0,
    FieldDescriptor.TYPE_SINT64: 0
}


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
            description='pydbgen.pbclass.protoc_gen_json')

        parser.add_argument('-o', '--output',
                            type=str, default=None,
                            help='ouput path')

        parser.add_argument('-e', '--encoding', default='utf8',
                            help='output encoding(default: utf8)')

        args = parser.parse_args()
        self.output = args.output
        self.encoding = args.encoding


def strip(val):
    while val and val[0] == '/':
        val = val[1:]
    return val.strip()


def _locations(locations, pathtype, i, last_path=tuple()):
    # location.leading_comments
    # location.trailing_comments
    # location.leading_detached_comments
    # result = locations[local_path + (EnumPathIndex.FIELD, i)]
    full_path = last_path + (pathtype, i)
    result = locations.get(full_path, None)
    if result is None:
        class EnumLog(object):
            trailing_comments = ''
            leading_comments = ''
            leading_detached_comments = ''
        return EnumLog
    return result


def default_json(name, typename, comment='', fields={},
                 options={}, nesteds={}, enums={}):
    assert isinstance(fields, dict)
    assert isinstance(options, dict)
    assert isinstance(nesteds, dict)
    return OrderedDict([
        ("type", typename),
        ("name", name),
        ("comment", comment),
        ("fields", fields),
        ("options", options),
        ("enums", enums),
        ("nesteds", nesteds),
    ])


def field_json(name, value, type, defval, comment, options={}):
    return OrderedDict([
        ("name", name),
        ("value", value),
        ("type", type),
        ("defval", defval),
        ("comment", comment),
        ("options", options),
    ])


def enums2json(items, locations, path=tuple()):
    # assert isinstance(items, list)
    assert isinstance(locations, dict)
    assert isinstance(path, tuple)
    # location.leading_comments
    # location.trailing_comments
    # location.leading_detached_comments

    result = {}
    for index, item in enumerate(items):
        local_path = (EnumPathIndex.ENUM, index)
        cur_path = path + local_path
        assert isinstance(item, EnumDescriptorProto)
        result[item.name] = default_json(
            item.name, 'enum',
            comment=strip(_locations(locations, EnumPathIndex.ENUM, index, path).leading_comments),  # noqa
            fields=OrderedDict([(
                v.name, field_json(
                    v.name, v.number, 'int32', 0,
                    strip(_locations(locations, EnumPathIndex.FIELD, i, cur_path).trailing_comments)))  # noqa
            for i, v in enumerate(item.value)
            ]))
    return result


def message2json(items, locations, path=tuple()):
    # assert isinstance(items, list)
    assert isinstance(locations, dict)
    assert isinstance(path, tuple)

    result = {}
    for index, item in enumerate(items):
        local_path = (EnumPathIndex.MESSAGE, index)
        cur_path = path + local_path
        assert isinstance(item, DescriptorProto)
        result[item.name] = default_json(
            item.name,  'message',
            comment=strip(_locations(locations, EnumPathIndex.MESSAGE, index).leading_comments),  # noqa
            nesteds=message2json(item.nested_type, locations, cur_path),
            enums=enums2json(item.enum_type, locations, cur_path),
            fields=OrderedDict([(
                    v.name, field_json(
                    v.name, v.number,
                    TYPE_CHANGE.get(v.type, '--'),
                    v.default_value if v.default_value else TYPE_DEFVAL.get(v.type, ''),  # noqa
                    strip(_locations(locations, EnumPathIndex.FIELD, i, cur_path).trailing_comments),  # noqa
                    options=OrderedDict([
                        ('label', LABEL_CHANGE[v.label]),
                        ('type_name', v.type_name),
                        ('extendee', v.extendee),
                        ('default_value', v.default_value),
                        ('json_name', v.json_name),
                    ]))
                ) for i, v in enumerate(item.field)
            ]),
            options=OrderedDict([
                        ('message_set_wire_format', item.options.message_set_wire_format),  # noqa
                        ('no_standard_descriptor_accessor', item.options.no_standard_descriptor_accessor),  # noqa
                        ('deprecated', item.options.deprecated),  # noqa
                    ])
            )

    return result


def generate_json(request, step_files=['pydbgen', 'google/protobuf']):

    for filename in request.file_to_generate:
        output = OrderedDict([
            ("type", "root"),
            ("name", "root"),
            ("package", "root"),
            ("filename", filename),
            ("comment", "root"),
            ("enums", {}),
            ("nesteds", {}),
        ])

        for proto_file in request.proto_file:
            step = False
            for i in step_files:
                if proto_file.name.replace('\\', '/').find(i) >= 0:
                    step = True
            if step:
                continue

            if proto_file.name != filename:
                continue

            output['filename'] = proto_file.name
            output['package'] = proto_file.package

            locations = proto_file.source_code_info.location
            locations = {
                tuple(location.path): location
                for location in locations
            }

            enums = enums2json(proto_file.enum_type, locations)
            inset = set(output['enums'].keys()).intersection(set(enums.keys()))
            if inset:
                raise TypeError('enum name duplicate[{}]'.format(inset))

            output['enums'].update(enums)

            msgs = message2json(proto_file.message_type, locations)
            inset = set(output['nesteds'].keys()).intersection(
                set(msgs.keys()))
            if inset:
                raise TypeError('messages name duplicate[{}]'.format(inset))

            output['nesteds'].update(msgs)

        yield filename, output


def generate_code(opts, request, response):

    for filename, output in generate_json(request):
        fout = response.file.add()

        if opts.output:
            fout.name = opts.output
        else:
            fout.name = filename + '.json'

        fout.content = json.dumps(output, indent=4)

    # open('test.json', 'w').write(
    # json.dumps(generate_json(request), indent=4))


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
