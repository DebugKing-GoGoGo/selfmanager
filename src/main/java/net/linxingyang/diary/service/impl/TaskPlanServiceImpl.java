package net.linxingyang.diary.service.impl;import java.util.ArrayList;import java.util.Calendar;import java.util.Date;import java.util.List;import net.linxingyang.common.utils.BeanCopyUtils;import net.linxingyang.common.utils.DateUtils;import net.linxingyang.common.utils.LightPageBean;import net.linxingyang.common.utils.PageBean;import net.linxingyang.common.vo.ResponseCode;import net.linxingyang.diary.mapper.TaskPlanCustomMapper;import net.linxingyang.diary.mapper.TaskPlanMapper;import net.linxingyang.diary.pojo.TaskPlan;import net.linxingyang.diary.pojo.TaskPlanExample;import net.linxingyang.diary.qo.TaskPlanQo;import net.linxingyang.diary.service.TaskPlanService;import net.linxingyang.diary.service.TaskService;import net.linxingyang.diary.vo.TaskPlanVo;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Service;@Service("taskPlanService")public class TaskPlanServiceImpl implements TaskPlanService {    private static Logger log = LoggerFactory.getLogger(TaskPlanServiceImpl.class);    @Autowired    private TaskPlanMapper taskPlanMapper;    @Autowired    private TaskPlanCustomMapper taskPlanCustomMapper;    @Autowired    private TaskService taskService;    @Override    public void insert(TaskPlan taskPlan) throws Exception {        taskPlan.setCreateDate(new Date());        taskPlanMapper.insert(taskPlan);    }        private static void encapeTimeToCalendar(Calendar taskTime, String doTime) throws Exception{    	Date tempDate = DateUtils.TIME_STANDERED_SDF.parse(doTime);    	Calendar tempCalendar = Calendar.getInstance();    	tempCalendar.setTime(tempDate);    	taskTime.set(Calendar.HOUR_OF_DAY, tempCalendar.get(Calendar.HOUR_OF_DAY));    	taskTime.set(Calendar.MINUTE, tempCalendar.get(Calendar.MINUTE));    	taskTime.set(Calendar.SECOND, tempCalendar.get(Calendar.SECOND));    }        @Override    public void insert(TaskPlan taskPlan, String dateRange, String doTime) throws Exception {    	// 封装时间00:00:00    	Calendar taskTime = Calendar.getInstance();    	encapeTimeToCalendar(taskTime, doTime);    	    	// 遍历循环日期 2018-05-17 - 2018-05-17    	String startDateStr = dateRange.split(" - ")[0];    	String endDateStr = dateRange.split(" - ")[1];    	Calendar startDate = Calendar.getInstance();    	Calendar endDate = Calendar.getInstance();    	    	startDate.setTime(DateUtils.STANDERED_SDF.parse(startDateStr));    	endDate.setTime(DateUtils.STANDERED_SDF.parse(endDateStr));    	    	taskPlan.setCreateDate(new Date());    	    	boolean startDateLessOrEqualToEndDate = startDate.compareTo(endDate) <= 0;    	 do {    		 taskTime.set(Calendar.YEAR, startDate.get(Calendar.YEAR));    		 taskTime.set(Calendar.MONTH, startDate.get(Calendar.MONTH));    		 taskTime.set(Calendar.DATE, startDate.get(Calendar.DATE));    		 taskPlan.setDoDate(taskTime.getTime());    		     		 // System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(taskTime.getTime()));    		 // System.out.println(startDateLessOrEqualToEndDate);    		     		 startDate.add(Calendar.DATE, 1);    		 taskPlanMapper.insert(taskPlan);    		 startDateLessOrEqualToEndDate = startDate.compareTo(endDate) <= 0;    	 } while(startDateLessOrEqualToEndDate);    }        @Override    public void update(TaskPlan taskPlan) throws Exception {        taskPlan.setModifyDate(new Date());        taskPlanMapper.updateByPrimaryKeySelective(taskPlan);    }        @Override    public void delete(Integer id) throws Exception {        taskPlanMapper.deleteByPrimaryKey(id);    }        @Override    public List<TaskPlan> selectAll() throws Exception {        return taskPlanMapper.selectByExample(null);    }        @Override    public List<TaskPlan> selectByExample(TaskPlanExample qo) throws Exception {        return taskPlanMapper.selectByExample(qo);    }        @Override    public TaskPlan selectById(Integer id) throws Exception {        return taskPlanMapper.selectByPrimaryKey(id);    }            @Override    public TaskPlanVo selectVoById(Integer id) throws Exception {        TaskPlan taskPlan = taskPlanMapper.selectByPrimaryKey(id);        if (null != taskPlan) {        	TaskPlanVo taskPlanVo = pojoToVo(taskPlan);        	taskPlanVo.setTaskVo(taskService.selectVoById(taskPlanVo.getTaskId()));        	return taskPlanVo;        }        return null;    }        @Override    public PageBean<TaskPlanVo> selectByQo(TaskPlanQo qo) throws Exception {        PageBean<TaskPlanVo> pageBean = new PageBean<TaskPlanVo>();                         return pageBean;     }        @Override    public LightPageBean<TaskPlanVo> selectByQo2(TaskPlanQo qo) throws Exception {        LightPageBean<TaskPlanVo> lightPageBean = new LightPageBean<TaskPlanVo>();                lightPageBean.setPage(qo.getPage() == null ? 1 : qo.getPage());        lightPageBean.setLimit(qo.getLimit() == null ? 10 : qo.getLimit());                TaskPlanExample taskPlanExample = new TaskPlanExample();    	TaskPlanExample.Criteria condition = taskPlanExample.createCriteria();    	    	    	// 如果为空就查询今天的安排    	Calendar start = Calendar.getInstance();    	Calendar end = Calendar.getInstance();    	start.set(Calendar.HOUR_OF_DAY, 0);    	start.set(Calendar.MINUTE, 0);    	start.set(Calendar.SECOND, 0);        if (null != qo.getDoDate()) {        	start.setTime(qo.getDoDate());        }         end.setTime(start.getTime());        end.set(Calendar.DATE, end.get(Calendar.DATE) + 1);        // 2018-05-31 00:00:00.0(Timestamp), 2018-06-01 00:00:00.0(Timestamp)        // 这个会包含2018-06-01 00:00:00.0        // condition.andDoDateBetween(start.getTime(), end.getTime());                // 这样，左闭右开就不会了。        condition.andDoDateGreaterThanOrEqualTo(start.getTime());        condition.andDoDateLessThan(end.getTime());                lightPageBean.setCount(taskPlanMapper.countByExample(taskPlanExample));    	    	if (0 == lightPageBean.getCount()) {    		// 如果没数据，那就直接不用继续再查了。    		lightPageBean.setCode(ResponseCode.SUCCESS);    		lightPageBean.setMsg("没有符合条件的数据!");    		lightPageBean.setData(new ArrayList<TaskPlanVo>());    		return lightPageBean;    	}    	    	taskPlanExample.setOrderByClause(qo.getOrderBy());    	    	    	List<TaskPlan> taskPlans = taskPlanMapper.selectByExample(taskPlanExample);    	lightPageBean.setData(TaskPlanServiceImpl.pojoToVo(taskPlans));    	    	for (TaskPlanVo taskPlanVo : lightPageBean.getData()) {    		taskPlanVo.setTaskVo(taskService.selectVoById(taskPlanVo.getTaskId()));    	}    	        return lightPageBean;     }               private static TaskPlanVo pojoToVo(TaskPlan taskPlan) throws Exception {        TaskPlanVo taskPlanVo = new TaskPlanVo();        BeanCopyUtils.copy(taskPlan, taskPlanVo);        return taskPlanVo;    }        private static List<TaskPlanVo> pojoToVo(List<TaskPlan> taskPlans) throws Exception {        List<TaskPlanVo> taskPlanVos = new ArrayList<TaskPlanVo>();        for (TaskPlan d : taskPlans) {            taskPlanVos.add(TaskPlanServiceImpl.pojoToVo(d));        }        return taskPlanVos;    }    public TaskPlanMapper getTaskPlanMapper() {        return taskPlanMapper;    }    public void setTaskPlanMapper(TaskPlanMapper taskPlanMapper) {        this.taskPlanMapper = taskPlanMapper;    }    public TaskPlanCustomMapper getTaskPlanCustomMapper() {        return taskPlanCustomMapper;    }    public void setTaskPlanCustomMapper(TaskPlanCustomMapper taskPlanCustomMapper) {        this.taskPlanCustomMapper = taskPlanCustomMapper;    }}