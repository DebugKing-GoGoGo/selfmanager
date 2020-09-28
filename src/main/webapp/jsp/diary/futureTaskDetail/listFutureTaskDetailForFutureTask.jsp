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
                
            	var futureId = "${futureId }";
				var dataTable = table.render({
                    elem: "#dataTable"
                    ,height: "full-100"
                    ,url: common.url.futureTaskDetail.list + "?paging=false"
                    ,page: false
                    ,cols: [[
                        {field: "id", title: "ID", width: 70, unresize: true}
                        ,{field: "privilege", title: "优先级", width: 72}
                        ,{field: "defaultTime", title: "用时", width: 72}
                        ,{field: "planDateStr", title: "安排日期", width: 152}
                        ,{field: "taskName", title: "任务名称", width: 351}
                        ,{field: "step", title: "任务内容", width: 192}
                        ,{fixed: "right", title: "是否完成", width: 100, align: "center", 
                            toolbar: "#futureTaskDetailDoneTpl", unresize: true}
                        ,{fixed: "right", title: "操作", width: 120, align: "center", 
                            toolbar: "#futureTaskDetailMenuTpl", unresize: true}
                    ]]
                    ,where: {
                        orderBy: globals.defaultOrderByTaskName
                        ,futureId: futureId
                        ,paging: true
                    }
                });
                
                form.on("submit(refresh)", function(data){
                    dataTable.reload({});
                    return false;
                });
                form.on("submit(goAdd)", function(data){
                    command.goAdd(futureId);
                    return false;
                });
                
                form.on("checkbox(done)", function(obj){
                    // 因为每次点击到后台更新数据不会更新数据模型中的done的值，
                    // 导致每次this.value都是模型中相同的值。
                    // 所以使用一个全局变量来保存
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
                table.on("tool(dataTable)", function(obj) { 
                    var data = obj.data; // 获得当前行数据
                    var layEvent = obj.event; // 获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; // 获得当前行 tr 的DOM对象
                    
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
        <jsp:include page="futureTaskDetail.jsp"></jsp:include>  
        <script type="text/html" id="futureTaskDetailMenuTpl">
            <a class="layui-btn layui-btn-xs" lay-event="goModify">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="goView">查看</a>
        </script>
        <script type="text/html" id="futureTaskDetailDoneTpl">
            <input dataId={{ d.id }} type="checkbox" name="done" value="{{ d.done }}" title="完成" 
                lay-filter="done" {{ d.done == 1 ? "checked" : "" }}>
        </script>
    </body>   
</html>