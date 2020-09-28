package net.linxingyang.diary.mapper;

import java.util.List;
import net.linxingyang.diary.pojo.FutureTaskDetail;
import net.linxingyang.diary.pojo.FutureTaskDetailExample;
import org.apache.ibatis.annotations.Param;

public interface FutureTaskDetailMapper {
    int countByExample(FutureTaskDetailExample example);

    int deleteByExample(FutureTaskDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FutureTaskDetail record);

    int insertSelective(FutureTaskDetail record);

    List<FutureTaskDetail> selectByExample(FutureTaskDetailExample example);

    FutureTaskDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FutureTaskDetail record, @Param("example") FutureTaskDetailExample example);

    int updateByExample(@Param("record") FutureTaskDetail record, @Param("example") FutureTaskDetailExample example);

    int updateByPrimaryKeySelective(FutureTaskDetail record);

    int updateByPrimaryKey(FutureTaskDetail record);
}