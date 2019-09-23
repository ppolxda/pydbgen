
// ----------------------------
// -- Table for users user_info {'sharding_date_begin': 'None', 'sharding_date_end': 'None', 'space': 'user_spaces'}
// ----------------------------
db = db.getSiblingDB('users');
db.getCollection('user_info').createIndex({ "userId": 'hashed' }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'userId'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('user_info').createIndex({ "userId": 'hashed' }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190101').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190102').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190103').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190104').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190105').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190106').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190107').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190108').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190109').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190110').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190111').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190112').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190113').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190114').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190115').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190116').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190117').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190118').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190119').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190120').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190121').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190122').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190123').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190124').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190125').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190126').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190127').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190128').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190129').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190130').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190131 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190131').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190201').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190202').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190203').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190204').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190205').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190206').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190207').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190208').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190209').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190210').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190211').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190212').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190213').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190214').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190215').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190216').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190217').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190218').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190219').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190220').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190221').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190222').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190223').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190224').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190225').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190226').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190227').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190228').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190301 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190301').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190302 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190302').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190303 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190303').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190304 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190304').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190305 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190305').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190306 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190306').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190307 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190307').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190308 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190308').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190309 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190309').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190310 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190310').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190311 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190311').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190312 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190312').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190313 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190313').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190314 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190314').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190315 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190315').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190316 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190316').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190317 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190317').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190318 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190318').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190319 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190319').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190320 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190320').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190321 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190321').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190322 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190322').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190323 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190323').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190324 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190324').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190325 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190325').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190326 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190326').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190327 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190327').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190328 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190328').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190329 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190329').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190330 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190330').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q1 order_20190331 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q1');
db.getCollection('order_20190331').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'userId'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('user_info').createIndex({ "userId": 'hashed' }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190401 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190401').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190402 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190402').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190403 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190403').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190404 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190404').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190405 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190405').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190406 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190406').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190407 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190407').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190408 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190408').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190409 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190409').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190410 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190410').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190411 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190411').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190412 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190412').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190413 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190413').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190414 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190414').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190415 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190415').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190416 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190416').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190417 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190417').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190418 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190418').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190419 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190419').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190420 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190420').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190421 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190421').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190422 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190422').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190423 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190423').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190424 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190424').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190425 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190425').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190426 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190426').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190427 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190427').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190428 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190428').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190429 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190429').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190430 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190430').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190501 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190501').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190502 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190502').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190503 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190503').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190504 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190504').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190505 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190505').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190506 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190506').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190507 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190507').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190508 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190508').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190509 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190509').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190510 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190510').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190511 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190511').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190512 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190512').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190513 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190513').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190514 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190514').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190515 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190515').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190516 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190516').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190517 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190517').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190518 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190518').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190519 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190519').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190520 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190520').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190521 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190521').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190522 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190522').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190523 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190523').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190524 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190524').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190525 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190525').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190526 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190526').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190527 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190527').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190528 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190528').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190529 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190529').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190530 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190530').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190531 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190531').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190601 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190601').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190602 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190602').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190603 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190603').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190604 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190604').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190605 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190605').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190606 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190606').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190607 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190607').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190608 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190608').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190609 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190609').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190610 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190610').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190611 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190611').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190612 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190612').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190613 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190613').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190614 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190614').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190615 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190615').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190616 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190616').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190617 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190617').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190618 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190618').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190619 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190619').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190620 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190620').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190621 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190621').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190622 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190622').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190623 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190623').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190624 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190624').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190625 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190625').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190626 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190626').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190627 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190627').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190628 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190628').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190629 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190629').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q2 order_20190630 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q2');
db.getCollection('order_20190630').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'userId'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('user_info').createIndex({ "userId": 'hashed' }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190701 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190701').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190702 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190702').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190703 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190703').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190704 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190704').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190705 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190705').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190706 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190706').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190707 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190707').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190708 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190708').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190709 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190709').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190710 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190710').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190711 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190711').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190712 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190712').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190713 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190713').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190714 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190714').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190715 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190715').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190716 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190716').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190717 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190717').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190718 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190718').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190719 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190719').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190720 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190720').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190721 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190721').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190722 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190722').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190723 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190723').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190724 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190724').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190725 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190725').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190726 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190726').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190727 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190727').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190728 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190728').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190729 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190729').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190730 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190730').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190731 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190731').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190801 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190801').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190802 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190802').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190803 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190803').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190804 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190804').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190805 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190805').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190806 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190806').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190807 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190807').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190808 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190808').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190809 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190809').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190810 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190810').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190811 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190811').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190812 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190812').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190813 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190813').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190814 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190814').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190815 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190815').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190816 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190816').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190817 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190817').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190818 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190818').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190819 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190819').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190820 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190820').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190821 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190821').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190822 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190822').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190823 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190823').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190824 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190824').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190825 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190825').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190826 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190826').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190827 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190827').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190828 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190828').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190829 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190829').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190830 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190830').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190831 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190831').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190901 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190901').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190902 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190902').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190903 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190903').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190904 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190904').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190905 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190905').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190906 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190906').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190907 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190907').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190908 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190908').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190909 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190909').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190910 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190910').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190911 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190911').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190912 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190912').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190913 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190913').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190914 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190914').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190915 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190915').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190916 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190916').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190917 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190917').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190918 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190918').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190919 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190919').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190920 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190920').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190921 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190921').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190922 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190922').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190923 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190923').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190924 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190924').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190925 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190925').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190926 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190926').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190927 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190927').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190928 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190928').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190929 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190929').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q3 order_20190930 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q3');
db.getCollection('order_20190930').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 user_info {'sharding_mode': 'SM_ENABLE', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'userId'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('user_info').createIndex({ "userId": 'hashed' }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191001 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191001').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191002 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191002').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191003 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191003').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191004 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191004').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191005 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191005').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191006 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191006').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191007 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191007').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191008 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191008').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191009 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191009').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191010 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191010').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191011 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191011').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191012 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191012').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191013 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191013').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191014 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191014').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191015 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191015').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191016 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191016').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191017 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191017').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191018 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191018').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191019 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191019').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191020 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191020').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191021 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191021').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191022 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191022').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191023 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191023').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191024 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191024').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191025 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191025').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191026 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191026').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191027 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191027').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191028 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191028').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191029 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191029').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191030 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191030').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191031 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191031').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191101 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191101').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191102 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191102').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191103 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191103').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191104 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191104').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191105 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191105').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191106 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191106').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191107 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191107').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191108 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191108').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191109 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191109').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191110 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191110').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191111 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191111').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191112 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191112').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191113 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191113').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191114 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191114').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191115 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191115').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191116 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191116').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191117 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191117').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191118 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191118').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191119 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191119').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191120 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191120').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191121 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191121').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191122 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191122').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191123 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191123').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191124 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191124').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191125 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191125').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191126 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191126').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191127 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191127').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191128 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191128').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191129 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191129').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191130 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191130').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191201 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191201').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191202 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191202').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191203 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191203').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191204 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191204').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191205 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191205').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191206 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191206').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191207 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191207').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191208 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191208').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191209 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191209').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191210 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191210').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191211 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191211').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191212 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191212').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191213 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191213').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191214 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191214').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191215 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191215').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191216 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191216').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191217 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191217').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191218 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191218').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191219 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191219').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191220 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191220').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191221 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191221').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191222 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191222').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191223 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191223').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191224 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191224').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191225 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191225').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191226 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191226').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191227 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191227').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191228 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191228').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191229 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191229').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191230 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191230').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
// ----------------------------
// -- Table for trade_2019Q4 order_20191231 {'sharding_mode': 'SM_PARTITION_DAY', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00', 'sharding_key': 'orderTime'}
// ----------------------------
db = db.getSiblingDB('trade_2019Q4');
db.getCollection('order_20191231').createIndex({ "oderId": -1 }, { 'background': true, 'unique': true });
