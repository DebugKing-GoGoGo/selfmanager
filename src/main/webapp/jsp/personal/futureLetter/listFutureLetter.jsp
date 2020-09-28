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
		                    
		                        <div class="layui-inline layui-col-md-offset7">
                                    <div class="layui-input-block">
                                        <button class="layui-btn layui-btn-disabled" disabled lay-submit 
                                            lay-filter="search">查询</button>
                                        <button class="layui-btn" lay-submit lay-filter="refresh">刷新</button>
                                        <button class="layui-btn layui-btn-normal" lay-submit 
                                            lay-filter="goAdd">添加</button>
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
            <jsp:include page="../../layout/bottom.jsp"></jsp:include>
        </div>
        <script>
            function pageScript(params) {
                var command = params.command;
                var globals = params.globals;
                
				var dataTable = table.render({
					elem: "#dataTable"
                    ,height: "full-150"
                    ,url: common.url.futureLetter.list
                    ,page: true
                    ,cols: [[
				        {field: "id", title: "ID", width:80, unresize: true}
				        ,{field: "writeDateStr", title: "写于", width: 120}
				        ,{field: "readDateStr", title: "打开日期", width: 120}
				        ,{field: "afterReadFeeling", title: "读后感", width: 562}
				        ,{field: "state", title: "是否已读", width: 100, templet: "#stateTpl", unresize: true}
				        ,{fixed: "right", title: "操作", width: 150, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy 
				    }
				});
				
				form.on("submit(refresh)", function(data){
                    dataTable.reload({});
                    return false;
                });
                
                form.on("submit(goAdd)", function(data){
                    command.goAdd();
                    return false;
                });
                
                form.on("checkbox(state)", function(obj){
                    var id = $(this).attr("dataId");
                    var key = "state" + id;
                    if (undefined == globals.state[key]) {
                        globals.state[key] = this.value;
                    }
                    var state = 1 ==  globals.state[key] ? 0 : 1;
                    globals.state[key] = state;
                    
                    command.modify({
                        "id": id
                        ,"state": state
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
            };
        </script>
        <jsp:include page="futureLetter.jsp"></jsp:include>
        <script type="text/html" id="stateTpl">
            <input dataId={{ d.id }} type="checkbox" name="state" value="{{ d.state }}" title="已读" 
                lay-filter="state" {{ d.state == 1 ? "checked" : "" }}>
        </script>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script>
    </body>   
</html>