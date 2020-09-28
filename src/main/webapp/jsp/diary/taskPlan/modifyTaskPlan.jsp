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
                            <input type="text" class="layui-input" id="doDate" name="doDateStr"  
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
                        <label class="layui-form-label">用时</label>
                        <div class="layui-input-block">
                            <input type="text" disabled id="defaultTime" required  lay-verify="required|number" 
                                placeholder="请输入任务用时" autocomplete="off" class="layui-input layui-bg-gray">
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
                            <textarea rows="10" id="remark" name="remark" placeholder="请输入备注" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn" lay-submit lay-filter="modify">更新</button>
                            <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
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
            	
                laydate.render({
                    elem: "#doDate"
                    ,type: "datetime"
                });
                
            	command.query("${id}");
                form.on("submit(modify)", function(data) {
                    command.modify(data.field);
                    return false;
                });
            };
        </script>
        <jsp:include page="taskPlan.jsp"></jsp:include>
    </body>   
</html>