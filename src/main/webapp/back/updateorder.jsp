
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>修改订单</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div>

    修改订单
    <hr/>
    <form action="updateorder.do" method="post">
    <table   cellspacing="0" cellpadding="0" >

        <tr>
            <td width="150px" style="text-align: right">订单编号:</td>
            <td><input  value="${order.id}" name="serialnumber" readonly="readonly"></td>
        </tr>
        <tr>
            <td width="150px" style="text-align: right">订购人姓名:</td>
            <td><input  value="${order.username}" name="username" readonly="readonly"></td>
        </tr>
        <tr>
            <td width="150px" style="text-align: right">订购人地址:</td>
            <td><input  value="${order.useraddress}" name="adress" readonly="readonly"></td>
        </tr>
        <tr>
            <td width="150px" style="text-align: right">总金额:</td>
            <td><input  value="${order.cost}" name="cost" readonly="readonly"></td>
        </tr>
        <tr>
            <td width="150px" style="text-align: right">下单日期:</td>
            <td><input  value="<fmt:formatDate value="${order.createtime}"/>" name="creattime" readonly="readonly"></td>
        </tr>
        <tr>
            <td width="150px" style="text-align: right">订单状态:</td>
            <td>
                <select id="op" name="op">
                    <option value="1">待审核</option>、
                    <option value="2">审核通过</option>
                    <option value="3">配货</option>
                    <option value="4">发货</option>
                    <option value="5">收货并确认</option>
                </select>
            </td>
            <td><input  type="hidden" value="${order.status}" id="or"></td>
        </tr>
    </table>
        <input type="hidden" name="id" value="${order.id}"/>
        <input type="submit" value="更新">
    </form>
</div>
<script>
    $(function () {
        var or=$("#or").val();
        $("#op").find("option").each(function(){
            if($(this).val() == or)	{
                $(this).attr("selected",true);
            }
        });

    })

</script>

</body>
</html>
