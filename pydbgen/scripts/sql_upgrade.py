# -*- coding: utf-8 -*-
u"""
@create: 2019-09-19 19:48:03.

@author: name

@desc: sql_upgrade
"""
from __future__ import absolute_import, division, print_function

import re
import os
import codecs
import argparse

RE_MOD_COLUMN = re.compile(r'^ALTER TABLE ".*?"."(?P<table>.*?)" ALTER COLUMN ".*?" TYPE .*?;$')  # noqa
RE_DEL_COLUMN = re.compile(r'^ALTER TABLE ".*?"."(?P<table>.*?)" DROP COLUMN ".*?";$')  # noqa
RE_ADD_COLUMN = re.compile(r'^ALTER TABLE ".*?"."(?P<table>.*?)" ADD COLUMN ".*?" (?P<datatype>.*?) NOT NULL;$')  # noqa
RE_TABLE_NAME = re.compile(r'^.*?_[0-9]{6}$')


class Cmdoptions(object):

    def __init__(self):
        parser = argparse.ArgumentParser(
            description='pydbgen.scripts.sql_upgrade')

        parser.add_argument('-i', '--input',
                            default='./sql_upgrade_src.sql',
                            help='input sql file path')

        parser.add_argument('-o', '--output',
                            default=None,
                            help='output sql file path')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='file encoding(default utf8)')

        args = parser.parse_args()

        self.input = args.input
        self.encoding = args.encoding
        self.output = args.output

        if not os.path.exists(self.input) or not os.path.isfile(self.input):
            raise TypeError('input invaild')

        if self.output is None:
            self.output = os.path.dirname(self.input)

        if not os.path.exists(self.output) or not os.path.isdir(self.output):
            raise TypeError('output invaild')

        self.input_filename = os.path.basename(self.input)
        self.input_basename = self.input_filename[:self.input_filename.rfind('.')]  # noqa
        self.input_suffix = self.input_filename[self.input_filename.rfind('.'):]  # noqa
        self.outmod_path = os.path.join(self.output, self.input_basename + '.mod' + self.input_suffix)  # noqa
        self.outadd_path = os.path.join(self.output, self.input_basename + '.add' + self.input_suffix)  # noqa
        self.outdrop_path = os.path.join(self.output, self.input_basename + '.drop' + self.input_suffix)  # noqa


def get_default(val):
    defmap = {
        'bigint':  "0",
        'bigserial':  "0",
        # 'bit':  "",
        # 'boolean':  "",
        # 'box':  "",
        # 'bytea':  "",
        'character':  "",
        'varchar':  "",
        # 'cidr':  "",
        # 'circle':  "",
        'date':  "1900-01-01",
        'double':  "0",
        # 'inet':  "",
        # 'integer':  "",
        # 'interval':  "",
        'json':  "{}",
        'jsonb':  "{}",
        # 'line':  "",
        # 'lseg':  "",
        # 'macaddr':  "",
        # 'money':  "",
        'numeric':  "0",
        'decimal':  "0",
        'float4':  "0",
        'float8':  "0",
        # 'path':  "",
        # 'point':  "",
        # 'polygon':  "",
        'real':  "0",
        'smallint':  "0",
        'int':  "0",
        'int2':  "0",
        'int4':  "0",
        # 'smallserial':  "'0'",
        # 'serial':  "",
        'text':  "",
        'time':  "1900-01-01 00:00:00",
        'timestamp':  "1900-01-01 00:00:00",
        # 'tsquery':  "",
        # 'tsvector':  "",
        # 'txid_snapshot':  "",
        # 'uuid':  "",
        # 'xml':  "",
    }
    if val in defmap:
        return defmap[val]

    for i in defmap:
        if val.find(i) >= 0:
            return defmap[i]

    raise TypeError('type invaild[{}]'.format(val))


def sql_group(fs):

    add_lines = []
    alter_lines = []

    for i in fs.readlines():
        i = i.replace('\r', '')
        match = RE_MOD_COLUMN.match(i)
        if match:
            table = match.groupdict()['table']
            if RE_TABLE_NAME.match(table) is None:
                alter_lines.append(i)
            continue

        match = RE_DEL_COLUMN.match(i)
        if match:
            table = match.groupdict()['table']
            if RE_TABLE_NAME.match(table) is None:
                alter_lines.append(i)
            continue

        match = RE_ADD_COLUMN.match(i)
        if match:
            table = match.groupdict()['table']
            if RE_TABLE_NAME.match(table) is None:
                add_lines.append(i)
            continue

    return add_lines, alter_lines


def main():
    options = Cmdoptions()

    add_lines, alter_lines = [], []

    with codecs.open(options.input, 'r', encoding=options.encoding) as fs:
        add_lines, alter_lines = sql_group(fs)

    with codecs.open(options.outmod_path, 'w', encoding=options.encoding) as fs:  # noqa
        fs.write(''.join(alter_lines))

    add_lines_add = []
    add_lines_drop = []
    for i in add_lines:
        m = RE_ADD_COLUMN.match(i)
        datatype = m.groupdict()['datatype']
        add_i = i[:-2] + ' DEFAULT \'{}\';'.format(get_default(datatype))
        add_lines_add.append(add_i)

        drop_i = i[:i.rfind(datatype)] + ' DROP DEFAULT;'
        drop_i = drop_i.replace('ADD COLUMN', 'ALTER COLUMN')
        add_lines_drop.append(drop_i)

    with codecs.open(options.outadd_path, 'w', encoding=options.encoding) as fs:  # noqa
        fs.write('\n'.join(add_lines_add))

    with codecs.open(options.outdrop_path, 'w', encoding=options.encoding) as fs:  # noqa
        fs.write('\n'.join(add_lines_drop))


if __name__ == '__main__':
    main()
