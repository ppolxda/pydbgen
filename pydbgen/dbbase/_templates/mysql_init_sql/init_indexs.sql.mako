<%!
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

        % if iconfig['db_options']['index_type'] not in ['INDEX_KEY', 'UNIQUE_KEY', 'FOREIGN_KEY']:
            <% continue %>
        % endif

        <% mkey = list(tconfig['members'].keys()) %>

        % if iconfig['db_options']['index_type'] == 'UNIQUE_KEY' or (iconfig['db_options']['index_type'] == 'INDEX_KEY' and iconfig['db_options']['is_unique']):
ADD UNIQUE INDEX `${iname}` (${ key_fmt(iconfig['fields']) }) USING BTREE${line_fmt(mkey, iname)}
        % elif iconfig['db_options']['index_type'] == 'INDEX_KEY':
ADD INDEX `${iname}` (${ key_fmt(iconfig['fields']) }) USING BTREE${line_fmt(mkey, iname)}
        % elif iconfig['db_options']['index_type'] == 'FOREIGN_KEY':
            <% fkeys = list(iconfig['members'].keys()) %>
            <% ftable = iconfig['members'][fkeys[0]] %>
ADD CONSTRAINT `${ iname }` FOREIGN KEY (
        ${ key_fmt(iconfig['fields']) }
    ) REFERENCES ${ dbname }.${ ftable['name'] } (
        ${ key_fmt(ftable['fields']) }
    ) ${ foreign_action(iconfig['db_options']['foreign_update'], 'DELETE') } ${ foreign_action(iconfig['db_options']['foreign_delete'], 'UPDATE') }${line_fmt(mkey, iname)}
        % endif
    % endfor
% endfor
