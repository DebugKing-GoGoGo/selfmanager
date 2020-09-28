package net.linxingyang.diary.service.impl;import java.util.ArrayList;import java.util.Date;import java.util.List;import net.linxingyang.common.utils.BeanCopyUtils;import net.linxingyang.common.utils.LightPageBean;import net.linxingyang.common.utils.PageBean;import net.linxingyang.common.vo.ResponseCode;import net.linxingyang.diary.mapper.TaskCustomMapper;import net.linxingyang.diary.mapper.TaskMapper;import net.linxingyang.diary.pojo.Task;import net.linxingyang.diary.pojo.TaskExample;import net.linxingyang.diary.qo.TaskQo;import net.linxingyang.diary.service.TaskService;import net.linxingyang.diary.vo.TaskVo;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Service;@Service("taskService")public class TaskServiceImpl implements TaskService {    private static Logger log = LoggerFactory.getLogger(TaskServiceImpl.class);    @Autowired    private TaskMapper taskMapper;    @Autowired    private TaskCustomMapper taskCustomMapper;    @Override    public void insert(Task task) throws Exception {        task.setCreateDate(new Date());        taskCustomMapper.insert(task);    }        @Override    public void update(Task task) throws Exception {        task.setModifyDate(new Date());        taskMapper.updateByPrimaryKeySelective(task);    }        @Override    public void delete(Integer id) throws Exception {        taskMapper.deleteByPrimaryKey(id);    }        @Override    public List<Task> selectAll() throws Exception {        return taskMapper.selectByExample(null);    }        @Override    public List<Task> selectByExample(TaskExample qo) throws Exception {        return taskMapper.selectByExample(qo);    }        @Override    public Task selectById(Integer id) throws Exception {        return taskMapper.selectByPrimaryKey(id);    }            @Override    public TaskVo selectVoById(Integer id) throws Exception {        Task task = taskMapper.selectByPrimaryKey(id);        if (null != task) {            return pojoToVo(task);        }        return null;            }        @Override    public PageBean<TaskVo> selectByQo(TaskQo qo) throws Exception {        PageBean<TaskVo> pageBean = new PageBean<TaskVo>();                         return pageBean;     }        @Override    public LightPageBean<TaskVo> selectByQo2(TaskQo qo) throws Exception {    	LightPageBean<TaskVo> lightPageBean = new LightPageBean<TaskVo>();    	lightPageBean.setPage(qo.getPage() == null ? 1 : qo.getPage());    	lightPageBean.setLimit(qo.getLimit() == null ? 10 : qo.getLimit());    	    	TaskExample taskExample = new TaskExample();    	TaskExample.Criteria condition = taskExample.createCriteria();    	    	if (null != qo.getTaskName()) {    		condition.andTaskNameLike("%" + qo.getTaskName() + "%");    	}    	if (null != qo.getDiscard()) {    		if (-1 != qo.getDiscard()) {    			// -1表示查询全部，即不包括此条件    			condition.andDiscardEqualTo(qo.getDiscard());    		}    	}    	    	lightPageBean.setCount(taskMapper.countByExample(taskExample));    	    	if (0 == lightPageBean.getCount()) {    		// 如果没数据，那就直接不用继续再查了。    		lightPageBean.setCode(ResponseCode.SUCCESS);    		lightPageBean.setMsg("没有符合条件的数据!");    		lightPageBean.setData(new ArrayList<TaskVo>());    		return lightPageBean;    	}    	    	    	// taskExample.setOffset(lightPageBean.getFromIndex());    	// taskExample.setLimit(5);    	// taskExample.setLimit(lightPageBean.getLimit());    	// 由于mybaits内部有判空，故此不判空。    	taskExample.setOrderByClause(qo.getOrderBy());    	List<Task> tasks = taskMapper.selectByExample(taskExample);    	lightPageBean.setData(TaskServiceImpl.pojoToVo(tasks));    	    	return lightPageBean;     }                private static TaskVo pojoToVo(Task task) throws Exception {        TaskVo taskVo = new TaskVo();        BeanCopyUtils.copy(task, taskVo);        return taskVo;    }    private static List<TaskVo> pojoToVo(List<Task> tasks) throws Exception {        List<TaskVo> taskVos = new ArrayList<TaskVo>();        for (Task d : tasks) {            taskVos.add(TaskServiceImpl.pojoToVo(d));        }        return taskVos;    }    public TaskMapper getTaskMapper() {        return taskMapper;    }    public void setTaskMapper(TaskMapper taskMapper) {        this.taskMapper = taskMapper;    }    public TaskCustomMapper getTaskCustomMapper() {        return taskCustomMapper;    }    public void setTaskCustomMapper(TaskCustomMapper taskCustomMapper) {        this.taskCustomMapper = taskCustomMapper;    }}