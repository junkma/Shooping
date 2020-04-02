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
    <title>用户管理</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>
    用户管理
    <hr/>
    <a href="back/insertuser.jsp">新增用户</a>
    <table border="1" cellpadding="0"cellspacing="0" >
        <tr>
            <th width="80px" style="text-align: center">用户名</th>
            <th width="100px" style="text-align: center">真实姓名</th>
            <th width="50px">性别</th>
            <th width="260px" style="text-align: center">Email</th>
            <th width="150px" style="text-align: center">手机</th>
            <th width="80px" style="text-align: center">操作</th>
        </tr>
        <c:forEach items="${requestScope.users.lists}" var="user">
            <tr>
                <td style="text-align: center">${user.loginname}</td>
                <td style="text-align: center">${user.username}</td>
                <td style="text-align: center">${user.sex==1?"男":"女"}</td>
                <td style="text-align: center">${user.email}</td>
                <td style="text-align: center">${user.mobile}</td>
                <td style="text-align: center"><a href="selectuser.do?id=${user.id}">修改</a>&nbsp;<a href="deluser.do?id=${user.id}" onclick="return confirm('你确定要删除吗？')">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <span style="text-align: center">第${requestScope.users.currPage }/ ${requestScope.users.totalPage}页&nbsp;总记录数：${requestScope.users.totalCount }  每页显示:${requestScope.users.pageSize}</span>
    <br/>
    <span style="text-align: center" >
          <a href="${pageContext.request.contextPath }/userManager.do?currentPage=1">[首页]</a>
<c:if test="${requestScope.users.currPage !=1}">
    <a href="${pageContext.request.contextPath }/userManager.do?currentPage=${requestScope.user.currPage-1}">[上一页]</a>
    <c:if test="${requestScope.users.currPage ==1}">
        <a href="${pageContext.request.contextPath }/userManager.do?currentPage=1">[上一页]</a>
    </c:if>
</c:if>
<c:if test="${requestScope.users.currPage !=requestScope.users.totalPage}">
    <a href="${pageContext.request.contextPath }/userManager.do?currentPage=${requestScope.users.currPage+1}">[下一页]</a>
    <c:if test="${requestScope.users.currPage==requestScope.users.totalPage}">
        <a href="${pageContext.request.contextPath }/userManager.do?currentPage=${requestScope.users.totalPage}">[下一页]</a>
    </c:if>
</c:if>
        <a href="${pageContext.request.contextPath }/userManager.do?currentPage=${requestScope.users.totalPage}">[尾页]</a>


       </span>

</div>

<script>
    $(function () {
        $("th").css("background","Bisque ");

    })

</script>
</body>
</html>
