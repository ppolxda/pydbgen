import re
import os
import sys
import copy
import codecs
import tempfile
import argparse
import pkg_resources
from grpc_tools.protoc import main as _main

IS_WINDOWS = sys.platform.startswith('win')
SUFFIX = '.exe' if IS_WINDOWS else ''
BINFILES_LIST = {
    'pdb_protoc': 'dbbase.protoc',
    'pdb_json': 'dbbase.protoc_gen_json',
    'pdb_mysql': 'dbbase.protoc_gen_mysql',
    'pdb_pgsql': 'dbbase.protoc_gen_pgsql',
    'pdb_mongodb': 'dbbase.protoc_gen_mongodb',
    'pdb_pycode': 'dbbase.protoc_gen_pycode',
    # 'pdb_pymdbcode': 'dbbase.protoc_gen_json',
}


class CmdPlugin(object):

    def __init__(self, tmppath, name, is_script=False):
        self.name = name
        self.tmppath = tmppath
        self.is_script = is_script

    @property
    def bin_path(self):
        bin_path = '{}/bin/{}{}'.format(
            sys.exec_prefix, self.name, SUFFIX)

        if os.path.exists(bin_path):
            return bin_path

        return '{}/Scripts/{}{}'.format(
            sys.exec_prefix, self.name, SUFFIX)

    def cmd(self):

        return '--plugin=protoc-gen-custom=' + self.bin_path


def main():
    with tempfile.TemporaryDirectory(prefix='pydbgen-') as _path:
        CONV_ARGS = {
            '--plugin=protoc-gen-custom={}'.format(i):
            CmdPlugin(_path, i)
            for i in BINFILES_LIST.keys()
        }

        # PY_CONV_ARGS = {
        #     '--plugin=protoc-gen-custom={}'.format('test_' + i):
        #     CmdPlugin(_path, i, True)
        #     for i in BINFILES_LIST.keys()
        # }

        # CONV_ARGS.update(PY_CONV_ARGS)

        grpc_tools_include = '-I{}'.format(pkg_resources.resource_filename(
            'grpc_tools', '_proto'))
        pydbgen_include = '-I{}'.format(pkg_resources.resource_filename(
            'pydbgen.dbbase', '_proto'))
        argvs = [CONV_ARGS[i].cmd() if i in CONV_ARGS else i for i in sys.argv]
        sys.exit(_main(argvs + [grpc_tools_include, pydbgen_include]))


if __name__ == '__main__':
    main()
