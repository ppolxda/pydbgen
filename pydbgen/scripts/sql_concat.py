# -*- coding: utf-8 -*-
"""
@create: 2019-09-19 19:45:46.

@author:

@desc: sql_concat
"""
import os
import glob
import codecs
import argparse


class Cmdoptions(object):

    def __init__(self):
        parser = argparse.ArgumentParser(
            description='pydbgen.scripts.file_concat')

        parser.add_argument('-i', '--input',
                            default='./**/*.sql',
                            help='input sql path(glob)')

        parser.add_argument('-o', '--output',
                            default=None,
                            help='output sql path')

        parser.add_argument('-s', '--comment_symbol',
                            default='--',
                            help='comment keyword')

        parser.add_argument('-r', '--relpath',
                            default=TabError,
                            help='show relative path')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='file encoding(default utf8)')

        args = parser.parse_args()

        self.input = args.input
        self.encoding = args.encoding
        self.output = args.output
        self.comment_symbol = args.comment_symbol
        self.relpath = args.relpath
        self.sqls = glob.glob(self.input, recursive=True)

        if self.output is None:
            self.output = os.path.dirname(self.input)

        if not self.output or os.path.isdir(self.output):
            raise TypeError('--output invaild')


def main():
    opts = Cmdoptions()

    concats = []
    for path in opts.sqls:
        with codecs.open(path, 'r', encoding=opts.encoding) as fs:
            data = fs.read().strip()

        if opts.relpath:
            path = os.path.relpath(path)

        concats += [
            '',
            '',
            opts.comment_symbol + ' -------------------------------------',
            opts.comment_symbol + '         {path}'.format(path=path),
            opts.comment_symbol + ' -------------------------------------'
            '',
            '',
            data
        ]

    with codecs.open(opts.output, 'w', encoding=opts.encoding) as fs:
        fs.write('\n'.join(concats))


if __name__ == '__main__':
    main()
