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
                
                    <input type="hidden" value="${id}" name="id">
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">做任务时间</label>
                        <div class="layui-input-block">
                            <input type="text" disabled class="layui-input layui-bg-gray" id="doDate"   
                                placeholder="yyyy-MM-dd HH:mm:ss">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">任务名称</label>
                        <div class="layui-input-block">
                            <input type="text" disabled id="taskName"  required  lay-verify="required" 
                                placeholder="请输入任务名称" autocomplete="off" class="layui-input layui-bg-gray">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">任务用时（分）</label>
                        <div class="layui-input-block">
                            <input rows="10" type="text" disabled id="defaultTime" required  
                                lay-verify="required|number" placeholder="请输入任务用时" 
                                autocomplete="off" class="layui-input layui-bg-gray">
                        </div>
                    </div>  
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">步骤</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="step" disabled placeholder="请输入步骤" 
                                class="layui-textarea layui-bg-gray"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="remark" disabled name="remark" placeholder="请输入步骤" 
                                class="layui-textarea layui-bg-gray"></textarea>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div> 
        <jsp:include page="../../layout/js.jsp"></jsp:include>
        <script>
	        function pageScript(params) {
                command = params.command;
                globals = params.globals;
                
	            command.query("${id}");
	        };
        </script>
        <jsp:include page="taskPlan.jsp"></jsp:include>
    </body>   
</html>