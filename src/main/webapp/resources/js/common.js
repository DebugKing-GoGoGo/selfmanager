

function layerOpen(data) {
	var index = layer.open({
        type: 2
        ,title: data.title
        ,area: ["443px", "549px"]
        ,shade: 0.5
        ,maxmin: true
        ,offset: "auto"
        ,content: data.url
        ,btn: ["关闭"]
        ,btn2: function(){
            layer.closeAll();
        }
        ,zIndex: layer.zIndex
        ,success: function(layero){
            layer.setTop(layero);
        }
    });
	layer.full(index);
}

function ajaxPost(params) {
	params.type = "POST";
	selfmanagerAjax(params);
}

function ajaxGet(params) {
	params.type = "GET";
	selfmanagerAjax(params);
}

function getConfig(params) {
    // 如果没有设置访问的链接的类型，默认为在用的。
    // params.selfDeal = params.selfDeal ? params.selfDeal : true;
    params.state = params.state ? params.state : 0;
    ajaxPost({
        url: "${pageContext.request.contextPath}/config/listConfig"
        ,data: params
        ,success: function(data) {
            if (0 === data.code) {
                layer.msg(data.message);
            }
        }
    });
};
/*
 * 可传递参数
 * ajax({
 *     url: 连接
 *     type: get/post 
 *     data: 参数
 *     dataType: "json" 默认JSON
 *     selfDeal： 服务器返回处理失败，即data.code !== 0的情况下
 *     		=true: 则直接将data传给success()函数
 *     		=false: 弹出错误原因后， 再将data传给success()函数
 *     success: 成功回调
 *     error: 失败回调 
 *     		如果不为空则自己处理错误情况
 *     		如果为空则弹出错误提示及原因
 * })
 */
function selfmanagerAjax(params) {
	if (!params.url) {
		layer.alert("url无效!");
		return;
	}
	// 默认JSON
	params.dataType =  params.dataType ? params.dataType : "json";
	
	$.ajax({
        url : params.url,
        type : params.type,
        data : params.data,
        dataType : params.dataType,
        success : function(data) {
        	if (!params.selfDeal) {
        		// 服务端请求处理结果不成功
        		var failDeal = (0 !== data.code); 
        		if (failDeal) {
        			// 当请求不成功时，弹出提示
        			// 请注意如果使用这里的提示，在success()函数中不要调用弹窗提示
        			// 因为会连带关闭这个提示
                    layer.alert(data.message, function(index){
                        layer.close(index);
                    }); 
            	}
        	}
        	var cb = params.success;
        	if ("function" === typeof cb) {
        		cb(data)
        	}
        }
        ,error: function(XMLHttpRequest, textStatus, errorThrown){
        	var ecb = params.error;
            if ("function" === typeof ecb) {
            	ecb(XMLHttpRequest, textStatus, errorThrown);
            } else {
            	layer.alert("访问服务器失败:" + textStatus + ":" + errorThrown);
            }
        } 
    });
}
