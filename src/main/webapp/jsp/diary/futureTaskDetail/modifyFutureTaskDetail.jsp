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
                    
                    <input type="hidden" value="${id }"name="id" id="id">
                    
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">优先级</label>
                            <div class="layui-input-block">
                              <select id="privilege" name="privilege" lay-verify="required">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                              </select>
                            </div>
                        </div>
                    </div>  
                    
                    <div class="layui-form-item pane">
                        <label class="layui-form-label">安排日期</label>
                        <div class="layui-input-inline">
                            <input placeholder="请选择安排日期" type="text" 
                                autocomplete="off" class="layui-input" id="planDate" name="planDate">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">用时（分）</label>
                        <div class="layui-input-block">
                            <input type="text" id="defaultTime" name="defaultTime" 
                                required  lay-verify="required|number" 
                                placeholder="请输入任务用时" autocomplete="off" 
                                class="layui-input">
                        </div>
                    </div>  
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">任务名称</label>
                        <div class="layui-input-block">
                            <input type="text" id="taskName" name="taskName" 
                                required  lay-verify="required" 
                                placeholder="请输入任务名称" autocomplete="off" 
                                class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">步骤</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="step" name="step" 
                                placeholder="请输入步骤" class="layui-textarea">
                            </textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
                            <button class="layui-btn" lay-submit lay-filter="modify">更新</button>
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
                
	        	laydate.render({
                    elem: "#planDate" 
                    ,value: new Date()
                });
                
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
        <jsp:include page="futureTaskDetail.jsp"></jsp:include>
    </body>   
</html>