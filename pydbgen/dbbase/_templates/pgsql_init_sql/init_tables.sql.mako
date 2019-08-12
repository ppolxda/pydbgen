<%def name="key_fmt(pkey)" filter="trim">
    ${', '.join(pkey)}
</%def>
<%def name="inc_fmt(field)" filter="trim">
    % if field['db_options']['inc']:
    serial8
    % else:
    int8
    % endif
</%def>
<%def name="declen_fmt(field)" filter="trim">
    % if field['db_options']['declen']:
        <% declen = field['db_options']['declen'] %>
    % else:
        <% declen = 16 %>
    % endif
    % if field['db_options']['decpoint']:
        <% decpoint = field['db_options']['decpoint'] %>
    % else:
        <% decpoint = 8 %>
    % endif
    ${','.join([str(declen), str(decpoint)])}
</%def>
<%def name="default_fmt(field)" filter="trim">
    % if field['db_options']['defval']:
    DEFAULT '${ field['db_options']['defval']}'
    % endif
</%def>
<%def name="array_fmt(field)" filter="trim">
    % if field['options']['label'] == 'repeated':
    []
    % endif
</%def>
<%def name="line_fmt(ilist, iname)" filter="trim">
    ${',' if ilist[-1] != iname else ';'}
</%def>
% for dbname, tname, tconfig, topts in loop_tables():
<% pkey = [field['name'] for field in tconfig['fields'] if field['db_options']['key']] %>
-- ----------------------------
-- -- Table for ${dbname} ${tname} ${dict(topts)}
-- ----------------------------
-- DROP TABLE IF EXISTS ${dbname}.${tname};
CREATE TABLE ${dbname}.${tname} (
createtime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
% for field in tconfig['fields']:
    % if field['type'] == 'string':
${field['name']} varchar(${field['db_options']['maxlen']})${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] == 'bytes':
${field['name']} bytea${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] == 'int32' or field['type'] == 'int64':
${field['name']} ${inc_fmt(field)}${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] == 'float' or field['type'] == 'double':
${field['name']} decimal(${declen_fmt(field)})${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] == 'datetime':
${field['name']} timestamp NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] == 'date':
${field['name']} date NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] in ['json', 'jsonb']:
${field['name']} ${field['type']}${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % elif field['type'] in ['oneof', 'message']:
    % else:
${field['name']} int2 NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field)}
    % endif
% endfor
## % if pkey and (not partition_keys or partition_keys == pkey):
% if pkey:
PRIMARY KEY (${ key_fmt(pkey) })
% endif
)
## % if partition_keys:
## PARTITION BY RANGE (${','.join(partition_keys)})
## % endif
% if tconfig['db_options'].get('space', None):
TABLESPACE "${field['db_options']['space']}"
% endif
;
% endfor
