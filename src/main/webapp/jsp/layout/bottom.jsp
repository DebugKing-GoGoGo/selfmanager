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
        <!-- 底部固定区域 -->
        <div class="layui-footer" style="text-align: center">
            <a target="_blank" href="https://github.com/linxingyang/selfmanager">项目源码GitHub地址</a>
            &nbsp;&nbsp;&nbsp;
            <a target="_blank" href="https://blog.csdn.net/JKL852qaz">作者:林兴洋</a>
            &nbsp;&nbsp;&nbsp;
            license:MIT
        </div>
    </body>   
    <script type="text/javascript">
// 父菜单项html
function menuHtml(menuId, menuName) {
	var html = '' + 
	    '<li class="layui-nav-item" id="' + menuId + '">' +
            '<a href="javascript:;">' + menuName + '</a>' +
                '<dl class="layui-nav-child">' +
                    // <dd><a href="${pageContext.request.contextPath}/bookModule/listBooklist">书单管理</a></dd>
                '</dl>' +
        '</li>';
    return html;
}
//渲染子菜单项
function renderMenuItem(menuId, menuItemName, menuItemValue) {
    $('li[id="' + menuId + '"]').find('dl.layui-nav-child')
        .append('<dd><a href="${pageContext.request.contextPath}/' + menuItemValue + '">' + menuItemName + '</a></dd>');
}

function renderMenu(menuConfigs) {
	var menuId = menuConfigs.groupId;
	var menuName = menuConfigs.groupName;
	var menuItemName = menuConfigs.propertyName;
	var menuItemValue = menuConfigs.propertyValue;
	if (!menuId || !menuName || !menuItemName || !menuItemValue) {
		return;
	}
	var menuExists = $('li[id="' + menuId + '"]').length;
	if (0 == menuExists) {
		var html = menuHtml(menuId, menuName);
		$("#leftMenu").append(html);
	}
	renderMenuItem(menuId, menuItemName, menuItemValue);
}

common.ajaxPost({
    url: common.url.config.list
    ,data: {
        type: "menu"
        ,state: 0
        // 菜单根据分组id和属性id升序排列
        // 所以如果想要菜单按照一定的顺序
        // 那就对分组id和属性id的命名就按照mysql默认升序的来。
        ,orderBy: "group_id asc, property_id asc"
    }
    ,success: function(data) {
        // console.log("menuConfigs::" + JSON.stringify(data));
        
        if (0 === data.code) {
        	var href = location.href;
            var currentLayuiNavItem = "";
            var menuConfigs = data.data;
            
            for (var i = 0; i < menuConfigs.length; i++) {
            	var index = href.indexOf("/selfmanager/");
            	var currentUrl = href.substring(index + 13);
            	
            	// if (-1 != href.indexOf(menuConfigs[i].propertyValue)) {
            	// 这样判断，那么如果propertyValue有两种情况：listTask和listTaskPlan
            	// 就会导致包含listTaskPlan的也包含listTask
            	
            	// 改成如下的就没有错了
            	if (currentUrl == menuConfigs[i].propertyValue) {
            		currentLayuiNavItem = menuConfigs[i].groupId;
            	}
                renderMenu(menuConfigs[i]);
            }
            $("#" + currentLayuiNavItem).addClass("layui-nav-itemed");
            layui.use(["element"], function() {
                   var element = layui.element;
                   element.render("nav");
            });
        }
    }
});
    </script>
</html>