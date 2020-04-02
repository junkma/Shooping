<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>修改用户</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<style type="text/css">
    td{text-align: center;

    }

</style>
<body>

修改用户
<hr/>
<form action="updateuser.do" method="post">
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="text-align: right">用户名（*）</td>
            <td>:</td>
            <td><input name="loginname" id="loginname" value="${user.loginname}"></td>
            <td><span id="span1" style="color: red"></span></td>
        </tr>
        <tr>
            <td> 真实姓名（*）</td>
            <td>:</td>
            <td><input name="username" id="username" value="${user.username}"> </td>
            <td><span id="span2"style="color: red"></span></td>
        </tr>
        <tr>
            <td>登陆密码（*）</td>
            <td>:</td>
            <td> <input type="password" name="password" id="password" value="${user.password}"> </td>
            <td><span id="span3"style="color: red"></span></td>
        </tr>
        <tr>
            <td>确认密码（*）</td>
            <td>:</td>
            <td><input type="password" name="cpassword" id="cpassword" value="${user.password}"> </td>
            <td><span id="span4"style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align: right">性别（*）</td>
            <td>:</td>
            <td><input type="radio" name="sex" value="1"  >男<input name="sex" type="radio" value="0">女<br/>
            <input type="hidden" id="sex" value="${user.sex}">
            </td>
        </tr>

        <td >身份证</td>
        <td>:</td>
        <td><input type="text" name="identitycode" value="${user.identitycode}"><br/></td>
        </tr>
        <tr>
            <td >电子邮件</td>
            <td>:</td>
            <td><input type="text" name="email" value="${user.email}"><br/></td>
        </tr>
        <tr>
            <td >手机</td>
            <td>:</td>
            <td><input type="text" name="phone" value="${user.mobile}"><br/></td>
        </tr>
        <tr>
            <td >地址(*)</td>
            <td>:</td>
            <td><input type="text" name="address"  id="adress" value="${user.address}"> </td>
            <td><span id="span5"style="color: red"></span></td>
        </tr>
    </table>
    <input type="hidden" value="${user.id}" name="id"/>
    <input type="submit" value="更新">
</form>
<script>
    $(function () {
        var sex=$("#sex").val();
        if(sex==1){
            $('input:radio').eq(0).attr('checked', 'true');
        }
    else {
            $('input:radio').eq(1).attr('checked', 'true');
        }
    })

</script>
</body>
</html>
