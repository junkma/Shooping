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
    <title>修改商品</title>
    <script src=" front/js/jquery-1.8.3.min.js"></script>
</head>
<body>
修改商品
<hr/>
<form action="updateproduct.do?id=${product.id}" method="post" enctype="multipart/form-data">
    <table cellspacing="0" cellpadding="0" >
        <tr>
            <td style="text-align: right">商品名称(*):</td>
            <td><input name="name" value="${product.name}"></td>
        </tr>
        <tr>
            <td style="text-align: right">描述:</td>
            <td><input name="descript" value="${product.description}"></td>
        </tr>
        <tr>
            <td style="text-align: right">所属分类:</td>
            <td>
                <select name="type" id="op">
                    <option value="654">面部护理</option>
                    <option value="656">餐具</option>
                    <option value="657">卫具</option>
                    <option value="696">餐厅专用</option>
                    <option value="661">零食/糖果/巧克力</option>
                    <option value="671">手机</option>
                    <option value="674">手环</option>
                    <option value="690">电脑</option>
                    <option value="677">老年保健品</option>
                    <option value="678">中年营养品</option>
                    <option value="679">儿童保健品</option>
                    <option value="682">旅行箱</option>
                    <option value="683">手提箱</option>
                </select>
                <input type="hidden" value="${product.catechildid}" id="or">
            </td>
        </tr>
        <tr>
            <td style="text-align: right" >商品价格(*):</td>
            <td><input name="price" value="${product.price}"></td>
        </tr>
        <tr>
            <td style="text-align: right">库存(*):</td>
            <td><input name="count" value="${product.stock}"></td>
        </tr>
        <tr>
            <td style="text-align: right">商品图片:</td>
            <td>
                  <img src="">
                <br/>
                <input type="file" name="file">


            </td>
        </tr>

    </table>
    <input type="submit" value="更新">
</form>
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
