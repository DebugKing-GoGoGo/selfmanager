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
        <div class="layui-layout layui-layout-admin">
           <div class="layui-container">
           <br><br>
	            <div class="layui-row">
	                <form class="layui-form layui-form-pane" action="">
	                    
	                    <input type="hidden" value="0" name="done">
	                    
                           <input type="hidden" value="0" name="discard">
                           
	                    <div class="layui-form-item pane">
		                    <div class="layui-inline">
						        <label class="layui-form-label">日期范围</label>
						        <div class="layui-input-inline">
						            <input type="text" required  lay-verify="required" class="layui-input" 
						                autocomplete="off" id="dateRange" name="dateRange" placeholder=" - ">
						        </div>
						    </div>
						    
						    <div class="layui-inline">
	                        <label class="layui-form-label">时间</label>
	                        <div class="layui-input-inline">
	                            <input placeholder="请选择做任务时间安排" required lay-verify="required" 
	                                 autocomplete="off" type="text" class="layui-input" id="doTime" name="doTime">
	                        </div>
	                        </div>
	                    </div>
	                    
	                    <div class="layui-form-item" pane>
	                        <div class="layui-inline" id="multiCheckboxLine">
	                            <label class="layui-form-label">任务</label>
	                            <div class="layui-input-inline" id="multiCheckbox">
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="layui-form-item layui-form-text pane">
	                        <label class="layui-form-label">备注</label>
	                        <div class="layui-input-block">
	                            <textarea rows="10" name="remark" placeholder="请输入备注" class="layui-textarea"></textarea>
	                        </div>
	                    </div>
	                    
	                    <div class="layui-form-item">
	                        <div class="layui-input-block">
	                            <button class="layui-btn" id="submitForm" lay-submit lay-filter="add">立即提交</button>
	                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	                        </div>
	                    </div>
	                    
	                </form>
	            </div>
	        </div> 
            <jsp:include page="../../layout/js.jsp"></jsp:include>
        </div>
        <script>
            var taskCommand;
            var taskGlobals;
            function pageScript(params) {
                var command;
                var globals;
                
                if ("taskPlan" == params.name) {
                    command = params.command;
                    globals = params.globals;
                } else if("task" == params.name){
                	taskCommand = params.command;
                	taskGlobals = params.globals;
                    return;
                } else {
                    return;
                }
                
                // 日期部分，如2018-05-01
                laydate.render({
                    elem: "#dateRange"
                    ,range: true
                });
                // 时间部分，如16:02:02
                laydate.render({
                    elem: "#doTime"
                    ,type: "time"
                    ,format: "HH:mm:ss"
                });
                
                form.on("submit(add)", function(data) {
                    command.add(data.field);
                    return false;
                });
                
                var interval = setInterval(function() {
                    if (taskCommand) {
                    	common.ajaxPost({
                            url: common.url.task.list 
                            ,data: "discard=0&orderBy=privilege desc"
                            ,success: function(data) {
                                if (0 === data.code) {
                                    var tasks = data.data; 
                                    var tasksNumber = tasks.length;
                                    if (0 === tasksNumber) {
                                        layer.alert("不存在可安排的任务，请先添加任务!");
                                        $("#submitForm").addClass("layui-btn-disabled");
                                        return;
                                    }
                                    $("#multiCheckbox").append('<input type="radio" name="taskId" value="' + 
                                    	tasks[0].id + 
                                    	'" title="' + tasks[0].taskName + 
                                    	'" checked>');
                                    for (var i = 1; i < tasksNumber; i++) {
                                        var task = tasks[i];
                                        $("#multiCheckbox").append('<input type="radio" name="taskId" value="' + 
                                        	task.id + 
                                        	'" title="' + task.taskName + '">');
                                    }
                                    form.render("radio");
                                }
                            }
                        });
                        clearInterval(interval);
                    }
                }, 50);
            };
        </script>
        <jsp:include page="../task/task.jsp"></jsp:include>
        <jsp:include page="taskPlan.jsp"></jsp:include>
    </body>   
</html>