% for dbname, dbconfig, db_opts in loop_datbases():
-- ----------------------------
-- -- Database for ${dbname} ${dict(db_opts)}
-- ----------------------------
# DROP DATABASE `${dbname}`;
CREATE DATABASE  `${dbname}` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
% endfor
