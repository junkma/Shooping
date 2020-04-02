<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>添加分类</title>
</head>
<body>
添加分类
<hr/>
<form action="inserttype.do" method="post">
父分类:
<select name="parentid">
    <option value="0">根栏目</option>
    <c:forEach items="${type}" var="type">
    <option value="${type.id}">${type.name}</option>
    </c:forEach>

</select><br/>
分类名称:<input name="name"><br/>
<input type="submit" value="新增">
</form>
</body>
</html>
