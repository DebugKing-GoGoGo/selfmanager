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
        <jsp:include page="../../layout/css.jsp"></jsp:include>
    </head>
    <body class="layui-layout-body" id="layuiLayoutBody">
        <div class="layui-container">
            <br><br>
            <div class="layui-row">
                <form class="layui-form layui-form-pane" action="">
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" id="name" name="name" required  lay-verify="required" 
                                placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item" pane="">
					    <label class="layui-form-label">性别</label>
					    <div class="layui-input-block">
					        <input type="radio" name="sex" value="1" title="男" checked="">
					        <input type="radio" name="sex" value="0" title="女">
					    </div>
					</div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <input type="text" id="type" name="type" required  lay-verify="required" 
                                placeholder="请输入类型" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">来自哪里</label>
                        <div class="layui-input-block">
                            <input type="text" id="home" name="home" required  lay-verify="required" 
                                placeholder="请输入来自哪里" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn" lay-submit lay-filter="add">添加</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div> 
        <jsp:include page="../../layout/js.jsp"></jsp:include>
        <script>
            function pageScript(params) {
                var command = params.command;
                var globals = params.globals;
                
                form.on("submit(add)", function(data) {
                    command.add(data.field);
                    return false;
                });
            };
        </script>
        <jsp:include page="person.jsp"></jsp:include>
    </body>   
</html>