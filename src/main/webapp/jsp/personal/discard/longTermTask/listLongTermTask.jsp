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
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/layui/css/layui.css" />
    </head>
    <body class="layui-layout-body">
        <div class="layui-layout layui-layout-admin">
            <jsp:include page="../../layout/top.jsp"></jsp:include>
            <jsp:include page="../../layout/left.jsp"></jsp:include>

            <div class="layui-body">
                <div class="layui-container">
                    <br><br>
		            <div class="layui-row">
		                <form class="layui-form layui-form-pane" action="">
		                
		                    <input type="hidden" value="1" name="id"/>
		                    
		                    <div class="layui-row">
		                        <div class="layui-form-item layui-form-text pane">
		                            <label class="layui-form-label">想法(500字内)</label>
		                            <div class="layui-input-block">
		                                <textarea rows="10" id="plan" name="plan" placeholder="请输入想法" class="layui-textarea"></textarea>
		                            </div>
		                        </div>
		                    </div> 
		                    
		                    <div class="layui-row">
		                        <div class="layui-form-item layui-form-text pane">
		                            <label class="layui-form-label">完成(500字内)</label>
		                            <div class="layui-input-block">
		                                <textarea rows="10" id="finish" name="finish" placeholder="请输入完成" class="layui-textarea"></textarea>
		                            </div>
		                        </div>
		                    </div> 
		                    
		                    <div class="layui-row layui-form-item pane">
		                        <div class="layui-inline">
		                            <div class="layui-input-block">
		                                <button class="layui-btn" lay-submit lay-filter="submitForm">更新</button>
		                            </div>
		                        </div>
		                    </div>
		                    
		                </form>
		            </div>
		        </div> 
            </div>
            
            <jsp:include page="../../layout/bottom.jsp"></jsp:include>
        </div>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
        <script>
            $.ajax({
                url : '${pageContext.request.contextPath}/longTermTask/queryLongTermTask',
                type : "POST",
                dataType : "json",
                data : { 'id': 1},
                success : function(data) {
                    if (0 == data.code) {
                        var longTermTask = data.resultObject;
                        $('#plan').html(longTermTask.plan);
                        $('#finish').html(longTermTask.finish);
                    } else {
                        layer.alert(data.message, function(index){
                            layer.close(index);
                        }); 
                    }
                }
            }, function(){
                alert("访问服务器失败!");
            });
            
            layui.use(['element', 'table', 'layer', 'form', 'laydate'], function() {
            	var layer = layui.layer
	                ,form = layui.form
	                ,laydate = layui.laydate
                    ,element = layui.element
                    ,table = layui.table;
                // 更新按钮
                form.on('submit(submitForm)', function(data){
                    $.ajax({
                        url : '${pageContext.request.contextPath}/longTermTask/modifyLongTermTask',
                        type : "POST",
                        dataType : "json",
                        data : data.field,
                        success : function(data) {
                            if (0 == data.code) {
                                layer.msg(data.message);
                            } else {
                                layer.alert(data.message, function(index){
                                    layer.close(index);
                                }); 
                            }
                        }
                    }, function(){
                        alert("访问服务器失败!");
                    });
                    return false;
                });
            });
        </script>
    </body>   
</html>
