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
			                        <label class="layui-form-label">开始日期</label>
			                        <div class="layui-input-inline">
			                            <input placeholder="请选择开始日期" type="text" class="layui-input" 
			                                id="minDiaryDate" name="minDiaryDate">
			                        </div>
			                    </div>
			                    
		                        <div class="layui-inline">
		                            <label class="layui-form-label">结束日期</label>
		                            <div class="layui-input-inline">
		                                <input placeholder="请选择结束日期" type="text" class="layui-input" 
		                                    id="maxDiaryDate" name="maxDiaryDate">
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
            function pageScript(params) {
            	var command = params.command;
                var globals = params.globals;
                
				var dataTable = table.render({
					elem: "#dataTable"
                    ,height: "full-160"
                    ,url: common.url.diary.list
                    ,page: true
				    ,cols: [[
				        {field: "id", title: "ID", width: 80, unresize: true}
				        ,{field: "diaryDateStr", title: "日期", width: 120, sort: true}
				        ,{field: "dayOffWeek", title: "星期", width: 80}
				        ,{field: "place", title: "地点", width: 80}
				        ,{field: "weather", title: "天气", width: 100} 
				        ,{field: "mood", title: "心情", width: 177}
				        ,{field: "content", title: "内容", width: 342}
				        ,{fixed: "right", title: "操作", width: 150, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    }
				});
                laydate.render({
                    elem: "#minDiaryDate" 
                    ,value: new Date()
                });
                laydate.render({
                    elem: "#maxDiaryDate" 
                    ,value: new Date()
                });
                
                form.on("submit(search)", function(data){
                	dataTable.reload({
                        where: {
                            minDiaryDate: data.field.minDiaryDate
                            ,maxDiaryDate: data.field.maxDiaryDate
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
                    } 
                    return;
                });
            };
        </script>
        <jsp:include page="diary.jsp"></jsp:include>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script>
    </body>   
</html>