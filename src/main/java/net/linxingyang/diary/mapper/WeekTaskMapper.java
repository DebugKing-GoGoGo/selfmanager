package net.linxingyang.diary.mapper;

import java.util.List;
import net.linxingyang.diary.pojo.WeekTask;
import net.linxingyang.diary.pojo.WeekTaskExample;
import org.apache.ibatis.annotations.Param;

public interface WeekTaskMapper {
    int countByExample(WeekTaskExample example);

    int deleteByExample(WeekTaskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(WeekTask record);

    int insertSelective(WeekTask record);

    List<WeekTask> selectByExample(WeekTaskExample example);

    WeekTask selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") WeekTask record, @Param("example") WeekTaskExample example);

    int updateByExample(@Param("record") WeekTask record, @Param("example") WeekTaskExample example);

    int updateByPrimaryKeySelective(WeekTask record);

    int updateByPrimaryKey(WeekTask record);
}