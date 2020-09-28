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
                    
                    <input type="hidden" value="0" name="discard"/>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>
                        <div class="layui-input-block">
                            <input type="text" id="bookName" name="bookName" required  lay-verify="required" 
                                placeholder="请输入书名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">作者</label>
                        <div class="layui-input-block">
                            <input type="text" id="author" name="author" required  lay-verify="required" 
                                placeholder="请输入作者" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    
                    <div class="layui-form-item" pane>
                        <div class="layui-inline" id="multiCheckboxLine">
                            <label class="layui-form-label">标签</label>
                            <div class="layui-input-inline" id="multiCheckbox">
                            </div>
                        </div>
                    </div>
                    
                    <div class="layui-form-item layui-form-text pane">
                        <label class="layui-form-label">读后感</label>
                        <div class="layui-input-block">
                            <textarea rows="10" id="readingThinking" name="readingThinking" placeholder="请输入内容" 
                                class="layui-textarea"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn" lay-submit lay-filter="add">添加</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
                
            	// 去掉那些已经被废弃的标签
            	$("#multiCheckbox").find('input[state=1]').next().remove();
            	$("#multiCheckbox").find('input[state=1]').remove();
            	
                form.on("submit(add)", function(data){
                	command.add(data.field);
                    return false;
                });
            };
        </script>
        <jsp:include page="booklist.jsp"></jsp:include>
    </body>   
</html>