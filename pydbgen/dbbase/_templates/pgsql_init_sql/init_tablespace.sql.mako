% for tsname, tsconfig in loop_tablespaces():
-- ----------------------------
-- -- Database for ${ tsname }
-- ----------------------------
CREATE TABLESPACE "${tsname}" LOCATION '${tsconfig['db_options']['location']}';
% endfor