# -*- coding: utf-8 -*-
"""
@create: 2020-02-26 04:22:32.

@author: ppolxda

@desc:
"""
from __future__ import absolute_import, division, print_function, unicode_literals  # noqa
from pydbgen.restful.protoc_gen_tmpl_multi import Cmdoptions as CmdoptionsBase  # noqa
from pydbgen.restful.protoc_gen_tmpl_multi import ProtoPlugins as ProtoPluginsBase  # noqa


class Cmdoptions(CmdoptionsBase):

    @property
    def package_path(self):
        return 'pydbgen.restful.protoc_gen_java'

    @property
    def default_config_path(self):
        return '{tmpl}/java/javacode.json'


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
