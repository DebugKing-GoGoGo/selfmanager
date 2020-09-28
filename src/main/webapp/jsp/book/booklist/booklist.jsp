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
			        discard: []
			        ,configIds: []
			        ,defaultDiscard: 0 // 0启用，1停用
			        ,defaultOrderBy: "book_name desc"
			        ,currentPageDatasId: []
			    };
			    var command = {};
			  
			    command.query = function(id) {
			        common.ajaxPost({
			            url: common.url.booklist.query
			            ,data: "id=" + id
			            ,success: function(data) {
			                 if (0 === data.code) {
			                    var model = data.resultObject;
			                    $("#id").val(model.id);
			                    $("#author").val(model.author);
			                    $("#bookName").val(model.bookName);
			                    $("#readingThinking").val(model.readingThinking);
			                    
			                    var tags = model.configs;
			                    
			                    globals.configIds = [];
			                    $("#multiCheckbox").find('input').attr("checked", false);
			                    // form.render("checkbox");
			                    for (var i = 0; i < tags.length; i++) {
			                    	// 更新时会提交configIds。所以要把已有的集合放到globals.configIds
			                    	globals.configIds.push(tags[i].id);
			                    	// 界面中勾选
			                    	// $("#multiCheckbox").find('input[value="' + tags[i].id + '"]').attr("checked", "checked");
			                    	$("#multiCheckbox").find('input[value="' + tags[i].id + '"]').click();
			                    }
			                    form.render("checkbox");
			                    console.log(globals.configIds);
			                }
			            }
			        });
			    };
			                 
			    common.ajaxPost({
			        url: common.url.config.list 
			        ,data: {
			        	type: "bookTag"
			        	,orderBy: "group_id desc, property_id desc" // 图书标签根据组名和属性名排序
			        }
			        ,success: function(data) {
			            if (0 === data.code) {
			                var model = data.data;
			                var modelSize = model.length;
			                
			                // 这里的处理目的是让不同组的标签之间有个换行
			                var preGroupId = model[0].groupId;
			                var groupChange = false;
			              	for (var i = 0; i < modelSize; i++) {
			              		groupChange = (preGroupId != model[i].groupId);
			                    if (groupChange) {
			                        preGroupId = model[i].groupId;
			                        $("#multiCheckbox").append("<br/>");
			                    }
			              		// state用于添加页面 去掉 那些已经被废弃的标签
			                    $("#multiCheckbox").append(
			                    	'<input lay-filter="checkbox" type="checkbox" name="configIds" state="' + 
			                    	model[i].state + 
			                   	    '" value="' + model[i].id + 
			                   	    '" title="' + model[i].propertyValue + '">');
			                }
			                form.render("checkbox");
			                
			                if ("function" === typeof pageScript) {
			                	pageScript({
			                        name: "booklist"
			                        ,command: command 
			                        ,globals: globals
			                    });
			                }
			            }
			        }
			    });
			                
			    // console.log("init:" + globals.configIds);
			    // 点击图书标签后将图书标签集合进行相应变化
			    form.on("checkbox(checkbox)", function(data){
			        // console.log("before:" + globals.configIds);
			        // console.log("操作的id:" + data.value);
			        var index = -1; // globals.configIds.indexOf(tagIndex);
			        for (var i = 0; i < globals.configIds.length; i++) {
			            if (data.value == globals.configIds[i]) {
			            	index = i;
			            }                     	
			        }
			        // console.log("index:---->" + index);
			        if (-1 !== index) {
			            globals.configIds.splice(index, 1);
			        }
			        if (data.elem.checked) {
			            globals.configIds.push(data.value);
			        }
			        // console.log("after:" + globals.configIds);
			    });
			            
			    command.goAdd = function() {
			        common.layerOpen({
			            title: "添加" + common.url.booklist.title
			            ,url: common.url.booklist.goAdd
			        });
			    };
			    command.add = function(addData) {
			    	addData.multiCheckbox = globals.configIds;
			        common.ajaxPost({
			            url: common.url.booklist.add
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
			            title: "修改" + common.url.booklist.title
			            ,url: common.url.booklist.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
			        });
			    };
			    command.modify = function(modifyData) {
			        common.ajaxPost({
			            url: common.url.booklist.modify
			            ,data: modifyData
			            ,success: function(data) {
			                if (0 === data.code) {
			                    layer.msg(data.message);
			                }
			            }
			        });
			    };
			    command.modifyWithTags = function(modifyData) {
			        modifyData.multiCheckbox = globals.configIds;
			        // console.log("modifyWithTags:" + JSON.stringify(modifyData));
			        common.ajaxPost({
			            url: common.url.booklist.modifyWithTags
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
			            title: "查看" + common.url.booklist.title
			            ,url: common.url.booklist.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
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