<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <base href="<%=basePath%>">
	</head>
	<body>
	    <script type="text/javascript">
			(function(factory) {
				layui.use(["element", "table", "layer", "form", "laydate"], function() {
				    window.layer = layui.layer
				    ,window.form = layui.form
				    ,window.laydate = layui.laydate
				    ,window.element = layui.element
				    ,window.table = layui.table;
				    factory(pageScript);
				});
			}(function(pageScript) {
			    var globals = {
			   	    done: []
			        ,discard: []
			        ,defaultOrderBy: "do_date asc"
			    };
			    var command = {};
			    
			    command.query = function(id) {
			        common.ajaxPost({
			            url: common.url.taskPlan.query
			            ,data: "id=" + id
			            ,success: function(data) {
			                 if (0 === data.code) {
			                    var model = data.resultObject;
			                    $("#doDate").val(model.doDateStr);
			                    $("#taskName").val(model.taskVoTaskName);
			                    $("#defaultTime").val(model.taskVoDefaultTime);
			                    $("#step").val(model.taskVoStep);
			                    $("#remark").val(model.remark);
			                }
			            }
			        });
			    };
			    
			    // 该判断之前，是页面马上会调用的函数query
			    // 调用页面的script
			    // 该判断之后，才是页面由于操作才会调用的函数，故而放在后面。
			    if ("function" === typeof pageScript) {
			        pageScript({
			            name: "taskPlan"
			            ,command: command 
			            ,globals: globals
			        });
			    }
			    
			    command.goAdd = function() {
			        common.layerOpen({
			            title: "添加" + common.url.taskPlan.title
			            ,url: common.url.taskPlan.goAdd
			        });
			    };
			    command.add = function(addData) {
			        common.ajaxPost({
			            url: common.url.taskPlan.add
			            ,data: addData
			            ,success: function(data) {
			                if (0 === data.code) {
			                    layer.msg(data.message);
			                }
			            }
			        });
			    };
			    
			    command.goModify = function(id) {
			        common.layerOpen({
			            title: "修改" + common.url.taskPlan.title
			            ,url: common.url.taskPlan.goModify + "?id=" + id
			        });
			    };
			    command.modify = function(modifyData) {
			        common.ajaxPost({
			            url: common.url.taskPlan.modify
			            ,data: modifyData
			            ,success: function(data) {
			                if (0 === data.code) {
			                    layer.msg(data.message);
			                }
			            }
			        });
			    };
			    
			    command.goView = function(id) {
			        common.layerOpen({
			            title: "查看" + common.url.taskPlan.title
			            ,url: common.url.taskPlan.goView + "?id=" + id
			        });
			    };
			    
			    command.goAddTaskAndTaskPlan = function() {
			        common.layerOpen({
			            title: "添加" +  common.url.taskPlan.taskAndTaskPlanTitle
			            ,url: common.url.taskPlan.goAddTaskAndTaskPlan
			        });
			    };
			    command.addTaskAndTaskPlan = function(addData) {
			        common.ajaxPost({
			            url: common.url.taskPlan.addTaskAndTaskPlan
			            ,data: addData
			            ,success: function(data) {
			                if (0 === data.code) {
			                    layer.msg(data.message);
			                }
			            }
			        });
			    };
			}));
	    </script>
	</body>
</html>