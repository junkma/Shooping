<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>前台登录</title>
      <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


      <link rel="stylesheet" href="static/css/admin.css" media="all">
      <link rel="stylesheet" href="static/css/login.css" media="all">
      <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
      <link rel="stylesheet" href="static/layui/css/layui.css" media="all">

     <script type="text/javascript">
          function changeImg(){
             var imgobj=document.getElementById("LAY-user-get-vercode");
             imgobj.src="image.jsp?ran="+Math.random();
          }
  function checkNo($txtObj){//账号必填，且长度在6到12之间
	 var len=$txtObj.val().length;
	 if(len==0){
	   $txtObj.siblings("span").text("账号必填");
	   return false;
	 }
	 if(len<3||len>12){
		 $txtObj.siblings("span").text("账号的长度在3到12位之间");
		 return false;
	 }
	 $txtObj.siblings("span").text("");
		return true;
	}
	function checkPwd($txtObj){
		var len=$txtObj.val().length;
		if(len==0){
	   $txtObj.siblings("span").text("密码必填");
	   return false;
	 }
	 if(len<3||len>12){
		 $txtObj.siblings("span").text("密码的长度在3到12位之间");
		 return false;
	 }
	 $txtObj.siblings("span").text("");
		return true;
	}
	function check(){
		var flag= checkNo($("#LAY-user-login-username"))&&checkPwd($("#LAY-user-login-password"));
		return flag;
	}
	
	
	$(function(){
		
		  $("#LAY-user-login-username").blur(function(){// 文本框失去鼠标焦点
		  	     
			    checkNo($(this));
		  });
		  
			$("#LAY-user-login-password").blur(function(){//绑定密码文本框丢失焦点事件
			 checkPwd($(this));//判断对错
			});
		 
		});
  </script>
  </head>

  <body>
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>易买网前台登录</h2>
        </div>
        <form action="LoginCheck.do" id="LAY-user-login-form" class="layadmin-user-login-box layadmin-user-login-body layui-form" method="post" onsubmit="return check()">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="loginname" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
                <span></span>
                <br>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
                <span></span>
                <br>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="code" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img src="image.jsp" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode" onclick="changeImg()">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <a href="forget.jsp" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" id="LAY-user-login-submit">登录</button>
            </div>
            <div style="text-align:center">${msg==null?"":msg }</div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号登入</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="regist.jsp" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
            </div>
        </form>
    </div>

    <div class="layui-trans layadmin-user-login-footer">
        <p> © 讯腾科技 版权所有</p>
        <p>
            <span><a href="#" target="_blank">关于讯腾</a></span>
            <span><a href="#" target="_blank">热门培训</a></span>
            <span><a href="#" target="_blank">联系我们 </a></span>
            <span><a href="#" target="_blank">在线报名</a></span>
        </p>
    </div>


</div>
  </body>
</html>
