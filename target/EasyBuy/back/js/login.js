// JavaScript Document
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
		var flag= checkNo($("#account"))&&checkPwd($("#password"));
		return flag;
	}
	
	
	$(function(){
		
		  $("#account").blur(function(){// 文本框失去鼠标焦点
		  	     
			    checkNo($(this));
		  });
		  
			$("#password").blur(function(){//绑定密码文本框丢失焦点事件
			 checkPwd($(this));//判断对错
			});
		 
		});