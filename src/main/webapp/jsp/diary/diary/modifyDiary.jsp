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
    <body class="layui-layout-body"  id="layuiLayoutBody">
        <div class="layui-container">
            <br><br>
            <div class="layui-row">
                <form class="layui-form layui-form-pane" action="">
                
                    <input type="hidden" name="id" id="id"/>
                    
                    <div class="layui-form-item pane">
                        <label class="layui-form-label">日记日期</label>
                        <div class="layui-input-inline">
                            <input disabled placeholder="请选择日记日期" required  lay-verify="required" 
                                type="text" class="layui-input layui-bg-gray" id="diaryDate" name="diaryDate">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">天气</label>
                        <div class="layui-input-block">
                            <input type="text" id="weather" name="weather" required  lay-verify="required" 
                                placeholder="请输入天气" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">写日记地点</label>
                        <div class="layui-input-block">
                            <input type="text" id="place" name="place" required  lay-verify="required" 
                                placeholder="请输入日记地点" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item" pane>
                        <label class="layui-form-label">心情</label>
                        <div class="layui-input-block">
                            <input type="text"  id="mood" name="mood" required  lay-verify="required" 
                                placeholder="请输入心情" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">日记内容</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="content" name="content" placeholder="请输入内容" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
                            <button class="layui-btn" lay-submit lay-filter="modify">保存</button>
                            <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
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
        <jsp:include page="diary.jsp"></jsp:include>
    </body>   
</html>