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
        <div class="layui-container">
            <br><br>
            <div class="layui-row">
                <form class="layui-form layui-form-pane" action="">
                
                    <input type="hidden" id="id" name="id">
                            
                    <div class="layui-form-item pane">
                        <label class="layui-form-label">开始日期</label>
                        <div class="layui-input-inline">
                            <input id="beginDate" name="beginDate" placeholder="请选择开始日期" required  
                                autocomplete="off" lay-verify="required" type="text" class="layui-input">
                        </div>
                        <label class="layui-form-label">结束日期</label>
                        <div class="layui-input-inline">
                            <input id="endDate" name="endDate" placeholder="请选择结束日期" required  
                                autocomplete="off" lay-verify="required" type="text" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">plan</label>
                        <div class="layui-input-block">
                            <textarea rows="10" onpropertychange="this.style.posHeight = this.scrollHeight+5"  
                                id="p" name="p" placeholder="请输入plan" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">do</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="d" name="d" placeholder="请输入do" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">check</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="c" name="c" placeholder="请输入check" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">action</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="a" name="a" placeholder="请输入action" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
                            <button class="layui-btn" lay-submit lay-filter="modify">保存</button>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div> 
        <jsp:include page="../../layout/js.jsp"></jsp:include>
        <script>
            function pageScript(params) {
            	var command = params.command;
                var globals = params.globals;
            	
                laydate.render({
                    elem: "#beginDate" 
                    ,value: new Date()
                });
                laydate.render({
                    elem: "#endDate" 
                    ,value: new Date()
                });
                
                var idsArray = $.parseJSON("${ids }");
                var currentId = parseInt("${id }");
                command.query(currentId);
                
                form.on("submit(prevous)", function(data) {
                    currentId = command.queryWithIds(currentId, idsArray, -1);
                    return false;
                });
                form.on("submit(next)", function(data) {
                    currentId = command.queryWithIds(currentId, idsArray, +1);
                    return false;
                });
                form.on("submit(modify)", function(data) {
                    command.modify(data.field);
                    return false;
                });
            };
        </script>
        <jsp:include page="weekTask.jsp"></jsp:include>
    </body>   
</html>