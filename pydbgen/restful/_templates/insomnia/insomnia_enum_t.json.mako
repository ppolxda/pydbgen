<%
    def enummap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_enums(datas, '')
        }
%>
<% DATA_MAP = enummap(json_data) %>
${ json_dumps(DATA_MAP, indent=4) }
