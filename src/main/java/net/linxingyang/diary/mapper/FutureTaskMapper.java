package net.linxingyang.diary.mapper;

import java.util.List;
import net.linxingyang.diary.pojo.FutureTask;
import net.linxingyang.diary.pojo.FutureTaskExample;
import org.apache.ibatis.annotations.Param;

public interface FutureTaskMapper {
    int countByExample(FutureTaskExample example);

    int deleteByExample(FutureTaskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FutureTask record);

    int insertSelective(FutureTask record);

    List<FutureTask> selectByExample(FutureTaskExample example);

    FutureTask selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FutureTask record, @Param("example") FutureTaskExample example);

    int updateByExample(@Param("record") FutureTask record, @Param("example") FutureTaskExample example);

    int updateByPrimaryKeySelective(FutureTask record);

    int updateByPrimaryKey(FutureTask record);
}