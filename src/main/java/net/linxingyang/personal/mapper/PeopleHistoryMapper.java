package net.linxingyang.personal.mapper;

import java.util.List;

import net.linxingyang.personal.pojo.PeopleHistory;
import net.linxingyang.personal.pojo.PeopleHistoryExample;

import org.apache.ibatis.annotations.Param;

public interface PeopleHistoryMapper {
    int countByExample(PeopleHistoryExample example);

    int deleteByExample(PeopleHistoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PeopleHistory record);

    int insertSelective(PeopleHistory record);

    List<PeopleHistory> selectByExampleWithBLOBs(PeopleHistoryExample example);

    List<PeopleHistory> selectByExample(PeopleHistoryExample example);

    PeopleHistory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PeopleHistory record, @Param("example") PeopleHistoryExample example);

    int updateByExampleWithBLOBs(@Param("record") PeopleHistory record, @Param("example") PeopleHistoryExample example);

    int updateByExample(@Param("record") PeopleHistory record, @Param("example") PeopleHistoryExample example);

    int updateByPrimaryKeySelective(PeopleHistory record);

    int updateByPrimaryKeyWithBLOBs(PeopleHistory record);

    int updateByPrimaryKey(PeopleHistory record);
}