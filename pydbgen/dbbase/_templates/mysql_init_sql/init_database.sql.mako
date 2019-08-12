% for dbname, dbconfig, db_opts in loop_datbases():
    % if db_opts.get('sharding_mode', 'SM_DISABLE') == 'SM_DISABLE':
        <% continue %>
    % endif
-- ----------------------------
-- -- Database for ${dbname} ${dict(db_opts)}
-- ----------------------------
# DROP DATABASE `${dbname}`;
CREATE DATABASE  `${dbname}` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
% endfor
