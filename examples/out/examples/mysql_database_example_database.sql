-- ----------------------------
-- -- Database for users {'sharding_date_begin': 'None', 'sharding_date_end': 'None'}
-- ----------------------------
# DROP DATABASE `users`;
CREATE DATABASE  `users` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- ----------------------------
-- -- Database for trade_2019Q1 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00'}
-- ----------------------------
# DROP DATABASE `trade_2019Q1`;
CREATE DATABASE  `trade_2019Q1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- ----------------------------
-- -- Database for trade_2019Q2 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00'}
-- ----------------------------
# DROP DATABASE `trade_2019Q2`;
CREATE DATABASE  `trade_2019Q2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- ----------------------------
-- -- Database for trade_2019Q3 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00'}
-- ----------------------------
# DROP DATABASE `trade_2019Q3`;
CREATE DATABASE  `trade_2019Q3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- ----------------------------
-- -- Database for trade_2019Q4 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00'}
-- ----------------------------
# DROP DATABASE `trade_2019Q4`;
CREATE DATABASE  `trade_2019Q4` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- ----------------------------
-- -- Database for trade_temp {'sharding_date_begin': 'None', 'sharding_date_end': 'None'}
-- ----------------------------
# DROP DATABASE `trade_temp`;
CREATE DATABASE  `trade_temp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
