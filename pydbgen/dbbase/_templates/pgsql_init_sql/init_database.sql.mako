% for dbname, dbconfig, db_opts in loop_datbases():
-- ----------------------------
-- -- Database for ${dbname} ${dict(db_opts)}
-- ----------------------------
-- DROP SCHEMA IF EXISTS ${dbname}  CASCADE;
CREATE SCHEMA ${dbname};
% endfor
