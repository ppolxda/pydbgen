<%  cur_class_name = ('' + parentclass + '_' if parentclass else '') + name %>
class ${cur_class_name}(object):
    """${name} enum define."""
    % for val in fields.values():
    ${val['name'].upper()} = ${val['value']}  # ${val['comment']}
    % endfor

    ENUM_LIST = [
        % for val in fields.values():
        ${val['name'].upper()},
        % endfor
    ]

    ENUM_COMMENTS = {
        % for val in fields.values():
        ${val['name'].upper()}: '${val['comment']}',
        % endfor
    }

    @classmethod
    def is_invaild(cls, val):
        u"""is_invaild."""
        return val not in cls.ENUM_LIST

    @classmethod
    def get_comments(cls, val):
        """get_comments."""
        return cls.ENUM_COMMENTS.get(val, 'unknow')
