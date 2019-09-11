// ----------------------------
// -- Table for users user_info {'space': 'user_spaces'}
// ----------------------------
sh.shardCollection('users.user_info', { "userId": 'hashed' }, true);
// ----------------------------
// -- Table for trade_2019Q1 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
// ----------------------------
sh.shardCollection('trade_2019Q1.user_info', { "userId": 'hashed' }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190131 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190131', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190301 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190301', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190302 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190302', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190303 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190303', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190304 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190304', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190305 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190305', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190306 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190306', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190307 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190307', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190308 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190308', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190309 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190309', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190310 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190310', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190311 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190311', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190312 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190312', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190313 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190313', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190314 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190314', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190315 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190315', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190316 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190316', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190317 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190317', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190318 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190318', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190319 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190319', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190320 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190320', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190321 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190321', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190322 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190322', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190323 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190323', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190324 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190324', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190325 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190325', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190326 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190326', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190327 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190327', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190328 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190328', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190329 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190329', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190330 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190330', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190331 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190331', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190401 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190401', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190402 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190402', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190403 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190403', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190404 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190404', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190405 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190405', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190406 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190406', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190407 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190407', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190408 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190408', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190409 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190409', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190410 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190410', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190411 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190411', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190412 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190412', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190413 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190413', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190414 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190414', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190415 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190415', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190416 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190416', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190417 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190417', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190418 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190418', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190419 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190419', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190420 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190420', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190421 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190421', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190422 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190422', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190423 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190423', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190424 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190424', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190425 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190425', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190426 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190426', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190427 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190427', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190428 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190428', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190429 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190429', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190430 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190430', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190501 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190501', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190502 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190502', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190503 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190503', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190504 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190504', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190505 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190505', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190506 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190506', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190507 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190507', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190508 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190508', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190509 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190509', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190510 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190510', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190511 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190511', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190512 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190512', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190513 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190513', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190514 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190514', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190515 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190515', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190516 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190516', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190517 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190517', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190518 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190518', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190519 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190519', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190520 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190520', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190521 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190521', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190522 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190522', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190523 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190523', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190524 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190524', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190525 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190525', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190526 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190526', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190527 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190527', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190528 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190528', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190529 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190529', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190530 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190530', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190531 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190531', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190601 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190601', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190602 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190602', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190603 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190603', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190604 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190604', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190605 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190605', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190606 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190606', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190607 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190607', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190608 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190608', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190609 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190609', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190610 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190610', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190611 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190611', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190612 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190612', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190613 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190613', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190614 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190614', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190615 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190615', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190616 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190616', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190617 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190617', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190618 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190618', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190619 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190619', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190620 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190620', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190621 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190621', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190622 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190622', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190623 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190623', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190624 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190624', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190625 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190625', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190626 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190626', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190627 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190627', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190628 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190628', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190629 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190629', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190630 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190630', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190701 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190701', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190702 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190702', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190703 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190703', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190704 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190704', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190705 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190705', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190706 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190706', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190707 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190707', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190708 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190708', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190709 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190709', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190710 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190710', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190711 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190711', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190712 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190712', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190713 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190713', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190714 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190714', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190715 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190715', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190716 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190716', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190717 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190717', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190718 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190718', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190719 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190719', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190720 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190720', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190721 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190721', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190722 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190722', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190723 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190723', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190724 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190724', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190725 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190725', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190726 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190726', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190727 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190727', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190728 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190728', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190729 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190729', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190730 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190730', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190731 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190731', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190801 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190801', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190802 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190802', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190803 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190803', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190804 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190804', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190805 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190805', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190806 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190806', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190807 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190807', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190808 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190808', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190809 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190809', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190810 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190810', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190811 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190811', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190812 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190812', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190813 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190813', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190814 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190814', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190815 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190815', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190816 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190816', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190817 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190817', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190818 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190818', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190819 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190819', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190820 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190820', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190821 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190821', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190822 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190822', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190823 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190823', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190824 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190824', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190825 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190825', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190826 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190826', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190827 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190827', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190828 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190828', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190829 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190829', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190830 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190830', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190831 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190831', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190901 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190901', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190902 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190902', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190903 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190903', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190904 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190904', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190905 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190905', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190906 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190906', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190907 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190907', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190908 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190908', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190909 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190909', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190910 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190910', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190911 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190911', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190912 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190912', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190913 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190913', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190914 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190914', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190915 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190915', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190916 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190916', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190917 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190917', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190918 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190918', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190919 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190919', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190920 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190920', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190921 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190921', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190922 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190922', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190923 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190923', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190924 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190924', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190925 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190925', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190926 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190926', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190927 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190927', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190928 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190928', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190929 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190929', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20190930 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20190930', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191001 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191001', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191002 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191002', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191003 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191003', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191004 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191004', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191005 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191005', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191006 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191006', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191007 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191007', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191008 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191008', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191009 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191009', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191010 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191010', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191011 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191011', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191012 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191012', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191013 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191013', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191014 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191014', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191015 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191015', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191016 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191016', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191017 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191017', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191018 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191018', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191019 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191019', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191020 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191020', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191021 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191021', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191022 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191022', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191023 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191023', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191024 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191024', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191025 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191025', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191026 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191026', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191027 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191027', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191028 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191028', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191029 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191029', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191030 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191030', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191031 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191031', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191229 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191229', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191230 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191230', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q1 order_20191231 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q1.order_20191231', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
// ----------------------------
sh.shardCollection('trade_2019Q2.user_info', { "userId": 'hashed' }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190131 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190131', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190301 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190301', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190302 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190302', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190303 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190303', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190304 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190304', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190305 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190305', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190306 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190306', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190307 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190307', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190308 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190308', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190309 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190309', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190310 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190310', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190311 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190311', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190312 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190312', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190313 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190313', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190314 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190314', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190315 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190315', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190316 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190316', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190317 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190317', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190318 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190318', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190319 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190319', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190320 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190320', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190321 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190321', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190322 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190322', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190323 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190323', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190324 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190324', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190325 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190325', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190326 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190326', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190327 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190327', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190328 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190328', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190329 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190329', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190330 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190330', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190331 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190331', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190401 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190401', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190402 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190402', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190403 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190403', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190404 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190404', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190405 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190405', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190406 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190406', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190407 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190407', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190408 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190408', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190409 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190409', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190410 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190410', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190411 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190411', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190412 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190412', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190413 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190413', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190414 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190414', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190415 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190415', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190416 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190416', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190417 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190417', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190418 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190418', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190419 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190419', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190420 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190420', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190421 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190421', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190422 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190422', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190423 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190423', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190424 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190424', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190425 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190425', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190426 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190426', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190427 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190427', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190428 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190428', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190429 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190429', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190430 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190430', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190501 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190501', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190502 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190502', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190503 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190503', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190504 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190504', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190505 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190505', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190506 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190506', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190507 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190507', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190508 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190508', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190509 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190509', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190510 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190510', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190511 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190511', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190512 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190512', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190513 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190513', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190514 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190514', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190515 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190515', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190516 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190516', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190517 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190517', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190518 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190518', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190519 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190519', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190520 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190520', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190521 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190521', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190522 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190522', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190523 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190523', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190524 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190524', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190525 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190525', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190526 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190526', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190527 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190527', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190528 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190528', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190529 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190529', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190530 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190530', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190531 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190531', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190601 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190601', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190602 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190602', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190603 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190603', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190604 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190604', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190605 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190605', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190606 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190606', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190607 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190607', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190608 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190608', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190609 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190609', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190610 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190610', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190611 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190611', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190612 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190612', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190613 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190613', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190614 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190614', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190615 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190615', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190616 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190616', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190617 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190617', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190618 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190618', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190619 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190619', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190620 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190620', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190621 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190621', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190622 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190622', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190623 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190623', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190624 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190624', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190625 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190625', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190626 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190626', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190627 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190627', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190628 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190628', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190629 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190629', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190630 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190630', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190701 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190701', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190702 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190702', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190703 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190703', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190704 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190704', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190705 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190705', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190706 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190706', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190707 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190707', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190708 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190708', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190709 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190709', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190710 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190710', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190711 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190711', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190712 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190712', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190713 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190713', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190714 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190714', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190715 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190715', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190716 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190716', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190717 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190717', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190718 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190718', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190719 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190719', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190720 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190720', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190721 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190721', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190722 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190722', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190723 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190723', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190724 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190724', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190725 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190725', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190726 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190726', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190727 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190727', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190728 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190728', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190729 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190729', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190730 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190730', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190731 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190731', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190801 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190801', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190802 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190802', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190803 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190803', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190804 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190804', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190805 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190805', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190806 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190806', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190807 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190807', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190808 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190808', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190809 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190809', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190810 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190810', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190811 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190811', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190812 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190812', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190813 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190813', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190814 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190814', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190815 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190815', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190816 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190816', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190817 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190817', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190818 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190818', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190819 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190819', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190820 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190820', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190821 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190821', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190822 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190822', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190823 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190823', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190824 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190824', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190825 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190825', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190826 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190826', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190827 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190827', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190828 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190828', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190829 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190829', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190830 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190830', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190831 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190831', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190901 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190901', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190902 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190902', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190903 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190903', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190904 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190904', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190905 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190905', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190906 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190906', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190907 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190907', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190908 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190908', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190909 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190909', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190910 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190910', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190911 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190911', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190912 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190912', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190913 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190913', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190914 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190914', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190915 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190915', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190916 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190916', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190917 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190917', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190918 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190918', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190919 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190919', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190920 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190920', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190921 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190921', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190922 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190922', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190923 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190923', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190924 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190924', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190925 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190925', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190926 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190926', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190927 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190927', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190928 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190928', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190929 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190929', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20190930 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20190930', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191001 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191001', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191002 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191002', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191003 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191003', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191004 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191004', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191005 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191005', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191006 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191006', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191007 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191007', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191008 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191008', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191009 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191009', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191010 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191010', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191011 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191011', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191012 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191012', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191013 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191013', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191014 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191014', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191015 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191015', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191016 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191016', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191017 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191017', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191018 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191018', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191019 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191019', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191020 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191020', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191021 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191021', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191022 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191022', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191023 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191023', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191024 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191024', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191025 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191025', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191026 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191026', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191027 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191027', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191028 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191028', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191029 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191029', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191030 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191030', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191031 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191031', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191229 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191229', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191230 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191230', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q2 order_20191231 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q2.order_20191231', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
// ----------------------------
sh.shardCollection('trade_2019Q3.user_info', { "userId": 'hashed' }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190131 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190131', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190301 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190301', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190302 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190302', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190303 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190303', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190304 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190304', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190305 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190305', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190306 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190306', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190307 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190307', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190308 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190308', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190309 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190309', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190310 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190310', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190311 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190311', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190312 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190312', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190313 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190313', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190314 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190314', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190315 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190315', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190316 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190316', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190317 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190317', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190318 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190318', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190319 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190319', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190320 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190320', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190321 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190321', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190322 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190322', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190323 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190323', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190324 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190324', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190325 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190325', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190326 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190326', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190327 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190327', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190328 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190328', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190329 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190329', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190330 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190330', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190331 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190331', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190401 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190401', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190402 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190402', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190403 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190403', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190404 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190404', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190405 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190405', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190406 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190406', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190407 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190407', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190408 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190408', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190409 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190409', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190410 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190410', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190411 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190411', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190412 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190412', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190413 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190413', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190414 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190414', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190415 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190415', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190416 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190416', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190417 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190417', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190418 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190418', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190419 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190419', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190420 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190420', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190421 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190421', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190422 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190422', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190423 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190423', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190424 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190424', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190425 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190425', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190426 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190426', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190427 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190427', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190428 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190428', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190429 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190429', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190430 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190430', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190501 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190501', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190502 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190502', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190503 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190503', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190504 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190504', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190505 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190505', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190506 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190506', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190507 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190507', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190508 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190508', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190509 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190509', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190510 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190510', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190511 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190511', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190512 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190512', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190513 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190513', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190514 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190514', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190515 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190515', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190516 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190516', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190517 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190517', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190518 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190518', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190519 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190519', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190520 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190520', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190521 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190521', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190522 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190522', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190523 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190523', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190524 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190524', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190525 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190525', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190526 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190526', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190527 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190527', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190528 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190528', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190529 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190529', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190530 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190530', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190531 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190531', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190601 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190601', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190602 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190602', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190603 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190603', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190604 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190604', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190605 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190605', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190606 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190606', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190607 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190607', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190608 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190608', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190609 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190609', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190610 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190610', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190611 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190611', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190612 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190612', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190613 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190613', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190614 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190614', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190615 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190615', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190616 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190616', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190617 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190617', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190618 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190618', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190619 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190619', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190620 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190620', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190621 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190621', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190622 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190622', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190623 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190623', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190624 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190624', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190625 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190625', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190626 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190626', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190627 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190627', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190628 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190628', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190629 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190629', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190630 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190630', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190701 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190701', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190702 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190702', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190703 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190703', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190704 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190704', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190705 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190705', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190706 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190706', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190707 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190707', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190708 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190708', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190709 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190709', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190710 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190710', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190711 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190711', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190712 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190712', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190713 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190713', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190714 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190714', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190715 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190715', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190716 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190716', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190717 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190717', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190718 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190718', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190719 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190719', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190720 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190720', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190721 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190721', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190722 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190722', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190723 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190723', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190724 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190724', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190725 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190725', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190726 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190726', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190727 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190727', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190728 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190728', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190729 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190729', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190730 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190730', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190731 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190731', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190801 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190801', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190802 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190802', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190803 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190803', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190804 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190804', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190805 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190805', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190806 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190806', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190807 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190807', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190808 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190808', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190809 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190809', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190810 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190810', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190811 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190811', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190812 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190812', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190813 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190813', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190814 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190814', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190815 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190815', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190816 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190816', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190817 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190817', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190818 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190818', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190819 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190819', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190820 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190820', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190821 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190821', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190822 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190822', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190823 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190823', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190824 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190824', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190825 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190825', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190826 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190826', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190827 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190827', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190828 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190828', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190829 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190829', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190830 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190830', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190831 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190831', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190901 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190901', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190902 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190902', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190903 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190903', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190904 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190904', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190905 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190905', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190906 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190906', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190907 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190907', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190908 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190908', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190909 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190909', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190910 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190910', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190911 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190911', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190912 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190912', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190913 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190913', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190914 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190914', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190915 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190915', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190916 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190916', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190917 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190917', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190918 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190918', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190919 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190919', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190920 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190920', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190921 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190921', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190922 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190922', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190923 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190923', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190924 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190924', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190925 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190925', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190926 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190926', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190927 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190927', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190928 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190928', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190929 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190929', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20190930 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20190930', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191001 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191001', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191002 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191002', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191003 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191003', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191004 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191004', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191005 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191005', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191006 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191006', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191007 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191007', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191008 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191008', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191009 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191009', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191010 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191010', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191011 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191011', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191012 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191012', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191013 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191013', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191014 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191014', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191015 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191015', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191016 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191016', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191017 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191017', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191018 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191018', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191019 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191019', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191020 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191020', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191021 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191021', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191022 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191022', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191023 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191023', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191024 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191024', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191025 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191025', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191026 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191026', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191027 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191027', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191028 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191028', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191029 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191029', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191030 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191030', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191031 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191031', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191229 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191229', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191230 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191230', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q3 order_20191231 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q3.order_20191231', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'userId'}
// ----------------------------
sh.shardCollection('trade_2019Q4.user_info', { "userId": 'hashed' }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190131 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190131', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190301 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190301', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190302 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190302', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190303 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190303', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190304 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190304', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190305 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190305', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190306 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190306', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190307 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190307', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190308 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190308', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190309 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190309', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190310 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190310', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190311 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190311', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190312 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190312', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190313 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190313', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190314 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190314', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190315 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190315', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190316 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190316', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190317 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190317', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190318 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190318', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190319 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190319', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190320 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190320', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190321 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190321', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190322 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190322', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190323 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190323', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190324 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190324', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190325 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190325', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190326 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190326', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190327 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190327', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190328 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190328', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190329 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190329', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190330 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190330', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190331 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190331', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190401 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190401', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190402 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190402', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190403 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190403', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190404 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190404', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190405 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190405', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190406 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190406', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190407 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190407', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190408 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190408', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190409 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190409', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190410 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190410', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190411 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190411', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190412 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190412', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190413 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190413', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190414 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190414', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190415 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190415', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190416 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190416', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190417 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190417', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190418 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190418', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190419 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190419', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190420 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190420', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190421 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190421', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190422 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190422', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190423 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190423', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190424 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190424', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190425 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190425', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190426 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190426', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190427 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190427', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190428 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190428', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190429 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190429', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190430 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190430', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190501 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190501', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190502 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190502', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190503 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190503', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190504 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190504', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190505 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190505', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190506 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190506', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190507 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190507', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190508 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190508', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190509 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190509', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190510 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190510', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190511 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190511', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190512 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190512', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190513 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190513', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190514 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190514', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190515 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190515', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190516 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190516', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190517 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190517', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190518 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190518', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190519 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190519', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190520 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190520', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190521 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190521', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190522 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190522', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190523 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190523', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190524 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190524', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190525 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190525', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190526 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190526', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190527 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190527', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190528 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190528', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190529 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190529', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190530 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190530', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190531 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190531', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190601 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190601', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190602 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190602', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190603 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190603', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190604 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190604', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190605 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190605', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190606 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190606', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190607 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190607', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190608 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190608', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190609 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190609', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190610 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190610', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190611 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190611', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190612 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190612', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190613 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190613', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190614 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190614', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190615 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190615', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190616 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190616', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190617 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190617', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190618 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190618', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190619 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190619', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190620 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190620', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190621 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190621', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190622 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190622', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190623 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190623', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190624 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190624', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190625 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190625', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190626 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190626', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190627 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190627', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190628 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190628', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190629 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190629', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190630 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190630', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190701 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190701', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190702 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190702', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190703 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190703', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190704 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190704', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190705 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190705', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190706 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190706', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190707 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190707', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190708 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190708', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190709 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190709', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190710 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190710', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190711 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190711', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190712 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190712', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190713 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190713', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190714 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190714', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190715 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190715', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190716 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190716', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190717 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190717', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190718 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190718', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190719 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190719', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190720 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190720', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190721 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190721', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190722 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190722', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190723 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190723', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190724 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190724', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190725 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190725', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190726 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190726', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190727 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190727', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190728 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190728', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190729 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190729', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190730 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190730', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190731 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190731', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190801 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190801', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190802 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190802', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190803 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190803', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190804 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190804', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190805 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190805', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190806 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190806', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190807 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190807', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190808 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190808', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190809 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190809', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190810 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190810', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190811 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190811', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190812 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190812', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190813 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190813', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190814 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190814', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190815 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190815', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190816 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190816', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190817 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190817', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190818 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190818', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190819 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190819', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190820 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190820', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190821 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190821', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190822 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190822', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190823 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190823', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190824 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190824', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190825 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190825', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190826 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190826', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190827 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190827', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190828 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190828', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190829 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190829', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190830 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190830', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190831 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190831', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190901 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190901', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190902 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190902', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190903 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190903', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190904 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190904', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190905 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190905', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190906 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190906', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190907 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190907', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190908 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190908', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190909 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190909', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190910 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190910', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190911 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190911', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190912 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190912', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190913 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190913', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190914 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190914', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190915 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190915', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190916 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190916', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190917 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190917', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190918 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190918', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190919 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190919', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190920 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190920', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190921 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190921', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190922 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190922', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190923 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190923', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190924 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190924', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190925 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190925', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190926 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190926', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190927 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190927', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190928 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190928', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190929 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190929', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20190930 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20190930', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191001 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191001', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191002 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191002', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191003 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191003', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191004 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191004', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191005 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191005', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191006 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191006', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191007 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191007', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191008 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191008', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191009 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191009', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191010 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191010', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191011 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191011', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191012 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191012', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191013 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191013', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191014 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191014', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191015 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191015', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191016 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191016', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191017 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191017', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191018 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191018', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191019 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191019', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191020 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191020', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191021 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191021', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191022 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191022', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191023 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191023', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191024 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191024', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191025 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191025', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191026 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191026', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191027 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191027', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191028 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191028', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191029 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191029', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191030 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191030', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191031 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191031', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191101', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191102', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191103', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191104', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191105', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191106', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191107', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191108', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191109', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191110', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191111', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191112', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191113', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191114', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191115', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191116', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191117', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191118', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191119', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191120', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191121', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191122', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191123', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191124', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191125', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191126', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191127', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191128', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191129', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191130', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191201', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191202', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191203', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191204', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191205', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191206', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191207', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191208', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191209', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191210', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191211', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191212', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191213', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191214', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191215', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191216', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191217', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191218', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191219', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191220', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191221', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191222', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191223', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191224', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191225', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191226', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191227', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191228', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191229 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191229', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191230 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191230', { "oderId": -1 }, true);
// ----------------------------
// -- Table for trade_2019Q4 order_20191231 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '20190101', 'sharding_date_end': '20200101', 'sharding_key': 'orderTime'}
// ----------------------------
sh.shardCollection('trade_2019Q4.order_20191231', { "oderId": -1 }, true);