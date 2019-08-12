<%def name="key_fmt(pkey)" filter="trim">
    ${', '.join(["`{}`".format(val) for val in pkey])}
</%def>
<%def name="inc_fmt(field)" filter="trim">
    % if field['db_options']['inc']:
    AUTO_INCREMENT
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
<%def name="line_fmt(ilist, iname)" filter="trim">
    ${',' if ilist[-1] != iname else ';'}
</%def>
% for dbname, tname, tconfig, topts in loop_tables():
<% pkey = [field['name'] for field in tconfig['fields'] if field['db_options']['key']] %>
-- ----------------------------
-- -- Table for ${dbname} ${tname} ${dict(topts)}
-- ----------------------------
-- DROP TABLE IF EXISTS `${dbname}`.`${tname}`;
CREATE TABLE `${dbname}`.`${tname}` (
`createtime`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
`updatetime`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
% for field in tconfig['fields']:
    % if field['type'] == 'string':
`${field['name']}`  varchar(${field['db_options']['maxlen']}) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ${default_fmt(field)},
    % elif field['type'] == 'bytes':
`${field['name']}`  varbinary(${field['db_options']['maxlen']}) NOT NULL ${default_fmt(field)},
    % elif field['type'] == 'int32' or field['type'] == 'int64':
`${field['name']}`  int(11) NOT NULL ${inc_fmt(field)} ${default_fmt(field)},
    % elif field['type'] == 'float' or field['type'] == 'double':
`${field['name']}`  decimal(${declen_fmt(field)}) NOT NULL ${default_fmt(field)},
    % elif field['type'] == 'datetime':
`${field['name']}` datetime NOT NULL ${default_fmt(field)},
    % elif field['type'] == 'date':
`${field['name']}` date NOT NULL ${default_fmt(field)},
    % elif field['type'] in ['oneof', 'message']:
    % else:
`${field['name']}` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ${default_fmt(field)},
    % endif
% endfor
% if pkey:
PRIMARY KEY (${ key_fmt(pkey) })
% endif
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
% endfor
