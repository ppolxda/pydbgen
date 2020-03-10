# -*- coding: utf-8 -*-
"""
@create: 2017-03-09 15:15:05.

@author:

@desc:
"""
# import os
# import sys
# import codecs
# import shutil
from setuptools import setup, find_packages, findall
from pkg_resources import load_entry_point


# print(find_packages())
# print(findall('pydbgen/_templates'))
# print(findall('pydbgen/_proto'))
# print(os.path.join(sys.prefix, 'MyApp', 'CBV'))
# is_py2 = sys.version_info.major == 2
# is_windows = sys.platform.startswith('win')


# def lf2crlf(path, encoding='utf8'):
#     with codecs.open(path, 'r', encoding=encoding) as fs:
#         data = fs.read()

#     with codecs.open(path, 'w', encoding=encoding) as fs:
#         data = data.replace('\r', '')
#         data = data.replace('\n', '\r\n')
#         fs.write(data)


datas = findall('pydbgen/dbbase/_proto')
datas += findall('pydbgen/dbbase/_templates')
datas += findall('pydbgen/pbclass/_proto')
datas += findall('pydbgen/pbclass/_templates')
datas += findall('pydbgen/restful/_proto')
datas += findall('pydbgen/restful/_templates')
datas = [i[len('pydbgen/'):] for i in datas]

setup(
    name="pydbgen",
    version="0.0.5",
    install_requires=[
        'six',
        'mako',
        'autopep8',
        'grpcio-tools',
    ],
    packages=find_packages('.'),
    package_data={
        'pydbgen': datas,
    },
    entry_points={
        "console_scripts": [
            "pydbgen=pydbgen.protoc:main",
            "protoc-gen-pydbjson=pydbgen.dbbase.protoc_gen_json:main",
            "protoc-gen-pydbmysql=pydbgen.dbbase.protoc_gen_mysql:main",
            "protoc-gen-pydbpgsql=pydbgen.dbbase.protoc_gen_pgsql:main",
            "protoc-gen-pydbmongo=pydbgen.dbbase.protoc_gen_mongodb:main",
            "protoc-gen-pydbtmpl=pydbgen.dbbase.protoc_gen_tmpl_multi:main",
            "protoc-gen-pypbjson=pydbgen.pbclass.protoc_gen_json:main",
            "protoc-gen-pypbclass=pydbgen.pbclass.protoc_gen_tmpl_multi:main",
            "protoc-gen-rfjson=pydbgen.restful.protoc_gen_json:main",
            "protoc-gen-rfcjson=pydbgen.restful.protoc_gen_tmpl_multi:main",
            "protoc-gen-rfcts=pydbgen.restful.protoc_gen_typescript:main",
            "protoc-gen-rfcjava=pydbgen.restful.protoc_gen_java:main",
        ]
    },
    # scripts=bin_list_build(),
    python_requires=">=3.6",
    author="ppolxda",
    author_email="sa@sa.com",
    description="pydbgen",
    license="PSF",
    keywords="examples",
    # url="http://example.com/HelloWorld/",
)
