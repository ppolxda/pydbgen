% for dbname, tname, tconfig, topts in loop_tables():

class ${ tname | class_name }(object):

    def __init__(self, **kwargs):
    % for field in tconfig['fields']:
        self.${field['name']} = kwargs.get(${field['name']}, ${field['db_options'].get('defval', None)})
    % endfor

% endfor
