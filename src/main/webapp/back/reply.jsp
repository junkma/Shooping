<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    回复留言
    <hr>
    <form action="update.do?id=${comment.id}" method="post">
    留言编号:<input type="text" value="${comment.id}"><br/>
    留言姓名:<input type="text" value="${comment.nickname}"><br/>
    留言内容:<input type="text" value="${comment.content}"><br/>
    回复内容:<textarea name="reply" cols="10" rows="5" >${comment.reply}</textarea>
    <br/>
    <input type="submit" value="更新">
    </form>
</div>
</body>
</html>
