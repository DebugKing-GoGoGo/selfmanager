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
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 菜单项于bottom.jsp中加载  -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="leftMenu" id="leftMenu">
                </ul>
            </div>
        </div>
    </body>   
</html>