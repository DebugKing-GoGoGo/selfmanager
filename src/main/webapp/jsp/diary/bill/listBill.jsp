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
		                    <div class="layui-row layui-form-item pane">
		                          
		                        <div class="layui-inline">
                                    <label class="layui-form-label">开始日期</label>
                                    <div class="layui-input-inline">
                                        <input placeholder="请选择开始日期" type="text" class="layui-input" 
                                            id="minBillDate" name="minBillDate">
                                    </div>
                                </div>
                                
                                <div class="layui-inline">
                                    <label class="layui-form-label">结束日期</label>
                                    <div class="layui-input-inline">
                                        <input placeholder="请选择结束日期" type="text" class="layui-input" 
                                            id="maxBillDate" name="maxBillDate">
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
		                    
		                    <div class="ayui-row layui-form-item" pane>
                                <div class="layui-inline" id="multiCheckboxLine">
                                    <label class="layui-form-label">标签</label>
                                    <div class="layui-input-inline" id="multiCheckbox">
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
                
                common.ajaxPost({
                    url: common.url.config.list
                    ,data: "type=billTag&groupId=billTag"
                    ,success: function(data) {
                        if (0 === data.code) {
                            var model = data.data;
                            var modelSize = model.length;
                            for (var i = 0; i < modelSize; i++) {
                                // state用于添加页面 去掉 那些已经被废弃的标签
                                $("#multiCheckbox").append('<input type="checkbox" lay-filter="checkbox" name="configIds" state="' + 
                                    model[i].state + 
                                    '" value="' + model[i].id + 
                                    '" title="' + model[i].propertyValue + '">');
                            }
                            form.render("checkbox");
                        }
                    }
                });
				var dataTable = table.render({
					elem: "#dataTable"
                    ,height: "full-330"
                    ,url: common.url.bill.list
                    ,page: true
                    ,cols: [[
				        {field: "id", title: "ID", width: 70, unresize: true}
				        ,{field: "billDateStr", title: "时间", width: 110}
				        ,{field: "dayOffWeek", title: "星期", width: 75}
				        ,{field: "costMoney", title: "花费金额", width: 110}
				        ,{field: "payTypeStr", title: "支付类型", width: 86}
				        ,{field: "tagStr", title: "标签", width: 127}
				        ,{field: "useTo", title: "明细", width: 400}
				        ,{fixed: "right", title: "操作", width: 150, align: "center", toolbar: "#menuTpl", unresize: true}
				    ]]
				    ,where: {
				    	orderBy: globals.defaultOrderBy
				    }
				});
				laydate.render({
                    elem: "#minBillDate"
                    ,value: new Date()
                });
				laydate.render({
                    elem: "#maxBillDate"
                    ,value: new Date()
                });
				
                form.on("submit(search)", function(data){
                	dataTable.reload({
                        where: { 
                        	minBillDate: data.field.minBillDate
                        	,maxBillDate: data.field.maxBillDate
                            ,multiCheckbox: globals.configIds
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
                    
                    // 保存当前页的数据，用于修改/查看中的上一项/下一项
                    globals.currentPageDatasId = [];
                    $('td[data-field="id"]').each(function(index, elem) {
                    	globals.currentPageDatasId.push($(elem).text());
                    });
                    // console.log(globals.currentPageDatasId);
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
        <jsp:include page="bill.jsp"></jsp:include>
        <script type="text/html" id="menuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script>
    </body>   
</html>