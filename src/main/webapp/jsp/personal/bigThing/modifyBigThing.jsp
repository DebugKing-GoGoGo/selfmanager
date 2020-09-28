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
                    
                    <input type="hidden" value="${id}" name="id">
                    
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-input-inline">
                                <input placeholder="请选择日期" required  lay-verify="required" type="text" 
                                    autocomplete="off" class="layui-input" id="thingDate" name="thingDate">
                            </div>
                        </div>
                    </div>  
    
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-inline">
                              <select id="type" name="type" lay-verify="required">
                                  <option value="0">关于我</option>
                                  <option value="1">认识的人</option>
                                  <option value="2">社会上</option>
                              </select>
                            </div>
                        </div>
                    </div>  
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">事件</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="content" name="content" placeholder="请输入事件" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">感想</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="feeling" name="feeling" placeholder="请输入事件" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
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
                    elem: "#thingDate"
                    ,value: new Date()
                });
	        	
	            command.query("${id}");
	            
	            form.on("submit(modify)", function(data) {
	                command.modify(data.field);
	                return false;
	            });
	        };
        </script>
        <jsp:include page="bigThing.jsp"></jsp:include>
    </body>   
</html>