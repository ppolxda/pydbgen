# -*- coding: utf-8 -*-
"""
@create:2020-03-11 07:03:26.

@author: ppolxda

@desc: gen_funcs
"""
import re
import six
import json
import codecs
import datetime
import functools
import pkg_resources
from collections import OrderedDict
from mako.template import Template


def ltrim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.lstrip() for i in text]
    return index.join(text)


def rtrim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.rstrip() for i in text]
    return index.join(text)


def trim(text):
    if isinstance(text, six.string_types):
        index = '\n'
    elif isinstance(text, six.binary_type):
        index = b'\n'
    else:
        raise TypeError('trim text invaild ')

    text = text.split(index)
    text = [i.strip() for i in text]
    return index.join(text)


def remove_blank_line(text):
    if isinstance(text, six.string_types):
        index = '\n\n'
        rindex = '\n\n\n'
        fix = '\r'
    elif isinstance(text, six.binary_type):
        index = b'\n\n'
        rindex = b'\n\n\n'
        fix = '\r'
    else:
        raise TypeError('remove_blank_line text invaild ')

    text = text.replace(fix, '')

    while rindex in text:
        text = text.replace(rindex, index)
    return text


def padding_switch_split(text, count=3, split=','):
    if not text:
        return text

    pos_count = 0
    pos = text.find(split)
    while pos > 0:
        pos_count += 1
        if pos_count >= count:
            text = text[:pos + 1] + '\n' + text[pos + 1:]
            pos_count = 0
            pos += 1

        pos += 1
        pos = text.find(split, pos)
    return text


def padding_space(text, count=0, padding_top=True):
    if not text:
        return text
    space = ' ' * count
    text = text.replace('\n', '\n' + space)
    if padding_top and text[0] != ' ':
        text = space + text
    return text


def camel_to_snake(text):
    str1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', text)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', str1).lower()


def snake_to_camel(word):
    return ''.join(x.capitalize() or '_' for x in word.split('_'))


def enum_loop(src):
    enum_re = re.compile(r'^\* (.*?): (.*?)$')

    def get_keyval(desc, i=1):
        match = enum_re.match(desc)
        if not match:
            raise TypeError('enum not match')
        return match.group(i)

    for name, module in src.get('definitions', {}).items():
        for fname, filed in module.get('properties', {}).items():
            ename = '_'.join(['Enum', name, fname])

            # TAG - diy tag
            if 'enum' in filed and 'description' in filed:
                enum_desc = filed['description'].split('\n')
                if not enum_desc:
                    raise TypeError('enum_desc error')

                enum_desc = enum_desc[1:]

                filed['enums_desc'] = {
                    get_keyval(enum_desc[i], 1):
                    get_keyval(enum_desc[i], 2)
                    for i, f in enumerate(filed['enum'])
                }

                filed['enums'] = {
                    get_keyval(enum_desc[i], 1): f
                    for i, f in enumerate(filed['enum'])
                }

                yield ename, filed


def generate_file(tmpl_path, **kwargs):
    """generate_file."""
    # template_loader = template.Loader(options.fs_tmpl)
    with codecs.open(tmpl_path, 'rb', encoding='utf8') as fs:
        tmpl = fs.read()

    kwargs['codecs'] = codecs
    kwargs['tmplpath'] = tmpl_path[:tmpl_path.rfind('/', 1)]
    kwargs['class_name'] = snake_to_camel
    kwargs['func_name'] = camel_to_snake
    kwargs['camel_to_snake'] = camel_to_snake
    kwargs['snake_to_camel'] = snake_to_camel
    kwargs['generate_file'] = generate_file
    kwargs['enum_loop'] = enum_loop
    return Template(tmpl).render(**kwargs)
