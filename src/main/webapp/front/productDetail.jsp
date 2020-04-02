<%--
  Created by IntelliJ IDEA.
  User: jie
  Date: 2019/11/29
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类</title>
</head>
<style type="text/css">
#left,#right{
    float: left;
}
    #right{
        margin-left: 30px;
        width: 200px;
        padding-top: 30px;
    }
    #foot{
        margin-top: 350px;
    }
</style>
<body>
${product.name}
<hr/>
<div id="top">
    <div id="left">
    <img src="front/static/images/${product.filename}" width="300px" height="300px">
    </div>
    <div id="right">
        商城价:<span style="color: red;font-size: 30px">￥${product.price}</span><br/><br/>
    库存:${product.stock}<br/><br/>
    <a href="insertCar.do?id=${product.id}"><img src="front/static/images/car.png"/></a>
    </div>
</div>
<div id="foot">
    商品详情
    <hr/>
    ${product.description}
</div>
</body>
</html>
