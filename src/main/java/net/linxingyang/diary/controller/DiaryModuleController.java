package net.linxingyang.diary.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="diaryModule")
public class DiaryModuleController {

	
	/**
	 * 测试
	 * 
	 * @return
	 */
	@RequestMapping(value="/test")
	public String test(HttpServletRequest request) {
		return "diary/test/test";
	}
	
	/**
	 * 添加日记
	 * 
	 * @return
	 */
	@RequestMapping(value="/addDiary")
	public String addDiary(HttpServletRequest request) {
		return "diary/diary/addDiary";
	}
	
	/**
	 * 日记列表
	 * 
	 * @return
	 */
	@RequestMapping(value="/listDiary")
	public String listDiary(HttpServletRequest request) {
		return "diary/diary/listDiary";
	}
	
	/**
	 * 修改日记
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyDiary")
	public String modifyDiary(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "diary/diary/modifyDiary";
	}
	
	/**
	 * 查看日记
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewDiary")
	public String viewDiary(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "diary/diary/viewDiary";
	}
	
	
	/**
	 * 任务管理
	 * 
	 * @return
	 */
	@RequestMapping(value="/listTask")
	public String listTask(HttpServletRequest request) {
		return "diary/task/listTask";
	}
	
	/**
	 * 添加任务
	 * 
	 * @return
	 */
	@RequestMapping(value="/addTask")
	public String addTask() {
		return "diary/task/addTask";
	}
	
	/**
	 * 修改任务
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyTask")
	public String modifyTask(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "diary/task/modifyTask";
	}
	
	/**
	 * 查看任务
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewTask")
	public String viewTask(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "diary/task/viewTask";
	}
	
	
	/**
	 * 添加任务安排
	 * 
	 * @return
	 */
	@RequestMapping(value="/addTaskPlan")
	public String addTaskPlan(HttpServletRequest request) {
		return "diary/taskPlan/addTaskPlan";
	}
	
	/**
	 * 添加任务和任务安排
	 * 
	 * @return
	 */
	@RequestMapping(value="/addTaskAndTaskPlan")
	public String addTaskAndTaskPlan(HttpServletRequest request) {
		return "diary/taskPlan/addTaskAndTaskPlan";
	}
	
	
	/**
	 * 显示某天任务安排
	 * 
	 * @return
	 */
	@RequestMapping(value="/listTaskPlan")
	public String listTaskPlan(HttpServletRequest request) {
		return "diary/taskPlan/listTaskPlan";
	}
	
	/**
	 * 显示某个任务安排
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewTaskPlan")
	public String viewTaskPlan(Integer id, HttpServletRequest request) {
		request.setAttribute("id", id);
		return "diary/taskPlan/viewTaskPlan";
	}
	
	/**
	 * 修改某个任务安排
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyTaskPlan")
	public String modifyTaskPlan(Integer id, HttpServletRequest request) {
		request.setAttribute("id", id);
		return "diary/taskPlan/modifyTaskPlan";
	}
    
    /**
     * 账单管理
     * 
     * @return
     */
    @RequestMapping(value="/listBill")
    public String listBill(HttpServletRequest request) {
    	return "diary/bill/listBill";
    }
    
    /**
     * 添加账单
     * 
     * @return
     */
    @RequestMapping(value="/addBill")
    public String addBill(HttpServletRequest request) {
    	return "diary/bill/addBill";
    }
    
    /**
     * 修改账单
     * 
     * @return
     */
    @RequestMapping(value="/modifyBill")
    public String modifyBill(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/bill/modifyBill";
    }
    
    /**
     * 查看账单
     * 
     * @return
     */
    @RequestMapping(value="/viewBill")
    public String viewBill(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/bill/viewBill";
    }
    public void setIds(HttpServletRequest request) {
    	String ids = request.getParameter("ids");
    	// 281,278,279,280,277,275,276,273,274,271,272,269,270,267,268,266,264,265,262,263,261,260,259,257,258,255,256,254,252,253
    	if (null != ids) {
    		StringBuilder jsonData = new StringBuilder();
    		jsonData.append("[");
    		jsonData.append(ids);
    		jsonData.append("]");
    		request.setAttribute("ids", jsonData.toString());
    	} else {
    		request.setAttribute("ids", "[]");
    	}
    }
    
    
    /**
     * 长期任务管理
     * 
     * @return
     */
    @RequestMapping(value="/listFutureTask")
    public String listFutureTask(HttpServletRequest request) {
    	return "diary/futureTask/listFutureTask";
    }
    
    /**
     * 添加长期任务
     * 
     * @return
     */
    @RequestMapping(value="/addFutureTask")
    public String addFutureTask(HttpServletRequest request) {
    	return "diary/futureTask/addFutureTask";
    }
    
    /**
     * 修改长期任务
     * 
     * @return
     */
    @RequestMapping(value="/modifyFutureTask")
    public String modifyFutureTask(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/futureTask/modifyFutureTask";
    }
    
    /**
     * 查看长期任务
     * 
     * @return
     */
    @RequestMapping(value="/viewFutureTask")
    public String viewFutureTask(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/futureTask/viewFutureTask";
    }
    
    
    /**
     * 长期任务明细管理-长期任务
     * 
     * @return
     */
    @RequestMapping(value="/listFutureTaskDetailForFutureTask")
    public String listFutureTaskDetailForFutureTask(HttpServletRequest request, Integer futureId) {
    	request.setAttribute("futureId", futureId);
    	return "diary/futureTaskDetail/listFutureTaskDetailForFutureTask";
    }
    
    /**
     * 长期任务明细管理-周任务
     * 
     * @return
     */
    @RequestMapping(value="/listFutureTaskDetailForWeekTask")
    public String listFutureTaskDetailForWeekTask(HttpServletRequest request, Integer futureId, String minPlanDate, String maxPlanDate) {
    	request.setAttribute("futureId", futureId);
    	request.setAttribute("minPlanDate", minPlanDate);
    	request.setAttribute("maxPlanDate", maxPlanDate);
    	return "diary/futureTaskDetail/listFutureTaskDetailForWeekTask";
    }
    
    /**
     * 长期任务明细管理
     * 
     * @return
     */
    @RequestMapping(value="/listFutureTaskDetail")
    public String listFutureTaskDetail(HttpServletRequest request) {
    	return "diary/futureTaskDetail/listFutureTaskDetail";
    }
    
    
    
    /**
     * 添加长期任务明细
     * 
     * @return
     */
    @RequestMapping(value="/addFutureTaskDetail")
    public String addFutureTaskDetail(HttpServletRequest request) {
    	request.setAttribute("futureId", request.getParameter("futureId"));
    	return "diary/futureTaskDetail/addFutureTaskDetail";
    }
    
    /**
     * 修改长期任务明细
     * 
     * @return
     */
    @RequestMapping(value="/modifyFutureTaskDetail")
    public String modifyFutureTaskDetail(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/futureTaskDetail/modifyFutureTaskDetail";
    }
    
    /**
     * 查看长期任务明细
     * 
     * @return
     */
    @RequestMapping(value="/viewFutureTaskDetail")
    public String viewFutureTaskDetail(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/futureTaskDetail/viewFutureTaskDetail";
    }
    
    
    
    /**
	 * 周任务管理
	 * 
	 * @return
	 */
	@RequestMapping(value="/listWeekTask")
	public String listWeekTask(HttpServletRequest request) {
		request.setAttribute("leftMenu", "task");
		return "diary/weekTask/listWeekTask";
	}

    /**
     * 添加周任务
     * 
     * @return
     */
    @RequestMapping(value="/addWeekTask")
    public String addWeekTask(HttpServletRequest request) {
    	return "diary/weekTask/addWeekTask";
    }
    
    /**
     * 修改周任务
     * 
     * @return
     */
    @RequestMapping(value="/modifyWeekTask")
    public String modifyWeekTask(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/weekTask/modifyWeekTask";
    }
    
    /**
     * 查看周任务
     * 
     * @return
     */
    @RequestMapping(value="/viewWeekTask")
    public String viewWeekTask(Integer id, HttpServletRequest request) {
    	setIds(request);
    	request.setAttribute("id", id);
    	return "diary/weekTask/viewWeekTask";
    }
    
    
}
