<%
    def datamap(datas):
        return {
            '.'.join([key, val['name']]): val
            for key, val in loop_nesteds(datas, '')
        }
%>
<% DATA_MAP = datamap(json_data) %>
${ json_dumps(DATA_MAP, indent=4) }
