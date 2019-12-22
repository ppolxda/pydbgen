<%!
    tables = []
    def get_sort(field):
        return '1' if field['db_options'].get('sort', 'ASC') == 'ASC' else '\'hashed\'' if field['db_options'].get('sort', 'ASC') == 'HASHED' else '-1'

    def foreign_action(key, action):
        if action not in ['DELETE', 'UPDATE']:
            raise TypeError('foreign_action action invaild')

        enums = {
            'FA_NONE': '',
            'FA_RESTRICT': 'RESTRICT',
            'FA_NO_ACTION': 'NO ACTION',
            'FA_CASCADE': 'CASCADE',
            'FA_SET_NULL': 'SET NULL',
            'FA_SET_DEFAULT': 'SET DEFAULT',
        }
        mode = enums.get(key, '')
        if mode:
            return ' '.join(['ON', action,  mode])
        else:
            return ''
%>
% for dbname, tname, iname, iconfig, tconfig, topts in loop_indexs():
    % if iconfig['db_options']['index_type'] == 'SHARDING_KEY':
        <% continue %>
    % endif
    <% is_hash = 'HASHED' in [val['db_options'].get('sort', 'DESC') for val in iconfig['fields']] %>
    <% index_type = 'hash' if is_hash else 'btree' %>

    % if iconfig['db_options']['index_type'] == 'UNIQUE_KEY':
CREATE UNIQUE INDEX "${ dbname }_${ tname }_${ iname }" ON ${ dbname }.${ tname } USING ${index_type} (
    ${ ',\n'.join(["{} {}".format(val['name'], '' if is_hash else val['db_options'].get('sort', 'DESC')) for val in iconfig['fields']]) }
);
    % elif iconfig['db_options']['index_type'] == 'INDEX_KEY':
CREATE INDEX "${ dbname }_${ tname }_${ iname }" ON ${ dbname }.${ tname } USING ${index_type} (
    ${ ',\n'.join(["{} {}".format(val['name'], '' if is_hash else val['db_options'].get('sort', 'DESC')) for val in iconfig['fields']]) }
);
    % elif iconfig['db_options']['index_type'] == 'FOREIGN_KEY':
        <% fkeys = list(iconfig['members'].keys()) %>
        <% ftable = iconfig['members'][fkeys[0]] %>
ALTER TABLE ${ dbname }.${ tname }
    ADD CONSTRAINT "${ dbname }_${ tname }_${ iname }" FOREIGN KEY (
        ${ ',\n'.join([val['name'] for val in iconfig['fields']]) }
    ) REFERENCES ${ dbname }.${ ftable['name'] } (
        ${ ',\n'.join([val['name'] for val in ftable['fields']]) }
    ) ${ foreign_action(iconfig['db_options']['foreign_update'], 'DELETE') } ${ foreign_action(iconfig['db_options']['foreign_delete'], 'UPDATE') };
    % endif
% endfor
