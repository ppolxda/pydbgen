# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals  # noqa
import os
import re
import six
import sys
import json
import copy
import codecs
import argparse
import autopep8
import pkg_resources
from six.moves import reduce
from google.protobuf.compiler import plugin_pb2 as plugin
from pydbgen.restful.protoc_gen_json import generate_json
from pydbgen import gen_funcs as gfuncs


class Cmdoptions(object):

    def __init__(self):
        # pjoin = os.path.join
        # FILEPATH = os.path.abspath(os.path.dirname(__file__))
        TMPLPATH_DEFINE = '{tmpl}'
        TMPLPATH = self.get_tmpl_path()

        self.cmds = self.parse_args()
        self.tmplpath = TMPLPATH
        self.config = self.get_config_path(self.cmds)
        self.encoding = self.cmds.encoding
        self.step_files = self.cmds.step_files.split(',')

        if not self.config:
            raise TypeError('--config not set')

        self.config = self.config.replace(TMPLPATH_DEFINE, self.tmplpath)

        with codecs.open(self.config) as fs:
            self.json_conf = json.loads(fs.read())

        def fmt_json(data):
            data['tmpl'] = data['tmpl'].replace(TMPLPATH_DEFINE, self.tmplpath)
            return data

        self.json_conf = list(map(fmt_json, self.json_conf))

    def get_config_path(self, args):
        DB_CONFIG = os.environ.get('DB_CONFIG', None)
        if DB_CONFIG:
            return DB_CONFIG

        return args.config

    def get_tmpl_path(self):
        DB_TMLP = os.environ.get('DB_TMLP', None)
        if DB_TMLP:
            return DB_TMLP

        return pkg_resources.resource_filename(
            'pydbgen.restful', os.path.join('', '_templates'))

    @property
    def package_path(self):
        return 'pydbgen.restful.protoc_gen_tmpl_multi'

    @property
    def default_config_path(self):
        return '{tmpl}/insomnia/insomnia.json'

    def parse_args(self):
        parser = argparse.ArgumentParser(description=self.package_path)

        parser.add_argument('-s', '--step_files',
                            type=str,
                            default='pydbgen,google/protobuf',
                            help='step files list(",")')

        parser.add_argument('-c', '--config',
                            default=self.default_config_path,
                            help='templates json path ({tmpl} default pydbgen/_templates)')  # noqa

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='output encoding(default: utf8)')

        return parser.parse_args()


def loop_enums(_data, _trees='.root'):
    for obj in _data['enums'].values():
        yield _trees, obj

    for obj in _data['nesteds'].values():
        _sub_trees = '.'.join([_trees, obj['name']])
        yield from loop_enums(obj, _sub_trees)


def loop_nesteds(_data, _trees='.root'):
    for obj in _data['nesteds'].values():
        _sub_trees = '.'.join([_trees, obj['name']])
        yield from loop_nesteds(obj, _sub_trees)
        yield _trees, obj


class ProtoPlugins(object):

    def __init__(self):
        self.opts = Cmdoptions()

    @classmethod
    def auto_fmt(cls, context, fixcode):
        if fixcode is None:
            return context

        elif isinstance(fixcode, six.string_types):
            if fixcode == 'blankline':
                context = gfuncs.remove_blank_line(context)
            elif fixcode == 'trim':
                context = gfuncs.trim(context)
            elif fixcode == 'rtrim':
                context = gfuncs.rtrim(context)
            elif fixcode == 'ltrim':
                context = gfuncs.ltrim(context)
            elif fixcode == 'aoutpep8':
                context = autopep8.fix_code(context)
            return context

        elif isinstance(fixcode, list):
            return six.functools.reduce(cls.auto_fmt, fixcode, context)

        else:
            raise TypeError('fixcode invaild[{}]'.format(fixcode))

    @classmethod
    def generate_code_by_json(cls, json_data, tmpl_path, fixcode):
        content = gfuncs.generate_file(tmpl_path, **json_data)
        content = cls.auto_fmt(content, fixcode)
        return content

    def generate_code(self, request, response):
        # filepath0 = request.file_to_generate[0]
        # filename = filepath0[:filepath0.rfind('.')]
        opts = self.opts

        for _, _json_data in generate_json(request, opts.step_files):

            for config in opts.json_conf:
                tmpl = config['tmpl']
                json_data = copy.deepcopy(_json_data)
                json_data['loop_enums'] = loop_enums
                json_data['loop_nesteds'] = loop_nesteds
                json_data['json_data'] = copy.deepcopy(_json_data)
                json_data['cargs'] = config.get('args', {})
                if not isinstance(config, dict):
                    raise TypeError('config invaild')

                disable = config.get('disable', False)
                if disable:
                    continue

                mode = config.get('mode', 'single')
                mode_match = re.match(
                    r'^(tables|enums|table_groups|databases|classs)_multi$', mode  # noqa
                )
                if mode_match:
                    _obj = mode_match.group(1)

                    self.generate_code_multi(
                        request, response, tmpl,
                        config, json_data, _obj
                    )
                elif mode == 'single':
                    self.generate_code_signal(
                        request, response, tmpl, config, json_data
                    )
                else:
                    raise TypeError('config mode invaild')

    def generate_code_signal(self, request, response,
                             tmpl, config, json_data):
        output = config.get('output', 'auto')
        fixcode = config.get('fixcode', None)
        upsert = config.get('upsert', True)

        if output == 'auto':
            filepath0 = request.file_to_generate[0]
            filename1 = filepath0[:filepath0.rfind('.')]
            fpath = '{}_helper.py'.format(filename1)
        else:
            filepath0 = request.file_to_generate[0]
            filepath0 = filepath0.replace('\\', '/')
            filename1 = filepath0[:filepath0.rfind('/') + 1]
            if filepath0.rfind('/') >= 0:
                filename = filepath0[
                    filepath0.rfind('/') + 1: filepath0.rfind('.')
                ]
            else:
                filename = filepath0[:filepath0.rfind('.')]

            fpath = filename1 + \
                output.format(filename=gfuncs.camel_to_snake(filename))

        fpath2 = os.path.abspath(fpath)
        if not upsert and os.path.exists(fpath2):
            return

        fout = response.file.add()
        fout.name = fpath
        fout.content = gfuncs.generate_file(tmpl, **json_data)
        fout.content = self.auto_fmt(fout.content, fixcode)

    def generate_code_multi(self, request, response,
                            tmpl, config, json_data,
                            objects):
        output = config.get('output', 'auto')
        fixcode = config.get('fixcode', None)
        upsert = config.get('upsert', True)
        filepath0 = request.file_to_generate[0]
        filepath0 = filepath0.replace('\\', '/')
        filename1 = filepath0[:filepath0.rfind('/') + 1]
        keys = '{%s}' % objects[:-1]

        _objects = json_data.get(objects.upper(), {}).get('members', {})

        def gen_file(_upsert, objname, tconfig):
            fpath = filename1 + \
                output.format(objname=gfuncs.camel_to_snake(objname))

            fpath2 = os.path.abspath(fpath)
            if not _upsert and os.path.exists(fpath2):
                return

            fout = response.file.add()
            tconfig['objname'] = objname
            tconfig['json_data'] = json_data
            fout.content = gfuncs.generate_file(tmpl, **tconfig)
            fout.content = self.auto_fmt(fout.content, fixcode)
            fout.name = fpath

        if objects == 'tables':
            if keys not in output:
                raise TypeError('config output error, missing ' + keys)

            def gen_file2(_upsert, dbname, table, tconfig):
                fpath = filename1 + output.format(
                    db=gfuncs.camel_to_snake(dbname),
                    table=gfuncs.camel_to_snake(table)
                )

                fpath2 = os.path.abspath(fpath)
                if not _upsert and os.path.exists(fpath2):
                    return

                fout = response.file.add()
                tconfig['db'] = dbname
                fout.content = gfuncs.generate_file(tmpl, **tconfig)
                fout.content = self.auto_fmt(fout.content, fixcode)
                fout.name = fpath

            for table, tconfig in _objects.items():
                tconfig['json_data'] = json_data

                if output.find('{db}') >= 0:
                    for dbname in tconfig.get('database', []):
                        gen_file2(upsert, dbname, table, tconfig)
                else:
                    gen_file2(upsert, '', table, tconfig)
        else:
            for objname, tconfig in _objects.items():
                gen_file(upsert, objname, tconfig)

    def main(self):
        # Read request message from stdin
        if six.PY2:
            DATA = sys.stdin.read()
        else:
            DATA = sys.stdin.buffer.read()

        # open('test.dat', 'wb').write(data)
        # data = open('test.dat', 'rb').read()

        # Parse request
        REQUEST = plugin.CodeGeneratorRequest()
        REQUEST.ParseFromString(DATA)

        # Create response
        RESPONSE = plugin.CodeGeneratorResponse()

        # Generate code
        self.generate_code(REQUEST, RESPONSE)

        # Serialise response message
        OUTPUT = RESPONSE.SerializeToString()
        # open('tests.dat', 'wb').write(OUTPUT)

        # Write to stdout
        if six.PY2:
            sys.stdout.write(OUTPUT)
        else:
            sys.stdout.buffer.write(OUTPUT)


def main():
    p = ProtoPlugins()
    p.main()


if __name__ == '__main__':
    main()
