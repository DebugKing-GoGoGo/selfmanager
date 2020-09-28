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
                                    <label class="layui-form-label">姓名关键字</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="name" placeholder="请输入姓名关键字" autocomplete="off" 
                                            class="layui-input">
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                      <select name="sex" id="sex" lay-verify="required">
                                        <option value="-1">全部</option>
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                      </select>
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="search">查询</button>
                                        <button class="layui-btn" lay-submit lay-filter="refresh">刷新</button>
                                        <button class="layui-btn layui-btn-normal" lay-submit 
                                            lay-filter="goAdd">添加</button>
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
            var peopleHistoryCommand;
            var peopleHistoryGlobals;
            var personWordCommand;
            var personWordGlobals;
            
            function pageScript(params) {
                var command;
                var globals;
                
                if ("person" == params.name) {
                    command = params.command;
                    globals = params.globals;
                }  else if("peopleHistory" == params.name){
                	peopleHistoryCommand = params.command;
                	peopleHistoryGlobals = params.globals;
                    return;
                }  else if("personWord" == params.name){
                	personWordCommand = params.command;
                	personWordGlobals = params.globals;
                    return;
                } else {
                    return;
                }
            	
				var dataTable = table.render({
				    elem: "#dataTable"
				    ,height: "full-150"
				    ,url: common.url.person.list
				    ,page: true
				    ,cols: [[
				        {field: "id", title: "ID", width: 70, unresize: true}
				        ,{field: "name", title: "姓名", width: 110}
				        ,{field: "sexStr", title: "性别", width: 75}
				        ,{field: "type", title: "类型", width: 287}
				        ,{field: "home", title: "来自", width: 294}
				        ,{fixed: "right", title: "操作", width: 294, align: "center", 
				            toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    }
				});
                
                form.on("submit(search)", function(data){
                	dataTable.reload({
                        where: {
                        	name: data.field.name
                        	,sex: data.field.sex
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
                        case "peopleHistory" : 
                        	var personId = data.id;
                        	if(data.existsPeopleHistory) {
                        		peopleHistoryCommand.goModify(personId);
                        	} else {
                        		peopleHistoryCommand.goAdd(personId);
                        	}
                            break;
                        case "goListPersonWord" :
                            var personId = data.id;
                        	personWordCommand.goList(personId);
                        	break;
                    } 
                    return;
                });
            };
        </script>
        <jsp:include page="../personWord/personWord.jsp"></jsp:include>
        <jsp:include page="../peopleHistory/peopleHistory.jsp"></jsp:include>
        <jsp:include page="person.jsp"></jsp:include>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="peopleHistory">{{ d.addOrModify }}</a>
            <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="goListPersonWord">密语列表</a>
	    </script> 
    </body>   
</html>