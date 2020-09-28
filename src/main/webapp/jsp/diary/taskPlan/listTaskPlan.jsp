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
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <jsp:include page="../../layout/top.jsp"></jsp:include>
            <jsp:include page="../../layout/left.jsp"></jsp:include>
            <div class="layui-body" id="layuiBody">
                <div class="layui-container">
                    <br><br>
                    
		            <div class="layui-row">
		                <form class="layui-form layui-form-pane" action="">
		                    <div class="layui-form-item pane">
							    <div class="layui-form-item" style="position: fixed; right: 0px; z-index: 8888;">
				                    <div class="site-demo-laydate">
									    <div class="layui-inline" id="doTime"></div>
									</div>
									<br/>
							    </div>
							    <div class="layui-form-item" style="position: fixed; right: 0px; top: 400px; z-index: 8888;">
                                    <div class="layui-inline">
                                        <div class="layui-input-block">
                                            <button class="layui-btn layui-btn-normal" lay-submit 
                                                lay-filter="goAddTaskAndTaskPlan">安排新任务</button>
                                            <button class="layui-btn layui-btn-normal" lay-submit 
                                                lay-filter="goAdd">安排已有任务</button>
                                        </div>
                                    </div>
                                </div>
							    
								<div class="layui-form-item layui-col-md9">
                                    <div id="futureTaskDetailTable" lay-filter="futureTaskDetailTable"></div>
                                    <div id="dataTable" lay-filter="dataTable"></div> 
                                </div>
                                
		                    </div>
		                </form>
		            </div>
		        </div> 
            </div>
            <jsp:include page="../../layout/js.jsp"></jsp:include>
            <jsp:include page="../../layout/bottom.jsp"></jsp:include>
        </div>
        <script>
            var futureTaskDetailCommand;
            var futureTaskDetailGlobals;
	        function pageScript(params) {
	        	var command;
	            var globals;
	            if ("taskPlan" == params.name) {
	                command = params.command;
	                globals = params.globals;
	            }  else if("futureTaskDetail" == params.name){
                    futureTaskDetailCommand = params.command;
                    futureTaskDetailGlobals = params.globals;
                    return;
                } else {
	                return;
	            }
	            
				var dataTable = table.render({
					elem: "#dataTable"
	                ,height: "full-340"
				    ,url: common.url.taskPlan.list 
				    ,page: false 
				    ,cols: [[
				        {field: "id", title: "ID", width: 60, unresize: true}
				        ,{field: "doDateStr", title: "时间", width: 160}
				        ,{field: "taskVoTaskName", title: "任务名称", width: 120}
				        ,{field: "taskVoPrivilege", title: "优先级", width: 72}
				        ,{field: "taskVoDefaultTime", title: "用时", width: 60}
				        ,{field: "remark", title: "备注", width: 64}
				        ,{fixed: "right", title: "是否完成", width: 100, templet: "#doneTpl", unresize: true}
				        ,{fixed: "right", title: "状态", width: 90, templet: "#discardTpl", unresize: true}
				        ,{fixed: "right", title: "操作", width: 117, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    }
				});
				
				form.on("submit(goAdd)", function(data) {
                    command.goAdd();
                    return false;
                });
				
				form.on("submit(goAddTaskAndTaskPlan)", function(data) {
                    command.goAddTaskAndTaskPlan();
                    return false;
                });
				
                form.on("checkbox(done)", function(obj){
                    // 因为每次点击到后台更新数据不会更新数据模型中的done的值，
                    // 所以每次this.value都是模型中相同的值。
                    // 所以使用一个全局变量listTaskPlanGlobal来保存。。
                    var id = $(this).attr("dataId");
                    var key = "done" + id;
                    if (undefined == globals.done[key]) {
                    	globals.done[key] = this.value;
                    } 
                    var done = 1 ==  globals.done[key] ? 0 : 1;
                    globals.done[key] = done;
                    
                    command.modify({
                        id: id
                        ,done: done
                    });
                });
				
				form.on("switch(discard)", function(obj){
                    var id = $(this).attr("dataId");
                    var key = "discard" + id;
                    if (undefined == globals.discard[key]) {
                    	globals.discard[key] = this.value;
                    }
                    var discard = 1 ==  globals.discard[key] ? 0 : 1;
                    globals.discard[key] = discard;
                    
                    command.modify({
                        id: id
                        ,discard: discard
                    });
				});
                
				table.on("tool(dataTable)", function(obj) { 
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; // 获得当前行 tr 的DOM对象
                    switch(layEvent) {
                        case "goModify" : 
                            command.goModify(data.id);
                            break;
                        case "goView" : 
                            command.goView(data.id);
                            break;
                    } 
                    return;
                });
				
				var futureTaskDetailTable;
                var interval = setInterval(function() {
                    if (futureTaskDetailGlobals) {
                        futureTaskDetailTable = table.render({
                            elem: "#futureTaskDetailTable"
                            ,height: "200"
                            ,url: common.url.futureTaskDetail.list + "?paging=false&today=true"
                            ,page: false
                            ,cols: [[
                                {field: "id", title: "ID", width: 70, unresize: true}
                                ,{field: "planDateStr", title: "安排日期", width: 110}
                                ,{field: "taskName", title: "任务名称", width: 180}
                                ,{field: "step", title: "任务内容", width: 121}
                                ,{field: "privilege", title: "优先级", width: 72}
                                ,{field: "defaultTime", title: "用时", width: 72}
                                ,{fixed: "right", title: "是否完成", width: 100, align: "center", toolbar: "#futureTaskDetailDoneTpl", unresize: true}
                                ,{fixed: "right", title: "操作", width: 120, align: "center", toolbar: "#futureTaskDetailMenuTpl", unresize: true}
                            ]]
                            ,where: {
                                orderBy: futureTaskDetailGlobals.defaultOrderByPlanDate
                            }
                        });
                        clearInterval(interval);
                    }
                }, 50);
                
                // 每次选择日期后
                laydate.render({
                    elem: "#doTime"
                    ,position: "static"
                    ,done: function(value, date, endDate){
                        dataTable.reload({
                            where: { 
                                orderBy: globals.defaultOrderBy
                                ,doDate: value
                            }
                        });
                        futureTaskDetailTable.reload({
                        	where: {
                        		planDate: value
                        		,today: "false"
                                ,orderBy: futureTaskDetailGlobals.defaultOrderByPlanDate
                            }
                        });
                    }
                });
                
                form.on("checkbox(doneFutureTaskDetail)", function(obj){
                    // 因为每次点击到后台更新数据不会更新数据模型中的done的值，
                    // 导致每次this.value都是模型中相同的值。
                    // 所以使用一个全局变量来保存
                    var id = $(this).attr("dataId");
                    var key = "done" + id;
                    if (undefined == futureTaskDetailGlobals.done[key]) {
                        futureTaskDetailGlobals.done[key] = this.value;
                    } 
                    var done = 1 ==  futureTaskDetailGlobals.done[key] ? 0 : 1;
                    futureTaskDetailGlobals.done[key] = done;
                    
                    futureTaskDetailCommand.modify({
                        id: id
                        ,done: done
                    });
                });
                table.on("tool(futureTaskDetailTable)", function(obj) { 
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; // 获得当前行 tr 的DOM对象
                    switch(layEvent) {
                        case "goModifyFutureTaskDetail" : 
                            futureTaskDetailCommand.goModify(data.id);
                            break;
                        case "goViewFutureTaskDetail" : 
                            futureTaskDetailCommand.goView(data.id);
                            break;
                    } 
                    return;
                });
                
            };
        </script>
        <jsp:include page="../futureTaskDetail/futureTaskDetail.jsp"></jsp:include>
        <jsp:include page="taskPlan.jsp"></jsp:include>
        <script type="text/html" id="doneTpl">
            <input dataId={{ d.id }} type="checkbox" name="done" value="{{ d.done }}" title="完成" 
                lay-filter="done" {{ d.done == 1 ? "checked" : "" }}>
        </script>
	    <script type="text/html" id="discardTpl">
            <input dataId={{ d.id }} type="checkbox" name="discard" value="{{ d.discard }}" 
                lay-skin="switch" lay-text="正常|丢弃" lay-filter="discard" {{ d.discard == 0 ? "checked" : "" }}>
        </script>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script>
        <script type="text/html" id="futureTaskDetailDoneTpl">
            <input dataId={{ d.id }} type="checkbox" name="done" value="{{ d.done }}" title="完成" 
                lay-filter="doneFutureTaskDetail" {{ d.done == 1 ? "checked" : "" }}>
        </script>
        <script type="text/html" id="futureTaskDetailMenuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModifyFutureTaskDetail">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goViewFutureTaskDetail">查看</a>
        </script>
    </body>   
</html>