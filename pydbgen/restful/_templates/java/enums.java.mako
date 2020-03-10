<%
    def enummap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_enums(datas, '')
        }
%>
<% DATA_MAP = enummap(json_data) %>
package ${ rest_options['java_package'] };

% for key, val in DATA_MAP.items():
// ${ val['comment'] }
enum ${ val['name'] } {
    % for key, _val in val['fields'].items():
    ${ key.upper() } = ${ _val['value'] },  // ${_val['comment']}
    % endfor
}

% endfor
