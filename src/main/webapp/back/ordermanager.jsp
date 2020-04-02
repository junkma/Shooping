
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
    <title>订单管理</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>
    订单管理
    <hr/>
    订单号:<input type="text" id="pid"> 订货人:<input id="name"><input type="button" value="查询">
    <table   cellspacing="0" cellpadding="0" border="1">
        <tr>
           <th width="50px">编号</th>
           <th width="100px">姓名</th>
           <th width="300px"> 发货地址</th>
           <th width="100px"> 状态</th>
           <th width="80px"> 操作</th>
        </tr>

        <c:forEach items="${requestScope.order.lists}" var="order">
    <tr>
        <td>${order.id}</td>
        <td>${order.username}</td>
        <td>${order.useraddress}</td>
        <c:choose>
        <c:when test="${order.status==0}">
           <td width="150px" style="text-align: center">待审核</td>
        </c:when>
        <c:when test="${order.status==1}">
         <td width="150px" style="text-align: center">审核通过</td>
        </c:when>
        <c:when test="${order.status==2}">
            <td width="150px" style="text-align: center">配货</td>
        </c:when>
        <c:when test="${order.status==3}">
            <td width="150px" style="text-align: center">发货</td>
        </c:when>
        <c:when test="${order.status==4}">
           <td width="150px" style="text-align: center"> 收货并确认</td>
        </c:when>

        </c:choose>
        <td><a href="selectorder.do?id=${order.id}">修改</a>&nbsp;<a href="delorder.do?id=${order.id} " onclick="return confirm('确定要删除吗?')">删除</a></td>
    </tr>
        </c:forEach>

    </table>
    <span style="text-align: center">第${requestScope.order.currPage }/ ${requestScope.order.totalPage}页&nbsp;总记录数：${requestScope.order.totalCount }  每页显示:${requestScope.news.pageSize}</span>
    <br/>
    <span style="text-align: center" >
          <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=1">[首页]</a>
<c:if test="${requestScope.order.currPage !=1}">
    <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=${requestScope.order.currPage-1}">[上一页]</a>
    <c:if test="${requestScope.order.currPage ==1}">
        <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=1">[上一页]</a>
    </c:if>
</c:if>
<c:if test="${requestScope.order.currPage !=requestScope.order.totalPage}">
    <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=${requestScope.order.currPage+1}">[下一页]</a>
    <c:if test="${requestScope.order.currPage==requestScope.order.totalPage}">
        <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=${requestScope.order.totalPage}">[下一页]</a>
    </c:if>
</c:if>
        <a href="${pageContext.request.contextPath }/orderManager.do?currentPage=${requestScope.order.totalPage}">[尾页]</a>


       </span>
</div>

<script>
    $(function () {
        $("th").css("background","Bisque ");
$("input[type='button']").click(function () {
    $("td").remove();
   $.getJSON("selectby.do",{"pid":$("#pid").val(),"name":$("#name").val()},callback);
   function callback(data) {
       $(data).each(function () {
           var status=this.status;
           var aa='';
           if(status==1){
               aa="待审核";
           }
           if(status==2){
               aa="审核通过";
           }
           if(status==3){
               aa="配货";
           }
           if(status==4){
               aa="发货";
           }
           if(status==5){
               aa="收货并确认";
           }

           var td1=$("<td>"+this.id+"</td>");
           var td2=$("<td>"+this.username+"</td>");
           var td3=$("<td>"+this.useraddress+"</td>");
           var td4=$("<td>"+aa+"</td>");
           var td5=$("<td><a href='selectorder.do?id="+this.id+"'>修改</a><a href='delorder.do?id="+this.id+"' onclick=\"return confirm('确定要删除吗?')\">删除</a></td>")
            var tr=$("<tr></tr>");
           tr.append(td1);
           tr.append(td2);
           tr.append(td3);
           tr.append(td4);
           tr.append(td5);
           $("table").append(tr);
       })

   }

});
    })

</script>
</body>
</html>
