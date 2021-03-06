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
    DEFAULT ${ field['db_options']['defval']}
    % endif
</%def>
<%def name="array_fmt(field)" filter="trim">
    % if field['options']['label'] == 'repeated':
    []
    % endif
</%def>
<%def name="line_fmt(ilist, iname, has_pkey)" filter="trim">
    ${',' if ilist[-1] != iname else ',' if has_pkey else ''}
</%def>
<% is_temp = cargs.get('is_temp', False) %>
% if is_temp:
    <%
        TEMP_KEY = 'TEMP '
        loop_func = loop_temp_tables
    %>
% else:
    <%
        TEMP_KEY = ''
        loop_func = loop_tables
    %>
% endif
% for dbname, tname, tconfig, topts in loop_func():
<% pkey = [field['name'] for field in tconfig['fields'] if field['db_options']['key']] %>
## <% has_pkey = pkey and (not partition_keys or partition_keys == pkey): %>
<% is_partitions = is_partition(topts) %>
<% has_pkey = pkey and not is_partitions %>
-- ----------------------------
-- -- Table for ${dbname} ${tname} ${dict(topts)}
-- ----------------------------
% if is_temp:
DROP TABLE IF EXISTS ${tname};
CREATE ${TEMP_KEY}TABLE ${tname} (
% else:
-- DROP TABLE IF EXISTS ${dbname}.${tname};
CREATE TABLE ${dbname}.${tname} (
createtime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
% endif
% for field in tconfig['fields']:
    % if field['type'] == 'string':
${field['name']} varchar(${field['db_options']['maxlen']})${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] == 'bytes':
${field['name']} bytea${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] == 'int32' or field['type'] == 'int64':
${field['name']} ${inc_fmt(field)}${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] == 'float' or field['type'] == 'double':
${field['name']} decimal(${declen_fmt(field)})${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] == 'datetime':
${field['name']} timestamp NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] == 'date':
${field['name']} date NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] in ['json', 'jsonb']:
${field['name']} ${field['type']}${array_fmt(field)} NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % elif field['type'] in ['oneof', 'message']:
    % else:
${field['name']} int2 NOT NULL ${default_fmt(field)}${line_fmt(tconfig['fields'], field, has_pkey)}
    % endif
% endfor
% if has_pkey:
PRIMARY KEY (${ key_fmt(pkey) })
% endif
)
% if is_partitions:
PARTITION BY RANGE (${ key_fmt(topts['sharding_key'].split(',')) })
% endif
% if topts.get('space', None):
TABLESPACE "${topts['space']}"
% endif
;

% if is_partitions:
    % for pname, start, end in loop_sharding_range(tname, topts, p2r=True):
CREATE TABLE ${dbname}.${pname} PARTITION OF ${dbname}.${tname}
FOR VALUES FROM ('${start}') TO ('${end}');
    % endfor
    % if pkey:
CREATE UNIQUE INDEX "${dbname}.${tname}_primary" ON ${dbname}.${tname} USING btree (
    ${ key_fmt(topts['sharding_key'].split(',') + pkey) }
)
        % if topts.get('space', None):
TABLESPACE "${topts['space']}"
        % endif
;
    % endif
% endif
% endfor
