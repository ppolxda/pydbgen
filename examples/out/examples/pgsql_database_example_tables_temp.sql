
-- ----------------------------
-- -- Table for trade_temp user_info {'sharding_date_begin': 'None', 'sharding_date_end': 'None', 'is_temp': True}
-- ----------------------------
DROP TABLE IF EXISTS user_info;
CREATE TEMP TABLE user_info (
userId serial8 NOT NULL ,
loginCode varchar(32) NOT NULL ,
userName varchar(16) NOT NULL ,
nikeName varchar(16) NOT NULL ,
phone varchar(16) NOT NULL ,
email varchar(32) NOT NULL ,
others jsonb NOT NULL DEFAULT {},
PRIMARY KEY (userId)
)
;
-- ----------------------------
-- -- Table for trade_temp order {'sharding_date_begin': 'None', 'sharding_date_end': 'None', 'is_temp': True}
-- ----------------------------
DROP TABLE IF EXISTS order;
CREATE TEMP TABLE order (
oderId serial8 NOT NULL ,
orderTime timestamp NOT NULL ,
userId int8 NOT NULL ,
symbol varchar(16) NOT NULL ,
qty decimal(32,8) NOT NULL ,
PRIMARY KEY (oderId)
)
;
