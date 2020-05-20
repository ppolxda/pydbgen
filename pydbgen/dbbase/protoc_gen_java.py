#! python
# -*- coding: utf-8 -*-
"""
@create: 2017-11-17 14:58:29.

@author: ppolxda

@desc:
"""
from __future__ import absolute_import, division, print_function, unicode_literals  # noqa
import copy
from pydbgen.dbbase.protoc_gen_tmpl_multi import Cmdoptions as CmdoptionsBase  # noqa
from pydbgen.dbbase.protoc_gen_tmpl_multi import ProtoPlugins as ProtoPluginsBase  # noqa


class Cmdoptions(CmdoptionsBase):

    @property
    def package_path(self):
        return 'pydbgen.dbbase.protoc_gen_java'

    @property
    def default_config_path(self):
        return '{tmpl}/java_code/gen_code.json'


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
    p.main()


if __name__ == '__main__':
    main()
