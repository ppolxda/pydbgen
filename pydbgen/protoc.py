import sys
import pkg_resources
from grpc_tools.protoc import main as _main


def main():
    grpc_tools = pkg_resources.resource_filename('grpc_tools', '_proto')
    grpc_tools_include = '-I{}'.format(grpc_tools)
    pydbgen = pkg_resources.resource_filename('pydbgen.dbbase', '_proto')
    pydbgen_include = '-I{}'.format(pydbgen)
    pypbgen = pkg_resources.resource_filename('pydbgen.pbclass', '_proto')
    pypbgen_include = '-I{}'.format(pypbgen)
    sys.exit(_main(sys.argv + [
        grpc_tools_include, pydbgen_include, pypbgen_include
    ]))


if __name__ == '__main__':
    sys.exit(main())
