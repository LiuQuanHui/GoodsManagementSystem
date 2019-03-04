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
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/bootstrap-theme.css">

</head>
<body>
	${result}
</body>
</html>