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
        padding-left:300px ;
    }
    #middle{
        height: 30px;
        background-color: #fc7e31;
        padding-left: 200px;
        color: white;
        margin-top: 0px;
    }
    #left{
        float: left;
        margin-left:100px;
        height:90%;
        width:180px;
    }
    #center{
        float: left;
        height:90%;
        width: 1150px;
    }
    ul li{
        list-style: none;
    }
    a:link{
        text-decoration: none;
    }
    #left1{
        border:1px solid red;
    }
    #right ul li{
        padding-left: 10px;
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

<div>
    <div  id="top">
        <img src="static/image/buy.png" width="95" height="52">
        <a href="index.jsp"><button style="width: 68px;height: 30px">首页</button></a>&nbsp;&nbsp;<button style="width: 68px;height: 30px">图书</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">百货</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">品牌</button>&nbsp;&nbsp;<button style="width: 68px;height: 30px">促销</button>
        <span id="top1">
               <c:if test="${!empty user}">
                   ${user.loginname},你好!&nbsp;&nbsp;
               </c:if>
               <a href="off.do">注销</a>&nbsp;&nbsp;<a href="checkCar.do">购物车</a>&nbsp;&nbsp;<a href="login.jsp">登录</a>&nbsp;&nbsp;<a href="regist.jsp">注册</a>&nbsp;&nbsp;<a href="comment.do">留言</a>&nbsp;&nbsp;

           </span>
    </div>
    <div id="middle">
        <a href="#">音乐</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">影视</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">少儿</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">动漫</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">小说</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">外语</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">数码相机</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">笔记本</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Investor Relations</a>
    </div>
    <div id="foot">
        <div id="left">
            <div id="left1">
                <div style="color: #c37840;background-color: #fcb8a2;width: 100%;height: 30px">商品分类</div>

                        <ul>
                            <li><a href="commentManager.do" target="right">留言管理</a></li>
                            <li><a href="userManager.do" target="right">用户管理</a></li>
                            <li><a href="newsManager.do" target="right">新闻管理</a></li>
                            <li><a href="orderManager.do" target="right">订单管理</a></li>
                            <li><a href="productManager.do" target="right">商品管理</a></li>
                            <li><a href="typeManager.do" target="right">分类管理</a></li>
                        </ul>
            </div>
        </div>
        <div id="center">
            <iframe scrolling="auto" rameborder="0" src="" name="right" width="100%" height="100%" ></iframe>
        </div>
    </div>
</div>

</body>
</html>