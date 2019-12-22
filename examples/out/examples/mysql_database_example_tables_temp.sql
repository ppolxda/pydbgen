
-- ----------------------------
-- -- Table for users user_info {'sharding_date_begin': 'None', 'sharding_date_end': 'None', 'space': 'user_spaces'}
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TEMPORARY TABLE `user_info` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`loginCode`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nikeName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`others` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT {},
PRIMARY KEY (`userId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
-- ----------------------------
-- -- Table for trade_2019Q1 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'userId'}
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TEMPORARY TABLE `user_info` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`loginCode`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nikeName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`others` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT {},
PRIMARY KEY (`userId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
-- ----------------------------
-- -- Table for trade_2019Q1 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TEMPORARY TABLE `order` (
`oderId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderTime` datetime NOT NULL ,
`userId`  int(11) NOT NULL  ,
`symbol`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qty`  decimal(32,8) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
PARTITION BY RANGE (`orderTime`) (
PARTITION ptrade_2019Q1order_20190101 VALUES LESS THAN ('2019-01-02 00:00:00'),
PARTITION ptrade_2019Q1order_20190102 VALUES LESS THAN ('2019-01-03 00:00:00'),
PARTITION ptrade_2019Q1order_20190103 VALUES LESS THAN ('2019-01-04 00:00:00'),
PARTITION ptrade_2019Q1order_20190104 VALUES LESS THAN ('2019-01-05 00:00:00'),
PARTITION ptrade_2019Q1order_20190105 VALUES LESS THAN ('2019-01-06 00:00:00'),
PARTITION ptrade_2019Q1order_20190106 VALUES LESS THAN ('2019-01-07 00:00:00'),
PARTITION ptrade_2019Q1order_20190107 VALUES LESS THAN ('2019-01-08 00:00:00'),
PARTITION ptrade_2019Q1order_20190108 VALUES LESS THAN ('2019-01-09 00:00:00'),
PARTITION ptrade_2019Q1order_20190109 VALUES LESS THAN ('2019-01-10 00:00:00'),
PARTITION ptrade_2019Q1order_20190110 VALUES LESS THAN ('2019-01-11 00:00:00'),
PARTITION ptrade_2019Q1order_20190111 VALUES LESS THAN ('2019-01-12 00:00:00'),
PARTITION ptrade_2019Q1order_20190112 VALUES LESS THAN ('2019-01-13 00:00:00'),
PARTITION ptrade_2019Q1order_20190113 VALUES LESS THAN ('2019-01-14 00:00:00'),
PARTITION ptrade_2019Q1order_20190114 VALUES LESS THAN ('2019-01-15 00:00:00'),
PARTITION ptrade_2019Q1order_20190115 VALUES LESS THAN ('2019-01-16 00:00:00'),
PARTITION ptrade_2019Q1order_20190116 VALUES LESS THAN ('2019-01-17 00:00:00'),
PARTITION ptrade_2019Q1order_20190117 VALUES LESS THAN ('2019-01-18 00:00:00'),
PARTITION ptrade_2019Q1order_20190118 VALUES LESS THAN ('2019-01-19 00:00:00'),
PARTITION ptrade_2019Q1order_20190119 VALUES LESS THAN ('2019-01-20 00:00:00'),
PARTITION ptrade_2019Q1order_20190120 VALUES LESS THAN ('2019-01-21 00:00:00'),
PARTITION ptrade_2019Q1order_20190121 VALUES LESS THAN ('2019-01-22 00:00:00'),
PARTITION ptrade_2019Q1order_20190122 VALUES LESS THAN ('2019-01-23 00:00:00'),
PARTITION ptrade_2019Q1order_20190123 VALUES LESS THAN ('2019-01-24 00:00:00'),
PARTITION ptrade_2019Q1order_20190124 VALUES LESS THAN ('2019-01-25 00:00:00'),
PARTITION ptrade_2019Q1order_20190125 VALUES LESS THAN ('2019-01-26 00:00:00'),
PARTITION ptrade_2019Q1order_20190126 VALUES LESS THAN ('2019-01-27 00:00:00'),
PARTITION ptrade_2019Q1order_20190127 VALUES LESS THAN ('2019-01-28 00:00:00'),
PARTITION ptrade_2019Q1order_20190128 VALUES LESS THAN ('2019-01-29 00:00:00'),
PARTITION ptrade_2019Q1order_20190129 VALUES LESS THAN ('2019-01-30 00:00:00'),
PARTITION ptrade_2019Q1order_20190130 VALUES LESS THAN ('2019-01-31 00:00:00'),
PARTITION ptrade_2019Q1order_20190131 VALUES LESS THAN ('2019-02-01 00:00:00'),
PARTITION ptrade_2019Q1order_20190201 VALUES LESS THAN ('2019-02-02 00:00:00'),
PARTITION ptrade_2019Q1order_20190202 VALUES LESS THAN ('2019-02-03 00:00:00'),
PARTITION ptrade_2019Q1order_20190203 VALUES LESS THAN ('2019-02-04 00:00:00'),
PARTITION ptrade_2019Q1order_20190204 VALUES LESS THAN ('2019-02-05 00:00:00'),
PARTITION ptrade_2019Q1order_20190205 VALUES LESS THAN ('2019-02-06 00:00:00'),
PARTITION ptrade_2019Q1order_20190206 VALUES LESS THAN ('2019-02-07 00:00:00'),
PARTITION ptrade_2019Q1order_20190207 VALUES LESS THAN ('2019-02-08 00:00:00'),
PARTITION ptrade_2019Q1order_20190208 VALUES LESS THAN ('2019-02-09 00:00:00'),
PARTITION ptrade_2019Q1order_20190209 VALUES LESS THAN ('2019-02-10 00:00:00'),
PARTITION ptrade_2019Q1order_20190210 VALUES LESS THAN ('2019-02-11 00:00:00'),
PARTITION ptrade_2019Q1order_20190211 VALUES LESS THAN ('2019-02-12 00:00:00'),
PARTITION ptrade_2019Q1order_20190212 VALUES LESS THAN ('2019-02-13 00:00:00'),
PARTITION ptrade_2019Q1order_20190213 VALUES LESS THAN ('2019-02-14 00:00:00'),
PARTITION ptrade_2019Q1order_20190214 VALUES LESS THAN ('2019-02-15 00:00:00'),
PARTITION ptrade_2019Q1order_20190215 VALUES LESS THAN ('2019-02-16 00:00:00'),
PARTITION ptrade_2019Q1order_20190216 VALUES LESS THAN ('2019-02-17 00:00:00'),
PARTITION ptrade_2019Q1order_20190217 VALUES LESS THAN ('2019-02-18 00:00:00'),
PARTITION ptrade_2019Q1order_20190218 VALUES LESS THAN ('2019-02-19 00:00:00'),
PARTITION ptrade_2019Q1order_20190219 VALUES LESS THAN ('2019-02-20 00:00:00'),
PARTITION ptrade_2019Q1order_20190220 VALUES LESS THAN ('2019-02-21 00:00:00'),
PARTITION ptrade_2019Q1order_20190221 VALUES LESS THAN ('2019-02-22 00:00:00'),
PARTITION ptrade_2019Q1order_20190222 VALUES LESS THAN ('2019-02-23 00:00:00'),
PARTITION ptrade_2019Q1order_20190223 VALUES LESS THAN ('2019-02-24 00:00:00'),
PARTITION ptrade_2019Q1order_20190224 VALUES LESS THAN ('2019-02-25 00:00:00'),
PARTITION ptrade_2019Q1order_20190225 VALUES LESS THAN ('2019-02-26 00:00:00'),
PARTITION ptrade_2019Q1order_20190226 VALUES LESS THAN ('2019-02-27 00:00:00'),
PARTITION ptrade_2019Q1order_20190227 VALUES LESS THAN ('2019-02-28 00:00:00'),
PARTITION ptrade_2019Q1order_20190228 VALUES LESS THAN ('2019-03-01 00:00:00'),
PARTITION ptrade_2019Q1order_20190301 VALUES LESS THAN ('2019-03-02 00:00:00'),
PARTITION ptrade_2019Q1order_20190302 VALUES LESS THAN ('2019-03-03 00:00:00'),
PARTITION ptrade_2019Q1order_20190303 VALUES LESS THAN ('2019-03-04 00:00:00'),
PARTITION ptrade_2019Q1order_20190304 VALUES LESS THAN ('2019-03-05 00:00:00'),
PARTITION ptrade_2019Q1order_20190305 VALUES LESS THAN ('2019-03-06 00:00:00'),
PARTITION ptrade_2019Q1order_20190306 VALUES LESS THAN ('2019-03-07 00:00:00'),
PARTITION ptrade_2019Q1order_20190307 VALUES LESS THAN ('2019-03-08 00:00:00'),
PARTITION ptrade_2019Q1order_20190308 VALUES LESS THAN ('2019-03-09 00:00:00'),
PARTITION ptrade_2019Q1order_20190309 VALUES LESS THAN ('2019-03-10 00:00:00'),
PARTITION ptrade_2019Q1order_20190310 VALUES LESS THAN ('2019-03-11 00:00:00'),
PARTITION ptrade_2019Q1order_20190311 VALUES LESS THAN ('2019-03-12 00:00:00'),
PARTITION ptrade_2019Q1order_20190312 VALUES LESS THAN ('2019-03-13 00:00:00'),
PARTITION ptrade_2019Q1order_20190313 VALUES LESS THAN ('2019-03-14 00:00:00'),
PARTITION ptrade_2019Q1order_20190314 VALUES LESS THAN ('2019-03-15 00:00:00'),
PARTITION ptrade_2019Q1order_20190315 VALUES LESS THAN ('2019-03-16 00:00:00'),
PARTITION ptrade_2019Q1order_20190316 VALUES LESS THAN ('2019-03-17 00:00:00'),
PARTITION ptrade_2019Q1order_20190317 VALUES LESS THAN ('2019-03-18 00:00:00'),
PARTITION ptrade_2019Q1order_20190318 VALUES LESS THAN ('2019-03-19 00:00:00'),
PARTITION ptrade_2019Q1order_20190319 VALUES LESS THAN ('2019-03-20 00:00:00'),
PARTITION ptrade_2019Q1order_20190320 VALUES LESS THAN ('2019-03-21 00:00:00'),
PARTITION ptrade_2019Q1order_20190321 VALUES LESS THAN ('2019-03-22 00:00:00'),
PARTITION ptrade_2019Q1order_20190322 VALUES LESS THAN ('2019-03-23 00:00:00'),
PARTITION ptrade_2019Q1order_20190323 VALUES LESS THAN ('2019-03-24 00:00:00'),
PARTITION ptrade_2019Q1order_20190324 VALUES LESS THAN ('2019-03-25 00:00:00'),
PARTITION ptrade_2019Q1order_20190325 VALUES LESS THAN ('2019-03-26 00:00:00'),
PARTITION ptrade_2019Q1order_20190326 VALUES LESS THAN ('2019-03-27 00:00:00'),
PARTITION ptrade_2019Q1order_20190327 VALUES LESS THAN ('2019-03-28 00:00:00'),
PARTITION ptrade_2019Q1order_20190328 VALUES LESS THAN ('2019-03-29 00:00:00'),
PARTITION ptrade_2019Q1order_20190329 VALUES LESS THAN ('2019-03-30 00:00:00'),
PARTITION ptrade_2019Q1order_20190330 VALUES LESS THAN ('2019-03-31 00:00:00'),
PARTITION ptrade_2019Q1order_20190331 VALUES LESS THAN ('2019-04-01 00:00:00')
PARTITION future VALUES LESS THAN MAXVALUE
)
;
-- ----------------------------
-- -- Table for trade_2019Q2 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'userId'}
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TEMPORARY TABLE `user_info` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`loginCode`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nikeName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`others` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT {},
PRIMARY KEY (`userId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
-- ----------------------------
-- -- Table for trade_2019Q2 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TEMPORARY TABLE `order` (
`oderId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderTime` datetime NOT NULL ,
`userId`  int(11) NOT NULL  ,
`symbol`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qty`  decimal(32,8) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
PARTITION BY RANGE (`orderTime`) (
PARTITION ptrade_2019Q2order_20190401 VALUES LESS THAN ('2019-04-02 00:00:00'),
PARTITION ptrade_2019Q2order_20190402 VALUES LESS THAN ('2019-04-03 00:00:00'),
PARTITION ptrade_2019Q2order_20190403 VALUES LESS THAN ('2019-04-04 00:00:00'),
PARTITION ptrade_2019Q2order_20190404 VALUES LESS THAN ('2019-04-05 00:00:00'),
PARTITION ptrade_2019Q2order_20190405 VALUES LESS THAN ('2019-04-06 00:00:00'),
PARTITION ptrade_2019Q2order_20190406 VALUES LESS THAN ('2019-04-07 00:00:00'),
PARTITION ptrade_2019Q2order_20190407 VALUES LESS THAN ('2019-04-08 00:00:00'),
PARTITION ptrade_2019Q2order_20190408 VALUES LESS THAN ('2019-04-09 00:00:00'),
PARTITION ptrade_2019Q2order_20190409 VALUES LESS THAN ('2019-04-10 00:00:00'),
PARTITION ptrade_2019Q2order_20190410 VALUES LESS THAN ('2019-04-11 00:00:00'),
PARTITION ptrade_2019Q2order_20190411 VALUES LESS THAN ('2019-04-12 00:00:00'),
PARTITION ptrade_2019Q2order_20190412 VALUES LESS THAN ('2019-04-13 00:00:00'),
PARTITION ptrade_2019Q2order_20190413 VALUES LESS THAN ('2019-04-14 00:00:00'),
PARTITION ptrade_2019Q2order_20190414 VALUES LESS THAN ('2019-04-15 00:00:00'),
PARTITION ptrade_2019Q2order_20190415 VALUES LESS THAN ('2019-04-16 00:00:00'),
PARTITION ptrade_2019Q2order_20190416 VALUES LESS THAN ('2019-04-17 00:00:00'),
PARTITION ptrade_2019Q2order_20190417 VALUES LESS THAN ('2019-04-18 00:00:00'),
PARTITION ptrade_2019Q2order_20190418 VALUES LESS THAN ('2019-04-19 00:00:00'),
PARTITION ptrade_2019Q2order_20190419 VALUES LESS THAN ('2019-04-20 00:00:00'),
PARTITION ptrade_2019Q2order_20190420 VALUES LESS THAN ('2019-04-21 00:00:00'),
PARTITION ptrade_2019Q2order_20190421 VALUES LESS THAN ('2019-04-22 00:00:00'),
PARTITION ptrade_2019Q2order_20190422 VALUES LESS THAN ('2019-04-23 00:00:00'),
PARTITION ptrade_2019Q2order_20190423 VALUES LESS THAN ('2019-04-24 00:00:00'),
PARTITION ptrade_2019Q2order_20190424 VALUES LESS THAN ('2019-04-25 00:00:00'),
PARTITION ptrade_2019Q2order_20190425 VALUES LESS THAN ('2019-04-26 00:00:00'),
PARTITION ptrade_2019Q2order_20190426 VALUES LESS THAN ('2019-04-27 00:00:00'),
PARTITION ptrade_2019Q2order_20190427 VALUES LESS THAN ('2019-04-28 00:00:00'),
PARTITION ptrade_2019Q2order_20190428 VALUES LESS THAN ('2019-04-29 00:00:00'),
PARTITION ptrade_2019Q2order_20190429 VALUES LESS THAN ('2019-04-30 00:00:00'),
PARTITION ptrade_2019Q2order_20190430 VALUES LESS THAN ('2019-05-01 00:00:00'),
PARTITION ptrade_2019Q2order_20190501 VALUES LESS THAN ('2019-05-02 00:00:00'),
PARTITION ptrade_2019Q2order_20190502 VALUES LESS THAN ('2019-05-03 00:00:00'),
PARTITION ptrade_2019Q2order_20190503 VALUES LESS THAN ('2019-05-04 00:00:00'),
PARTITION ptrade_2019Q2order_20190504 VALUES LESS THAN ('2019-05-05 00:00:00'),
PARTITION ptrade_2019Q2order_20190505 VALUES LESS THAN ('2019-05-06 00:00:00'),
PARTITION ptrade_2019Q2order_20190506 VALUES LESS THAN ('2019-05-07 00:00:00'),
PARTITION ptrade_2019Q2order_20190507 VALUES LESS THAN ('2019-05-08 00:00:00'),
PARTITION ptrade_2019Q2order_20190508 VALUES LESS THAN ('2019-05-09 00:00:00'),
PARTITION ptrade_2019Q2order_20190509 VALUES LESS THAN ('2019-05-10 00:00:00'),
PARTITION ptrade_2019Q2order_20190510 VALUES LESS THAN ('2019-05-11 00:00:00'),
PARTITION ptrade_2019Q2order_20190511 VALUES LESS THAN ('2019-05-12 00:00:00'),
PARTITION ptrade_2019Q2order_20190512 VALUES LESS THAN ('2019-05-13 00:00:00'),
PARTITION ptrade_2019Q2order_20190513 VALUES LESS THAN ('2019-05-14 00:00:00'),
PARTITION ptrade_2019Q2order_20190514 VALUES LESS THAN ('2019-05-15 00:00:00'),
PARTITION ptrade_2019Q2order_20190515 VALUES LESS THAN ('2019-05-16 00:00:00'),
PARTITION ptrade_2019Q2order_20190516 VALUES LESS THAN ('2019-05-17 00:00:00'),
PARTITION ptrade_2019Q2order_20190517 VALUES LESS THAN ('2019-05-18 00:00:00'),
PARTITION ptrade_2019Q2order_20190518 VALUES LESS THAN ('2019-05-19 00:00:00'),
PARTITION ptrade_2019Q2order_20190519 VALUES LESS THAN ('2019-05-20 00:00:00'),
PARTITION ptrade_2019Q2order_20190520 VALUES LESS THAN ('2019-05-21 00:00:00'),
PARTITION ptrade_2019Q2order_20190521 VALUES LESS THAN ('2019-05-22 00:00:00'),
PARTITION ptrade_2019Q2order_20190522 VALUES LESS THAN ('2019-05-23 00:00:00'),
PARTITION ptrade_2019Q2order_20190523 VALUES LESS THAN ('2019-05-24 00:00:00'),
PARTITION ptrade_2019Q2order_20190524 VALUES LESS THAN ('2019-05-25 00:00:00'),
PARTITION ptrade_2019Q2order_20190525 VALUES LESS THAN ('2019-05-26 00:00:00'),
PARTITION ptrade_2019Q2order_20190526 VALUES LESS THAN ('2019-05-27 00:00:00'),
PARTITION ptrade_2019Q2order_20190527 VALUES LESS THAN ('2019-05-28 00:00:00'),
PARTITION ptrade_2019Q2order_20190528 VALUES LESS THAN ('2019-05-29 00:00:00'),
PARTITION ptrade_2019Q2order_20190529 VALUES LESS THAN ('2019-05-30 00:00:00'),
PARTITION ptrade_2019Q2order_20190530 VALUES LESS THAN ('2019-05-31 00:00:00'),
PARTITION ptrade_2019Q2order_20190531 VALUES LESS THAN ('2019-06-01 00:00:00'),
PARTITION ptrade_2019Q2order_20190601 VALUES LESS THAN ('2019-06-02 00:00:00'),
PARTITION ptrade_2019Q2order_20190602 VALUES LESS THAN ('2019-06-03 00:00:00'),
PARTITION ptrade_2019Q2order_20190603 VALUES LESS THAN ('2019-06-04 00:00:00'),
PARTITION ptrade_2019Q2order_20190604 VALUES LESS THAN ('2019-06-05 00:00:00'),
PARTITION ptrade_2019Q2order_20190605 VALUES LESS THAN ('2019-06-06 00:00:00'),
PARTITION ptrade_2019Q2order_20190606 VALUES LESS THAN ('2019-06-07 00:00:00'),
PARTITION ptrade_2019Q2order_20190607 VALUES LESS THAN ('2019-06-08 00:00:00'),
PARTITION ptrade_2019Q2order_20190608 VALUES LESS THAN ('2019-06-09 00:00:00'),
PARTITION ptrade_2019Q2order_20190609 VALUES LESS THAN ('2019-06-10 00:00:00'),
PARTITION ptrade_2019Q2order_20190610 VALUES LESS THAN ('2019-06-11 00:00:00'),
PARTITION ptrade_2019Q2order_20190611 VALUES LESS THAN ('2019-06-12 00:00:00'),
PARTITION ptrade_2019Q2order_20190612 VALUES LESS THAN ('2019-06-13 00:00:00'),
PARTITION ptrade_2019Q2order_20190613 VALUES LESS THAN ('2019-06-14 00:00:00'),
PARTITION ptrade_2019Q2order_20190614 VALUES LESS THAN ('2019-06-15 00:00:00'),
PARTITION ptrade_2019Q2order_20190615 VALUES LESS THAN ('2019-06-16 00:00:00'),
PARTITION ptrade_2019Q2order_20190616 VALUES LESS THAN ('2019-06-17 00:00:00'),
PARTITION ptrade_2019Q2order_20190617 VALUES LESS THAN ('2019-06-18 00:00:00'),
PARTITION ptrade_2019Q2order_20190618 VALUES LESS THAN ('2019-06-19 00:00:00'),
PARTITION ptrade_2019Q2order_20190619 VALUES LESS THAN ('2019-06-20 00:00:00'),
PARTITION ptrade_2019Q2order_20190620 VALUES LESS THAN ('2019-06-21 00:00:00'),
PARTITION ptrade_2019Q2order_20190621 VALUES LESS THAN ('2019-06-22 00:00:00'),
PARTITION ptrade_2019Q2order_20190622 VALUES LESS THAN ('2019-06-23 00:00:00'),
PARTITION ptrade_2019Q2order_20190623 VALUES LESS THAN ('2019-06-24 00:00:00'),
PARTITION ptrade_2019Q2order_20190624 VALUES LESS THAN ('2019-06-25 00:00:00'),
PARTITION ptrade_2019Q2order_20190625 VALUES LESS THAN ('2019-06-26 00:00:00'),
PARTITION ptrade_2019Q2order_20190626 VALUES LESS THAN ('2019-06-27 00:00:00'),
PARTITION ptrade_2019Q2order_20190627 VALUES LESS THAN ('2019-06-28 00:00:00'),
PARTITION ptrade_2019Q2order_20190628 VALUES LESS THAN ('2019-06-29 00:00:00'),
PARTITION ptrade_2019Q2order_20190629 VALUES LESS THAN ('2019-06-30 00:00:00'),
PARTITION ptrade_2019Q2order_20190630 VALUES LESS THAN ('2019-07-01 00:00:00')
PARTITION future VALUES LESS THAN MAXVALUE
)
;
-- ----------------------------
-- -- Table for trade_2019Q3 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'userId'}
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TEMPORARY TABLE `user_info` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`loginCode`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nikeName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`others` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT {},
PRIMARY KEY (`userId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
-- ----------------------------
-- -- Table for trade_2019Q3 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TEMPORARY TABLE `order` (
`oderId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderTime` datetime NOT NULL ,
`userId`  int(11) NOT NULL  ,
`symbol`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qty`  decimal(32,8) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
PARTITION BY RANGE (`orderTime`) (
PARTITION ptrade_2019Q3order_20190701 VALUES LESS THAN ('2019-07-02 00:00:00'),
PARTITION ptrade_2019Q3order_20190702 VALUES LESS THAN ('2019-07-03 00:00:00'),
PARTITION ptrade_2019Q3order_20190703 VALUES LESS THAN ('2019-07-04 00:00:00'),
PARTITION ptrade_2019Q3order_20190704 VALUES LESS THAN ('2019-07-05 00:00:00'),
PARTITION ptrade_2019Q3order_20190705 VALUES LESS THAN ('2019-07-06 00:00:00'),
PARTITION ptrade_2019Q3order_20190706 VALUES LESS THAN ('2019-07-07 00:00:00'),
PARTITION ptrade_2019Q3order_20190707 VALUES LESS THAN ('2019-07-08 00:00:00'),
PARTITION ptrade_2019Q3order_20190708 VALUES LESS THAN ('2019-07-09 00:00:00'),
PARTITION ptrade_2019Q3order_20190709 VALUES LESS THAN ('2019-07-10 00:00:00'),
PARTITION ptrade_2019Q3order_20190710 VALUES LESS THAN ('2019-07-11 00:00:00'),
PARTITION ptrade_2019Q3order_20190711 VALUES LESS THAN ('2019-07-12 00:00:00'),
PARTITION ptrade_2019Q3order_20190712 VALUES LESS THAN ('2019-07-13 00:00:00'),
PARTITION ptrade_2019Q3order_20190713 VALUES LESS THAN ('2019-07-14 00:00:00'),
PARTITION ptrade_2019Q3order_20190714 VALUES LESS THAN ('2019-07-15 00:00:00'),
PARTITION ptrade_2019Q3order_20190715 VALUES LESS THAN ('2019-07-16 00:00:00'),
PARTITION ptrade_2019Q3order_20190716 VALUES LESS THAN ('2019-07-17 00:00:00'),
PARTITION ptrade_2019Q3order_20190717 VALUES LESS THAN ('2019-07-18 00:00:00'),
PARTITION ptrade_2019Q3order_20190718 VALUES LESS THAN ('2019-07-19 00:00:00'),
PARTITION ptrade_2019Q3order_20190719 VALUES LESS THAN ('2019-07-20 00:00:00'),
PARTITION ptrade_2019Q3order_20190720 VALUES LESS THAN ('2019-07-21 00:00:00'),
PARTITION ptrade_2019Q3order_20190721 VALUES LESS THAN ('2019-07-22 00:00:00'),
PARTITION ptrade_2019Q3order_20190722 VALUES LESS THAN ('2019-07-23 00:00:00'),
PARTITION ptrade_2019Q3order_20190723 VALUES LESS THAN ('2019-07-24 00:00:00'),
PARTITION ptrade_2019Q3order_20190724 VALUES LESS THAN ('2019-07-25 00:00:00'),
PARTITION ptrade_2019Q3order_20190725 VALUES LESS THAN ('2019-07-26 00:00:00'),
PARTITION ptrade_2019Q3order_20190726 VALUES LESS THAN ('2019-07-27 00:00:00'),
PARTITION ptrade_2019Q3order_20190727 VALUES LESS THAN ('2019-07-28 00:00:00'),
PARTITION ptrade_2019Q3order_20190728 VALUES LESS THAN ('2019-07-29 00:00:00'),
PARTITION ptrade_2019Q3order_20190729 VALUES LESS THAN ('2019-07-30 00:00:00'),
PARTITION ptrade_2019Q3order_20190730 VALUES LESS THAN ('2019-07-31 00:00:00'),
PARTITION ptrade_2019Q3order_20190731 VALUES LESS THAN ('2019-08-01 00:00:00'),
PARTITION ptrade_2019Q3order_20190801 VALUES LESS THAN ('2019-08-02 00:00:00'),
PARTITION ptrade_2019Q3order_20190802 VALUES LESS THAN ('2019-08-03 00:00:00'),
PARTITION ptrade_2019Q3order_20190803 VALUES LESS THAN ('2019-08-04 00:00:00'),
PARTITION ptrade_2019Q3order_20190804 VALUES LESS THAN ('2019-08-05 00:00:00'),
PARTITION ptrade_2019Q3order_20190805 VALUES LESS THAN ('2019-08-06 00:00:00'),
PARTITION ptrade_2019Q3order_20190806 VALUES LESS THAN ('2019-08-07 00:00:00'),
PARTITION ptrade_2019Q3order_20190807 VALUES LESS THAN ('2019-08-08 00:00:00'),
PARTITION ptrade_2019Q3order_20190808 VALUES LESS THAN ('2019-08-09 00:00:00'),
PARTITION ptrade_2019Q3order_20190809 VALUES LESS THAN ('2019-08-10 00:00:00'),
PARTITION ptrade_2019Q3order_20190810 VALUES LESS THAN ('2019-08-11 00:00:00'),
PARTITION ptrade_2019Q3order_20190811 VALUES LESS THAN ('2019-08-12 00:00:00'),
PARTITION ptrade_2019Q3order_20190812 VALUES LESS THAN ('2019-08-13 00:00:00'),
PARTITION ptrade_2019Q3order_20190813 VALUES LESS THAN ('2019-08-14 00:00:00'),
PARTITION ptrade_2019Q3order_20190814 VALUES LESS THAN ('2019-08-15 00:00:00'),
PARTITION ptrade_2019Q3order_20190815 VALUES LESS THAN ('2019-08-16 00:00:00'),
PARTITION ptrade_2019Q3order_20190816 VALUES LESS THAN ('2019-08-17 00:00:00'),
PARTITION ptrade_2019Q3order_20190817 VALUES LESS THAN ('2019-08-18 00:00:00'),
PARTITION ptrade_2019Q3order_20190818 VALUES LESS THAN ('2019-08-19 00:00:00'),
PARTITION ptrade_2019Q3order_20190819 VALUES LESS THAN ('2019-08-20 00:00:00'),
PARTITION ptrade_2019Q3order_20190820 VALUES LESS THAN ('2019-08-21 00:00:00'),
PARTITION ptrade_2019Q3order_20190821 VALUES LESS THAN ('2019-08-22 00:00:00'),
PARTITION ptrade_2019Q3order_20190822 VALUES LESS THAN ('2019-08-23 00:00:00'),
PARTITION ptrade_2019Q3order_20190823 VALUES LESS THAN ('2019-08-24 00:00:00'),
PARTITION ptrade_2019Q3order_20190824 VALUES LESS THAN ('2019-08-25 00:00:00'),
PARTITION ptrade_2019Q3order_20190825 VALUES LESS THAN ('2019-08-26 00:00:00'),
PARTITION ptrade_2019Q3order_20190826 VALUES LESS THAN ('2019-08-27 00:00:00'),
PARTITION ptrade_2019Q3order_20190827 VALUES LESS THAN ('2019-08-28 00:00:00'),
PARTITION ptrade_2019Q3order_20190828 VALUES LESS THAN ('2019-08-29 00:00:00'),
PARTITION ptrade_2019Q3order_20190829 VALUES LESS THAN ('2019-08-30 00:00:00'),
PARTITION ptrade_2019Q3order_20190830 VALUES LESS THAN ('2019-08-31 00:00:00'),
PARTITION ptrade_2019Q3order_20190831 VALUES LESS THAN ('2019-09-01 00:00:00'),
PARTITION ptrade_2019Q3order_20190901 VALUES LESS THAN ('2019-09-02 00:00:00'),
PARTITION ptrade_2019Q3order_20190902 VALUES LESS THAN ('2019-09-03 00:00:00'),
PARTITION ptrade_2019Q3order_20190903 VALUES LESS THAN ('2019-09-04 00:00:00'),
PARTITION ptrade_2019Q3order_20190904 VALUES LESS THAN ('2019-09-05 00:00:00'),
PARTITION ptrade_2019Q3order_20190905 VALUES LESS THAN ('2019-09-06 00:00:00'),
PARTITION ptrade_2019Q3order_20190906 VALUES LESS THAN ('2019-09-07 00:00:00'),
PARTITION ptrade_2019Q3order_20190907 VALUES LESS THAN ('2019-09-08 00:00:00'),
PARTITION ptrade_2019Q3order_20190908 VALUES LESS THAN ('2019-09-09 00:00:00'),
PARTITION ptrade_2019Q3order_20190909 VALUES LESS THAN ('2019-09-10 00:00:00'),
PARTITION ptrade_2019Q3order_20190910 VALUES LESS THAN ('2019-09-11 00:00:00'),
PARTITION ptrade_2019Q3order_20190911 VALUES LESS THAN ('2019-09-12 00:00:00'),
PARTITION ptrade_2019Q3order_20190912 VALUES LESS THAN ('2019-09-13 00:00:00'),
PARTITION ptrade_2019Q3order_20190913 VALUES LESS THAN ('2019-09-14 00:00:00'),
PARTITION ptrade_2019Q3order_20190914 VALUES LESS THAN ('2019-09-15 00:00:00'),
PARTITION ptrade_2019Q3order_20190915 VALUES LESS THAN ('2019-09-16 00:00:00'),
PARTITION ptrade_2019Q3order_20190916 VALUES LESS THAN ('2019-09-17 00:00:00'),
PARTITION ptrade_2019Q3order_20190917 VALUES LESS THAN ('2019-09-18 00:00:00'),
PARTITION ptrade_2019Q3order_20190918 VALUES LESS THAN ('2019-09-19 00:00:00'),
PARTITION ptrade_2019Q3order_20190919 VALUES LESS THAN ('2019-09-20 00:00:00'),
PARTITION ptrade_2019Q3order_20190920 VALUES LESS THAN ('2019-09-21 00:00:00'),
PARTITION ptrade_2019Q3order_20190921 VALUES LESS THAN ('2019-09-22 00:00:00'),
PARTITION ptrade_2019Q3order_20190922 VALUES LESS THAN ('2019-09-23 00:00:00'),
PARTITION ptrade_2019Q3order_20190923 VALUES LESS THAN ('2019-09-24 00:00:00'),
PARTITION ptrade_2019Q3order_20190924 VALUES LESS THAN ('2019-09-25 00:00:00'),
PARTITION ptrade_2019Q3order_20190925 VALUES LESS THAN ('2019-09-26 00:00:00'),
PARTITION ptrade_2019Q3order_20190926 VALUES LESS THAN ('2019-09-27 00:00:00'),
PARTITION ptrade_2019Q3order_20190927 VALUES LESS THAN ('2019-09-28 00:00:00'),
PARTITION ptrade_2019Q3order_20190928 VALUES LESS THAN ('2019-09-29 00:00:00'),
PARTITION ptrade_2019Q3order_20190929 VALUES LESS THAN ('2019-09-30 00:00:00'),
PARTITION ptrade_2019Q3order_20190930 VALUES LESS THAN ('2019-10-01 00:00:00')
PARTITION future VALUES LESS THAN MAXVALUE
)
;
-- ----------------------------
-- -- Table for trade_2019Q4 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'userId'}
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TEMPORARY TABLE `user_info` (
`userId`  int(11) NOT NULL AUTO_INCREMENT ,
`loginCode`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`userName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nikeName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`others` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT {},
PRIMARY KEY (`userId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
;
-- ----------------------------
-- -- Table for trade_2019Q4 order {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TEMPORARY TABLE `order` (
`oderId`  int(11) NOT NULL AUTO_INCREMENT ,
`orderTime` datetime NOT NULL ,
`userId`  int(11) NOT NULL  ,
`symbol`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qty`  decimal(32,8) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
PARTITION BY RANGE (`orderTime`) (
PARTITION ptrade_2019Q4order_20191001 VALUES LESS THAN ('2019-10-02 00:00:00'),
PARTITION ptrade_2019Q4order_20191002 VALUES LESS THAN ('2019-10-03 00:00:00'),
PARTITION ptrade_2019Q4order_20191003 VALUES LESS THAN ('2019-10-04 00:00:00'),
PARTITION ptrade_2019Q4order_20191004 VALUES LESS THAN ('2019-10-05 00:00:00'),
PARTITION ptrade_2019Q4order_20191005 VALUES LESS THAN ('2019-10-06 00:00:00'),
PARTITION ptrade_2019Q4order_20191006 VALUES LESS THAN ('2019-10-07 00:00:00'),
PARTITION ptrade_2019Q4order_20191007 VALUES LESS THAN ('2019-10-08 00:00:00'),
PARTITION ptrade_2019Q4order_20191008 VALUES LESS THAN ('2019-10-09 00:00:00'),
PARTITION ptrade_2019Q4order_20191009 VALUES LESS THAN ('2019-10-10 00:00:00'),
PARTITION ptrade_2019Q4order_20191010 VALUES LESS THAN ('2019-10-11 00:00:00'),
PARTITION ptrade_2019Q4order_20191011 VALUES LESS THAN ('2019-10-12 00:00:00'),
PARTITION ptrade_2019Q4order_20191012 VALUES LESS THAN ('2019-10-13 00:00:00'),
PARTITION ptrade_2019Q4order_20191013 VALUES LESS THAN ('2019-10-14 00:00:00'),
PARTITION ptrade_2019Q4order_20191014 VALUES LESS THAN ('2019-10-15 00:00:00'),
PARTITION ptrade_2019Q4order_20191015 VALUES LESS THAN ('2019-10-16 00:00:00'),
PARTITION ptrade_2019Q4order_20191016 VALUES LESS THAN ('2019-10-17 00:00:00'),
PARTITION ptrade_2019Q4order_20191017 VALUES LESS THAN ('2019-10-18 00:00:00'),
PARTITION ptrade_2019Q4order_20191018 VALUES LESS THAN ('2019-10-19 00:00:00'),
PARTITION ptrade_2019Q4order_20191019 VALUES LESS THAN ('2019-10-20 00:00:00'),
PARTITION ptrade_2019Q4order_20191020 VALUES LESS THAN ('2019-10-21 00:00:00'),
PARTITION ptrade_2019Q4order_20191021 VALUES LESS THAN ('2019-10-22 00:00:00'),
PARTITION ptrade_2019Q4order_20191022 VALUES LESS THAN ('2019-10-23 00:00:00'),
PARTITION ptrade_2019Q4order_20191023 VALUES LESS THAN ('2019-10-24 00:00:00'),
PARTITION ptrade_2019Q4order_20191024 VALUES LESS THAN ('2019-10-25 00:00:00'),
PARTITION ptrade_2019Q4order_20191025 VALUES LESS THAN ('2019-10-26 00:00:00'),
PARTITION ptrade_2019Q4order_20191026 VALUES LESS THAN ('2019-10-27 00:00:00'),
PARTITION ptrade_2019Q4order_20191027 VALUES LESS THAN ('2019-10-28 00:00:00'),
PARTITION ptrade_2019Q4order_20191028 VALUES LESS THAN ('2019-10-29 00:00:00'),
PARTITION ptrade_2019Q4order_20191029 VALUES LESS THAN ('2019-10-30 00:00:00'),
PARTITION ptrade_2019Q4order_20191030 VALUES LESS THAN ('2019-10-31 00:00:00'),
PARTITION ptrade_2019Q4order_20191031 VALUES LESS THAN ('2019-11-01 00:00:00'),
PARTITION ptrade_2019Q4order_20191101 VALUES LESS THAN ('2019-11-02 00:00:00'),
PARTITION ptrade_2019Q4order_20191102 VALUES LESS THAN ('2019-11-03 00:00:00'),
PARTITION ptrade_2019Q4order_20191103 VALUES LESS THAN ('2019-11-04 00:00:00'),
PARTITION ptrade_2019Q4order_20191104 VALUES LESS THAN ('2019-11-05 00:00:00'),
PARTITION ptrade_2019Q4order_20191105 VALUES LESS THAN ('2019-11-06 00:00:00'),
PARTITION ptrade_2019Q4order_20191106 VALUES LESS THAN ('2019-11-07 00:00:00'),
PARTITION ptrade_2019Q4order_20191107 VALUES LESS THAN ('2019-11-08 00:00:00'),
PARTITION ptrade_2019Q4order_20191108 VALUES LESS THAN ('2019-11-09 00:00:00'),
PARTITION ptrade_2019Q4order_20191109 VALUES LESS THAN ('2019-11-10 00:00:00'),
PARTITION ptrade_2019Q4order_20191110 VALUES LESS THAN ('2019-11-11 00:00:00'),
PARTITION ptrade_2019Q4order_20191111 VALUES LESS THAN ('2019-11-12 00:00:00'),
PARTITION ptrade_2019Q4order_20191112 VALUES LESS THAN ('2019-11-13 00:00:00'),
PARTITION ptrade_2019Q4order_20191113 VALUES LESS THAN ('2019-11-14 00:00:00'),
PARTITION ptrade_2019Q4order_20191114 VALUES LESS THAN ('2019-11-15 00:00:00'),
PARTITION ptrade_2019Q4order_20191115 VALUES LESS THAN ('2019-11-16 00:00:00'),
PARTITION ptrade_2019Q4order_20191116 VALUES LESS THAN ('2019-11-17 00:00:00'),
PARTITION ptrade_2019Q4order_20191117 VALUES LESS THAN ('2019-11-18 00:00:00'),
PARTITION ptrade_2019Q4order_20191118 VALUES LESS THAN ('2019-11-19 00:00:00'),
PARTITION ptrade_2019Q4order_20191119 VALUES LESS THAN ('2019-11-20 00:00:00'),
PARTITION ptrade_2019Q4order_20191120 VALUES LESS THAN ('2019-11-21 00:00:00'),
PARTITION ptrade_2019Q4order_20191121 VALUES LESS THAN ('2019-11-22 00:00:00'),
PARTITION ptrade_2019Q4order_20191122 VALUES LESS THAN ('2019-11-23 00:00:00'),
PARTITION ptrade_2019Q4order_20191123 VALUES LESS THAN ('2019-11-24 00:00:00'),
PARTITION ptrade_2019Q4order_20191124 VALUES LESS THAN ('2019-11-25 00:00:00'),
PARTITION ptrade_2019Q4order_20191125 VALUES LESS THAN ('2019-11-26 00:00:00'),
PARTITION ptrade_2019Q4order_20191126 VALUES LESS THAN ('2019-11-27 00:00:00'),
PARTITION ptrade_2019Q4order_20191127 VALUES LESS THAN ('2019-11-28 00:00:00'),
PARTITION ptrade_2019Q4order_20191128 VALUES LESS THAN ('2019-11-29 00:00:00'),
PARTITION ptrade_2019Q4order_20191129 VALUES LESS THAN ('2019-11-30 00:00:00'),
PARTITION ptrade_2019Q4order_20191130 VALUES LESS THAN ('2019-12-01 00:00:00'),
PARTITION ptrade_2019Q4order_20191201 VALUES LESS THAN ('2019-12-02 00:00:00'),
PARTITION ptrade_2019Q4order_20191202 VALUES LESS THAN ('2019-12-03 00:00:00'),
PARTITION ptrade_2019Q4order_20191203 VALUES LESS THAN ('2019-12-04 00:00:00'),
PARTITION ptrade_2019Q4order_20191204 VALUES LESS THAN ('2019-12-05 00:00:00'),
PARTITION ptrade_2019Q4order_20191205 VALUES LESS THAN ('2019-12-06 00:00:00'),
PARTITION ptrade_2019Q4order_20191206 VALUES LESS THAN ('2019-12-07 00:00:00'),
PARTITION ptrade_2019Q4order_20191207 VALUES LESS THAN ('2019-12-08 00:00:00'),
PARTITION ptrade_2019Q4order_20191208 VALUES LESS THAN ('2019-12-09 00:00:00'),
PARTITION ptrade_2019Q4order_20191209 VALUES LESS THAN ('2019-12-10 00:00:00'),
PARTITION ptrade_2019Q4order_20191210 VALUES LESS THAN ('2019-12-11 00:00:00'),
PARTITION ptrade_2019Q4order_20191211 VALUES LESS THAN ('2019-12-12 00:00:00'),
PARTITION ptrade_2019Q4order_20191212 VALUES LESS THAN ('2019-12-13 00:00:00'),
PARTITION ptrade_2019Q4order_20191213 VALUES LESS THAN ('2019-12-14 00:00:00'),
PARTITION ptrade_2019Q4order_20191214 VALUES LESS THAN ('2019-12-15 00:00:00'),
PARTITION ptrade_2019Q4order_20191215 VALUES LESS THAN ('2019-12-16 00:00:00'),
PARTITION ptrade_2019Q4order_20191216 VALUES LESS THAN ('2019-12-17 00:00:00'),
PARTITION ptrade_2019Q4order_20191217 VALUES LESS THAN ('2019-12-18 00:00:00'),
PARTITION ptrade_2019Q4order_20191218 VALUES LESS THAN ('2019-12-19 00:00:00'),
PARTITION ptrade_2019Q4order_20191219 VALUES LESS THAN ('2019-12-20 00:00:00'),
PARTITION ptrade_2019Q4order_20191220 VALUES LESS THAN ('2019-12-21 00:00:00'),
PARTITION ptrade_2019Q4order_20191221 VALUES LESS THAN ('2019-12-22 00:00:00'),
PARTITION ptrade_2019Q4order_20191222 VALUES LESS THAN ('2019-12-23 00:00:00'),
PARTITION ptrade_2019Q4order_20191223 VALUES LESS THAN ('2019-12-24 00:00:00'),
PARTITION ptrade_2019Q4order_20191224 VALUES LESS THAN ('2019-12-25 00:00:00'),
PARTITION ptrade_2019Q4order_20191225 VALUES LESS THAN ('2019-12-26 00:00:00'),
PARTITION ptrade_2019Q4order_20191226 VALUES LESS THAN ('2019-12-27 00:00:00'),
PARTITION ptrade_2019Q4order_20191227 VALUES LESS THAN ('2019-12-28 00:00:00'),
PARTITION ptrade_2019Q4order_20191228 VALUES LESS THAN ('2019-12-29 00:00:00'),
PARTITION ptrade_2019Q4order_20191229 VALUES LESS THAN ('2019-12-30 00:00:00'),
PARTITION ptrade_2019Q4order_20191230 VALUES LESS THAN ('2019-12-31 00:00:00'),
PARTITION ptrade_2019Q4order_20191231 VALUES LESS THAN ('2020-01-01 00:00:00')
PARTITION future VALUES LESS THAN MAXVALUE
)
;
