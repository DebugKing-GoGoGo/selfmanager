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
        <!-- jQuery -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.11.1.min.js"></script>
        <!-- layui -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
        <!-- 公共的JS -->
	    <script type="text/javascript">
	        ;(function(factory) {
	            window.common = factory();
	        }(function() {
	        	var g = {};
	        	// 所有页面跳转的url
	        	g.url = {
	        		// 图书 模块
        			booklist: {
                        title: "图书"
                        ,add:  "${pageContext.request.contextPath}" + "/booklist/addBooklist"
                        ,modify: "${pageContext.request.contextPath}" + "/booklist/modifyBooklist"
                        ,modifyWithTags: "${pageContext.request.contextPath}" + "/booklist/modifyBooklistWithTags" 
                        ,query: "${pageContext.request.contextPath}" + "/booklist/queryBooklist"
                        ,list: "${pageContext.request.contextPath}" + "/booklist/listBooklist"
                        ,goAdd: "${pageContext.request.contextPath}" + "/bookModule/addBooklist"
                        ,goModify: "${pageContext.request.contextPath}" + "/bookModule/modifyBooklist"
                        ,goView: "${pageContext.request.contextPath}" + "/bookModule/viewBooklist"
                        ,goList: "${pageContext.request.contextPath}" + "/bookModule/listBooklist"
                    }
	        	    // 个人模块
                    ,peopleHistory: {
                        title: "人物小传"
                        ,add:  "${pageContext.request.contextPath}" + "/peopleHistory/addPeopleHistory"
                        ,modify: "${pageContext.request.contextPath}" + "/peopleHistory/modifyPeopleHistory"
                        ,query: "${pageContext.request.contextPath}" + "/peopleHistory/queryPeopleHistory"
                        ,list: "${pageContext.request.contextPath}" + "/peopleHistory/listPeopleHistory"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addPeopleHistory"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyPeopleHistory"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewPeopleHistory"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listPeopleHistory"
                    }
                    ,personWord: {
                        title: "密语"
                        ,add:  "${pageContext.request.contextPath}" + "/personWord/addPersonWord"
                        ,modify: "${pageContext.request.contextPath}" + "/personWord/modifyPersonWord"
                        ,query: "${pageContext.request.contextPath}" + "/personWord/queryPersonWord"
                        ,list: "${pageContext.request.contextPath}" + "/personWord/listPersonWord"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addPersonWord"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyPersonWord"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewPersonWord"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listPersonWord"
                    }
                    ,word: {
                        title: "喜欢的话"
                        ,add:  "${pageContext.request.contextPath}" + "/word/addWord"
                        ,modify: "${pageContext.request.contextPath}" + "/word/modifyWord"
                        ,query: "${pageContext.request.contextPath}" + "/word/queryWord"
                        ,list: "${pageContext.request.contextPath}" + "/word/listWord"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addWord"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyWord"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewWord"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listWord"
                    }
                    ,futureLetter: {
                        title: "未来一封信"
                        ,add:  "${pageContext.request.contextPath}" + "/futureLetter/addFutureLetter"
                        ,modify: "${pageContext.request.contextPath}" + "/futureLetter/modifyFutureLetter"
                        ,query: "${pageContext.request.contextPath}" + "/futureLetter/queryFutureLetter"
                        ,list: "${pageContext.request.contextPath}" + "/futureLetter/listFutureLetter"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addFutureLetter"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyFutureLetter"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewFutureLetter"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listFutureLetter"
                    }
                    ,bigThing: {
                        title: "配置"
                        ,add:  "${pageContext.request.contextPath}" + "/bigThing/addBigThing"
                        ,modify: "${pageContext.request.contextPath}" + "/bigThing/modifyBigThing"
                        ,query: "${pageContext.request.contextPath}" + "/bigThing/queryBigThing"
                        ,list: "${pageContext.request.contextPath}" + "/bigThing/listBigThing"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addBigThing"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyBigThing"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewBigThing"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listBigThing"
                    }
                   
                    ,person: {
                        title: "认识的人"
                        ,add:  "${pageContext.request.contextPath}" + "/person/addPerson"
                        ,modify: "${pageContext.request.contextPath}" + "/person/modifyPerson"
                        ,query: "${pageContext.request.contextPath}" + "/person/queryPerson"
                        ,list: "${pageContext.request.contextPath}" + "/person/listPerson"
                        ,goAdd: "${pageContext.request.contextPath}" + "/personalModule/addPerson"
                        ,goModify: "${pageContext.request.contextPath}" + "/personalModule/modifyPerson"
                        ,goView: "${pageContext.request.contextPath}" + "/personalModule/viewPerson"
                        ,goList: "${pageContext.request.contextPath}" + "/personalModule/listPerson"
                    }
                    // 配置模块
                    ,config: {
                        title: "配置"
                        ,add:  "${pageContext.request.contextPath}" + "/config/addConfig"
                        ,modify: "${pageContext.request.contextPath}" + "/config/modifyConfig"
                        ,query: "${pageContext.request.contextPath}" + "/config/queryConfig"
                        ,list: "${pageContext.request.contextPath}" + "/config/listConfig"
                        ,goAdd: "${pageContext.request.contextPath}" + "/configModule/addConfig"
                        ,goModify: "${pageContext.request.contextPath}" + "/configModule/modifyConfig"
                        ,goView: "${pageContext.request.contextPath}" + "/configModule/viewConfig"
                        ,goList: "${pageContext.request.contextPath}" + "/configModule/listConfig"
                    }
                    // 日常模块
                    ,bill: {
                        title: "账单"
                        ,add:  "${pageContext.request.contextPath}" + "/bill/addBill"
                        ,modify: "${pageContext.request.contextPath}" + "/bill/modifyBill"
                        ,query: "${pageContext.request.contextPath}" + "/bill/queryBill"
                        ,list: "${pageContext.request.contextPath}" + "/bill/listBill"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addBill"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyBill"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewBill"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listBill"
                    }
                    ,diary: {
                        title: "日记"
                        ,add:  "${pageContext.request.contextPath}" + "/diary/addDiary"
                        ,modify: "${pageContext.request.contextPath}" + "/diary/modifyDiary"
                        ,query: "${pageContext.request.contextPath}" + "/diary/queryDiary"
                        ,list: "${pageContext.request.contextPath}" + "/diary/listDiary"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addDiary"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyDiary"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewDiary"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listDiary"
                    }
                    ,task: {
                        title: "任务"
                        ,add:  "${pageContext.request.contextPath}" + "/task/addTask"
                        ,modify: "${pageContext.request.contextPath}" + "/task/modifyTask"
                        ,query: "${pageContext.request.contextPath}" + "/task/queryTask"
                        ,list: "${pageContext.request.contextPath}" + "/task/listTask"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addTask"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyTask"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewTask"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listTask"
                    }
                    ,taskPlan: {
	        	        title: "任务安排"
                        ,add:  "${pageContext.request.contextPath}" + "/taskPlan/addTaskPlan"
                        ,modify: "${pageContext.request.contextPath}" + "/taskPlan/modifyTaskPlan"
                        ,query: "${pageContext.request.contextPath}" + "/taskPlan/queryTaskPlan"
                        ,list: "${pageContext.request.contextPath}" + "/taskPlan/listTaskPlan"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addTaskPlan"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyTaskPlan"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewTaskPlan"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listTaskPlan"
                        ,taskAndTaskPlanTitle: "任务和任务安排"
                        ,goAddTaskAndTaskPlan: "${pageContext.request.contextPath}" + "/diaryModule/addTaskAndTaskPlan"
                        ,addTaskAndTaskPlan: "${pageContext.request.contextPath}" + "/taskPlan/addTaskAndTaskPlan"
                    }
	        		,weekTask: {
	        			title: "周任务"
                        ,add:  "${pageContext.request.contextPath}" + "/weekTask/addWeekTask"
                        ,modify: "${pageContext.request.contextPath}" + "/weekTask/modifyWeekTask"
                        ,query: "${pageContext.request.contextPath}" + "/weekTask/queryWeekTask"
                        ,list: "${pageContext.request.contextPath}" + "/weekTask/listWeekTask"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addWeekTask"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyWeekTask"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewWeekTask"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listWeekTask"
	        		}	
	        		,futureTask: {
                        title: "长期任务"
                        ,add:  "${pageContext.request.contextPath}" + "/futureTask/addFutureTask"
                        ,modify: "${pageContext.request.contextPath}" + "/futureTask/modifyFutureTask"
                        ,query: "${pageContext.request.contextPath}" + "/futureTask/queryFutureTask"
                        ,list: "${pageContext.request.contextPath}" + "/futureTask/listFutureTask"
                        ,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addFutureTask"
                        ,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyFutureTask"
                        ,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewFutureTask"
                        ,goList: "${pageContext.request.contextPath}" + "/diaryModule/listFutureTask"
                    }   
	        		,futureTaskDetail: {
	        			title: "任务明细"
	        			,add:  "${pageContext.request.contextPath}" + "/futureTaskDetail/addFutureTaskDetail"
	        			,modify: "${pageContext.request.contextPath}" + "/futureTaskDetail/modifyFutureTaskDetail"
	        			,query: "${pageContext.request.contextPath}" + "/futureTaskDetail/queryFutureTaskDetail"
	        			,list: "${pageContext.request.contextPath}" + "/futureTaskDetail/listFutureTaskDetail"
	        			,goAdd: "${pageContext.request.contextPath}" + "/diaryModule/addFutureTaskDetail"
	        			,goModify: "${pageContext.request.contextPath}" + "/diaryModule/modifyFutureTaskDetail"
	        			,goView: "${pageContext.request.contextPath}" + "/diaryModule/viewFutureTaskDetail"
	        			,goList: "${pageContext.request.contextPath}" + "/diaryModule/listFutureTaskDetail"
	        			,goListForFutureTask: "${pageContext.request.contextPath}" + "/diaryModule/listFutureTaskDetailForFutureTask"
	        			,goListForWeekTask: "${pageContext.request.contextPath}" + "/diaryModule/listFutureTaskDetailForWeekTask"
	        		}	
	        	};
	        	
	        	// 添加、编辑和查看都是用这个来打开一个新页面的。
	        	g.layerOpen = function(data) {
	                var index = layer.open({
	                    type: 2
	                    ,title: data.title
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
	            };
	            
	            g.ajaxPost = function(params) {
	                params.type = "POST";
	                ajaxWrapper(params);
	            };
	        
	            g.ajaxGet = function(params) {
	                params.type = "GET";
	                ajaxWrapper(params);
	            };
	            /*
	             * 可传递参数
	             * ajax({
	             *     url: 连接
	             *     type: get/post 
	             *     data: 参数
	             *     dataType: "json" 默认JSON
	             *     selfDeal： 服务器返回处理失败，即data.code !== 0的情况下
	             *          =true: 则直接将data传给success()函数
	             *          =false: 默认：弹出错误原因后， 再将data传给success()函数
	             *     success: 成功回调
	             *     error: 失败回调 
	             *          如果不为空则传递给error方法处理错误情况
	             *          如果为空则弹出错误提示及原因
	             * })
	             */
	             ajaxWrapper = function(params) {
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
	                    	// 普通的请求，比如 查询/更新/查询列表等等
	                    	// 这些操作，如果失败了。我们可以在这里统一弹窗进行提示
	                    	// 从而使得这些请求的内部只需要处理正确的情况。
	                    	
	                    	// 特殊的请求，比如请求某个页面的中对应操作的URL，
	                    	// 这种请求不能有问题，如果有问题，这个页面就跑不动了。
	                    	// 所以这种请求可以留给特殊的请求内部处理出问题的情况
	                    	
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
	                            cb(data);
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
	            };
	            
	            /*
                // 获取页面的链接的键值对。将会得到指定链接的key,value，如
                // {addUrl: 'xxx', modifyUrl: 'xxx'}
                g.getConfigIdAndValue = function(params) {
                    // 如果没有设置访问的链接的类型，默认为在用的。
                    // params.selfDeal = params.selfDeal ? params.selfDeal : true;
                    params.data.state = params.data.state ? params.data.state : 0;
                    g.ajaxPost({
                        url: "${pageContext.request.contextPath}/config/listConfigPropertyIdAndPropertyValue"
                        ,data: params.data
                        ,selfDeal: true
                        ,success: function(data) {
                            if (0 === data.code) {
                                var cb = params.success;
                                if("function" === typeof cb) {
                                    cb(data);       
                                }
                            } else {
                                layer.alert("获取页面URL配置失败：" + data.message);
                            }
                        }
                        ,error: function(XMLHttpRequest, textStatus, errorThrown) {
                            layer.alert("获取页面URL配置失败：" + textStatus + "(" + errorThrown + ")");
                        }
                    });
                };
                */
	            
	            return g;
	        }));
	    </script>
    </body>   
</html>