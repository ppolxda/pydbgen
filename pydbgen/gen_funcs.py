# -*- coding: utf-8 -*-
u"""
@create: InsertDatetimeString(Ctrl+Shift+I).

@author: name

@desc:
"""
import re
import six
import json
import codecs
import datetime
import functools
import pkg_resources
from collections import OrderedDict
from mako.template import Template

SHAIDING_RANGE_ID = {'SM_RANGE_ID'}
SHAIDING_RANGE_DATE = {'SM_RANGE_YEAR', 'SM_RANGE_QUARTER',
                       'SM_RANGE_MONTH', 'SM_RANGE_DAY'}
SHAIDING_PARTITION_DATE = {'SM_PARTITION_YEAR', 'SM_PARTITION_QUARTER',
                           'SM_PARTITION_MONTH', 'SM_PARTITION_DAY'}
SHAIDING_PARTITION_ID = {'SM_PARTITION_ID'}
SHAIDING_RANGE = (SHAIDING_RANGE_ID | SHAIDING_RANGE_DATE |
                  SHAIDING_PARTITION_DATE | SHAIDING_PARTITION_ID)

SHAIDING_P2R = {
    'SM_PARTITION_YEAR': 'SM_RANGE_YEAR',
    'SM_PARTITION_QUARTER': 'SM_RANGE_QUARTER',
    'SM_PARTITION_MONTH': 'SM_RANGE_MONTH',
    'SM_PARTITION_DAY': 'SM_RANGE_DAY'
}


def partition2range(mode):
    if isinstance(mode, dict):
        mode = mode.get('sharding_mode', 'SM_DISABLE')
    return SHAIDING_P2R[mode]


def is_partition(mode):
    if isinstance(mode, dict):
        mode = mode.get('sharding_mode', 'SM_DISABLE')
    return mode in SHAIDING_PARTITION_DATE


def is_range(mode):
    if isinstance(mode, dict):
        mode = mode.get('sharding_mode', 'SM_DISABLE')
    return mode in SHAIDING_RANGE_DATE


def is_shaiding(mode):
    if isinstance(mode, dict):
        mode = mode.get('sharding_mode', 'SM_DISABLE')
    return mode in SHAIDING_RANGE


def get_type_default(_type):
    if _type == 'string':
        return "''"
    elif _type == 'bytes':
        return "''"
    elif _type == 'int32' or _type == 'int64':
        return 0
    elif _type == 'float' or _type == 'double':
        return 0.0
    elif _type == 'datetime':
        return "'1900-01-01 00:00:00'"
    elif _type == 'date':
        return "'1900-01-01'"
    elif _type in ['json', 'jsonb']:
        return "'{}'"
    # elif _type in ['oneof', 'message']:
    #     raise TypeError('get_type_default type unknow')
    else:
        raise TypeError('get_type_default type unknow')


class Field(object):

    KEY_RE = re.compile(r'^\{(?P<key>.+)\}::(?P<type>.+)$')

    def __init__(self, _key):
        match = self.KEY_RE.match(_key.strip())
        if not match:
            raise TypeError('_key invaild')

        self._key = match.group('key')
        self._keys = self._key.split('.')
        self._type = match.group('type')

    @property
    def key(self):
        return self._keys[-1]

    def fmt_value(self, val):
        if 'string' == self._type:
            return str(val)
        elif 'int' == self._type:
            return int(val)
        elif 'float' == self._type:
            return float(val)
        elif 'bool' == self._type:
            return bool(val)
        elif 'sort' == self._type:
            return self.get_sort(val)
        else:
            raise TypeError('fmt_value error, value invaild')

    def get_value(self, data, level=None):
        if level is None:
            level = self._keys.copy()

        key = level.pop(0)
        if level:
            return self.get_value(data[key], level)
        else:
            return data[key]

    @staticmethod
    def get_sort(_sort):
        # _sort = x['db_options'].get('sort', 'ASC')
        if _sort in ['ASC', 'DESC', 'HASHED']:
            return _sort
        raise TypeError('field sort invaild[{}]'.format(_sort))


class Fields(object):

    CACHE = {}

    def __init__(self, _keys):
        keys = _keys.split(',')
        self.fields = [Field(i) for i in keys]

    def gen_dict(self, data):
        return {i.key: i.get_value(data) for i in self.fields}

    @classmethod
    def instance(cls, _key):
        if _key in cls.CACHE:
            return cls.CACHE[_key]
        else:
            cls.CACHE[_key] = Fields(_key)
            return cls.instance(_key)


def list_fmt(_list, keys):
    fields = Fields.instance(keys)
    return map(lambda x: fields.gen_dict(x), _list)


def list_fmt_string(_list, fmt, keys):
    return map(lambda x: fmt.format(**x), list_fmt(_list, keys))


def ltrim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.lstrip() for i in text]
    return index.join(text)


def rtrim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.rstrip() for i in text]
    return index.join(text)


def trim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.strip() for i in text]
    return index.join(text)


def remove_blank_line(text):
    if isinstance(text, six.string_types):
        index = '\n\n'
        rindex = '\n\n\n'
        fix = '\r'
    elif isinstance(text, six.binary_type):
        index = b'\n\n'
        rindex = b'\n\n\n'
        fix = '\r'
    else:
        raise TypeError('remove_blank_line text invaild ')

    text = text.replace(fix, '')

    while rindex in text:
        text = text.replace(rindex, index)
    return text


def padding_switch_split(text, count=3, split=','):
    if not text:
        return text

    pos_count = 0
    pos = text.find(split)
    while pos > 0:
        pos_count += 1
        if pos_count >= count:
            text = text[:pos + 1] + '\n' + text[pos + 1:]
            pos_count = 0
            pos += 1

        pos += 1
        pos = text.find(split, pos)
    return text


def padding_space(text, count=0, padding_top=True):
    if not text:
        return text
    space = ' ' * count
    text = text.replace('\n', '\n' + space)
    if padding_top and text[0] != ' ':
        text = space + text
    return text


def camel_to_snake(text):
    str1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', text)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', str1).lower()


def snake_to_camel(word):
    return ''.join(x.capitalize() or '_' for x in word.split('_'))


def string2date(val, to_date=True):
    u"""string2date."""
    try:
        if to_date:
            return datetime.datetime.strptime(val, '%Y-%m-%d').date()
        else:
            return datetime.datetime.strptime(val, '%Y-%m-%d')
    except ValueError:
        pass
    try:
        if to_date:
            return datetime.datetime.strptime(val, '%Y/%m/%d').date()
        else:
            return datetime.datetime.strptime(val, '%Y/%m/%d')
    except ValueError:
        pass
    try:
        if to_date:
            return datetime.datetime.strptime(val, '%Y%m%d').date()
        else:
            return datetime.datetime.strptime(val, '%Y%m%d')
    except ValueError:  # noqa
        pass


def string2datetime(val):
    u"""string2datetime."""
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%d %H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%dT%H:%M:%S')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y%m%dT%H%M%S')
    except ValueError:  # noqa
        pass
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%d %H:%M:%S.%f')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%d %H:%M:%S.%f')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y-%m-%dT%H:%M:%S.%f')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y/%m/%dT%H:%M:%S.%f')
    except ValueError:
        pass
    try:
        return datetime.datetime.strptime(val, '%Y%m%dT%H%M%S%f')
    except ValueError:  # noqa
        pass

    return string2date(val, False)


def datetime2year_string(_datetime):
    assert isinstance(_datetime, datetime.datetime)
    return _datetime.strftime('%Y')


def datetime2month_string(_datetime):
    assert isinstance(_datetime, datetime.datetime)
    return _datetime.strftime('%Y%m')


def datetime2quarter_string(_datetime):
    assert isinstance(_datetime, datetime.datetime)
    return '{}Q{}'.format(_datetime.year, (_datetime.month - 1) // 3 + 1)


def datetime2date_string(_datetime):
    assert isinstance(_datetime, datetime.datetime)
    return _datetime.strftime('%Y%m%d')


def loop_datetime(_start, _end, days=0, months=0, years=0, quarters=0):
    assert isinstance(_start, datetime.datetime), '_start invaild [type {}][{}][{}]'.format(type(_start), _start, (_start, _end, days, months, years))  # noqa
    assert isinstance(_end, datetime.datetime), '_end invaild [type {}][{}][{}]'.format(type(_end), _end, (_start, _end, days, months, years))  # noqa
    assert isinstance(days, six.integer_types)
    assert isinstance(months, six.integer_types)
    assert isinstance(years, six.integer_types)
    assert isinstance(quarters, six.integer_types)
    assert not (days <= 0 and months <= 0 and years <= 0 and quarters <= 0)

    if years > 0:
        _end = string2datetime(datetime2year_string(_end) + '0101')
        _start = string2datetime(datetime2year_string(_start) + '0101')
        while _start < _end:
            yield _start
            _start = _start.replace(year=_start.year + 1)

    elif months > 0:
        _end = string2datetime(datetime2month_string(_end) + '01')
        _start = string2datetime(datetime2month_string(_start) + '01')

        while _start < _end:
            yield _start

            div, mod = divmod(_start.month + months - 1, 12)
            _start = _start.replace(
                year=_start.year + div,
                month=mod + 1)

    elif days > 0:
        _timedelta = datetime.timedelta(days=days)
        while _start < _end:
            yield _start
            _start += datetime.timedelta(days)

    elif quarters > 0:
        months = 1
        s_year = _start.year
        s_quarter = (_start.month - 1) // 3 + 1
        s_month = (s_quarter - 1) * 3 + 1
        e_year = _end.year
        e_quarter = (_end.month - 1) // 3 + 1
        e_month = (e_quarter - 1) * 3 + 1
        c_rq = None

        _start = string2datetime(
            ''.join([str(s_year), '{:02d}'.format(s_month),  '01']))
        _end = string2datetime(
            ''.join([str(e_year), '{:02d}'.format(e_month),  '01']))

        while _start < _end:
            _qr = datetime2quarter_string(_start)
            if c_rq is None or c_rq != _qr:
                c_rq = _qr
                yield _start

            div, mod = divmod(_start.month + months - 1, 12)
            _start = _start.replace(
                year=_start.year + div,
                month=mod + 1
            )

    else:
        raise TypeError('loop_datetime days=0, months=0 invaild')


def loop_datetime_range(_start, _end, days=0, months=0, years=0, quarters=0):
    for i in loop_datetime(_start, _end, days, months, years, quarters):
        if years > 0:
            _end = i.replace(year=i.year + 1)
            yield i, _end

        elif months > 0:
            div, mod = divmod(i.month + months - 1, 12)
            _end = i.replace(year=i.year + div, month=mod + 1)
            yield i, _end

        elif days > 0:
            _end = i + datetime.timedelta(days=days)
            yield i, _end

        elif quarters > 0:
            months = 3
            div, mod = divmod(i.month + months - 1, 12)
            _end = i.replace(year=i.year + div, month=mod + 1)
            yield i, _end

        else:
            raise TypeError('loop_datetime days=0, months=0 invaild')


def loop_datetime_range2(_start, _end, days=0, months=0, years=0, quarters=0):
    for i, _end in loop_datetime_range(_start, _end, days,
                                       months, years, quarters):
        yield i, _end - datetime.timedelta(milliseconds=1)


def loop_sharding_range(name, _dbconfig, mode=None, p2r=False):
    sharding_mode = _dbconfig.get('sharding_mode', 'SM_DISABLE')  # noqa
    sharding_date_begin = string2datetime(_dbconfig.get('sharding_date_begin', '1900-01-01'))  # noqa
    sharding_date_end = string2datetime(_dbconfig.get('sharding_date_end', '1900-01-01'))  # noqa
    sharding_step = _dbconfig.get('sharding_step', 5000000)  # noqa
    sharding_max = _dbconfig.get('sharding_max', 0)  # noqa
    sharding_min = _dbconfig.get('sharding_min', 0)  # noqa
    if mode:
        sharding_mode = mode

    if p2r and is_partition(sharding_mode):
        sharding_mode = partition2range(sharding_mode)

    if sharding_mode == 'SM_RANGE_ID':
        for _i in range(sharding_min, sharding_max, sharding_step):
            yield name + '_' + str(_i), _i, _i + sharding_step - 1
    elif sharding_mode == 'SM_RANGE_YEAR':
        for start_date, end_date in loop_datetime_range(
                sharding_date_begin, sharding_date_end, years=1):

            yield ('_'.join([name, datetime2year_string(start_date)]),
                   start_date, end_date)
    elif sharding_mode == 'SM_RANGE_QUARTER':
        for start_date, end_date in loop_datetime_range(
                sharding_date_begin, sharding_date_end, quarters=1):
            _qr = datetime2quarter_string(start_date)
            yield ('_'.join([name, _qr]), start_date, end_date)

    elif sharding_mode == 'SM_RANGE_MONTH':
        for start_date, end_date in loop_datetime_range(
                sharding_date_begin, sharding_date_end, months=1):
            yield ('_'.join([name, datetime2month_string(start_date)]),
                   start_date, end_date)

    elif sharding_mode == 'SM_RANGE_DAY':
        for start_date, end_date in loop_datetime_range(
                sharding_date_begin, sharding_date_end, days=1):
            yield ('_'.join([name, datetime2date_string(start_date)]),
                   start_date, end_date)

    elif sharding_mode == 'SM_RANGE':
        yield name, sharding_date_begin, sharding_date_end

    else:
        yield name, None, None


def loop_sharding_range2(name, _dbconfig, mode=None, p2r=False):
    for name, start, end in loop_sharding_range(name, _dbconfig, mode, p2r):
        # if isinstance(start, datetime.datetime):
        #     start -= datetime.timedelta(milliseconds=1)
        if isinstance(end, datetime.datetime):
            end -= datetime.timedelta(milliseconds=1)
        yield name, start, end


def loop_sharding(name, _dbconfig, mode=None, p2r=False):
    for name, _, _ in loop_sharding_range(name, _dbconfig, mode, p2r):
        yield name


def loop_datbases(_json):
    for _, o_config in _json['OUTPUTS']['members'].items():
        for db_config in o_config['fields']:
            db_name = db_config['name']
            db_type = db_config['type']

            _db_config = _json['DATABASES']['members'].get(db_type, None)
            if _db_config is None:
                raise TypeError('DATABASES members not has {}'.format(db_name))

            db_opts = db_config['db_options'].copy()
            sharding_mode = db_opts.get('sharding_mode', 'SM_DISABLE')
            for dbname, start, end in loop_sharding_range(
                    db_name, db_config['db_options']):
                if sharding_mode == 'SM_RANGE_ID':
                    db_opts['sharding_max'] = start
                    db_opts['sharding_min'] = end
                else:
                    db_opts['sharding_date_begin'] = str(start)
                    db_opts['sharding_date_end'] = str(end)

                yield dbname, _db_config, db_opts


def loop_all_tables(_json, p2r=False):
    def loop_table(_table):
        # assert o_name == db_config['name']
        t_name = _table['name']
        t_type = _table['type']

        if t_type in _json['TABLES']['members']:
            table = _json['TABLES']['members'][t_type]
            yield t_name, table, _table
        elif t_type in _json['TABLE_GROUPS']['members']:
            tgroup = _json['TABLE_GROUPS']['members'][t_type]
            for table in tgroup['fields']:
                yield from loop_table(table)
        else:
            raise TypeError(
                '[{}]TABLES or TABLE_GROUPS '
                'members not has {}'.format(t_name, t_type)
            )

    for dbname, db_config, db_opts in loop_datbases(_json):
        for _t_config in db_config['fields']:
            for t_name, t_config, t_opts in loop_table(_t_config):
                opts = db_opts.copy()
                opts.update(t_opts['db_options'])

                for tname in loop_sharding(t_name, opts, p2r=p2r):
                    yield dbname, tname, t_config, opts

                suffixs = opts.get('suffix_tables', '').split(',')
                if not suffixs:
                    continue

                for suffix in filter(lambda x: x, suffixs):
                    _t_name = '_'.join([t_name, suffix])
                    for tname in loop_sharding(_t_name, opts, p2r=p2r):
                        yield dbname, tname, t_config, opts


def loop_tables(_json, p2r=False):
    for dbname, tname, tconfig, topts in loop_all_tables(_json, p2r):
        if not topts.get('is_temp', False):
            yield dbname, tname, tconfig, topts


def loop_temp_tables(_json, p2r=False):
    for dbname, tname, tconfig, topts in loop_all_tables(_json, p2r):
        if topts.get('is_temp', False):
            yield dbname, tname, tconfig, topts


def loop_indexs(_json, p2r=False):
    for dbname, tname, tconfig, topts in loop_tables(_json, p2r):
        for iname, iconfig in tconfig['members'].items():
            if iconfig['msg_type'] != 'INDEX':
                continue

            yield (dbname, tname, iname, iconfig, tconfig, topts)


def loop_tablespaces(_json):
    for tsname, tsconfig in _json['TABLESPACES']['members'].items():
        yield tsname, tsconfig


def generate_file(tmpl_path, **kwargs):
    u"""generate_file."""
    # template_loader = template.Loader(options.fs_tmpl)
    with codecs.open(tmpl_path, 'rb', encoding='utf8') as fs:
        tmpl = fs.read()

    kwargs['codecs'] = codecs
    kwargs['tmplpath'] = tmpl_path[:tmpl_path.rfind('/', 1)]
    kwargs['class_name'] = snake_to_camel
    kwargs['func_name'] = camel_to_snake
    kwargs['camel_to_snake'] = camel_to_snake
    kwargs['snake_to_camel'] = snake_to_camel
    kwargs['generate_file'] = generate_file
    kwargs['padding_space'] = padding_space
    kwargs['padding_switch_split'] = padding_switch_split
    kwargs['remove_blank_line'] = remove_blank_line
    kwargs['string2datetime'] = string2datetime
    kwargs['string2date'] = string2date
    kwargs['timedelta'] = datetime.timedelta
    kwargs['json_dumps'] = json.dumps
    kwargs['now'] = datetime.datetime.now

    kwargs['is_partition'] = is_partition
    kwargs['is_range'] = is_range
    kwargs['is_shaiding'] = is_shaiding
    kwargs['OrderedDict'] = OrderedDict
    kwargs['get_type_default'] = get_type_default

    kwargs['loop_sharding'] = loop_sharding
    kwargs['loop_sharding_range'] = loop_sharding_range
    kwargs['loop_sharding_range2'] = loop_sharding_range2
    kwargs['loop_datbases'] = functools.partial(loop_datbases, kwargs.copy())
    kwargs['loop_tables'] = functools.partial(loop_tables, kwargs.copy())
    kwargs['loop_temp_tables'] = functools.partial(
        loop_temp_tables, kwargs.copy()
    )
    kwargs['loop_indexs'] = functools.partial(loop_indexs, kwargs.copy())
    kwargs['loop_tablespaces'] = functools.partial(
        loop_tablespaces, kwargs.copy()
    )
    return Template(tmpl).render(**kwargs)
