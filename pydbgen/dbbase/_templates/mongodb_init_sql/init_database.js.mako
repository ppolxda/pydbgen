% for dbname, dbconfig, db_opts in loop_datbases():
    % if db_opts.get('sharding_mode', 'SM_DISABLE') == 'SM_DISABLE':
        <% continue %>
    % endif
// ----------------------------
// -- Database for ${dbname} ${dict(db_opts)}
// ----------------------------
sh.enableSharding('${dbname}');
% endfor
