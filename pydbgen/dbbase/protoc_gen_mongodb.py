#! python
# -*- coding: utf-8 -*-
"""
@create: 2017-11-17 14:58:29.

@author: ppolxda

@desc:
"""
from __future__ import absolute_import, division, print_function, unicode_literals  # noqa
import copy
from pydbgen.dbbase.protoc_gen_pgsql import Cmdoptions as CmdoptionsBase  # noqa
from pydbgen.dbbase.protoc_gen_pgsql import ProtoPlugins as ProtoPluginsBase  # noqa


class Cmdoptions(CmdoptionsBase):

    @property
    def package_path(self):
        return 'pydbgen.dbbase.protoc_gen_mongodb'

    @property
    def default_config_path(self):
        return '{tmpl}/mongodb_init_sql/gen_code.json'


class ProtoPlugins(ProtoPluginsBase):

    def __init__(self):
        self.opts = Cmdoptions()
        # with open('tt.e', 'w') as fs:
        #     fs.write(self.opts.config)


def main():
    p = ProtoPlugins()
    p.main()


if __name__ == '__main__':
    main()
