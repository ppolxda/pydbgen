<%
    cur_class_name = ('' + parentclass + '_' if parentclass else '') + name

    def fmt_class(type_name, package, step_root=True):
        cpath = type_name[len(package) + 2:]
        if step_root and cpath.startswith(cur_class_name + '.'):
            cpath = cpath[len(cur_class_name) + 1:]
        return cpath

    def get_fclass(val, package):
        _type = fmt_class(val['options']['type_name'], package)
        if val['type'].lower() == 'message' and _type not in ['date', 'datetime']:
            return ", fclass=" + _type
        else:
            return ''

    def get_type(val, package):
        _type = fmt_class(val['options']['type_name'], package)
        if val['type'].lower() == 'message' and _type in ['date', 'datetime']:
            return _type
        else:
            return val['type'].lower()
%>

class ${cur_class_name}(ProtoClass):  # noqa
    """${class_name(name)}."""
    <% _roots = roots + [name] %>
    <% _roots[0] = _roots[0] + '_pb' %>
    protopb = ${ '.'.join(_roots) }
% for enum in enums.values():
<% sub_class_name = ('_' + cur_class_name if cur_class_name[0] != '_' else cur_class_name) + '_' + enum['name']%>
    ${enum['name']} = ${sub_class_name}
% endfor
% for nested in nesteds.values():
<% sub_class_name = ('_' + cur_class_name if cur_class_name[0] != '_' else cur_class_name) + '_' + nested['name']%>
    ${nested['name']} = ${sub_class_name}
% endfor

    fields = {
        % for val in fields.values():
        '${val['name']}': FeildOption('${get_type(val, package)}', '${val['name'].lower()}', '${val['comment'].lower()}', ${val['options']['label'] == 'repeated'}${get_fclass(val, package)}),  # noqa
        % endfor
    }

    def __init__(self, **kwargs):
        % for val in fields.values():
            % if val['type'].lower() == 'message' and val['options']['label'] != 'repeated' and get_type(val, package) not in ['date', 'datetime']:
        self.${val['name'].lower()} = self.new_${val['name'].lower()}(self._value_kwargs('${val['name'].lower()}', kwargs))  # noqa
            % else:
        self.${val['name'].lower()} = self._value_kwargs('${val['name'].lower()}', kwargs)  # noqa
            % endif
        % endfor
        % if not fields:
        pass
        % endif

        % for val in fields.values():
            % if val['type'].lower() != 'message' or get_type(val, package) in ['date', 'datetime']:
                <% continue %>
            % endif

    def new_${val['name'].lower()}(self, data=None):
        if not data:
            return ${fmt_class(val['options']['type_name'], package, False)}()
        elif isinstance(data, dict):
            return ${fmt_class(val['options']['type_name'], package, False)}.from_dict(data)
        elif isinstance(data, six.binary_type):
            return ${fmt_class(val['options']['type_name'], package, False)}.from_buffer(data)
        elif isinstance(data, ${fmt_class(val['options']['type_name'], package, False)}):
            return data
        else:
            raise TypeError('data invaild')
        % endfor

    @classmethod
    def from_dict(cls, obj):
        """ParseFromString."""
        # if not isinstance(obj, dict):
        #     raise TypeError('from_proto data invaild')

        if isinstance(obj, Message):
            obj_dict = {
                key: getattr(obj, key, None)
                for key in cls.fields
                if getattr(obj, key, None)
            }
        elif isinstance(obj, dict):
            obj_dict = {
                key: obj.get(key, None)
                for key in cls.fields
                if obj.get(key, None)
            }
        else:
            raise TypeError('from_proto data invaild')

        return ${cur_class_name}(**obj_dict)

    @classmethod
    def from_buffer(cls, buf):
        """ParseFromString."""
        assert isinstance(buf, six.binary_type)
        obj = cls.protopb()
        obj.ParseFromString(buf)
        obj_dict = {
            key: getattr(obj, key, None)
            for key in cls.fields
            if getattr(obj, key, None)
        }
        return ${cur_class_name}(**obj_dict)  # noqa
