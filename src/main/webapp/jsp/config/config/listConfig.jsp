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
            <div class="layui-body" style="top: 0px">
                <div class="layui-container">
                    <br><br>
		            <div class="layui-row">
		                <form class="layui-form layui-form-pane" action="">
		                    <div class="layui-form-item pane">
		                        
		                        <div class="layui-inline">
                                    <label class="layui-form-label">分组名称关键字</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="groupName" placeholder="请输入分组名称关键字" 
                                            autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <label class="layui-form-label">状态</label>
                                    <div class="layui-input-block">
                                      <select name="state" lay-verify="required">
                                        <option value="0">在用</option>
                                        <option value="1">停用</option>
                                        <option value="-1">全部</option>
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
                                
			                    <div class="layui-form-item" pane>
	                                <div class="layui-inline" id="multiCheckboxLine">
	                                    <label class="layui-form-label">类型</label>
	                                    <div class="layui-input-inline" id="multiCheckbox">
	                                        <input type="radio" name="type" value="" title="所有" checked>
	                                        <input type="radio" name="type" value="url" title="url(链接管理)">
                                            <input type="radio" name="type" value="menu" title="menu(菜单链接管理)">
                                            <input type="radio" name="type" value="bookTag" title="bookTag(图书标签管理)">
                                            <input type="radio" name="type" value="billTag" title="billTag(账单标签管理)">
	                                    </div>
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
                    ,height: "full-320"
                    ,url: common.url.config.list
                    ,page: true
                    ,cols: [[
                        {field: "id", title: "ID", width: 80, unresize: true}
                        ,{field: "type", title: "类型", width: 100}
                        ,{field: "typeName", title: "类型名称", width: 100}
                        ,{field: "groupId", title: "分组ID", width: 100}
                        ,{field: "groupName", title: "分组名称", width: 100}
                        ,{field: "propertyId", title: "属性ID", width: 120}
                        ,{field: "propertyName", title: "属性名", width: 120}
                        ,{field: "propertyValue", title: "属性值", width: 138}
                        ,{fixed: "right", title: "状态", width: 100, templet: "#stateTpl", unresize: true}
                        ,{fixed: "right", title: "操作", width: 150, align: "center", toolbar: "#menuTpl", unresize: true}
                    ]]
                    ,where: {
                    	state: globals.defaultState
                    	,pageing: globals.defaultPaging
                    	,orderBy: globals.defaultOrderBy
                    }
                });
                
                form.on("submit(search)", function(data){
                    dataTable.reload({
                        where: {
                            type: data.field.type
                            ,state: data.field.state
                            ,groupName: data.field.groupName
                            ,pageing: globals.defaultPaging
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
                
                form.on("switch(state)", function(obj){
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
        <jsp:include page="config.jsp"></jsp:include>
	    <script type="text/html" id="stateTpl">
            <input dataId={{ d.id }} type="checkbox" name="state" value="{{ d.state }}" lay-skin="switch" 
                lay-text="在用|停用" lay-filter="state" {{ d.state == 0 ? "checked" : "" }}>
        </script>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
	    </script>
    </body>   
</html>