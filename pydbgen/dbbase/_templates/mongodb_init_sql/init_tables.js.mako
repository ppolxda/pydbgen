<%!
    def get_sort(field):
        return '1' if field['db_options'].get('sort', 'ASC') == 'ASC' else '\'hashed\'' if field['db_options'].get('sort', 'ASC') == 'HASHED' else '-1'
%>
% for dbname, tname, iname, iconfig, tconfig, topts in loop_indexs(p2r=True):
    % if iconfig['db_options']['index_type'] != 'SHARDING_KEY':
        <% continue %>
    % endif
// ----------------------------
// -- Table for ${dbname} ${tname} ${dict(topts)}
// ----------------------------
## db = db.getSiblingDB('${dbname}');
sh.shardCollection('${dbname}.${tname}', { ${','.join(['"{}": {}'.format(i['name'], get_sort(i)) for i in iconfig['fields']]) } }, ${'true' if iconfig['db_options'].get('is_unique', 0) else 'false'});
% endfor
