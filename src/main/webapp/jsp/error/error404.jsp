<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>找不到页面了</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/error/404/css/style.css">
        </head>
    <body>
	    <div class="wrap">
	        <div class="banner">
	            <img src="${pageContext.request.contextPath}/resources/error/404/images/banner.png" alt="" />
	        </div>
	        <div class="page">
	            <h2>页面不见了!</h2>
	        </div>
	        <div class="footer">
	            <p>Design by <a href="http://w3layouts.com">w3layouts</a></p>
	        </div>
	    </div>
    </body>
</html>
