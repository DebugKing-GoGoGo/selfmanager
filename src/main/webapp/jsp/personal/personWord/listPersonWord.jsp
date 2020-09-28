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
	                    <div class="layui-form-item pane">
	                    
                               <div class="layui-inline layui-col-md-offset7">
                                   <div class="layui-input-block">
                                       <button class="layui-btn layui-btn-disabled" disabled lay-submit 
                                           lay-filter="search">查询</button>
                                       <button class="layui-btn" lay-submit lay-filter="refresh">刷新</button>
                                       <button class="layui-btn layui-btn-normal" lay-submit lay-filter="goAdd">添加</button>
                                       <button type="reset" class="layui-btn layui-btn-primary layui-btn-disabled" 
                                           disabled>重置</button>
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
        <script>
            function pageScript(params) {
                var command = params.command;
                var globals = params.globals;
                
            	var personId = "${personId}";
				var dataTable = table.render({
					elem: "#dataTable"
                    ,height: "full-100"
                    ,url: common.url.personWord.list
                    ,page: true
                    ,cols: [[
				        {field: "id", title: "ID", width: 60, unresize: true}
				        ,{field: "writeDateStr", title: "日期", width: 110}
				        ,{field: "word", title: "内容", width: 844}
				        ,{fixed: "right", title: "操作", width: 120, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    	,personId: personId
				    }
				});
                
                form.on("submit(refresh)", function(data){
                    dataTable.reload({});
                    return false;
                });
                form.on("submit(goAdd)", function(data){
                    command.goAdd(personId);
                    return false;
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
            };
        </script>
        <jsp:include page="personWord.jsp"></jsp:include>  
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script> 
    </body>   
</html>