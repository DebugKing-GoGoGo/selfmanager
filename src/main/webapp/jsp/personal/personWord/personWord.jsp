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
	            	defaultOrderBy: "write_date desc"
	            };
	            var command = {};
	                        
	            command.query = function(id) {
	                common.ajaxPost({
	                    url: common.url.personWord.query
	                    ,data: "id=" + id
	                    ,success: function(data) {
	                         if (0 === data.code) {
	                            var model = data.resultObject;
	                            $("#writeDate").val(model.writeDateStr);
	                            $("#word").val(model.word);
	                        }
	                    }
	                });
	            };
	            
	            // 该判断之前，是页面马上会调用的函数query
	            // 调用页面的script
	            // 该判断之后，才是页面由于操作才会调用的函数，故而放在后面。
	            if ("function" === typeof pageScript) {
	            	pageScript({
	                    name: "personWord"
	                    ,command: command 
	                    ,globals: globals
	                });
	            }
	            
	            
	            command.goAdd = function(personId) {
	                common.layerOpen({
	                    title: "添加" + common.url.personWord.title
	                    ,url:common.url.personWord.goAdd + "?personId=" + personId
	                });
	            };
	            command.add = function(addData) {
	                common.ajaxPost({
	                    url: common.url.personWord.add
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
	                    title: "修改" + common.url.personWord.title
	                    ,url: common.url.personWord.goModify + "?id=" + id
	                });
	            };
	            command.modify = function(modifyData) {
	                common.ajaxPost({
	                    url: common.url.personWord.modify
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
	                    title: "查看" + common.url.personWord.title
	                    ,url: common.url.personWord.goView + "?id=" + id
	                });
	            };
	            
	            command.goList = function(personId) {
                    common.layerOpen({
                        title: common.url.personWord.title + "列表"
                        ,url: common.url.personWord.goList + "?personId=" + personId
                    });
                };
	        }));
        </script>
    </body>
</html>