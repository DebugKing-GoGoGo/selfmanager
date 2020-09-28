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
                    
                        <div class="layui-inline">
	                        <label class="layui-form-label">开始日期</label>
	                        <div class="layui-input-inline">
	                            <input placeholder="请选择开始日期" required  type="text" class="layui-input" 
	                                autocomplete="off" id="beginDate" name="beginDate">
	                        </div>
                        </div>
                        
                        <div class="layui-inline">
	                        <label class="layui-form-label">结束日期</label>
	                        <div class="layui-input-inline">
	                            <input placeholder="请选择结束日期" required type="text" class="layui-input" 
	                                autocomplete="off" id="endDate" name="endDate">
	                        </div>
                        </div>
                        
                        <div class="layui-inline">
	                        <label class="layui-form-label">状态</label>
	                        <div class="layui-input-inline">
	                          <select name="state" id="state" lay-verify="required">
	                            <option value="0">未开始</option>
	                            <option value="1">进行中</option>
	                            <option value="2">完成</option>
	                          </select>
	                        </div>
                        </div>
                        
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">长期任务内容</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="taskName" name="taskName" placeholder="长期任务内容" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
                            <button class="layui-btn" lay-submit lay-filter="modify">更新</button>
                            <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
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
        <jsp:include page="futureTask.jsp"></jsp:include>
    </body>   
</html>