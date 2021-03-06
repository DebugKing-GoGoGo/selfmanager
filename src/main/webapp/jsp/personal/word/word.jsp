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
	            	discard: []
	                ,defaultDiscard: 0 
	            	,defaultOrderBy: "like_percent desc" // 默认根据优先级降序排列
	            	,currentPageDatasId: [] // 当前页的数据的id
	            };
	            var command = {};
	                        
	            command.query = function(id) {
	                common.ajaxPost({
	                    url: common.url.word.query
	                    ,data: "id=" + id
	                    ,success: function(data) {
	                         if (0 === data.code) {
	                            var model = data.resultObject;
	                            $("#id").val(model.id);
	                            $("#fromWho").val(model.fromWho);
	                            $("#remark").val(model.remark);
	                            $("#word").val(model.word);
	                            // $("#likePercent").find('option[value="' + 
	                                // model.likePercent + '"]').attr('selected', 'selected');
	                            $("#likePercent").val(model.likePercent);
	                            form.render("select");
	                        }
	                    }
	                });
	            };
	            
	            if ("function" === typeof pageScript) {
	            	pageScript({
	                    name: "word"
	                    ,command: command 
	                    ,globals: globals
	                });
	            }
	                        
	            command.goAdd = function() {
	                common.layerOpen({
	                    title: "添加" + common.url.word.title
	                    ,url:common.url.word.goAdd
	                });
	            };
	            command.add = function(addData) {
	                common.ajaxPost({
	                    url: common.url.word.add
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
	                    title: "修改" + common.url.word.title
	                    ,url: common.url.word.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
	                });
	            };
	            command.modify = function(modifyData) {
	                common.ajaxPost({
	                    url: common.url.word.modify
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
	                    title: "查看" + common.url.word.title
	                    ,url: common.url.word.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
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