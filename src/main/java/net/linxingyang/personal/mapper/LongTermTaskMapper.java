package net.linxingyang.personal.mapper;

import java.util.List;

import net.linxingyang.personal.pojo.LongTermTask;
import net.linxingyang.personal.pojo.LongTermTaskExample;

import org.apache.ibatis.annotations.Param;

public interface LongTermTaskMapper {
    int countByExample(LongTermTaskExample example);

    int deleteByExample(LongTermTaskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LongTermTask record);

    int insertSelective(LongTermTask record);

    List<LongTermTask> selectByExample(LongTermTaskExample example);

    LongTermTask selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LongTermTask record, @Param("example") LongTermTaskExample example);

    int updateByExample(@Param("record") LongTermTask record, @Param("example") LongTermTaskExample example);

    int updateByPrimaryKeySelective(LongTermTask record);

    int updateByPrimaryKey(LongTermTask record);
}