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
		                            <label class="layui-form-label">类型</label>
		                            <div class="layui-input-inline">
		                              <select id="type" name="type" lay-verify="required">
		                                  <option value="-1">全部</option>
		                                  <option value="0">关于我</option>
		                                  <option value="1">认识的人</option>
		                                  <option value="2">社会上</option>
		                              </select>
		                            </div>
		                        </div>
		                        
		                        <div class="layui-inline layui-col-md-offset4">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="search">查询</button>
                                        <button class="layui-btn layui-btn-disabled" disabled 
                                            lay-submit lay-filter="refresh">刷新</button>
                                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="goAdd">添加</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
			                        
		                    </div>
		                </form>
		            </div>
		            
		            <div class="layui-row">
			            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						    <legend>大事件时间线</legend>
						</fieldset>
						<form class="layui-form layui-form-pane" action="">
				            <ul class="layui-timeline" id="timeline">
							</ul>  
						</form>
		            </div> 
		            
		        </div> 
            </div>
            <jsp:include page="../../layout/js.jsp"></jsp:include>
            <jsp:include page="../../layout/bottom.jsp"></jsp:include>
        </div>
        <script>
            function getBigThingHtml(datas) {
                var html = '';
            	for (var i = 0; i < datas.length; i++) {
                    // alert(datas[i].content);
                    var bigThing = datas[i];
                    html += 
                        '<li class="layui-timeline-item">' +
                            '<i class="layui-icon layui-timeline-axis"></i>' + 
                            '<div class="layui-timeline-content layui-text">' + 
                                '<h3 class="layui-timeline-title">' + 
                                    '<input class="layui-btn layui-btn-xs layui-btn-normal" ' + 
                                        'lay-submit lay-filter="modify" type="button" ' + 
                                        'value="修改" data-id="' + bigThing.id + '"/>' + 
                                    '&nbsp;&nbsp;&nbsp;' +
                                    bigThing.thingDateStr + '[' + 
                                    bigThing.typeStr + ']' + 
                                    '<b>[' + bigThing.content + ']</b>' +
                                '</h3>' + 
                                '<p>感想：' + bigThing.feeling + 
                                '</p>' +
                            '</div>' + 
                        '</li>';
                }
            	return html;
            }
            
            function pageScript(params) {
                var command = params.command;
                var globals = params.globals;
                
            	common.ajaxPost({
                    url: common.url.bigThing.list
                    ,data: "orderBy=thing_date desc"
                    ,success: function(data) {
                        if (0 === data.code) {
                            var model = data.data;
                            var html = getBigThingHtml(model);
                            $("#timeline").append(html);
                        }
                    }
                });
            	
                form.on("submit(search)", function(data){
                	common.ajaxPost({
                        url: common.url.bigThing.list
                        ,data: "orderBy=thing_date desc&type=" + data.field.type
                        ,success: function(data) {
                        	$("#timeline").html("");
                            if (0 === data.code) {
                                var model = data.data;
                                var html = getBigThingHtml(model);
                                $("#timeline").append(html);
                            }
                        }
                    });
                    return false;
                });
                form.on("submit(goAdd)", function(data){
                    command.goAdd();
                    return false;
                });
                
                form.on("submit(modify)", function(data){
                    var id = $(this).attr("data-id");
                    command.goModify(id);
                });
            };
        </script>
        <jsp:include page="bigThing.jsp"></jsp:include>
    </body>   
</html>