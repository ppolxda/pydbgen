<%
    import datetime
    package = 'asdasd.asdasd.asd'
    author = 'ppolxda'
    date = str(datetime.datetime.now())
    classname = filename.split('.')[0]
%>
package ${package}.domain;

import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.*;
import java.sql.Timestamp;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author ${author}
* @date ${date}
*/
@Entity
@Data
@Table(name="${ name }", schema="${ db }")
public class ${ classname } implements Serializable {
% for field in fields:
    % if comments:
    /** ${comments} */
    % endif
    % if options.get('key', False):
    @Id
    % endif
    % if options.get('inc', False):
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    % endif

##     </#if>
##     @Column(name = "${column.columnName}"<#if column.columnKey = 'UNI'>,unique = true</#if><#if column.istNotNull && column.columnKey != 'PRI'>,nullable = false</#if>)
##     <#if column.istNotNull && column.columnKey != 'PRI'>
##         <#if column.columnType = 'String'>
##     @NotBlank
##         <#else>
##     @NotNull
##         </#if>
##     </#if>
##     <#if column.dateAnnotation??>
##     <#if column.dateAnnotation = 'CreationTimestamp'>
##     @CreationTimestamp
##     <#else>
##     @UpdateTimestamp
##     </#if>
##     </#if>
##     private ${column.columnType} ${column.changeColumnName};
##     </#list>
## </#if>

##     public void copy(${className} source){
##         BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
##     }
% endfor
}
