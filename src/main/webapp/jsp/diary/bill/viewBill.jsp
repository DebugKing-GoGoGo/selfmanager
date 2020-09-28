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
                    
                    <input type="hidden" value="${id}" name="id">
                    
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">日期</label>
                            <div class="layui-input-inline">
                                <input disabled placeholder="请选择日期" required  lay-verify="required" 
                                    type="text" class="layui-input layui-bg-gray" id="billDate" name="billDate">
                            </div>
                        </div>
                        
                        <div class="layui-inline">
	                        <label class="layui-form-label">花费金额</label>
	                        <div class="layui-input-inline">
	                            <input disabled type="text" id="costMoney" name="costMoney" required  
	                               lay-verify="required|number" placeholder="请输入花费金额" autocomplete="off" 
	                               class="layui-input layui-bg-gray">
	                        </div>
                        </div>
                        
                        <div class="layui-inline">
                            <label class="layui-form-label">支付类型</label>
                            <div class="layui-input-block">
                              <select disabled id="payType" name="payType" lay-verify="required">
                                  <option value="0">现付</option>
                                  <option value="1">未现付</option>
                              </select>
                            </div>
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
                        <label class="layui-form-label">花费具体信息</label>
                        <div class="layui-input-block">
                            <textarea rows="10" disabled id="useTo" name="useTo" placeholder="请输入花费具体信息" 
                                class="layui-textarea layui-bg-gray"></textarea>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block layui-layer-btn">
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="prevous">上一项</button>
                            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="next">下一项</button>
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
	        	
                common.ajaxPost({
                    url: common.url.config.list 
                    ,data: "type=billTag&state=0"
                    ,success: function(data) {
                        if (0 === data.code) {
                            var model = data.data;
                            var modelSize = model.length;
                            if (0 === modelSize) {
                                layer.alert("不存在账单标签，请先前往配置页面添加账单标签!");
                                $("#submitForm").addClass("layui-btn-disabled");
                                return;
                            }
                            $("#multiCheckbox").append('<input type="radio" name="payWay" state="' + 
                                model[0].state + '" value="' + 
                                model[0].id + '" title="' + 
                                model[0].propertyValue + '" checked>');
                            for (var i = 1; i < modelSize; i++) {
                                // state用于添加页面 去掉 那些已经被废弃的标签
                                $("#multiCheckbox").append('<input type="radio" name="payWay" state="' + 
                                    model[i].state + '" value="' + 
                                    model[i].id + '" title="' + 
                                    model[i].propertyValue + '">');
                            }
                            form.render("radio");
                            command.query(currentId);
                        }
                    }
                });
	            
	            form.on("submit(prevous)", function(data) {
                    currentId = command.queryWithIds(currentId, idsArray, -1);
                    return false;
                });
                form.on("submit(next)", function(data) {
                    currentId = command.queryWithIds(currentId, idsArray, +1);
                    return false;
                });
	        };
        </script>
        <jsp:include page="bill.jsp"></jsp:include>
    </body>   
</html>