# -*- coding: utf-8 -*-
u"""
@create: 2017-03-09 15:15:05.

@author:

@desc:
"""
import os
import sys
import codecs
import shutil
from setuptools import setup, find_packages, findall
from pkg_resources import load_entry_point


# print(find_packages())
# print(findall('pydbgen/_templates'))
# print(findall('pydbgen/_proto'))
# print(os.path.join(sys.prefix, 'MyApp', 'CBV'))
is_py2 = sys.version_info.major == 2
is_windows = sys.platform.startswith('win')


def lf2crlf(path, encoding='utf8'):
    with codecs.open(path, 'r', encoding=encoding) as fs:
        data = fs.read()

    with codecs.open(path, 'w', encoding=encoding) as fs:
        data = data.replace('\r', '')
        data = data.replace('\n', '\r\n')
        fs.write(data)


datas = findall('pydbgen/dbbase/_proto')
datas += findall('pydbgen/dbbase/_templates')
# datas += findall('pydbgen/msgclass/_templates')
datas = [i[len('pydbgen/'):] for i in datas]

setup(
    name="pydbgen",
    version="0.0.1",
    install_requires=[
        'autopep8',
        'grpcio-tools',
    ],
    packages=find_packages('.'),
    package_data={
        'pydbgen': datas,
    },
    entry_points={
        "console_scripts": [
            "pdb_protoc=pydbgen.protoc:main",
            "pdb_json=pydbgen.dbbase.protoc_gen_json:main",
            "pdb_mysql=pydbgen.dbbase.protoc_gen_mysql:main",
            "pdb_pgsql=pydbgen.dbbase.protoc_gen_pgsql:main",
            "pdb_mongodb=pydbgen.dbbase.protoc_gen_mongodb:main",
            "pdb_tmpl=pydbgen.dbbase.protoc_gen_tmpl_multi:main",
            # "pdb_pycode=pydbgen.dbbase.protoc_gen_pycode:main",
            # "pdb_pymdbcode=pydbgen.dbbase.protoc_gen_pymdbcode:main",

            # "pdb_msg_json=pydbgen.msgclass.protoc_gen_json:main",
            # "pdb_msg_pycode=pydbgen.msgclass.protoc_gen_pycode:main",
        ]
    },
    # scripts=bin_list_build(),
    python_requires=">=2.7",
    author="ppolxda",
    author_email="sa@sa.com",
    description="This is an pybcexapis Package",
    license="PSF",
    keywords="examples",
    # url="http://example.com/HelloWorld/",
)
