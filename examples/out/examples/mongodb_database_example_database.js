// ----------------------------
// -- Database for trade_2019Q1 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-01-01 00:00:00', 'sharding_date_end': '2019-04-01 00:00:00'}
// ----------------------------
sh.enableSharding('trade_2019Q1');
// ----------------------------
// -- Database for trade_2019Q2 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-04-01 00:00:00', 'sharding_date_end': '2019-07-01 00:00:00'}
// ----------------------------
sh.enableSharding('trade_2019Q2');
// ----------------------------
// -- Database for trade_2019Q3 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-07-01 00:00:00', 'sharding_date_end': '2019-10-01 00:00:00'}
// ----------------------------
sh.enableSharding('trade_2019Q3');
// ----------------------------
// -- Database for trade_2019Q4 {'sharding_mode': 'SM_RANGE_QUARTER', 'sharding_date_begin': '2019-10-01 00:00:00', 'sharding_date_end': '2020-01-01 00:00:00'}
// ----------------------------
sh.enableSharding('trade_2019Q4');
