# -*- coding: utf-8 -*-
"""
@create: 2020-03-10 11:03:49.

@author: ppolxda

@desc: swagger-apis
"""
import os
import json
import yaml
import copy
import codecs
import requests
import autopep8
import argparse
import pkg_resources
from . import gen_func as gfuncs


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
        self.project = self.cmds.project
        self.output = self.cmds.output
        self.input = self.cmds.input

        if not self.config:
            raise TypeError('--config not set')

        if not self.input:
            raise TypeError('--input not set')

        if not self.output:
            raise TypeError('--output not set')

        if not self.project:
            raise TypeError('--project not set')

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
            'pydbgen.swagger', os.path.join('', '_templates')
        )

    @property
    def package_path(self):
        return 'pydbgen.swagger.main'

    @property
    def default_config_path(self):
        return '{tmpl}/ts/tscode.json'

    def parse_args(self):
        parser = argparse.ArgumentParser(description=self.package_path)

        parser.add_argument('-i', '--input',
                            default=None,
                            help='swagger config')  # noqa

        parser.add_argument('-o', '--output',
                            default=None,
                            help='swagger output config')  # noqa

        parser.add_argument('-p', '--project',
                            default=None,
                            help='project name')  # noqa

        parser.add_argument('-c', '--config',
                            default=self.default_config_path,
                            help='templates json path ({tmpl} default pydbgen/swagger/)')  # noqa

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='output encoding(default: utf8)')

        return parser.parse_args()


class GenConfig(object):

    def __init__(self, **config):
        self.tmpl_path = config['tmpl']
        self.mode = config.get('mode', 'single')
        self.output = config.get('output', 'auto')
        self.output_fmt = config.get('output_fmt', 'snake')  # 'camel', 'snake'
        self.fixcode = config.get('fixcode', None)
        self.upsert = config.get('upsert', True)
        self.disable = config.get('disable', False)


class Worker(object):

    def __init__(self):
        self.otps = Cmdoptions()
        self.otps.parse_args()
        self.data = self.load_swagger()

    def load_swagger(self):
        ''
        if self.otps.input.startswith('http://') or self.otps.input.startswith('https://'):
            r = requests.get(self.otps.input)
            if r.status_code != 200:
                raise TypeError(
                    '--input http error {}'.format(
                        self.otps.input, r.content)
                )

            data = r.content

        elif self.otps.input.startswith('file://'):
            fpath = self.otps.input[len('file://'):]
            with codecs.open(fpath, encoding=self.otps.encoding) as fs:
                data = fs.read()
        else:
            raise TypeError('--input error {}'.format(self.otps.input))

        try:
            data = json.loads(data)
        except json.JSONDecodeError as ex:
            try:
                data = yaml.load(data)
            except yaml.error.YAMLError as ex:
                raise ex

        return data

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

    def main(self):
        for config in self.otps.json_conf:
            data = copy.deepcopy(self.data)
            data['src'] = copy.deepcopy(self.data)
            data['project'] = self.otps.project
            if not isinstance(config, dict):
                raise TypeError('config invaild')

            config = GenConfig(**config)
            if config.disable:
                continue

            if config.output == 'mutil':
                pass
            else:
                files = self.gen_single(config, data)

            for fpath, context in files:
                fpath = os.path.abspath(os.path.join(self.otps.output, fpath))

                try:
                    os.makedirs(os.path.dirname(fpath))
                except FileExistsError as ex:
                    pass

                if not config.upsert and os.path.exists(fpath):
                    continue

                if config.output_fmt == 'camel':
                    project = gfuncs.snake_to_camel(self.otps.project)
                else:
                    project = gfuncs.camel_to_snake(self.otps.project)

                fpath = fpath.format(filename=project)

                with codecs.open(fpath, 'w', encoding=self.otps.encoding) as fs:
                    fs.write(context)

    def gen_single(self, config: GenConfig, data: dict):
        content = gfuncs.generate_file(config.tmpl_path, **data)
        return [(config.output, content)]


def main():
    Worker().main()


if __name__ == '__main__':
    main()
