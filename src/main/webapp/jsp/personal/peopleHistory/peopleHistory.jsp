<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
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
                        url: common.url.peopleHistory.query
                        ,data: "personId=" + id // 这个比较特殊，需要使用personId
                        ,success: function(data) {
                             if (0 === data.code) {
                                var model = data.resultObject;
                                $("#content").val(model.content);
                                $("#id").val(model.id);
                            }
                        }
                    });
                };
                
                if ("function" === typeof pageScript) {
                	pageScript({
                        name: "peopleHistory"
                        ,command: command 
                        ,globals: globals
                    });
                }
                
                command.goAdd = function(personId) {
                    common.layerOpen({
                        title: "添加" + common.url.peopleHistory.title
                        ,url: common.url.peopleHistory.goAdd + "?personId=" + personId
                    });
                };
                command.add = function(addData) {
                    common.ajaxPost({
                        url: common.url.peopleHistory.add
                        ,data: addData
                        ,success: function(data) {
                            if (0 === data.code) {
                                layer.msg(data.message);
                            }
                        }
                    });
                };

                command.goModify = function(personId) {
                    common.layerOpen({
                        title: "修改" + common.url.peopleHistory.title
                        ,url: common.url.peopleHistory.goModify + "?personId=" + personId
                    });
                };
                command.modify = function(modifyData) {
                    common.ajaxPost({
                        url: common.url.peopleHistory.modify
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
                        title: "查看" + common.url.peopleHistory.title
                        ,url: common.url.peopleHistory.goView + "?id=" + id
                    });
                };
            }));
        </script>
    </body>
</html>