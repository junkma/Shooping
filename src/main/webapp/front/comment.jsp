<%--
  Created by IntelliJ IDEA.
  User: jie
  Date: 2019/11/28
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
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
        padding-left: 250px;
        color: white;
        margin-top: 0px;
    }
    #left{
        float: left;
        margin-left:180px;
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
        width:300px;
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
    #middle a:link{
        color: white;
    }
    #left a:link{
        color: #616161;
    }
    #table1{
        margin-left: 20px;
    }
    #table1 td{
        height: 20px;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="front/static/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#comment2").click(function(){
            $("#comment1").html("");
        });

    });
</script>
<body>

<div>
    <div  id="top">
        <img src="static/image/buy.png" width="95" height="52">
        <a href="index.jsp"><button lay-size="20">首页</button></a>&nbsp;&nbsp;<button>图书</button>&nbsp;&nbsp;<button>百货</button>&nbsp;&nbsp;<button>品牌</button>&nbsp;&nbsp;<button>促销</button>
        <span id="top1">
               <c:if test="${!empty user}">
                   ${user.loginname},你好!&nbsp;&nbsp;
               </c:if>
               <a href="off.do">注销</a>&nbsp;&nbsp;<a href="checkCar.do">购物车</a>&nbsp;&nbsp;<a href="login.jsp">登录</a>&nbsp;&nbsp;<a href="regist.jsp">注册</a>&nbsp;&nbsp;<a href="comment.do">留言</a>&nbsp;&nbsp;
             <c:if test="${!empty user}">
                 <a href="#">后台管理</a>
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
                                <li><a href="productType.do?id=${child.id}" target="right" id="comment2" >${child.name}</a></li>
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
            <div id="comment1">
            全部留言
            <table cellspacing="0" cellpadding="0" border="0px" width="100%" id="table1">
                <c:forEach items="${commentsPage}" var="comment">
                    <tr style="background-color: #c7c7c7">
                        <td>${comment.content}</td>
                    </tr>
                    <tr>
                        <td>网友:${comment.nickname}&nbsp;&nbsp;<f:formatDate value="${comment.createtime}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                    <tr>
                        <td>管理员回复:${comment.reply}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td style="text-align: right">
                        共${sum}条记录&nbsp;&nbsp;&nbsp;&nbsp;${pagenum}/${totalPage}页<br/>
                        <a href="comment.do?page=1">[首页]</a>&nbsp;&nbsp;<a href="comment.do?page=${pagenum-1}">[上一页]</a>&nbsp;&nbsp;<a href="comment.do?page=2">[2]</a>&nbsp;&nbsp;<a href="comment.do?page=3">[3]</a>&nbsp;&nbsp;<a href="comment.do?page=${pagenum+1}">[下一页]</a>&nbsp;&nbsp;<a href="comment.do?page=${totalPage}">[尾页]</a>
                    </td>
                </tr>
            </table>
            <form action="insertComment.do">
                <table cellspacing="0" cellpadding="0" border="0px" height="200px">
                    <tr>
                        <td>昵称:</td>
                        <td><input name="nickname"/></td>
                    </tr>
                   <br/>
                    <tr>
                        <td>留言内容:</td>
                        <td><textarea name="content" rows="5" cols="40"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit">提交留言</button></td>
                    </tr>
                </table>

            </form>
            </div>
            <iframe frameborder="0"  name="right" width="100%" height="100%"></iframe>
        </div>

        <div id="right"></div>
    </div>
</div>
</body>
</html>
