# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: data_define.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import descriptor_pb2 as google_dot_protobuf_dot_descriptor__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='data_define.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  serialized_pb=_b('\n\x11\x64\x61ta_define.proto\x1a google/protobuf/descriptor.proto\"\n\n\x08\x64\x61tetime\"\x06\n\x04\x64\x61te\"\x05\n\x03\x61ny\"\x06\n\x04json\"\x07\n\x05jsonb*v\n\x0e\x45numDefineType\x12\x08\n\x04NONE\x10\x00\x12\t\n\x05TABLE\x10\x01\x12\x0f\n\x0bTABLE_GROUP\x10\x02\x12\x0c\n\x08\x44\x41TABASE\x10\x03\x12\x0e\n\nTABLESPACE\x10\x04\x12\t\n\x05\x43LASS\x10\x05\x12\n\n\x06OUTPUT\x10\x06\x12\t\n\x05INDEX\x10\x07*_\n\rEnumIndexType\x12\x0c\n\x08NONE_KEY\x10\x00\x12\r\n\tINDEX_KEY\x10\x01\x12\x0e\n\nUNIQUE_KEY\x10\x02\x12\x0f\n\x0b\x46OREIGN_KEY\x10\x03\x12\x10\n\x0cSHARDING_KEY\x10\x04*\'\n\x0c\x45numIsEnable\x12\x0b\n\x07\x44ISABLE\x10\x00\x12\n\n\x06\x45NABLE\x10\x01*\xa2\x02\n\x10\x45numShardingMode\x12\x0e\n\nSM_DISABLE\x10\x00\x12\r\n\tSM_ENABLE\x10\x01\x12\r\n\tSM_HASHED\x10\x02\x12\x0c\n\x08SM_RANGE\x10\x03\x12\x11\n\rSM_RANGE_YEAR\x10\n\x12\x14\n\x10SM_RANGE_QUARTER\x10\x0b\x12\x12\n\x0eSM_RANGE_MONTH\x10\x0c\x12\x10\n\x0cSM_RANGE_DAY\x10\r\x12\x0f\n\x0bSM_RANGE_ID\x10\x0e\x12\x15\n\x11SM_PARTITION_YEAR\x10\x14\x12\x18\n\x14SM_PARTITION_QUARTER\x10\x15\x12\x16\n\x12SM_PARTITION_MONTH\x10\x16\x12\x14\n\x10SM_PARTITION_DAY\x10\x17\x12\x13\n\x0fSM_PARTITION_ID\x10\x18*-\n\x0c\x45numSortType\x12\x07\n\x03\x41SC\x10\x00\x12\x08\n\x04\x44\x45SC\x10\x01\x12\n\n\x06HASHED\x10\x02*-\n\x0f\x45numBulkOrdered\x12\x0b\n\x07ORDERED\x10\x00\x12\r\n\tUNORDERED\x10\x01:D\n\x08msg_type\x12\x1f.google.protobuf.MessageOptions\x18\xa1\x8d\x06 \x01(\x0e\x32\x0f.EnumDefineType:E\n\nindex_type\x12\x1f.google.protobuf.MessageOptions\x18\xab\x8d\x06 \x01(\x0e\x32\x0e.EnumIndexType:4\n\tis_unique\x12\x1f.google.protobuf.MessageOptions\x18\xac\x8d\x06 \x01(\x08:A\n\x16is_sharding_not_unique\x12\x1f.google.protobuf.MessageOptions\x18\xa2\x8d\x06 \x01(\x08:I\n\x0c\x62ulk_ordered\x12\x1f.google.protobuf.MessageOptions\x18\xa9\x8d\x06 \x01(\x0e\x32\x10.EnumBulkOrdered:3\n\x08location\x12\x1f.google.protobuf.MessageOptions\x18\xaa\x8d\x06 \x01(\t:/\n\x06maxlen\x12\x1d.google.protobuf.FieldOptions\x18\x91\xbf\x05 \x01(\x05:/\n\x06minlen\x12\x1d.google.protobuf.FieldOptions\x18\x92\xbf\x05 \x01(\x05:/\n\x06maxval\x12\x1d.google.protobuf.FieldOptions\x18\x93\xbf\x05 \x01(\x05:/\n\x06minval\x12\x1d.google.protobuf.FieldOptions\x18\x94\xbf\x05 \x01(\x05:/\n\x06\x64\x65\x63len\x12\x1d.google.protobuf.FieldOptions\x18\x95\xbf\x05 \x01(\x05:1\n\x08\x64\x65\x63point\x12\x1d.google.protobuf.FieldOptions\x18\x96\xbf\x05 \x01(\x05:,\n\x03key\x12\x1d.google.protobuf.FieldOptions\x18\x97\xbf\x05 \x01(\x08:,\n\x03inc\x12\x1d.google.protobuf.FieldOptions\x18\x98\xbf\x05 \x01(\x08:/\n\x06update\x12\x1d.google.protobuf.FieldOptions\x18\x99\xbf\x05 \x01(\x08:/\n\x06\x64\x65\x66val\x12\x1d.google.protobuf.FieldOptions\x18\xaa\xf7\x36 \x01(\t:<\n\x04sort\x12\x1d.google.protobuf.FieldOptions\x18\xac\xf7\x36 \x01(\x0e\x32\r.EnumSortType:.\n\x05space\x12\x1d.google.protobuf.FieldOptions\x18\xaf\xf7\x36 \x01(\t:0\n\x07is_temp\x12\x1d.google.protobuf.FieldOptions\x18\xb7\xf7\x36 \x01(\x08:I\n\rsharding_mode\x12\x1d.google.protobuf.FieldOptions\x18\xb0\xf7\x36 \x01(\x0e\x32\x11.EnumShardingMode:5\n\x0csharding_key\x12\x1d.google.protobuf.FieldOptions\x18\xb6\xf7\x36 \x01(\t:6\n\rsharding_step\x12\x1d.google.protobuf.FieldOptions\x18\xb1\xf7\x36 \x01(\x05:5\n\x0csharding_max\x12\x1d.google.protobuf.FieldOptions\x18\xb2\xf7\x36 \x01(\x05:5\n\x0csharding_min\x12\x1d.google.protobuf.FieldOptions\x18\xb3\xf7\x36 \x01(\x05:<\n\x13sharding_date_begin\x12\x1d.google.protobuf.FieldOptions\x18\xb4\xf7\x36 \x01(\t::\n\x11sharding_date_end\x12\x1d.google.protobuf.FieldOptions\x18\xb5\xf7\x36 \x01(\tb\x06proto3')
  ,
  dependencies=[google_dot_protobuf_dot_descriptor__pb2.DESCRIPTOR,])

_ENUMDEFINETYPE = _descriptor.EnumDescriptor(
  name='EnumDefineType',
  full_name='EnumDefineType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='NONE', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='TABLE', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='TABLE_GROUP', index=2, number=2,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='DATABASE', index=3, number=3,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='TABLESPACE', index=4, number=4,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='CLASS', index=5, number=5,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='OUTPUT', index=6, number=6,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='INDEX', index=7, number=7,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=99,
  serialized_end=217,
)
_sym_db.RegisterEnumDescriptor(_ENUMDEFINETYPE)

EnumDefineType = enum_type_wrapper.EnumTypeWrapper(_ENUMDEFINETYPE)
_ENUMINDEXTYPE = _descriptor.EnumDescriptor(
  name='EnumIndexType',
  full_name='EnumIndexType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='NONE_KEY', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='INDEX_KEY', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='UNIQUE_KEY', index=2, number=2,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='FOREIGN_KEY', index=3, number=3,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SHARDING_KEY', index=4, number=4,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=219,
  serialized_end=314,
)
_sym_db.RegisterEnumDescriptor(_ENUMINDEXTYPE)

EnumIndexType = enum_type_wrapper.EnumTypeWrapper(_ENUMINDEXTYPE)
_ENUMISENABLE = _descriptor.EnumDescriptor(
  name='EnumIsEnable',
  full_name='EnumIsEnable',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='DISABLE', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='ENABLE', index=1, number=1,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=316,
  serialized_end=355,
)
_sym_db.RegisterEnumDescriptor(_ENUMISENABLE)

EnumIsEnable = enum_type_wrapper.EnumTypeWrapper(_ENUMISENABLE)
_ENUMSHARDINGMODE = _descriptor.EnumDescriptor(
  name='EnumShardingMode',
  full_name='EnumShardingMode',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='SM_DISABLE', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_ENABLE', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_HASHED', index=2, number=2,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE', index=3, number=3,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE_YEAR', index=4, number=10,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE_QUARTER', index=5, number=11,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE_MONTH', index=6, number=12,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE_DAY', index=7, number=13,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_RANGE_ID', index=8, number=14,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_PARTITION_YEAR', index=9, number=20,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_PARTITION_QUARTER', index=10, number=21,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_PARTITION_MONTH', index=11, number=22,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_PARTITION_DAY', index=12, number=23,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SM_PARTITION_ID', index=13, number=24,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=358,
  serialized_end=648,
)
_sym_db.RegisterEnumDescriptor(_ENUMSHARDINGMODE)

EnumShardingMode = enum_type_wrapper.EnumTypeWrapper(_ENUMSHARDINGMODE)
_ENUMSORTTYPE = _descriptor.EnumDescriptor(
  name='EnumSortType',
  full_name='EnumSortType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='ASC', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='DESC', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='HASHED', index=2, number=2,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=650,
  serialized_end=695,
)
_sym_db.RegisterEnumDescriptor(_ENUMSORTTYPE)

EnumSortType = enum_type_wrapper.EnumTypeWrapper(_ENUMSORTTYPE)
_ENUMBULKORDERED = _descriptor.EnumDescriptor(
  name='EnumBulkOrdered',
  full_name='EnumBulkOrdered',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='ORDERED', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='UNORDERED', index=1, number=1,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=697,
  serialized_end=742,
)
_sym_db.RegisterEnumDescriptor(_ENUMBULKORDERED)

EnumBulkOrdered = enum_type_wrapper.EnumTypeWrapper(_ENUMBULKORDERED)
NONE = 0
TABLE = 1
TABLE_GROUP = 2
DATABASE = 3
TABLESPACE = 4
CLASS = 5
OUTPUT = 6
INDEX = 7
NONE_KEY = 0
INDEX_KEY = 1
UNIQUE_KEY = 2
FOREIGN_KEY = 3
SHARDING_KEY = 4
DISABLE = 0
ENABLE = 1
SM_DISABLE = 0
SM_ENABLE = 1
SM_HASHED = 2
SM_RANGE = 3
SM_RANGE_YEAR = 10
SM_RANGE_QUARTER = 11
SM_RANGE_MONTH = 12
SM_RANGE_DAY = 13
SM_RANGE_ID = 14
SM_PARTITION_YEAR = 20
SM_PARTITION_QUARTER = 21
SM_PARTITION_MONTH = 22
SM_PARTITION_DAY = 23
SM_PARTITION_ID = 24
ASC = 0
DESC = 1
HASHED = 2
ORDERED = 0
UNORDERED = 1

MSG_TYPE_FIELD_NUMBER = 100001
msg_type = _descriptor.FieldDescriptor(
  name='msg_type', full_name='msg_type', index=0,
  number=100001, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
INDEX_TYPE_FIELD_NUMBER = 100011
index_type = _descriptor.FieldDescriptor(
  name='index_type', full_name='index_type', index=1,
  number=100011, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
IS_UNIQUE_FIELD_NUMBER = 100012
is_unique = _descriptor.FieldDescriptor(
  name='is_unique', full_name='is_unique', index=2,
  number=100012, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
IS_SHARDING_NOT_UNIQUE_FIELD_NUMBER = 100002
is_sharding_not_unique = _descriptor.FieldDescriptor(
  name='is_sharding_not_unique', full_name='is_sharding_not_unique', index=3,
  number=100002, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
BULK_ORDERED_FIELD_NUMBER = 100009
bulk_ordered = _descriptor.FieldDescriptor(
  name='bulk_ordered', full_name='bulk_ordered', index=4,
  number=100009, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
LOCATION_FIELD_NUMBER = 100010
location = _descriptor.FieldDescriptor(
  name='location', full_name='location', index=5,
  number=100010, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
MAXLEN_FIELD_NUMBER = 90001
maxlen = _descriptor.FieldDescriptor(
  name='maxlen', full_name='maxlen', index=6,
  number=90001, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
MINLEN_FIELD_NUMBER = 90002
minlen = _descriptor.FieldDescriptor(
  name='minlen', full_name='minlen', index=7,
  number=90002, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
MAXVAL_FIELD_NUMBER = 90003
maxval = _descriptor.FieldDescriptor(
  name='maxval', full_name='maxval', index=8,
  number=90003, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
MINVAL_FIELD_NUMBER = 90004
minval = _descriptor.FieldDescriptor(
  name='minval', full_name='minval', index=9,
  number=90004, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
DECLEN_FIELD_NUMBER = 90005
declen = _descriptor.FieldDescriptor(
  name='declen', full_name='declen', index=10,
  number=90005, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
DECPOINT_FIELD_NUMBER = 90006
decpoint = _descriptor.FieldDescriptor(
  name='decpoint', full_name='decpoint', index=11,
  number=90006, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
KEY_FIELD_NUMBER = 90007
key = _descriptor.FieldDescriptor(
  name='key', full_name='key', index=12,
  number=90007, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
INC_FIELD_NUMBER = 90008
inc = _descriptor.FieldDescriptor(
  name='inc', full_name='inc', index=13,
  number=90008, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
UPDATE_FIELD_NUMBER = 90009
update = _descriptor.FieldDescriptor(
  name='update', full_name='update', index=14,
  number=90009, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
DEFVAL_FIELD_NUMBER = 900010
defval = _descriptor.FieldDescriptor(
  name='defval', full_name='defval', index=15,
  number=900010, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SORT_FIELD_NUMBER = 900012
sort = _descriptor.FieldDescriptor(
  name='sort', full_name='sort', index=16,
  number=900012, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SPACE_FIELD_NUMBER = 900015
space = _descriptor.FieldDescriptor(
  name='space', full_name='space', index=17,
  number=900015, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
IS_TEMP_FIELD_NUMBER = 900023
is_temp = _descriptor.FieldDescriptor(
  name='is_temp', full_name='is_temp', index=18,
  number=900023, type=8, cpp_type=7, label=1,
  has_default_value=False, default_value=False,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_MODE_FIELD_NUMBER = 900016
sharding_mode = _descriptor.FieldDescriptor(
  name='sharding_mode', full_name='sharding_mode', index=19,
  number=900016, type=14, cpp_type=8, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_KEY_FIELD_NUMBER = 900022
sharding_key = _descriptor.FieldDescriptor(
  name='sharding_key', full_name='sharding_key', index=20,
  number=900022, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_STEP_FIELD_NUMBER = 900017
sharding_step = _descriptor.FieldDescriptor(
  name='sharding_step', full_name='sharding_step', index=21,
  number=900017, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_MAX_FIELD_NUMBER = 900018
sharding_max = _descriptor.FieldDescriptor(
  name='sharding_max', full_name='sharding_max', index=22,
  number=900018, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_MIN_FIELD_NUMBER = 900019
sharding_min = _descriptor.FieldDescriptor(
  name='sharding_min', full_name='sharding_min', index=23,
  number=900019, type=5, cpp_type=1, label=1,
  has_default_value=False, default_value=0,
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_DATE_BEGIN_FIELD_NUMBER = 900020
sharding_date_begin = _descriptor.FieldDescriptor(
  name='sharding_date_begin', full_name='sharding_date_begin', index=24,
  number=900020, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)
SHARDING_DATE_END_FIELD_NUMBER = 900021
sharding_date_end = _descriptor.FieldDescriptor(
  name='sharding_date_end', full_name='sharding_date_end', index=25,
  number=900021, type=9, cpp_type=9, label=1,
  has_default_value=False, default_value=_b("").decode('utf-8'),
  message_type=None, enum_type=None, containing_type=None,
  is_extension=True, extension_scope=None,
  serialized_options=None, file=DESCRIPTOR)


_DATETIME = _descriptor.Descriptor(
  name='datetime',
  full_name='datetime',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=55,
  serialized_end=65,
)


_DATE = _descriptor.Descriptor(
  name='date',
  full_name='date',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=67,
  serialized_end=73,
)


_ANY = _descriptor.Descriptor(
  name='any',
  full_name='any',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=75,
  serialized_end=80,
)


_JSON = _descriptor.Descriptor(
  name='json',
  full_name='json',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=82,
  serialized_end=88,
)


_JSONB = _descriptor.Descriptor(
  name='jsonb',
  full_name='jsonb',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=90,
  serialized_end=97,
)

DESCRIPTOR.message_types_by_name['datetime'] = _DATETIME
DESCRIPTOR.message_types_by_name['date'] = _DATE
DESCRIPTOR.message_types_by_name['any'] = _ANY
DESCRIPTOR.message_types_by_name['json'] = _JSON
DESCRIPTOR.message_types_by_name['jsonb'] = _JSONB
DESCRIPTOR.enum_types_by_name['EnumDefineType'] = _ENUMDEFINETYPE
DESCRIPTOR.enum_types_by_name['EnumIndexType'] = _ENUMINDEXTYPE
DESCRIPTOR.enum_types_by_name['EnumIsEnable'] = _ENUMISENABLE
DESCRIPTOR.enum_types_by_name['EnumShardingMode'] = _ENUMSHARDINGMODE
DESCRIPTOR.enum_types_by_name['EnumSortType'] = _ENUMSORTTYPE
DESCRIPTOR.enum_types_by_name['EnumBulkOrdered'] = _ENUMBULKORDERED
DESCRIPTOR.extensions_by_name['msg_type'] = msg_type
DESCRIPTOR.extensions_by_name['index_type'] = index_type
DESCRIPTOR.extensions_by_name['is_unique'] = is_unique
DESCRIPTOR.extensions_by_name['is_sharding_not_unique'] = is_sharding_not_unique
DESCRIPTOR.extensions_by_name['bulk_ordered'] = bulk_ordered
DESCRIPTOR.extensions_by_name['location'] = location
DESCRIPTOR.extensions_by_name['maxlen'] = maxlen
DESCRIPTOR.extensions_by_name['minlen'] = minlen
DESCRIPTOR.extensions_by_name['maxval'] = maxval
DESCRIPTOR.extensions_by_name['minval'] = minval
DESCRIPTOR.extensions_by_name['declen'] = declen
DESCRIPTOR.extensions_by_name['decpoint'] = decpoint
DESCRIPTOR.extensions_by_name['key'] = key
DESCRIPTOR.extensions_by_name['inc'] = inc
DESCRIPTOR.extensions_by_name['update'] = update
DESCRIPTOR.extensions_by_name['defval'] = defval
DESCRIPTOR.extensions_by_name['sort'] = sort
DESCRIPTOR.extensions_by_name['space'] = space
DESCRIPTOR.extensions_by_name['is_temp'] = is_temp
DESCRIPTOR.extensions_by_name['sharding_mode'] = sharding_mode
DESCRIPTOR.extensions_by_name['sharding_key'] = sharding_key
DESCRIPTOR.extensions_by_name['sharding_step'] = sharding_step
DESCRIPTOR.extensions_by_name['sharding_max'] = sharding_max
DESCRIPTOR.extensions_by_name['sharding_min'] = sharding_min
DESCRIPTOR.extensions_by_name['sharding_date_begin'] = sharding_date_begin
DESCRIPTOR.extensions_by_name['sharding_date_end'] = sharding_date_end
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

datetime = _reflection.GeneratedProtocolMessageType('datetime', (_message.Message,), {
  'DESCRIPTOR' : _DATETIME,
  '__module__' : 'data_define_pb2'
  # @@protoc_insertion_point(class_scope:datetime)
  })
_sym_db.RegisterMessage(datetime)

date = _reflection.GeneratedProtocolMessageType('date', (_message.Message,), {
  'DESCRIPTOR' : _DATE,
  '__module__' : 'data_define_pb2'
  # @@protoc_insertion_point(class_scope:date)
  })
_sym_db.RegisterMessage(date)

any = _reflection.GeneratedProtocolMessageType('any', (_message.Message,), {
  'DESCRIPTOR' : _ANY,
  '__module__' : 'data_define_pb2'
  # @@protoc_insertion_point(class_scope:any)
  })
_sym_db.RegisterMessage(any)

json = _reflection.GeneratedProtocolMessageType('json', (_message.Message,), {
  'DESCRIPTOR' : _JSON,
  '__module__' : 'data_define_pb2'
  # @@protoc_insertion_point(class_scope:json)
  })
_sym_db.RegisterMessage(json)

jsonb = _reflection.GeneratedProtocolMessageType('jsonb', (_message.Message,), {
  'DESCRIPTOR' : _JSONB,
  '__module__' : 'data_define_pb2'
  # @@protoc_insertion_point(class_scope:jsonb)
  })
_sym_db.RegisterMessage(jsonb)

msg_type.enum_type = _ENUMDEFINETYPE
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(msg_type)
index_type.enum_type = _ENUMINDEXTYPE
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(index_type)
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(is_unique)
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(is_sharding_not_unique)
bulk_ordered.enum_type = _ENUMBULKORDERED
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(bulk_ordered)
google_dot_protobuf_dot_descriptor__pb2.MessageOptions.RegisterExtension(location)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(maxlen)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(minlen)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(maxval)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(minval)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(declen)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(decpoint)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(key)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(inc)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(update)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(defval)
sort.enum_type = _ENUMSORTTYPE
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sort)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(space)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(is_temp)
sharding_mode.enum_type = _ENUMSHARDINGMODE
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_mode)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_key)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_step)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_max)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_min)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_date_begin)
google_dot_protobuf_dot_descriptor__pb2.FieldOptions.RegisterExtension(sharding_date_end)

# @@protoc_insertion_point(module_scope)
