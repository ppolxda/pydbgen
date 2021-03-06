# -*- coding: utf-8 -*-
import re
import six
import json
import decimal
import datetime
from google.protobuf.message import Message
from google.protobuf.pyext._message import RepeatedCompositeContainer
${ remove_blank_line(generate_file(tmplpath + "/import_tmpl_py.mako", nesteds=nesteds,filename=filename,package=package,json_data=json_data,loop_nesteds=loop_nesteds)) }


INT_TYPES = [
    'uint32', 'int32', 'uint64', 'int64', 'sint32',
    'sint64', 'fixed32', 'fixed64', 'sfixed32',
    'sfixed64'
]
BOOL_TYPES = ['boolean', 'bool']
FLOAT_TYPES = ['float', 'double']
DATETIME_TYPES = ['date', 'datetime']


class FeildInVaild(Exception):
    pass


def string2date(val, is_date=True):
    try:
        _date = datetime.datetime.strptime(val, '%Y-%m-%d')
        if is_date:
            return _date.date()
        else:
            return _date
    except ValueError:
        pass
    try:
        _date = datetime.datetime.strptime(val, '%Y/%m/%d')
        if is_date:
            return _date.date()
        else:
            return _date
    except ValueError:
        pass
    _date = datetime.datetime.strptime(val, '%Y%m%d')
    if is_date:
        return _date.date()
    else:
        return _date


def string2datetime(val):
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y%m%d%H%M%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y%m%dT%H%M%S')
    except ValueError:
        pass
    return string2date(val, False)



class FeildOption(object):
    """FeildOption."""

    def __init__(self, _type, name, comment, repeated, fclass=None):
        self.type = _type
        self.name = name
        self.comment = comment
        self.repeated = repeated
        self.fclass = fclass

    @staticmethod
    def from_dict(**option):
        """dict2class."""
        return FeildOption(**option)

    def to_dict(self):
        """class2dict."""
        return {
            'name': self.name,
            'type': self.type,
            'comment': self.comment,
            'repeated': self.repeated,
            'fclass': self.fclass.__class__,
        }

    def __str__(self):
        return json.dumps(self.to_dict())

    def __repr__(self):
        return '<{} {}>'.format(self.__class__.__name__, self.__str__())

    def _get_default(self, _type, repeated):
        if repeated:
            return []

        elif _type in INT_TYPES:
            return 0

        elif _type in FLOAT_TYPES:
            return decimal.Decimal('0.0')

        elif _type == 'string':
            return ''

        elif _type == 'date':
            return datetime.date(1900, 1, 1)

        elif _type == 'datetime':
            return datetime.datetime(1900, 1, 1)

        elif _type == 'bytes':
            return b''

        elif _type in BOOL_TYPES:
            return False

        elif _type == 'message':
            return self.fclass()

        elif _type == 'enum':
            return 0

        else:
            raise TypeError('[{}]type error'.format(_type))

    def get_default(self):
        return self._get_default(self.type, self.repeated)

    def check_value(self, val, step_repeated=False):
        if self.repeated and not step_repeated:
            if not isinstance(val, list):
                raise FeildInVaild('[{}]value invaild, is not list[{}]'.format(self.name, val))  # noqa

            for i in val:
                self.check_value(i, True)

        elif self.type in INT_TYPES:
            if not isinstance(val, six.integer_types):
                raise FeildInVaild('[{}]value invaild, is not int[{}]'.format(self.name, val))  # noqa

        elif self.type in FLOAT_TYPES:
            if not isinstance(val, (float, decimal.Decimal)):
                raise FeildInVaild('[{}]value invaild, is not float[{}]'.format(self.name, val))  # noqa

        elif self.type == 'date':
            if not isinstance(val, datetime.date):
                raise FeildInVaild('[{}]value invaild, is not date[{}]'.format(self.name, val))  # noqa

        elif self.type == 'datetime':
            if not isinstance(val, datetime.datetime):
                raise FeildInVaild('[{}]value invaild, is not datetime[{}]'.format(self.name, val))  # noqa

        elif self.type == 'string':
            if not isinstance(val, six.string_types):
                raise FeildInVaild('[{}]value invaild, is not string[{}]'.format(self.name, val))  # noqa

        elif self.type == 'bytes':
            if not isinstance(val, six.binary_type):
                raise FeildInVaild('[{}]value invaild, is not bytes[{}]'.format(self.name, val))  # noqa

        elif self.type in BOOL_TYPES:
            if not isinstance(val, bool):
                raise FeildInVaild('[{}]value invaild, is not bool[{}]'.format(self.name, val))  # noqa

        elif self.type == 'message':
            if not isinstance(val, (self.fclass, dict)):
                raise FeildInVaild('[{}]value invaild, is not message[{}]'.format(self.name, val))  # noqa

            self.fclass.check_object(val)

        elif self.type == 'enum':
            if not isinstance(val, int):
                raise FeildInVaild('[{}]value invaild, is not bool[{}]'.format(self.name, val))  # noqa

        else:
            raise TypeError('[{}]type error[{}]'.format(self.name, self.type))

    def conv_value(self, val, step_repeated=False):
        """conv_value."""
        if self.repeated and not step_repeated:
            if val is None:
                return []
            elif not isinstance(val, (list, RepeatedCompositeContainer)):
                raise FeildInVaild(
                    '[{}]value invaild, is not list[{}]'.format(
                        self.name, val)
                )

            return [self.conv_value(i, True) for i in val]

        elif val is None:
            return self.get_default()

        elif self.type in INT_TYPES:
            return int(val)

        elif self.type in FLOAT_TYPES:
            if isinstance(val, six.string_types):
                return decimal.Decimal(val)
            elif isinstance(val, float):
                return decimal.Decimal.from_float(val)
            elif isinstance(val, decimal.Decimal):
                return val
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not string or float[{}]'.format(
                        self.name, val)
                )

        elif self.type == 'string':
            return str(val)

        elif self.type == 'date':
            if isinstance(val, six.string_types):
                return string2date(val)
            elif isinstance(val, datetime.date):
                return val
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not string or date[{}]'.format(
                        self.name, val)
                )

        elif self.type == 'datetime':
            if isinstance(val, six.string_types):
                return string2datetime(val)
            elif isinstance(val, datetime.datetime):
                return val
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not string or datetime[{}]'.format(
                        self.name, val)
                )

        elif self.type == 'bytes':
            if isinstance(val, six.string_types):
                raise six.b(val)
            elif isinstance(val, six.binary_type):
                raise val
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not bytes[{}]'.format(
                        self.name, val)
                )

        elif self.type in BOOL_TYPES:
            return bool(val)

        elif self.type == 'message':
            if isinstance(val, dict):
                return self.fclass.from_dict(val)
            elif isinstance(val, Message):
                return self.fclass(val)
            elif isinstance(val, self.fclass):
                return val
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not bytes[{}]'.format(
                        self.name, val)
                )

        elif self.type == 'enum':
            if not isinstance(val, int):
                raise FeildInVaild('[{}]value invaild, is not bool[{}]'.format(self.name, val))  # noqa

        else:
            raise TypeError('[{}]type error[{}]'.format(self.name, self.type))

class NullClass(object):
    """NullClass."""

    def __init__(self):
        raise NotImplementedError

    def ParseFromString(self, buf):
        """ParseFromString."""
        raise NotImplementedError

    def SerializeToString(self):
        """SerializeToString."""
        raise NotImplementedError


class ProtoClass(object):
    """ProtoClass."""

    protopb = NullClass
    fields = {

    }

    def __str__(self):
        return self.__repr__()

    def __repr__(self):
        return '<{} {}>'.format(self.__class__.__name__, self.to_json())

    def _value_kwargs(self, key, kwargs):
        """_value_kwargs."""
        field = self.fields.get(key, None)
        if not field:
            raise FeildInVaild(
                'key not in fileds invaild {}'.format(key)
            )

        if isinstance(kwargs, dict):
            val = kwargs.get(key, None)
        elif isinstance(kwargs, (ProtoClass, Message)):
            val = getattr(kwargs, key, None)
        elif kwargs is None:
            return field.get_default()
        else:
            raise FeildInVaild('kwargs invaild')

        return field.conv_value(val)

    def check_object(self, obj):
        """check_object."""
        for key, field in self.fields.items():
            val = obj.get(key, None)
            if val:
                field.check_value(val)

    def to_dict(self, filterkeys=None):
        """class2dict."""
        if filterkeys is None:
            filterkeys = []

        return {
            key: getattr(self, key.lower())
            for key in self.fields
            if key not in filterkeys
        }

    def to_json(self, filterkeys=None):
        """to json string."""
        return json.dumps(self.to_dict(filterkeys),
                          default=self.json_serial)

    def clone_to(self, obj):
        for key, opt in self.fields.items():
            val = getattr(self, key.lower(), None)
            if not val:
                continue

            if opt.repeated:
                if not isinstance(val, list):
                    raise TypeError('{} invaild, is not list'.format(key))

                field = getattr(obj, key)
                field.extend([
                    obj.to_proto()
                    if isinstance(obj, ProtoClass)
                    else obj for obj in val
                ])

            elif opt.type in DATETIME_TYPES:
                setattr(obj, key, str(val))

            elif opt.type == 'message':
                obj_data = getattr(self, key)
                obj_pb = getattr(obj, key)
                obj_data.clone_to(obj_pb)
            else:
                setattr(obj, key, val)

    def to_proto(self):
        """to proto object."""
        obj = self.protopb()
        self.clone_to(obj)
        return obj

    def to_buffer(self):
        """SerializeToString."""
        obj = self.to_proto()
        return obj.SerializeToString()

    @staticmethod
    def json_serial(obj):
        """JSON serializer for objects not serializable by default json code"""
        if isinstance(obj, datetime.datetime):
            return obj.strftime("%Y%m%dT%H%M%S")

        elif isinstance(obj, datetime.date):
            return obj.strftime("%Y%m%d")

        elif isinstance(obj, decimal.Decimal):
            return float(obj)

        elif isinstance(obj, (FeildOption, ProtoClass)):
            return obj.to_dict()

        else:
            raise TypeError("Type %s not serializable" % type(obj))

    ## @classmethod
    ## def from_buffer(cls, buf):
    ##     """ParseFromString."""
    ##     assert isinstance(buf, six.binary_type)
    ##     tick = cls.protopb()
    ##     tick.ParseFromString(buf)
    ##     tick_dict = {
    ##         key: cls.fields[key].conv_value(getattr(tick, key, None))
    ##         for key in cls.fields
    ##     }
    ##     return cls(**tick_dict)

% for root, enum in loop_enums(json_data):
<% enum['parentclass'] = root[len('.root'):].replace('.', '_') %>
${ generate_file(tmplpath + "/enum_tmpl_py.mako", **enum) }
% endfor
% for root, nested in loop_nesteds(json_data):
<% nested['roots'] = list(filter(lambda x: x, root[len('.root'):].split('.')))   %>
<% nested['parentclass'] = root[len('.root'):].replace('.', '_') %>
<% nested['package'] = json_data['package'] %>
${ generate_file(tmplpath + "/message_tmpl_py.mako", **nested) }
% endfor
