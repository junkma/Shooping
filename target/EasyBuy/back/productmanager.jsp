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
    <title>商品管理</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>
    商品管理
    <hr/>
    <a href="back/insertproduct.jsp">新增商品</a>
    <table cellpadding="0" cellspacing="0" border="1" width="900px">
        <tr>
            <th style="text-align: center" width="150px">编号</th>
            <th  width="600px">商品名称</th>
            <th style="text-align: center" width="150px">操作</th>
        </tr>

        <c:forEach items="${requestScope.product.lists}" var="product">
            <tr>
                <td width="150" style="text-align: center">${product.id}</td>
                <td width="600"><img src="">${product.name}</td>
                <td width="150" style="text-align: center"><a href="selectproduct.do?id=${product.id}">修改</a>&nbsp;<a href="delproduct.do?id=${product.id}" onclick="return confirm('是否要删除吗?')">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <span style="text-align: center">第${requestScope.product.currPage }/ ${requestScope.product.totalPage}页&nbsp;总记录数：${requestScope.product.totalCount }  每页显示:${requestScope.product.pageSize}</span>
    <br/>
    <span style="text-align: center" >
          <a href="${pageContext.request.contextPath }/productManager.do?currentPage=1">[首页]</a>
<c:if test="${requestScope.product.currPage !=1}">
    <a href="${pageContext.request.contextPath }/productManager.do?currentPage=${requestScope.product.currPage-1}">[上一页]</a>
    <c:if test="${requestScope.product.currPage ==1}">
        <a href="${pageContext.request.contextPath }/productManager.do?currentPage=1">[上一页]</a>
    </c:if>
</c:if>
<c:if test="${requestScope.product.currPage !=requestScope.product.totalPage}">
    <a href="${pageContext.request.contextPath }/productManager.do?currentPage=${requestScope.product.currPage+1}">[下一页]</a>
    <c:if test="${requestScope.product.currPage==requestScope.product.totalPage}">
        <a href="${pageContext.request.contextPath }/productManager.do?currentPage=${requestScope.product.totalPage}">[下一页]</a>
    </c:if>
</c:if>
        <a href="${pageContext.request.contextPath }/productManager.do?currentPage=${requestScope.product.totalPage}">[尾页]</a>
       </span>
</div>
<script>
    $(function () {
        $("th").css("background","Bisque ");

    })

</script>
</body>
</html>
