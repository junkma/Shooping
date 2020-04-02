<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
<%--<link rel="stylesheet" href="static/css/layout.css">--%>

<style type="text/css">
    #top{
        height:70px;
        padding-left: 200px;
    }
    #top1{
        margin-top:0px;
        padding-left:200px ;
    }
    #middle{
        height: 30px;
        background-color: #fc7e31;
        padding-left: 250px;
        color: white;
        margin-top: 0px;
    }
    #left{
        float: left;
        margin-left:100px;
        height:90%;
        width:200px;
    }
    #center{
        float: left;
        height:90%;
        width:800px;
    }
    #right{
        float: left;
        height:90%;
        width:200px;
    }
    ul li{
        list-style: none;
    }
    a:link{
        text-decoration: none;
    }
    #left2{
        margin-top:10px;
        border:1px solid red;
        padding-left: 10px;
    }
    #left1{
        border:1px solid red;
    }
    #right ul li{
        padding-left:
                0px;
        line-height: 25px;
    }
    #right ul li a:link{
        color: #616161;
    }
    #middle a:link{
        color: white;
    }
    #left a:link{
        color: #616161;
    }
</style>
<script type="text/javascript">
$(function(){
$(".leftnav h2").click(function(){
$(this).next().slideToggle(200);
$(this).toggleClass("on");
})
$(".leftnav ul li a").click(function(){
$("#a_leader_txt").text($(this).text());
$(".leftnav ul li a").removeClass("on");
$(this).addClass("on");
})
});
</script>
<html>
<body>
<c:if test="${empty productCategories}">
    <c:redirect url="index.do"></c:redirect>
</c:if>
<div>
    <div  id="top">
           <img src="static/image/buy.png" width="95" height="52">
           <a href="index.jsp"><button style="width: 68px;height: 30px">首页</button></a>&nbsp;&nbsp;<button style="width: 68px;height: 30px">图书</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">百货</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">品牌</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">促销</button>
           <span id="top1">
               <c:if test="${!empty user}">
                   ${user.loginname},你好!&nbsp;&nbsp;
               </c:if>
               <a href="off.do">注销</a>&nbsp;&nbsp;<a href="checkCar.do">购物车</a>&nbsp;&nbsp;<a href="login.jsp">登录</a>&nbsp;&nbsp;<a href="regist.jsp">注册</a>&nbsp;&nbsp;<a href="comment.do">留言</a>&nbsp;&nbsp;
             <c:if test="${!empty user}">
                 <a href="back/backindex.jsp">后台管理</a>
             </c:if>
           </span>
    </div>
   <div id="middle">
       <a href="#">音乐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">影视</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">少儿</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">动漫</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">小说</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">外语</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">数码相机</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">笔记本</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>
   </div>
   <div id="foot">
       <div id="left">
           <div id="left1">
               <div style="color: #c37840;background-color: #fcb8a2;width: 100%;height: 30px">商品分类</div>
               <c:forEach items="${productCategories}" var="cate">
              <div >${cate.name}</div>
              <div >
                  <ul>
                      <c:forEach items="${cate.childname}" var="child">
                      <li><a href="productType.do?id=${child.id}" target="right">${child.name}</a></li>
                      </c:forEach>
                  </ul>
              </div>
               </c:forEach>

           </div>
           <div id="left2">
               <div style="color: #c37840;background-color: #fcb8a2;width: 100%;height: 30px;padding-left: 0px">最近浏览</div>
               <c:if test="${!empty browses}">
                   <c:forEach items="${browses}" var="browse">
                       <a href="productDetail.do?id=${browse.product.id}"><img src="front/static/images/${browse.product.filename}" width="50px" height="50px"/></a>
                       <a href="productDetail.do?id=${browse.product.id}">${browse.product.name}</a><br/>
                   </c:forEach>
               </c:if>
           </div>
       </div>
       <div id="center">
           <iframe scrolling="auto" rameborder="0" src="allProducts.do" name="right" width="100%" height="100%" ></iframe>
       </div>
       <div id="right">
          <ul>
              <li style="background: #e4e4e4;width: 200px;height: 30px;color: #000000">新闻动态</li>
              <marquee  behavior="alternate" scrollamount='1' scrolldelay='20' direction= 'up' width='200' id='akuma' height='200' onmouseover='akuma.stop()' onmouseout='akuma.start()'>
                   <c:if test="${!empty news}">
                       <c:forEach items="${news}" var="news">
                           <li><a href="newsDetail.do?id=${news.id}" target="right">${news.title}</a></li>
                       </c:forEach>
                   </c:if>
               </marquee>
           </ul>
       </div>
   </div>
</div>

</body>
</html>
