<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>修改分类</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
添加分类
<hr/>
<form action="updatetype.do?id=${type.id}" method="post">
    父分类:
    <select name="type" id="op">
        <option value="0">根栏目</option>
        <option value="548">化妆品</option>
        <option value="628">加用商电</option>
        <option value="660">进口食品/生鲜</option>
        <option value="670">电子商品</option>
        <option value="676">保健食品</option>
        <option value="681">箱包</option>

    </select><br/>
    分类名称:<input name="name" value="${type.name}"><br/>
    <input type="hidden" value="${type.parentid}" id="or">
    <input type="submit" value="更新">
</form>

<script>
    $(function () {
        var or=$("#or").val();
        $("#op").find("option").each(function(){
            if($(this).val() == or)	{
                $(this).attr("selected",true);
            }
        });

    })

</script>
</body>
</html>
