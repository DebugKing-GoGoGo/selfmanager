package net.linxingyang.diary.mapper;

import java.util.List;
import net.linxingyang.diary.pojo.TaskPlan;
import net.linxingyang.diary.pojo.TaskPlanExample;
import org.apache.ibatis.annotations.Param;

public interface TaskPlanMapper {
    int countByExample(TaskPlanExample example);

    int deleteByExample(TaskPlanExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TaskPlan record);

    int insertSelective(TaskPlan record);

    List<TaskPlan> selectByExample(TaskPlanExample example);

    TaskPlan selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TaskPlan record, @Param("example") TaskPlanExample example);

    int updateByExample(@Param("record") TaskPlan record, @Param("example") TaskPlanExample example);

    int updateByPrimaryKeySelective(TaskPlan record);

    int updateByPrimaryKey(TaskPlan record);
}