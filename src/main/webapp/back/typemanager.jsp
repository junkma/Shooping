<%@ page import="com.dao.ProductCategoryMapper,com.pojo.ProductCategory" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>分类管理</title>
    <script src=" front/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>
    分类管理
<hr/>
    <a href="inserttypes.do">添加</a>
<table cellpadding="0" cellspacing="0" border="1" width="900px">
    <tr>
        <th width="150px">编号</th>
        <th width="600px">分类名称</th>
        <th width="150px">操作</th>
    </tr>
<%  %>
    <c:forEach items="${type1}" var="type">
    <tr>
        <td style="text-align: center">${type.id}</td>
        <td style="text-align: left">${type.name}</td>


       <td style="text-align: center"><a href="selecttype.do?id=${type.id}">修改</a>&nbsp;<a href="deltype.do?id=${type.id}" onclick=" return confirm('是否要删除吗?')">删除</a></td>
    </tr>
        <c:forEach items="${type.childname}" var="child">
            <tr>
                <td style="text-align: center">${child.id}</td>
                <td style="padding-left: 60px">${child.name}</td>
                <td style="text-align: center"><a href="selecttype.do?id=${child.id}">修改</a>&nbsp;<a href="deltype.do?id=${child.id}" onclick=" return confirm('是否要删除吗?')">删除</a></td>

            </tr>
        </c:forEach>
</c:forEach>
</table>
</div>
<script>
    $(function () {
        $("th").css("background","Bisque ");

    })

</script>
</body>
</html>
