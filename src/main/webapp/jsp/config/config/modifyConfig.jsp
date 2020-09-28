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
                    
                    <div class="layui-form-item" pane>
                        <div class="layui-inline">
                            <label class="layui-form-label">类型</label>
                            <div class="layui-input-inline" id="multiCheckbox">
                                <input disabled type="radio" name="type" value="url" title="url(链接管理)">
                                <input type="radio" name="type" value="menu" title="menu(菜单链接管理)" checked>
                                <input type="radio" name="type" value="bookTag" title="bookTag(图书标签管理)">
                                <input type="radio" name="type" value="billTag" title="billTag(账单标签管理)">
                            </div>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型名称</label>
                        <div class="layui-input-block">
                            <input type="text" id="typeName" name="typeName" required  lay-verify="required" 
                                placeholder="请输入分组名称" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">分组ID</label>
                        <div class="layui-input-block">
                            <input type="text" id="groupId" name="groupId" required  lay-verify="required" 
                                placeholder="请输入分组ID" autocomplete="off" class="layui-input">
                        </div>
                    </div>  
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">分组名称</label>
                        <div class="layui-input-block">
                            <input type="text" id="groupName" name="groupName" required  lay-verify="required" 
                                placeholder="请输入分组名称" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">属性ID</label>
                        <div class="layui-input-block">
                            <input type="text" id="propertyId" name="propertyId" required  lay-verify="required" 
                                placeholder="请输入属性ID" autocomplete="off" class="layui-input">
                        </div>
                    </div>  
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">属性名称</label>
                        <div class="layui-input-block">
                            <input type="text" id="propertyName" name="propertyName" required  lay-verify="required" 
                                placeholder="请输入属性名称" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">属性值</label>
                        <div class="layui-input-block">
                            <input type="text" id="propertyValue" name="propertyValue" required  lay-verify="required" 
                                placeholder="请输入属性值" autocomplete="off" class="layui-input">
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
        <jsp:include page="config.jsp"></jsp:include>
    </body>   
</html>