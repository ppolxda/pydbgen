<%!
    def get_sort(field):
        return '1' if field['db_options'].get('sort', 'ASC') == 'ASC' else '\'hashed\'' if field['db_options'].get('sort', 'ASC') == 'HASHED' else '-1'
%>
% for dbname, tname, iname, iconfig, tconfig, topts in loop_indexs():
    % if iconfig['db_options']['index_type'] == 'SHARDING_KEY':
        <% continue %>
    % endif
// ----------------------------
// -- Table for ${dbname} ${tname} ${dict(topts)}
// ----------------------------
db = db.getSiblingDB('${dbname}');
    % if iconfig['db_options']['index_type'] == 'UNIQUE_KEY':
db.getCollection('${tname}').createIndex({ ${','.join(['"{}": {}'.format(i['name'], get_sort(i)) for i in iconfig['fields']]) } }, { 'background': true, 'unique': 'true' });
    % elif iconfig['db_options']['index_type'] == 'INDEX_KEY':
db.getCollection('${tname}').createIndex({ ${','.join(['"{}": {}'.format(i['name'], get_sort(i)) for i in iconfig['fields']]) } }, { 'background': true, 'unique': 'false' });
    % endif
% endfor
