package net.linxingyang.personal.mapper;

import java.util.List;

import net.linxingyang.personal.pojo.BigThing;
import net.linxingyang.personal.pojo.BigThingExample;

import org.apache.ibatis.annotations.Param;

public interface BigThingMapper {
    int countByExample(BigThingExample example);

    int deleteByExample(BigThingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BigThing record);

    int insertSelective(BigThing record);

    List<BigThing> selectByExample(BigThingExample example);

    BigThing selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BigThing record, @Param("example") BigThingExample example);

    int updateByExample(@Param("record") BigThing record, @Param("example") BigThingExample example);

    int updateByPrimaryKeySelective(BigThing record);

    int updateByPrimaryKey(BigThing record);
}