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
			        defaultOrderBy: "bill_date desc, id asc"
			        ,currentPageDatasId: [] // 当前页的数据的id
			        ,configIds: []
			    };
			    var command = {};
			                        
			    command.query = function(id) {
			        common.ajaxPost({
			            url: common.url.bill.query
			            ,data: "id=" + id
			            ,success: function(data) {
			                 if (0 === data.code) {
			                  var model = data.resultObject;
			                  $("#id").val(model.id);
			                  $("#billDate").val(model.billDateStr);
			                  $("#costMoney").val(model.costMoney);
			                  $("#useTo").val(model.useTo);
			                  
			                  // 下拉选择器用这种方式处理
			                  $("#payType").val(model.payType);
			                  // 下面这种方式比较繁琐
			                  // $("#payType").find('option').attr("selected", null);
                              // $("#payType").find('option[value="' + model.payType + '"]').attr("selected", true);
                              
			                  // 单选框用这种方式处理
			                  $("#multiCheckbox").find('input[value="' + model.payWay + '"]').click();
			                  // 下面这种方式无效
			                  // $("#multiCheckbox").find('input[value!="' + model.payWay + '"]').attr("checked", false);
			                  
			                  form.render();
			                  
			                  // 这里有个坑，是layui框架本身的问题
			                  
			                  // 比如界面原来有3个radio，a、b、c，一开始是a是checked的。如下，
			                  // <a checked> <b> <c>
			                  
			                  // 第一个情况
			                  // 使用如下代码，使得b单选框勾选
			                  // $("#multiCheckbox").find('input[value="' + model.payWay + '"]').attr("checked", true);
			                  // 结果界面上居然变成（a的checked没有去掉）
			                  // <a checked> <b checked> <c>
			                  // 此时b正确的选中了
			                  
			                  // 第二个情况
			                  // 但是使用如下代码，再次使得a单选框勾选
			                  // $("#multiCheckbox").find('input[value="' + model.payWay + '"]').attr("checked", true);
			                  // <a checked> <b checked> <c>
			                  // 结果此次仍然是b被勾选的。
			                  
			                  // 第二个情况：这是可以理解的，多个都有checked，会作用在最后一个checked
			                  // 第一个情况：但不理解的是为什么勾选b的时候，a上面的checked还在。
			                  
			                  // 第三个情况 
			                  // 如果我先使用这个代码使得所有单选框的勾选去掉
			                  // $("#multiCheckbox").find('input').attr("checked", false);
			                  // <a> <b> <c>
			                  // 然后使用如下的勾选b
			                  // $("#multiCheckbox").find('input[value="' + model.payWay + '"]').attr("checked", true);
			                  // <a> <b checked> <c>
			                  // 结果是我需要的了，但是界面上b还是没有勾选。
			                  // 这很明显就是layui的bug了
			                  
			                  // 现在单选框使用如下方法可以变通，即触发点击事件
			                  // $("#multiCheckbox").find('input[value="' + model.payWay + '"]').click();
			                  // 下拉框通过在layui社区提问，可以使用如下方式
			                  // $("#select").val(值);
			                  // 复选框先把所有的值都取消掉
			                  // $("#multiCheckbox").find('input').attr("checked", false);
			                  // 然后使用和单选框一样的click()事件，下面是通过一个遍历，把每个勾选的触发点击事件
			                  // for (var i = 0; i < tags.length; i++) {
                              //      $("#multiCheckbox").find('input[value="' + tags[i].id + '"]').click();
                              // }
			                }
			            }
			        });
			    };
			                        
			    if ("function" === typeof pageScript) {
			        pageScript({
			            name: "bill"
			            ,command: command 
			            ,globals: globals
			        });
			    }
			    
			    // console.log("init:" + globals.configIds);
			    form.on("checkbox(checkbox)", function(data){
			        // console.log("before:" + globals.configIds);
			        var index = globals.configIds.indexOf(data.value);
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
			            title: "添加" + common.url.bill.title
			            ,url: common.url.bill.goAdd
			        });
			    };
			    command.add = function(addData) {
			        common.ajaxPost({
			         url: common.url.bill.add
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
			            title: "修改" + common.url.bill.title
			            ,url: common.url.bill.goModify + "?id=" + id + "&ids=" + globals.currentPageDatasId
			        });
			    };
			    command.modify = function(modifyData) {
			        common.ajaxPost({
			            url: common.url.bill.modify
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
			            title: common.url.bill.title
			            ,url: common.url.bill.goView + "?id=" + id + "&ids=" + globals.currentPageDatasId
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