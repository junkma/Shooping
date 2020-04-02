<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻管理</title>
    <script src=" front/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>
    <a href="insertnews.jsp">新增新闻</a>
    <table border="1" cellpadding="0" cellspacing="0" width="900px">
        <tr>
            <th>编号</th>
            <th>新闻标题</th>
            <th>操作</th>
        </tr>
<c:forEach items="${requestScope.news.lists}" var="news">
    <tr>
        <td width="150" style="text-align: center">${news.id}</td>
        <td width="600">${news.title}</td>
        <td width="150" style="text-align: center"><a href="selectnews.do?id=${news.id}">修改</a>&nbsp;<a href="delnews.do?id=${news.id}" onclick="return confirm('是否要删除吗?')">删除</a></td>
    </tr>
</c:forEach>

    </table>
    <span style="text-align: center">第${requestScope.news.currPage }/ ${requestScope.news.totalPage}页&nbsp;总记录数：${requestScope.news.totalCount }  每页显示:${requestScope.news.pageSize}</span>
    <br/>
    <span style="text-align: center" >
          <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=1">[首页]</a>
<c:if test="${requestScope.news.currPage !=1}">
    <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=${requestScope.news.currPage-1}">[上一页]</a>
    <c:if test="${requestScope.news.currPage ==1}">
        <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=1">[上一页]</a>
    </c:if>
</c:if>
<c:if test="${requestScope.news.currPage !=requestScope.news.totalPage}">
    <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=${requestScope.news.currPage+1}">[下一页]</a>
    <c:if test="${requestScope.news.currPage==requestScope.news.totalPage}">
        <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=${requestScope.news.totalPage}">[下一页]</a>
    </c:if>
</c:if>
        <a href="${pageContext.request.contextPath }/newsManager.do?currentPage=${requestScope.news.totalPage}">[尾页]</a>


       </span>

</div>

<script>
    $(function () {
        $("th").css("background","Bisque ");

    })

</script>
</body>
</html>
