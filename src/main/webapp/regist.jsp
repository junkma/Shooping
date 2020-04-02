<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
      <link rel="stylesheet" href="static/css/admin.css" media="all">
      <link rel="stylesheet" href="static/css/login.css" media="all">
    <script type="text/javascript" src="static/js/jquery-1.11.0.min.js"></script>
      <script src="static/layui/layui.js"></script>

    <script type="text/javascript">
        layui.use('form', function(){
            var form = layui.form;
            layui.form.render();
            layui.form.render('radio');
            //监听提交
        });
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
         function checkRealname($txtObj){//账号必填，且长度在6到12之间
             var nickname=$txtObj.val();
             var len=$txtObj.val().length;
             if(len==0){
                 $txtObj.siblings("span").text("真实姓名必填");
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
	function checkRePwd($txtObj){
	    var pwd=document.getElementById("LAY-user-login-password").value;
	    var repwd=$txtObj.val();
	    if(pwd!=repwd){
	      $txtObj.siblings("span").text("确认密码不匹配");
	      return false;
	    }
	    $txtObj.val().siblings("span").text("");
	      return true;
	}

         function checkEmail($txtObj){
             var email=$txtObj.val();
             var len=$txtObj.val().length;
             var emailReg=/^\w+@\w+.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/;
             if(len==0){
                 $txtObj.siblings("span").text("电子邮箱必填");
                 return false;
             }
             if(!emailReg.test(email)){
                 $txtObj.siblings("span").text("邮箱格式不正确，邮箱账号@域名，如：good@tom.com,whj@sina.com.cn");
                 return false;
             }
             $txtObj.siblings("span").text("");
             return true;
         }
         function checkIdentity($txtObj){
             var identity=$txtObj.val();
             var idcardReg=/^\d{15}|\d{18}$/;
             if(!idcardReg.test(identity)){
                 $txtObj.siblings("span").text("身份证号格式不正确");
                 return false;
             }
             $txtObj.siblings("span").text("");
             return true;
         }
         function checkPhone($txtObj){
             var phone=$txtObj.val();
             if(phone.length!=11){
                 $txtObj.siblings("span").text("手机号格式不正确");
                 return false;
             }
             $txtObj.siblings("span").text("");
             return true;
         }
         function checkAddress($txtObj){
             var len=$txtObj.val().length;
             if(len==0){
                 $txtObj.siblings("span").text("地址必填");
                 return false;
             }

             $txtObj.siblings("span").text("");
             return true;
         }
	function check(){
		var flag= checkNo($("#LAY-user-login-username"))&&checkPwd($("#LAY-user-login-password")&&checkRePwd($("#LAY-user-login-repass"))&&checkNickname($("#LAY-user-login-realname"))&&checkEmail($("#LAY-user-login-email"))&&checkIdentity($("#LAY-user-login-identity"))&&checkPhone($("#LAY-user-login-phone"))&&checkAddress($("#LAY-user-login-address")));
		return flag;
	}
	
	
	$(function(){
		
		  $("#LAY-user-login-username").blur(function(){// 文本框失去鼠标焦点
		  	     
			    checkNo($(this));
		  });
        $("#LAY-user-login-realname").blur(function(){// 文本框失去鼠标焦点

            checkRealname($(this));
        });
			$("#LAY-user-login-password").blur(function(){//绑定密码文本框丢失焦点事件
			 checkPwd($(this));//判断对错
			});
		   $("#LAY-user-login-repass").blur(function(){//绑定密码文本框丢失焦点事件
			 checkRePwd($(this));//判断对错
			});
        $("#LAY-user-login-email").blur(function(){// 文本框失去鼠标焦点

            checkEmail($(this));
        });
        $("#LAY-user-login-identity").blur(function(){// 文本框失去鼠标焦点

            checkIdentity($(this));
        });
        $("#LAY-user-login-phone").blur(function(){// 文本框失去鼠标焦点

            checkPhone($(this));
        });
        $("#LAY-user-login-address").blur(function(){// 文本框失去鼠标焦点

            checkAddress($(this));
        });
		});
    </script>
</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" >
    <div class="layadmin-user-login-main">
        <form action="regist.do" id="LAY-user-login-form" class="layadmin-user-login-box layadmin-user-login-body layui-form" method="post" onsubmit="">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>易买网注册</h2>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone"></label>
                <input type="text" name="loginname" id="LAY-user-login-username" lay-verify="phone" placeholder="用户名" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="text" name="username" id="LAY-user-login-realname" lay-verify="pass" placeholder="真实姓名" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="code" id="LAY-user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img src="image.jsp" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode" onclick="changeImg()">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
                <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
                <span></span>
            </div>

            <div class="layui-form-item">
                    性别:
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="2" title="女" checked>
            </div>

            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="text" name="identitycode" id="LAY-user-login-identity" lay-verify="pass" placeholder="身份证" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="text" name="email" id="LAY-user-login-email" lay-verify="pass" placeholder="电子邮件" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="text" name="mobile" id="LAY-user-login-phone" lay-verify="pass" placeholder="手机" class="layui-input">
                <span></span>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="text" name="address" id="LAY-user-login-address" lay-verify="pass" placeholder="地址" class="layui-input">
                <span></span>
            </div>

            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" >注 册</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号注册</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="login.jsp" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
            </div>
        </div>
        </form>
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
</div>
</body>
</html>
