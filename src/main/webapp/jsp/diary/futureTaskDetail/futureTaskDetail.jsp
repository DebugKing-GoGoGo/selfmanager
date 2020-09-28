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
		            ,currentPageDatasId: [] // 当前页的数据的id
		        	,defaultOrderByPlanDate: "plan_date asc" // 周任务中使用
		        	,defaultOrderByTaskName: "task_name asc"
		        };
	            var command = {};
                
                command.query = function(id) {
                    common.ajaxPost({
                        url: common.url.futureTaskDetail.query
                        ,data: "id=" + id
                        ,success: function(data) {
                             if (0 === data.code) {
                                var model = data.resultObject;
                                // $("#privilege").find('option[value="' + 
                                   // model.privilege + '"]').attr("selected", "selected");
                                $("#id").val(model.id);
                                $("#privilege").val(model.privilege);
                                $("#planDate").val(model.planDateStr);
                                $("#diaryDate").val(model.diaryDateStr);
                                $("#defaultTime").val(model.defaultTime);
                                $("#taskName").val(model.taskName);
                                $("#step").val(model.step);
                                form.render();
                            }
                        }
                    });
                };
                
                if ("function" === typeof pageScript) {
                    pageScript({
                        name: "futureTaskDetail"
                        ,command: command 
                        ,globals: globals
                    });
                }
                
                command.goAdd = function(futureId) {
                    common.layerOpen({
                        title: "添加" + common.url.futureTaskDetail.title
                        ,url: common.url.futureTaskDetail.goAdd + "?futureId=" + futureId
                    });
                };
                command.add = function(addData) {
                    common.ajaxPost({
	                     url: common.url.futureTaskDetail.add
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
                        title: "修改" + common.url.futureTaskDetail.title
                        ,url: common.url.futureTaskDetail.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
                    });
                };
                command.modify = function(modifyData) {
                    common.ajaxPost({
                        url: common.url.futureTaskDetail.modify
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
                        title: "查看" + common.url.futureTaskDetail.title
                        ,url: common.url.futureTaskDetail.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
                    });
                };
                
                command.goListForFutureTask = function(futureId) {
                	common.layerOpen({
                        title: common.url.futureTaskDetail.title + "列表"
                        ,url: common.url.futureTaskDetail.goListForFutureTask + "?futureId=" + futureId
                    });
                };
                command.goListForWeekTask = function(futureId, minPlanDate, maxPlanDate) {
                	common.layerOpen({
                        title: common.url.futureTaskDetail.title + "列表"
                        ,url: common.url.futureTaskDetail.goListForWeekTask + "?futureId=" + futureId 
                        	+ "&minPlanDate=" + minPlanDate 
                        	+ "&maxPlanDate=" + maxPlanDate
                    });
                };
                
                command.queryWithIds = function(currentId, idsArray, number) {
                    var index = idsArray.indexOf(currentId) + number;
                    if (-1 == index) {
                        layer.msg("当前记录已是本页第一条记录");
                        return currentId;
                    }
                    if (idsArray.length <= index) {
                        layer.msg("当前记录已是本页最后一条记录");
                        return currentId;
                    }
                    currentId = idsArray[index];
                    command.query(currentId);
                    return currentId;
                };
	        }));
	    </script>
	</body>
</html>