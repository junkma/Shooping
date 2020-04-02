<%--
  Created by IntelliJ IDEA.
  User: jie
  Date: 2019/11/30
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>购物车</title>
</head>
<link href="front/static/css/layout.css" rel="stylesheet" type="text/css" />
<link href="front/static/css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<%--<script type="text/javascript" src="front/static/js/NFLightBox.js"></script>
<script type="text/javascript" src="front/static/js/shop.js"></script>--%>
<style type="text/css">

</style>
<body>
<div id="shop">
    <div id="shop-t">
        <div id="shop-l"><img src="front/static/images/sh.jpg" width="74" height="67" /></div>
        <div id="shop-r">我的购物车</div>
    </div>
    <div id="shop-inf">
        <ul>
            <li class="xh">序号</li>
            <li class="lx">商品名称</li>
            <li class="rs">单价</li>
            <li class="dj">购买数量</li>
            <li class="cz">操作</li>
        </ul>
    </div>
    <c:forEach items="${cars}" var="car" varStatus="cals">
    <div id="shop-xx">
        <ul id="shop1">
            <li class="xh">${cals.count}</li>
            <li class="lx">
                <div id="luxian">
                    <ul>
                        <li><a href="front/static/images/${car.product.filename}" ><img src="front/static/images/${car.product.filename}" width="87" height="58"  /></a></li>
                        <li><a href="productDetail.do?id=${car.product.id}">${car.product.name}</a></li>
                    </ul>
                </div>
            </li>
            <li class="rs">￥${car.product.price}</li>
            <li class="dj">
                <a href="minCar.do?id=${car.id}&&page=${pagenum}"><input type="button" value="-" class="btn btnMinus" /></a>
                <input type="text" class="txt" value="${car.number}" disabled="disabled" size="3"/>
                <a href="addCar.do?id=${car.id}&&page=${pagenum}"><input type="button"  value="+" class="btn btnAdd" /></a>
            </li>
            <li class="cz"><a href="deleteCar.do?id=${car.id}" class="btnDel" onclick="return confirm('确定是否删除?')"><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
        </ul>
    </div>
    </c:forEach>
    <div id="fanye"><a href="checkCar.do?page=1">首页</a> <a href="checkCar.do?page=${pagenum-1}">上一页</a> <a href="checkCar.do?page=${pagenum+1}">下一页</a> <a href="checkCar.do?page=${totalPage}">尾页</a></div>
    <div id="jine">应付金额：<span style="color:#F00;">${sumPrice}</span>元</div>

    <div id="js">
        <a href="submitOrder.do?cost=${sumPrice}"><img src="front/static/images/js.jpg" /></a>
    </div>
</div>

</body>
</html>
