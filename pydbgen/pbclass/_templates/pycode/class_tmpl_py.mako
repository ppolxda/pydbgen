# -*- coding: utf-8 -*-
import re
import six
import json
import decimal
from google.protobuf.message import Message
from google.protobuf.pyext._message import RepeatedCompositeContainer
${ remove_blank_line(generate_file(tmplpath + "/import_tmpl_py.mako", nesteds=nesteds,filename=filename,package=package,json_data=json_data,loop_nesteds=loop_nesteds)) }

class FeildInVaild(Exception):
    pass


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

        elif _type in ['uint32', 'int32', 'uint64', 'int64', 'sint32',
                       'sint64', 'fixed32', 'fixed64', 'sfixed32',
                       'sfixed64']:
            return 0

        elif _type in ['float', 'double']:
            return 0.0

        elif _type == 'string':
            return ''

        elif _type == 'bytes':
            return b''

        elif _type == 'boolean':
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

        elif self.type in ['uint32', 'int32', 'uint64', 'int64', 'sint32',
                           'sint64', 'fixed32', 'fixed64', 'sfixed32',
                           'sfixed64']:
            if not isinstance(val, six.integer_types):
                raise FeildInVaild('[{}]value invaild, is not int[{}]'.format(self.name, val))  # noqa

        elif self.type in ['float', 'double']:
            if not isinstance(val, (float, decimal.Decimal)):
                raise FeildInVaild('[{}]value invaild, is not float[{}]'.format(self.name, val))  # noqa

        elif self.type == 'string':
            if not isinstance(val, six.string_types):
                raise FeildInVaild('[{}]value invaild, is not string[{}]'.format(self.name, val))  # noqa

        elif self.type == 'bytes':
            if not isinstance(val, six.binary_type):
                raise FeildInVaild('[{}]value invaild, is not bytes[{}]'.format(self.name, val))  # noqa

        elif self.type == 'boolean':
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
                val = []
            elif isinstance(val, (list, RepeatedCompositeContainer)):
                pass
            else:
                raise FeildInVaild(
                    '[{}]value invaild, is not list[{}]'.format(
                        self.name, val)
                )

            return [self.conv_value(i, True) for i in val]

        elif val is None:
            return self.get_default()

        elif self.type in ['uint32', 'int32', 'uint64', 'int64', 'sint32',
                           'sint64', 'fixed32', 'fixed64', 'sfixed32',
                           'sfixed64']:
            return int(val)

        elif self.type in ['float', 'double']:
            if isinstance(val, six.string_types):
                return decimal.Decimal(val)
            else:
                return decimal.Decimal.from_float(val)

        elif self.type == 'string':
            return str(val)

        elif self.type == 'bytes':
            if isinstance(val, six.string_types):
                raise str(six.b(val))
            else:
                return str(val)

        elif self.type == 'boolean':
            return bool(val)

        elif self.type == 'message':
            if isinstance(val, dict):
                return self.fclass.from_dict(val)
            elif isinstance(val, self.fclass):
                return self.fclass.from_dict(val)
            else:
                return self.fclass.from_dict(val)

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
        if not isinstance(kwargs, dict):
            raise FeildInVaild('kwargs invaild')

        if key not in self.fields:
            raise FeildInVaild(
                'key not in fileds invaild {}'.format(key)
            )

        return self.fields[key].conv_value(kwargs.get(key, None))  # noqa

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
        return json.dumps(self.to_dict(filterkeys))

    def __list_set(self, objs, opt, field):
        assert isinstance(objs, list)
        assert isinstance(opt, FeildOption)
        field.extend([obj.to_proto() if isinstance(
            obj, ProtoClass) else obj for obj in objs])

    def to_proto(self):
        """to proto object."""
        obj = self.protopb()
        for key, opt in self.fields.items():
            val = getattr(self, key.lower(), None)
            if not val:
                continue

            if opt.repeated:
                if not isinstance(val, list):
                    raise TypeError('{} invaild, is not list'.format(key))

                field = getattr(obj, key)
                self.__list_set(val, opt, field)
            elif opt.type == 'message':
                obj_data = getattr(self, key)
                obj_pb = getattr(obj, key)
                for key, val in obj_data.fields.items():
                    setattr(obj_pb, key, getattr(obj_data, key))
            else:
                setattr(obj, key, val)
        return obj

    def to_buffer(self):
        """SerializeToString."""
        obj = self.to_proto()
        return obj.SerializeToString()

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
