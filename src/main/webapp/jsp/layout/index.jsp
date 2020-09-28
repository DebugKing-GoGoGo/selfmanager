<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>后台管理</title>
        <jsp:include page="css.jsp"></jsp:include>        
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <!-- 顶端导航 -->
            <jsp:include page="top.jsp"></jsp:include>
            <!-- 左端导航 -->
            <jsp:include page="left.jsp"></jsp:include>

            <!-- 内容主体区域 -->
            <div class="layui-body">
                <div style="padding: 15px;">欢迎进入个人管理系统</div>
            </div>

            <jsp:include page="js.jsp"></jsp:include>
            <!-- 底部固定区域 -->
            <jsp:include page="bottom.jsp"></jsp:include>
        </div>
        <script>
            layui.use('element', function() {
                var element = layui.element;
            });
        </script>
    </body>   
</html>