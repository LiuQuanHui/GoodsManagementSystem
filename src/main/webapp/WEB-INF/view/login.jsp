<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="https://cdn.bootcss.com/Base64/1.0.2/base64.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/login.css">
</head>
<body onload="getCookie();">
<script>
function setCookie() { // 设置cookie    
	var account = $("#account").val(); // 获取用户名信息    
	var password = $("#password").val(); // 获取登陆密码信息    
	var checked = $("[name='checkbox']:checked");// 获取“是否记住密码”复选框  

	if (checked) { // 判断是否选中了“记住密码”复选框    
		$.cookie("account", account);// 调用jquery.cookie.js中的方法设置cookie中的用户名    
		$.cookie("password",$.base64.encode(password));// 调用jquery.cookie.js中的方法设置cookie中的登陆密码，并使用base64（jquery.base64.js）进行加密    
	} else {
		$.cookie("password", null);
	}
}
function getCookie() { // 获取cookie    
	var account = $.cookie("account"); // 获取cookie中的用户名    
	var password = $.cookie("password"); // 获取cookie中的登陆密码    
	if (password) {// 密码存在的话把“记住用户名和密码”复选框勾选住    
		$("[name='checkbox']").attr("checked", "true");
	}
	if (account) {// 用户名存在的话把用户名填充到用户名文本框    
		$("#account").val(account);
	}
	if (password) {// 密码存在的话把密码填充到密码文本框    
		$("#password").val($.base64.decode(password));
	}
	
}
function checkSubmit() {
	var basicaddon1_txt = document.getElementById("account").value;
	var basicaddon2_txt = document.getElementById("password").value;
	var accountInform_txt = document.getElementById("accountWarn");
	var passwordInform_txt = document.getElementById("passwordWarn");
	if (basicaddon1_txt == null || basicaddon1_txt == "") {
		accountInform_txt.innerHTML = "*账号不能为空";
		return false;
	} else {
		accountInform_txt.innerHTML = "";
	}
	if (basicaddon2_txt == null || basicaddon2_txt == "") {
		passwordInform_txt.innerHTML = "*密码不能为空";
		return false;
	} else {
		passwordInform_txt.innerHTML = "";
	}
	if (basicaddon2_txt.length < 6 || basicaddon2_txt.length > 18) {
		passwordInform_txt.innerHTML = "*密码为6-18位";
		return false;
	} else {
		passwordInform_txt.innerHTML = "";
	}
	if($("[name='checkbox']").attr("checked","true")){    
		        //添加cookie    
		        setCookie();    
		     
		        window.location = basepath+"/findUser";    
		    }else{    
		       
		        window.location = basepath+"/findUser";    
		    }    
}
</script>

	<div id="main">
		
		<div id="loginBody">
			<div>
				<form action="${basePath}/findUser" id="loginForm" method="post" onsubmit="return checkSubmit()">
					<div><h1>库存管理系统</h1></div>
					<div id="formbody">
					<span class="glyphicon glyphicon-user"></span>
					<input type="text" name="telephone" id="account" placeholder="请输入登录手机号"/><span id="accountWarn"></span><br/>
					
					<span class="glyphicon glyphicon-lock"></span>
					<input type="text" name="password" id="password" placeholder="请输入登录密码"><span id="passwordWarn"></span><br/>
					<input type="checkbox" name="checkbox" id="checkbox">记住账号密码<br/>
					<input type="submit" value="登录" id="btn_submit" onmouseover="onMouseOver()" onmouseout="onMouseOut()">
					<label>温馨提示:账号密码由管理员进行注册分配，可由本人修改</label>
					<div class="warning" style="color:red;">${msg}</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>

</html>