<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-cn">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-华城农贸</title>
<link rel="stylesheet" type="text/css" href="front/css/public.css" />
<link rel="stylesheet" type="text/css" href="front/css/page.css" />
<script type="text/javascript" src="front/js/public.js"></script>
	<script>
		function changeImg(){
			var imgObj=document.getElementById("img");
			imgObj.src="CheckCodeServlet?ran="+Math.random();

		}

	</script>
</head>
<body>

  <form action="LoginServlet" method="post">	<!-- 登录页面头部 -->
	<div class="logHead">
		<img src="img/logLOGO.png" />
	</div>
	<!-- 登录页面头部结束 -->

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="front/img/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
				<p class="p2">华城人员登录</p>
			</div>
			<!-- 输入框 -->
			<div class="lgD">
				<img class="img1" src="front/img/logName.png" /><input type="text"
					placeholder="输入用户名"  name="account"/>
			</div>
			<div class="lgD">
				<img class="img1" src="front/img/logPwd.png" /><input type="password"
					placeholder="输入用户密码" name="password" />
			</div>
			<div class="lgD logD2">
				<input class="getYZM" type="text" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码"/>
				<div class="logYZM">
					<img  src="image.jsp" id="img" alt="" width="100" height="32"  style="height:43px;cursor:pointer;" onclick="changeImg()"/>
				</div>
			</div>
			<div class="logC">
				<button>登 录</button>
			</div>
			<span style="color: red;">${msg}</span>
		</div>
	</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">版权所有：南京设易网络科技有限公司</p>
		<p class="p2">南京设易网络科技有限公司 登记序号：苏ICP备11003578号-2</p>
	</div>
	<!-- 登录页面底部end -->
  </form>
</body>
</html>