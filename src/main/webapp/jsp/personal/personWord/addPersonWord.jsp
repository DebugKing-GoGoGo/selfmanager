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
        <div class="layui-layout">
            <div class="layui-container">
                <br><br>
	            <div class="layui-row">
	                <form class="layui-form layui-form-pane" action="">
	                    
	                    <input type="hidden" name="personId" value="${personId }"/>
	                    
	                    <div class="layui-form-item pane">
	                        <label class="layui-form-label">日期</label>
	                        <div class="layui-input-inline">
	                            <input id="writeDate" name="writeDate" placeholder="请选择日期" required  
	                                 autocomplete="off" lay-verify="required" type="text" class="layui-input">
	                        </div>
	                    </div>
	                    
	                    <div class="layui-form-item layui-form-text pane">
	                        <label class="layui-form-label">内容</label>
	                        <div class="layui-input-block">
	                            <textarea rows="10" id="word" name="word" placeholder="请输入内容" 
	                               class="layui-textarea"></textarea>
	                        </div>
	                    </div>
	                    
	                    <div class="layui-form-item">
	                        <div class="layui-input-block">
	                            <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
	                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	                        </div>
	                    </div>
	                    
	                </form>
	            </div>
            </div>
        </div>
        <jsp:include page="../../layout/js.jsp"></jsp:include>
        <script>
            function pageScript(params) {
                var command = params.command;
                var globals = params.globals;
                
                laydate.render({
                    elem: "#writeDate" 
                    ,value: new Date()
                });
                
                form.on("submit(add)", function(data) {
                    command.add(data.field);
                    return false;
                });
            };
        </script>
        <jsp:include page="personWord.jsp"></jsp:include>
    </body>   
</html>