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
		                    
		                        <div class="layui-inline">
                                    <label class="layui-form-label">任务关键字</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="taskName" id="taskName" placeholder="请输入任务关键字" 
                                            autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <label class="layui-form-label">状态</label>
                                    <div class="layui-input-block">
                                        <select name="state" id="state" lay-verify="required">
                                            <option value="-1">全部</option>
                                            <option value="0">未开始</option>
                                            <option value="1">进行中</option>
                                            <option value="2">完成</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="search">查询</button>
                                        <button class="layui-btn" lay-submit lay-filter="refresh">刷新</button>
                                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="goAdd">添加</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
		                        
		                    </div>
		                </form>
		            </div>
		            
		            <div class="layui-row">
		                <div id="dataTable" lay-filter="dataTable"></div>
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
                if ("futureTask" == params.name) {
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
	                ,height: "full-150"
				    ,url: common.url.futureTask.list
				    ,page: true
				    ,cols: [[
				        {field: "id", title: "ID", width: 70, unresize: true}
				        ,{field: "taskName", title: "任务内容", width: 454}
				        ,{field: "stateStr", title: "状态", width: 75}
				        ,{field: "beginDateStr", title: "开始日期", width: 135}
				        ,{field: "endDateStr", title: "结束日期", width: 150}
				        ,{fixed: "right", title: "操作", width: 246, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    }
				});
				
                form.on("submit(search)", function(data){
                	dataTable.reload({
                        where: {
                        	taskName: data.field.taskName
                        	,state: data.field.state
                        	,orderBy: globals.defaultOrderBy
                        }
                    });
                    return false;
                });
                form.on("submit(refresh)", function(data){
                    dataTable.reload({});
                    return false;
                });
                form.on("submit(goAdd)", function(data){
                    command.goAdd();
                    return false;
                });
                table.on("tool(dataTable)", function(obj) { 
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; // 获得当前行 tr 的DOM对象
                    
                    globals.currentPageDatasId = [];
                    $('td[data-field="id"]').each(function(index, elem) {
                        globals.currentPageDatasId.push($(elem).text());
                    });
                    
                    switch(layEvent) {
                        case "goModify" : 
                            command.goModify(data.id);
                            break;
                        case "goView" : 
                            command.goView(data.id);
                            break;
                        case "goListFutureTaskDetail" : 
                            futureTaskDetailCommand.goListForFutureTask(data.id);
                            break;
                    } 
                    return;
                });
            };
        </script>
        <jsp:include page="../futureTaskDetail/futureTaskDetail.jsp"></jsp:include>
        <jsp:include page="futureTask.jsp"></jsp:include>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="goListFutureTaskDetail">任务明细列表</a>
        </script>
    </body>   
</html>