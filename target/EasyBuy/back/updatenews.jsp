<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>修改新闻</title>
</head>
<body>
<div>
    修改新闻
    <hr/>
    <form action="updatenews.do?id=${news.id}" method="post">
        新闻标题(*):<input type="text" name="title" value="${news.title}"><br/>
        新闻内容:<textarea name="content" >${news.content}</textarea><br/>
        <input type="submit" value="更新">

    </form>
</div>
</body>
</html>
