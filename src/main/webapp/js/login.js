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
		        alert("记住密码登录。");    
		        window.location = basepath+"/findUser";    
		    }else{    
		        alert("不记密码登录。");    
		        window.location = basepath+"/findUser";    
		    }    
}

function onMouseOver() {
	document.getElementById("btn_submit").style.background = "red";
}
function onMouseOut() {
	document.getElementById("btn_submit").style.background = "#BEBEBE";
}
/*
 * 设置cookie
 */

function setCookie() { // 设置cookie    
	var account = $("#account").val(); // 获取用户名信息    
	var password = $("#password").val(); // 获取登陆密码信息    
	var checked = $("[name='checkbox']:checked");// 获取“是否记住密码”复选框  

	if (checked) { // 判断是否选中了“记住密码”复选框    
		$.cookie("account", account);// 调用jquery.cookie.js中的方法设置cookie中的用户名    
		$.cookie("password", $.base64.encode(password));// 调用jquery.cookie.js中的方法设置cookie中的登陆密码，并使用base64（jquery.base64.js）进行加密    
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