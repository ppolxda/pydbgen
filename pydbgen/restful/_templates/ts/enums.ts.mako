<%
    def enummap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_enums(datas, '')
        }
%>
<% DATA_MAP = enummap(json_data) %>
% for key, val in DATA_MAP.items():

// ${ val['comment'] }
export enum ${ val['name'] } {
    % for key, _val in val['fields'].items():
    ${ key.upper() } = ${ _val['value'] },  // ${_val['comment']}
    % endfor
}

// ${ val['comment'] }
export const ${ val['name'] }Translate = {
    % for key, _val in val['fields'].items():
    ${_val['value']}: '${_val['comment']}',
    % endfor
}

% endfor
