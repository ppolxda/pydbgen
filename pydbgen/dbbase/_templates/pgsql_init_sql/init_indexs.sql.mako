<%!
    tables = []
    def get_sort(field):
        return '1' if field['db_options'].get('sort', 'ASC') == 'ASC' else '\'hashed\'' if field['db_options'].get('sort', 'ASC') == 'HASHED' else '-1'
%>
% for dbname, tname, iname, iconfig, tconfig, topts in loop_indexs():
    % if iconfig['db_options']['index_type'] == 'SHARDING_KEY':
        <% continue %>
    % endif
    <% is_hash = 'HASHED' in [val['db_options'].get('sort', 'DESC') for val in iconfig['fields']] %>
    <% index_type = 'hash' if is_hash else 'btree' %>

    % if iconfig['db_options']['index_type'] == 'UNIQUE_KEY':
CREATE UNIQUE INDEX "${ dbname }_${ tname }_${iname}" ON ${ dbname }.${ tname } USING ${index_type} (
    ${ ',\n'.join(["{} {}".format(val['name'], '' if is_hash else val['db_options'].get('sort', 'DESC')) for val in iconfig['fields']]) }
);
    % elif iconfig['db_options']['index_type'] == 'INDEX_KEY':
CREATE INDEX "${ dbname }_${ tname }_${iname}" ON ${ dbname }.${ tname } USING ${index_type} (
    ${ ',\n'.join(["{} {}".format(val['name'], '' if is_hash else val['db_options'].get('sort', 'DESC')) for val in iconfig['fields']]) }
);
    % elif iconfig['db_options']['index_type'] == 'FOREIGN_KEY':
    % endif
% endfor
