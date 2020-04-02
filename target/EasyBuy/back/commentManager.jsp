<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>留言管理</title>
    <script src=" front/js/jquery-1.8.3.min.js"></script>

</head>
<body>
<div>
    留言管理
    <hr/>
    <table border="1" cellpadding="0"cellspacing="0" >
        <tr>
            <th width="50px" style="text-align: center">编号</th>
            <th width="80px" style="text-align: center">姓名</th>
            <th width="300px">留言内容</th>
            <th width="150px" style="text-align: center">状态</th>
            <th width="80px" style="text-align: center">操作</th>
        </tr>
 <c:forEach items="${requestScope.paper.lists}" var="comment">
   <tr>
       <td style="text-align: center">${comment.id}</td>
       <td style="text-align: center">${comment.nickname}</td>
       <td>${comment.content}</td>
       <td style="text-align: center">${comment.stage==1?"已回复":""}</td>
       <td style="text-align: center"><a href="select.do?id=${comment.id}">回复</a>&nbsp;<a href="del.do?id=${comment.id}" onclick="return confirm('你确定要删除吗？')">删除</a></td>
   </tr>
 </c:forEach>
    </table>
    <span style="text-align: center">第${requestScope.paper.currPage }/ ${requestScope.paper.totalPage}页&nbsp;总记录数：${requestScope.paper.totalCount }  每页显示:${requestScope.paper.pageSize}</span>
<br/>
    <span style="text-align: center" >
          <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=1">[首页]</a>
<c:if test="${requestScope.paper.currPage !=1}">
         <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=${requestScope.paper.currPage-1}">[上一页]</a>
</c:if>
<c:if test="${requestScope.paper.currPage !=requestScope.paper.totalPage}">
          <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=${requestScope.paper.currPage+1}">[下一页]</a>
</c:if>
        <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=${requestScope.paper.totalPage}">[尾页]</a>
       <c:if test="${requestScope.paper.currPage ==1}">
           <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=1">[上一页]</a>
       </c:if>
       <c:if test="${requestScope.paper.currPage==requestScope.paper.totalPage}">
           <a href="${pageContext.request.contextPath }/commentManager.do?currentPage=${requestScope.paper.totalPage}">[下一页]</a>
       </c:if>
       </span>

</div>
<script>
    $(function () {
        $("th").css("background","Bisque ");

    })

</script>
</body>
</html>
