-- ----------------------------
-- -- Table for trade_temp user_info {'is_temp': True}
-- ----------------------------
DROP TABLE IF EXISTS user_info;
CREATE TEMP TABLE user_info (
createtime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
userId serial8 NOT NULL ,
loginCode varchar(32) NOT NULL ,
userName varchar(16) NOT NULL ,
nikeName varchar(16) NOT NULL ,
phone varchar(16) NOT NULL ,
email varchar(32) NOT NULL ,
others jsonb NOT NULL DEFAULT '{}',
PRIMARY KEY (userId)
)
;
-- ----------------------------
-- -- Table for trade_temp order {'is_temp': True}
-- ----------------------------
DROP TABLE IF EXISTS order;
CREATE TEMP TABLE order (
createtime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatetime timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
oderId serial8 NOT NULL ,
orderTime timestamp NOT NULL ,
userId int8 NOT NULL ,
symbol varchar(16) NOT NULL ,
qty decimal(32,8) NOT NULL ,
PRIMARY KEY (oderId)
)
;