
CREATE UNIQUE INDEX "users_user_info_logincode_unique" ON users.user_info USING btree (
loginCode DESC
);
CREATE INDEX "users_user_info_phone_index" ON users.user_info USING btree (
phone DESC
);
CREATE UNIQUE INDEX "trade_2019Q1_user_info_logincode_unique" ON trade_2019Q1.user_info USING btree (
loginCode DESC
);
CREATE INDEX "trade_2019Q1_user_info_phone_index" ON trade_2019Q1.user_info USING btree (
phone DESC
);
ALTER TABLE trade_2019Q1.order
ADD CONSTRAINT "trade_2019Q1_order_userid_foreign" FOREIGN KEY (
userId
) REFERENCES trade_2019Q1.user_info (
userId
) ON DELETE CASCADE ON UPDATE RESTRICT;
CREATE INDEX "trade_2019Q1_order_order_sharding" ON trade_2019Q1.order USING btree (
userId DESC
);
CREATE UNIQUE INDEX "trade_2019Q2_user_info_logincode_unique" ON trade_2019Q2.user_info USING btree (
loginCode DESC
);
CREATE INDEX "trade_2019Q2_user_info_phone_index" ON trade_2019Q2.user_info USING btree (
phone DESC
);
ALTER TABLE trade_2019Q2.order
ADD CONSTRAINT "trade_2019Q2_order_userid_foreign" FOREIGN KEY (
userId
) REFERENCES trade_2019Q2.user_info (
userId
) ON DELETE CASCADE ON UPDATE RESTRICT;
CREATE INDEX "trade_2019Q2_order_order_sharding" ON trade_2019Q2.order USING btree (
userId DESC
);
CREATE UNIQUE INDEX "trade_2019Q3_user_info_logincode_unique" ON trade_2019Q3.user_info USING btree (
loginCode DESC
);
CREATE INDEX "trade_2019Q3_user_info_phone_index" ON trade_2019Q3.user_info USING btree (
phone DESC
);
ALTER TABLE trade_2019Q3.order
ADD CONSTRAINT "trade_2019Q3_order_userid_foreign" FOREIGN KEY (
userId
) REFERENCES trade_2019Q3.user_info (
userId
) ON DELETE CASCADE ON UPDATE RESTRICT;
CREATE INDEX "trade_2019Q3_order_order_sharding" ON trade_2019Q3.order USING btree (
userId DESC
);
CREATE UNIQUE INDEX "trade_2019Q4_user_info_logincode_unique" ON trade_2019Q4.user_info USING btree (
loginCode DESC
);
CREATE INDEX "trade_2019Q4_user_info_phone_index" ON trade_2019Q4.user_info USING btree (
phone DESC
);
ALTER TABLE trade_2019Q4.order
ADD CONSTRAINT "trade_2019Q4_order_userid_foreign" FOREIGN KEY (
userId
) REFERENCES trade_2019Q4.user_info (
userId
) ON DELETE CASCADE ON UPDATE RESTRICT;
CREATE INDEX "trade_2019Q4_order_order_sharding" ON trade_2019Q4.order USING btree (
userId DESC
);
