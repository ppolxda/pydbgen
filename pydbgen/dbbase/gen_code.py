#! python
# -*- coding: utf-8 -*-
"""
@create: 2019-10-28 19:52:25.

@author: ppolxda

@desc:
"""
import os
import six
import copy
import json
import codecs
import argparse
from pydbgen.dbbase.protoc_gen_tmpl_multi import ProtoPlugins as ProtoPluginsBase  # noqa


class Cmdoptions(object):

    def __init__(self):
        # super(Cmdoptions, self).__init__()
        self.cmds = self.parse_args()
        self.mjson = self.cmds.mjson
        self.tmpl = self.cmds.tmpl
        self.fixcode = self.cmds.fixcode
        self.output = self.cmds.output
        self.encoding = self.cmds.encoding

        if self.is_invaild_file(self.mjson):
            raise TypeError('--mjson invaild')

        with codecs.open(self.mjson, 'r', self.encoding) as fs:
            try:
                self.mjson = json.loads(fs.read())
            except json.JSONDecodeError as ex:
                raise TypeError('--mjson data invaild, {}'.format(str(ex)))

        if not self.mjson or not isinstance(self.mjson, dict):
            raise TypeError('--mjson data invaild')

        if self.is_invaild_file(self.tmpl):
            raise TypeError('--tmpl invaild')

        # with codecs.open(self.tmpl, 'r', self.encoding) as fs:
        #     self.tmpl = fs.read()

        if not self.fixcode or not isinstance(self.fixcode, six.string_types):
            raise TypeError('--fixcode invaild')

        # if fixcode is list
        if self.fixcode[0] == '[' and self.fixcode[-1] == ']':
            self.fixcode = json.loads(self.fixcode)

        fixenums = ['blankline', 'trim', 'rtrim',
                    'ltrim', 'aoutpep8', 'unknow']
        if isinstance(self.fixcode, list):
            diff = list(map(lambda x: x in fixenums, self.fixcode))
            if False in diff:
                raise TypeError('--fixcode invaild')
        else:
            if self.fixcode not in fixenums:
                raise TypeError('--fixcode invaild')

    @staticmethod
    def is_invaild_file(_path):
        return not isinstance(_path, six.string_types) or \
            not _path or \
            not os.path.isfile(_path) or \
            not os.path.exists(_path)

    @property
    def package_path(self):
        return 'pydbgen.dbbase.gen_code'

    @property
    def default_config_path(self):
        return '{tmpl}/pgsql_init_sql/gen_code.json'

    def parse_args(self):
        parser = argparse.ArgumentParser(description=self.package_path)

        parser.add_argument('-s', '--step_files',
                            type=str,
                            default='pydbgen,google/protobuf',
                            help='step files list(",")')

        parser.add_argument('-e', '--encoding',
                            type=str,
                            default='utf8',
                            help='output encoding(default: utf8)')

        parser.add_argument('-m', '--mjson',
                            type=str,
                            default=None,
                            help='dbase json path')

        parser.add_argument('-o', '--output',
                            type=str,
                            default=None,
                            help='output path')

        parser.add_argument('-t', '--tmpl',
                            type=str,
                            default=None,
                            help='tmpl path')

        parser.add_argument(
            '-f', '--fixcode',
            default='unknow',
            help='fixcode (blankline|trim|rtrim|ltrim|aoutpep8)')

        return parser.parse_args()


class ProtoPlugins(ProtoPluginsBase):

    def __init__(self):
        self.opts = Cmdoptions()
        # with open('tt.e', 'w') as fs:
        #     fs.write(self.opts.config)

    @staticmethod
    def init_table_json(_json_table):
        assert isinstance(_json_table, dict)
        _json_table['json_data'] = copy.deepcopy(_json_table)
        # _json_table['default_tmplpath'] = self.opts.tmplpath

        ENUMS = _json_table.get('ENUMS', {}).get('members', {})
        # DATABASES = _json_table.get('DATABASES', {}).get('members', {})
        # TABLE_GROUPS = _json_table.get('TABLE_GROUPS', {}).get('members', {})
        TABLES = _json_table.get('TABLES', {}).get('members', {})

        for tables in ENUMS.values():
            tables['fieldsval'] = {}
            for field in tables['fields']:
                tables['fieldsval'][field['name']] = field['value']

        for tables in TABLES.values():

            for field in tables['fields']:
                if 'db_options' not in field:
                    field['db_options'] = {}

                if 'defval' not in field['db_options']:
                    field['db_options']['defval'] = None

                # if field['db_options']['defval'] == '"now"' and \
                # field['type'] == 'datetime':
                #     field['db_options']['defval'] = 'CURRENT_TIMESTAMP'

                # if field['db_options']['defval'] == '"now"' and \
                # field['type'] == 'date':
                #     field['db_options']['defval'] = ''

                if 'decpoint' not in field['db_options']:
                    field['db_options']['decpoint'] = 6

                if 'declen' not in field['db_options']:
                    field['db_options']['declen'] = 16

                if 'minval' not in field['db_options']:
                    field['db_options']['minval'] = None

                if 'maxval' not in field['db_options']:
                    field['db_options']['maxval'] = None

                if 'minlen' not in field['db_options']:
                    field['db_options']['minlen'] = None

                if 'maxlen' not in field['db_options']:
                    field['db_options']['maxlen'] = None

                if 'key' not in field['db_options']:
                    field['db_options']['key'] = False

                if 'inc' not in field['db_options']:
                    field['db_options']['inc'] = False

                if 'update' not in field['db_options']:
                    field['db_options']['update'] = False

            tables['keys'] = [val['name'] for val in tables['fields']
                              if bool(val['db_options'].get('key', False))]
        return _json_table


def main():
    p = ProtoPlugins()
    data = p.generate_code_by_json(
        p.opts.mjson, p.opts.tmpl, p.opts.fixcode)

    with codecs.open(p.opts.output, 'w', p.opts.encoding) as fs:
        fs.write(data)


if __name__ == '__main__':
    main()
