<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	  <base href="<%=basePath%>">
	</head>
	<body>
	    <script type="text/javascript">
	       (function(factory) {
	            layui.use(["element", "table", "layer", "form", "laydate"], function() {
	                window.layer = layui.layer
	                ,window.form = layui.form
	                ,window.laydate = layui.laydate
	                ,window.element = layui.element
	                ,window.table = layui.table;
	                factory(pageScript);
	            });
	        }(function(pageScript) {
		        var globals = {};
	            var command = {};
                        
                command.query = function(id) {
                    common.ajaxPost({
                        url: common.url.bigThing.query
                        ,data: "id=" + id
                        ,success: function(data) {
                             if (0 === data.code) {
                                var model = data.resultObject;
                                $("#thingDate").val(model.thingDateStr);
                                $("#content").val(model.content);
                                $("#feeling").val(model.feeling);
                                // $("#type").find('option[value="' + 
                                   // model.type + '"]').attr('selected', 'selected');
                                $("#type").val(model.type);
                                form.render("select");
                            }
                        }
                    });
                };
                        
                if ("function" === typeof pageScript) {
                	pageScript({
                        name: "bigThing"
                        ,command: command 
                        ,globals: globals
                    });
                }
                        
                command.goAdd = function() {
                    common.layerOpen({
                        title: "添加" + common.url.bigThing.title
                        ,url: common.url.bigThing.goAdd
                    });
                };
                command.add = function(addData) {
                    common.ajaxPost({
                        url: common.url.bigThing.add
                        ,data: addData
                        ,success: function(data) {
                            if (0 === data.code) {
                                layer.msg(data.message);
                            }
                        }
                    });
                };
                
                command.goModify = function(id) {
                	common.layerOpen({
                        title: "修改" + common.url.bigThing.title
                        ,url: common.url.bigThing.goModify + "?id=" + id
                    });
                };
                command.modify = function(modifyData) {
                    common.ajaxPost({
                        url: common.url.bigThing.modify
                        ,data: modifyData
                        ,success: function(data) {
                            if (0 === data.code) {
                                layer.msg(data.message);
                            }
                        }
                    });
                };
                
                command.goView = function(id) {
                	common.layerOpen({
                        title: "查看" + common.url.bigThing.title
                        ,url: common.url.bigThing.goView + "?id=" + id
                    });
                };
	        }));
	    </script>
	</body>
</html>