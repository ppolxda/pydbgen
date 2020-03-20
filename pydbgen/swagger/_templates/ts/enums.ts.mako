% for ename, field in enum_loop(src):

${ '// ' + '// '.join(map(lambda x: x + '\n', field['description'].split('\n')))  }export enum ${ snake_to_camel(ename) } {
    % for key, _val in field['enums'].items():
    ${ key.upper() } = ${ _val },
    % endfor
}

${ '// ' + '// '.join(map(lambda x: x + '\n', field['description'].split('\n')))  }export const ${ snake_to_camel(ename) }Translate = {
    % for key, _val in field['enums_desc'].items():
    ${ key.upper() }: '${_val }',
    % endfor
}

% endfor
