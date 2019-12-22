-- ----------------------------
-- -- Database for users {'sharding_date_begin': 'None', 'sharding_date_end': 'None'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS users  CASCADE;
CREATE SCHEMA users;
-- ----------------------------
-- -- Database for trade_2019Q1 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q1  CASCADE;
CREATE SCHEMA trade_2019Q1;
-- ----------------------------
-- -- Database for trade_2019Q2 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q2  CASCADE;
CREATE SCHEMA trade_2019Q2;
-- ----------------------------
-- -- Database for trade_2019Q3 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q3  CASCADE;
CREATE SCHEMA trade_2019Q3;
-- ----------------------------
-- -- Database for trade_2019Q4 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_2019Q4  CASCADE;
CREATE SCHEMA trade_2019Q4;
-- ----------------------------
-- -- Database for trade_temp {'sharding_date_begin': 'None', 'sharding_date_end': 'None'}
-- ----------------------------
-- DROP SCHEMA IF EXISTS trade_temp  CASCADE;
CREATE SCHEMA trade_temp;
