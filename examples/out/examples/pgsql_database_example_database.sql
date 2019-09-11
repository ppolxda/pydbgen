-- ----------------------------
-- -- Database for users {}
-- ----------------------------
-- DROP SCHEMA IF EXISTS users  CASCADE;
CREATE SCHEMA users;
-- ----------------------------
-- -- Database for trade_2019Q1 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q1  CASCADE;
CREATE SCHEMA trade_2019Q1;
-- ----------------------------
-- -- Database for trade_2019Q2 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q2  CASCADE;
CREATE SCHEMA trade_2019Q2;
-- ----------------------------
-- -- Database for trade_2019Q3 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q3  CASCADE;
CREATE SCHEMA trade_2019Q3;
-- ----------------------------
-- -- Database for trade_2019Q4 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q4  CASCADE;
CREATE SCHEMA trade_2019Q4;
-- ----------------------------
-- -- Database for trade_temp {}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_temp  CASCADE;
CREATE SCHEMA trade_temp;