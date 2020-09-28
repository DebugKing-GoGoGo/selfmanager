<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
    </head>
    <body>
        <div class="layui-header" id="layuiHeader">
            <div class="layui-logo">个人管理网站v1.1</div>
            <ul class="layui-nav layui-layout-left"></ul>
        </div>
    </body>   
</html>