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
	            var globals = {
	            	defaultOrderBy: "id desc"
	            	,faultFunction: function() {
	                    layer.alert("获取页面URL配置失败，请刷新后重试!");
	                }
	            };
	            var command = {};
	                        
	            command.query = function(id) {
	                common.ajaxPost({
	                    url: common.url.person.query
	                    ,data: "id=" + id
	                    ,success: function(data) {
	                         if (0 === data.code) {
	                            var model = data.resultObject;
	                            $("#id").val(model.id);
	                            if (0 == model.sex) {
	                                $("#woman").click();
	                            } else {
	                            	$("#man").click();
	                            }
	                            $("#name").val(model.name);
	                            $("#type").val(model.type);
	                            $("#home").val(model.home);
	                            form.render("radio");
	                        }
	                    }
	                });
	            };
	            
	            if ("function" === typeof pageScript) {
	            	pageScript({
	                    name: "person"
	                    ,command: command 
	                    ,globals: globals
	                });
	            }
	            
	            command.goAdd = function() {
                    common.layerOpen({
                        title: "添加" + common.url.person.title
                        ,url: common.url.person.goAdd
                    });
                };
	            command.add = function(addData) {
	                common.ajaxPost({
	                    url: common.url.person.add
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
	                    title: "修改" + common.url.person.title
	                    ,url: common.url.person.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
	                });
	            };
	            command.modify = function(modifyData) {
                    common.ajaxPost({
                        url: common.url.person.modify
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
	                    title: "查看" + common.url.person.title
	                    ,url: common.url.person.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
	                });
	            };
	            
	            command.queryWithIds = function(currentId, idsArray, number) {
                    var index = idsArray.indexOf(currentId) + number;
                    if (-1 == index) {
                        layer.msg("当前记录已是本页第一条记录");
                        return currentId;
                    }
                    if (idsArray.length <= index) {
                        layer.msg("当前记录已是本页最后一条记录");
                        return currentId;
                    }
                    currentId = idsArray[index];
                    command.query(currentId);
                    return currentId;
                };
	        }));
        </script>
    </body>
</html>