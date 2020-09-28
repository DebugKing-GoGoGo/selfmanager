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
			    var globals = {
			    	currentPageDatasId: []
			        ,defaultOrderBy: "diary_date desc" //根据日记日期倒序排列
			    };
			    var command = {};
			            
			    command.query = function(id) {
			        common.ajaxPost({
			            url: common.url.diary.query
			            ,data: "id=" + id
			            ,success: function(data) {
			                 if (0 === data.code) {
			                  var model = data.resultObject;
			                  $("#id").val(model.id);
			                  $("#diaryDate").val(model.diaryDateStr);
			                  $("#place").val(model.place);
			                  $("#weather").val(model.weather);
			                  $("#mood").val(model.mood);
			                  $("#content").val(model.content);
			                }
			            }
			        });
			    };
			    
			    if ("function" === typeof pageScript) {
			        pageScript({
			            name: "diary"
			            ,command: command 
			            ,globals: globals
			        });
			    }
			    
			    command.goAdd = function() {
			        common.layerOpen({
			            title: "添加" + common.url.diary.title
			            ,url: common.url.diary.goAdd
			        });
			    };
			    command.add = function(addData) {
			        common.ajaxPost({
			            url: common.url.diary.add
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
			            title: "修改" + common.url.diary.title
			            ,url: common.url.diary.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
			        });
			    };
			    command.modify = function(modifyData) {
			        common.ajaxPost({
			            url: common.url.diary.modify
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
			            title: "查看" + common.url.diary.title
			            ,url: common.url.diary.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
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