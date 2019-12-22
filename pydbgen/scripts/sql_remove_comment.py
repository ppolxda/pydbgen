# -*- coding: utf-8 -*-
"""
@create: 2019-09-19 19:45:58.

@author: name

@desc: sql_remove_comment
"""
from __future__ import absolute_import, division, print_function

import re
import os
import codecs
import argparse

# 分类用正则
RE_LINE_COMMENT = re.compile(r'--(.*?)\r?\n')
RE_LINE_COMMENT2 = re.compile(r'--(.*?)$')


def remove_c_comments(text):
    """ remove c-style comments.
        text: blob of text with comments (can include newlines)
        returns: text with comments removed
        see: https://www.saltycrane.com/blog/2007/11/remove-c-comments-python/
    """
    pattern = r"""
                            ##  --------- COMMENT ---------
           /\*              ##  Start of /* ... */ comment
           [^*]*\*+         ##  Non-* followed by 1-or-more *'s
           (                ##
             [^/*][^*]*\*+  ##
           )*               ##  0-or-more things which don't start with /
                            ##    but do end with '*'
           /                ##  End of /* ... */ comment
         |                  ##  -OR-  various things which aren't comments:
           (                ##
                            ##  ------ " ... " STRING ------
             "              ##  Start of " ... " string
             (              ##
               \\.          ##  Escaped char
             |              ##  -OR-
               [^"\\]       ##  Non "\ characters
             )*             ##
             "              ##  End of " ... " string
           |                ##  -OR-
                            ##
                            ##  ------ ' ... ' STRING ------
             '              ##  Start of ' ... ' string
             (              ##
               \\.          ##  Escaped char
             |              ##  -OR-
               [^'\\]       ##  Non '\ characters
             )*             ##
             '              ##  End of ' ... ' string
           |                ##  -OR-
                            ##
                            ##  ------ ANYTHING ELSE -------
             .              ##  Anything other char
             [^/"'\\]*      ##  Chars which doesn't start a comment, string
           )                ##    or escape
    """
    regex = re.compile(pattern, re.VERBOSE | re.MULTILINE | re.DOTALL)
    noncomments = [m.group(2) for m in regex.finditer(text) if m.group(2)]

    return "".join(noncomments)


class Cmdoptions(object):

    def __init__(self):
        parser = argparse.ArgumentParser(
            description='pydbgen.scripts.sql_remove_comment')

        parser.add_argument('-i', '--input',
                            default='./sql_upgrade_src.sql',
                            help='input sql file path')

        parser.add_argument('-o', '--output',
                            default=None,
                            help='output sql file path')

        parser.add_argument('-e', '--encoding',
                            default='utf8',
                            help='file encoding(default utf8)')

        args = parser.parse_args()

        self.input = args.input
        self.encoding = args.encoding
        self.output = args.output

        if not os.path.exists(self.input) or not os.path.isfile(self.input):
            raise TypeError('input invaild')

        if self.output is None:
            output = os.path.dirname(self.input)
            self.input_filename = os.path.basename(self.input)
            self.input_basename = self.input_filename[:self.input_filename.rfind('.')]  # noqa
            self.input_suffix = self.input_filename[self.input_filename.rfind('.'):]  # noqa
            self.output = os.path.join(output, self.input_basename + '.comm' + self.input_suffix)  # noqa


def main():
    options = Cmdoptions()

    with codecs.open(options.input, 'r', encoding=options.encoding) as infs:
        result = []
        for i in infs.readlines():
            i = i.replace('\r', '')
            i = RE_LINE_COMMENT.sub('\n', i)
            result.append(i)

    with codecs.open(options.output, 'w', encoding=options.encoding) as outfs:
        outfs.write(''.join(result))

    with codecs.open(options.output, 'r', encoding=options.encoding) as infs:
        data = infs.read()

    with codecs.open(options.output, 'w', encoding=options.encoding) as outfs:
        data = remove_c_comments(data)
        outfs.write(data)


if __name__ == '__main__':
    main()
