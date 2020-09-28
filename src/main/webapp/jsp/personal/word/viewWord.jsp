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
                    
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">喜欢程度</label>
                            <div class="layui-input-block">
                                <select id="likePercent" disabled class="layui-bg-gray" name="likePercent" 
                                    lay-verify="required">
                                    <option value="1">老生常谈</option>
                                    <option value="2">有点感触</option>
                                    <option value="3">印象深刻</option>
                                    <option value="4">非常喜欢</option>
                                    <option value="5">座右铭</option>
                                </select>
                            </div>
                        </div>
                    </div>  
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">来自</label>
                        <div class="layui-input-block">
                            <input type="text" disabled id="fromWho" name="fromWho" required  lay-verify="required" 
                                placeholder="请输入来自" autocomplete="off" class="layui-bg-gray layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="word" disabled name="word" placeholder="请输入内容" 
                                class="layui-textarea layui-bg-gray"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">备注，自己的感想</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="remark" disabled name="remark" placeholder="请输入备注" 
                                class="layui-textarea layui-bg-gray"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
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
	        };
        </script>
        <jsp:include page="word.jsp"></jsp:include>
    </body>   
</html>