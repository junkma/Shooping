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
    <title>新增用户</title>
    <script src=" static/js/jquery-1.8.3.min.js"></script>
</head>
<style type="text/css">
    td{text-align: center;

    }

</style>
<body>

新增用户
<hr/>
<form action="insertuser.do" method="post" onsubmit="return check()">
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="text-align: right">用户名（*）</td>
            <td>:</td>
            <td><input name="loginname" id="loginname"></td>
            <td><span id="span1" style="color: red"></span></td>
        </tr>
        <tr>
            <td> 真实姓名（*）</td>
            <td>:</td>
            <td><input name="username" id="username"> </td>
            <td><span id="span2"style="color: red"></span></td>
        </tr>
        <tr>
            <td>登陆密码（*）</td>
            <td>:</td>
            <td> <input type="password" name="password" id="password"> </td>
            <td><span id="span3"style="color: red"></span></td>
        </tr>
        <tr>
            <td>确认密码（*）</td>
            <td>:</td>
            <td><input type="password" name="cpassword" id="cpassword"> </td>
            <td><span id="span4"style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align: right">性别（*）</td>
            <td>:</td>
            <td><input type="radio" name="sex" value="1">男<input name="sex" type="radio" value="0">女<br/></td>
        </tr>

            <td >身份证</td>
            <td>:</td>
            <td><input type="text" name="id" value=""><br/></td>
        </tr>
        <tr>
            <td >电子邮件</td>
            <td>:</td>
            <td><input type="text" name="email" value=""><br/></td>
        </tr>
        <tr>
            <td >手机</td>
            <td>:</td>
            <td><input type="text" name="phone" value=""><br/></td>
        </tr>
        <tr>
            <td >地址(*)</td>
            <td>:</td>
            <td><input type="text" name="adress" value="" id="adress"> </td>
            <td><span id="span5"style="color: red"></span></td>
        </tr>
    </table>
    <input type="submit" value="新增">
</form>
<script>

    function checkloginname(){
        var loginnane=$("#loginname").val();
        if(loginnane==""){
            $("#span1").html("不能为空");
            return false;
        }
        else{
            return true;
        }
    }
    function checkusername() {
        var usernane = $("#username").val();
        if (usernane == "") {
            $("#span2").html("不能为空");
            return false;
        } else {
            return true;
        }
    }
    function checkpassword(){
        var pwd=$("#password").val();
        if(pwd==""){
            $("#span3").html("不能为空");
            return false;
        }
        else{
            return true;
        }
    }
    function checkcpassword(){
        var pwd=$("#password").val();
        var cpwd=$("#cpassword").val();
        if(cpwd==""){
            $("#span4").html("不能为空");
            return false;
        }
        else{
           if(cpwd!=pwd){
               $("#span4").html("两次输入的密码不一致");
               return false;
           }
           else {
               return true;
           }
        }
        }
        function checkadress() {
            var adress=$("#adress").val();
            if(adress==""){
                $("#span5").html("不能为空");
                return false;
            }
            else{
                return true;
            }
        }

        function check(){
        if(checkloginname()&&checkusername()&&checkpassword()&&checkcpassword()&&checkadress()){
            return true;
        }
        else {
            return false;
        }
        }
   $(function () {
       $("#loginname").blur(
           function () {
               $.get("checkuser1.do", "check=" + $("#loginname").val(), callback);

               function callback(data) {
                   $("#span1").html(data);

               }

           }
       );
   })
        /*
        $("#username").blur(
            function () {
                $.get("checkuser.do","check="+$("#username").val(),callback);
                function callback(data) {
                    $("#span2").html(data);

                }

            }
        );
        $("#password").blur(
            function () {
                $.get("checkuser.do","check="+$("#password").val(),callback);
                function callback(data) {
                    $("#span3").html(data);

                }

            }
        );
        $("#cpassword").blur(
            function () {
                var password=$("#password").val();
                var cpassword=$("#cpassword").val();
                if(password!=cpassword){
                    $("#span4").html("输入的两次密码不一致");

                }
                $.get("checkuser.do","check="+$("#cpassword").val(),callback);
                function callback(data) {
                    $("#span4").html(data);

                }

            }
        );
        $("#adress").blur(
            function () {
                $.get("checkuser.do","check="+$("#adress").val(),callback);
                function callback(data) {
                    $("#span5").html(data);

                }

            }
        );

    })*/

</script>
</body>
</html>
