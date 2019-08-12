<%def name="key_fmt(fields)" filter="trim">
${', '.join(["`{}`".format(val['name']) for val in fields])}
</%def>
<%def name="line_fmt(ilist, iname)" filter="trim">
${',' if ilist[-1] != iname else ';'}
</%def>
% for dbname, tname, tconfig, topts in loop_tables():
-- ----------------------------
-- -- Table for ${dbname} ${tname} ${dict(topts)}
-- ----------------------------
ALTER TABLE `${dbname}`.`${tname}`
    % for iname, iconfig in tconfig['members'].items():
        % if iconfig['msg_type'] != 'INDEX':
            <% continue %>
        % endif

        % if iconfig['db_options']['index_type'] not in ['INDEX_KEY', 'UNIQUE_KEY']:
            <% continue %>
        % endif

        <% mkey = list(tconfig['members'].keys()) %>

        % if iconfig['db_options']['index_type'] == 'UNIQUE_KEY' or (iconfig['db_options']['index_type'] == 'INDEX_KEY' and iconfig['db_options']['is_unique']):
ADD UNIQUE INDEX `${iname}` (${ key_fmt(iconfig['fields']) }) USING BTREE${line_fmt(mkey, iname)}
        % elif iconfig['db_options']['index_type'] == 'INDEX_KEY':
ADD INDEX `${iname}` (${ key_fmt(iconfig['fields']) }) USING BTREE${line_fmt(mkey, iname)}
        % endif
    % endfor
% endfor
