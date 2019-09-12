-- ----------------------------
-- -- Table for users user_info {'space': 'user_spaces'}
-- ----------------------------
ALTER TABLE `users`.`user_info`
ADD UNIQUE INDEX `logincode_unique` (`loginCode`) USING BTREE,
ADD INDEX `phone_index` (`phone`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q1 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
-- ----------------------------
ALTER TABLE `trade_2019Q1`.`user_info`
ADD UNIQUE INDEX `logincode_unique` (`loginCode`) USING BTREE,
ADD INDEX `phone_index` (`phone`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q1 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
-- ----------------------------
ALTER TABLE `trade_2019Q1`.`order`
ADD CONSTRAINT `userid_foreign` FOREIGN KEY (
`userId`
) REFERENCES trade_2019Q1.user_info (
`userId`
) ON DELETE CASCADE ON UPDATE RESTRICT,
ADD INDEX `order_sharding` (`userId`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q2 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
-- ----------------------------
ALTER TABLE `trade_2019Q2`.`user_info`
ADD UNIQUE INDEX `logincode_unique` (`loginCode`) USING BTREE,
ADD INDEX `phone_index` (`phone`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q2 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
-- ----------------------------
ALTER TABLE `trade_2019Q2`.`order`
ADD CONSTRAINT `userid_foreign` FOREIGN KEY (
`userId`
) REFERENCES trade_2019Q2.user_info (
`userId`
) ON DELETE CASCADE ON UPDATE RESTRICT,
ADD INDEX `order_sharding` (`userId`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q3 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
-- ----------------------------
ALTER TABLE `trade_2019Q3`.`user_info`
ADD UNIQUE INDEX `logincode_unique` (`loginCode`) USING BTREE,
ADD INDEX `phone_index` (`phone`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q3 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
-- ----------------------------
ALTER TABLE `trade_2019Q3`.`order`
ADD CONSTRAINT `userid_foreign` FOREIGN KEY (
`userId`
) REFERENCES trade_2019Q3.user_info (
`userId`
) ON DELETE CASCADE ON UPDATE RESTRICT,
ADD INDEX `order_sharding` (`userId`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q4 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
-- ----------------------------
ALTER TABLE `trade_2019Q4`.`user_info`
ADD UNIQUE INDEX `logincode_unique` (`loginCode`) USING BTREE,
ADD INDEX `phone_index` (`phone`) USING BTREE;
-- ----------------------------
-- -- Table for trade_2019Q4 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
-- ----------------------------
ALTER TABLE `trade_2019Q4`.`order`
ADD CONSTRAINT `userid_foreign` FOREIGN KEY (
`userId`
) REFERENCES trade_2019Q4.user_info (
`userId`
) ON DELETE CASCADE ON UPDATE RESTRICT,
ADD INDEX `order_sharding` (`userId`) USING BTREE;