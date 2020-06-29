# -*- coding: utf-8 -*-
"""
@create:2020-03-11 07:03:26.

@author: ppolxda

@desc: gen_funcs
"""
import re
import six
import codecs
import string
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
    if '_' not in word:
        if word and word[0] in string.ascii_lowercase:
            return word[0].upper() + word[1:]
        return word
    return ''.join(x.capitalize() or '_' for x in word.split('_'))


enums_index = 0


def fmt_enum(field):
    global enums_index
    enum_re = re.compile(r'^\* (.*?): (.*?)$')

    def get_keyval(desc, i=1):
        match = enum_re.match(desc)
        if not match:
            raise TypeError('enum not match')
        return match.group(i)

    enum_desc = field['description'].split('\n')
    if not enum_desc:
        raise TypeError('enum_desc error')

    ename = enum_desc[0]
    enum_desc = enum_desc[1:]

    try:
        get_keyval(enum_desc[0], 1)
    except TypeError:
        mode = 'base'
    except IndexError:
        mode = 'base'
    else:
        mode = 'int'

    field['mode'] = mode

    if mode == 'base':
        ename = field.get('name', None)
        if not ename:
            enums_index += 1
            ename = 'EnumObject' + str(enums_index)
        elif not ename.startswith('Enum'):
            ename = 'Enum' + ename

        field['ename'] =  snake_to_camel(ename)
        field['type'] = 'enum'

        field['enums_desc'] = {
            f: f
            for i, f in enumerate(field['enum'])
        }

        field['enums'] = {
            f: f
            for i, f in enumerate(field['enum'])
        }

    elif mode == 'int':
        field['ename'] = ename
        field['type'] = 'enum'

        field['enums_desc'] = {
            get_keyval(enum_desc[i], 1):
            get_keyval(enum_desc[i], 2)
            for i, f in enumerate(field['enum'])
        }

        field['enums'] = {
            get_keyval(enum_desc[i], 1): f
            for i, f in enumerate(field['enum'])
        }
    else:
        raise TypeError('enum invaild')

    return field


def enum_loop(src):
    # OAS 3 TO 2
    if 'components' in src:
        src['definitions'] = src['components']['schemas']

    # OAS 3 TO 2
    for i in module_loop(src):
        continue

    outlist = set()
    for mname, module in src.get('definitions', {}).items():
        for fname, field in module.get('properties', {}).items():
            # ename = '_'.join(['Enum', mname, fname])
            if 'enum' in field:
                if 'description' not in field or not field['description']:
                    field['description'] = ''
                    # raise TypeError(
                    #     'enum description not found [{}][{}]'.format(
                    #         field, module
                    #     )
                    # )

                field = fmt_enum(field)
                if field['mode'] != 'int':
                    continue

                if field['ename'] in outlist:
                    continue

                outlist.add(field['ename'])
                yield field['ename'], field


def module_loop(src):
    outlist = set()
    for mname, module in src.get('definitions', {}).items():
        # format enum
        for fname, field in module.get('properties', {}).items():
            if 'enum' in field:
                if 'description' not in field or not field['description']:
                    field['description'] = ''
                    # raise TypeError(
                    #     'enum description not found [{}][{}]'.format(
                    #         field, module
                    #     )
                    # )

                field = fmt_enum(field)
                continue

            # OAS 3 TO 2
            # TODO - Only supports a single association type
            for i in ['allOf', 'anyOf', 'oneOf']:
                if i not in field:
                    continue

                if len(field[i]) != 1:
                    raise TypeError(
                        'Only supports a single association type [{}][{}][{}]'.format(
                            field[i], field, module
                        )
                    )
                    
                module['properties'][fname] = {
                    'type': 'object',
                    'schema': {
                        '$ref':field[i][0]['$ref']
                    }
                }

        if 'properties' not in module:
            continue
            # raise TypeError(
            #     'module error, properties not found {}'.format(module)
            # )

        for key, field in module.get('properties', {}).items():
            repeated = False
            _type = module.get('type', 'object')
            if _type == 'array':
                repeated = True
            module['repeated'] = repeated

        outlist.add(mname)
        yield mname, module


def paths_loop(src):
    # OAS 3 TO 2
    if 'components' in src:
        src['definitions'] = src['components']['schemas']

    # OAS 3 TO 2
    for i in module_loop(src):
        continue

    for uri, pconfig in src.get('paths', {}).items():
        for method, config in pconfig.items():
            header = []
            query = []
            path = []
            body = []
            body_from = []

            for i in config.get('parameters', []):
                if 'in' not in i:
                    i['in'] = 'query'

                if i['in'] == 'query':
                    query.append(i)

                elif i['in'] == 'header':
                    header.append(i)

                elif i['in'] == 'path':
                    path.append(i)

                elif i['in'] == 'body':
                    body.append(i)

                elif i['in'] == 'formData':
                    body_from.append(i)

            config['xquery'] = query
            config['xheader'] = header
            config['xpath'] = path
            config['xbody'] = body
            config['xfrom'] = body_from

            # OAS 3 TO 2
            ctypes = ['application/json', 'application/xml', 'application/x-www-form-urlencoded', 'text/plain']
            if 'requestBody' in config:
                for i in ctypes:
                    if i in config['requestBody']['content']:
                        content = config['requestBody']['content'][i]
                        config['xbody'] = [{
                            'in': 'body',
                            **content
                        }]

            # OAS 3 TO 2
            if 'responses' in config:
                for key, val in config['responses'].items():
                    if 'content' not in val:
                        continue

                    for i in ctypes:
                        if i in val['content']:
                            config['responses'][key] = {
                                **config['responses'][key],
                                **val['content'][i]
                            }

            #   requestBody:
            #     content:
            #       application/json:
            #         schema:
            #           $ref: '#/components/schemas/Pet'
            #         examples:
            #           dog:  # <--- example name
            #             summary: An example of a dog
            #             value:
            #               # vv Actual payload goes here vv
            #               name: Fluffy
            #               petType: dog
            #           cat:  # <--- example name
            #             summary: An example of a cat
            #             externalValue: http://api.example.com/examples/cat.json   # cat.json contains {"name": "Tiger", "petType": "cat"}
            #           hamster:  # <--- example name
            #             $ref: '#/components/examples/hamster'

            # in: body
            # name: user
            # description: The user to create.
            # schema:
            #     type: object
            #     required:
            #     - userName
            #     properties:
            #     userName:
            #         type: string
            #     firstName:
            #         type: string
            #     lastName:
            #         type: string
            yield uri, method, config


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
    kwargs['module_loop'] = module_loop
    kwargs['paths_loop'] = paths_loop
    return Template(tmpl).render(**kwargs)
