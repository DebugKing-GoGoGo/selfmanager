package net.linxingyang.personal.mapper;

import java.util.List;

import net.linxingyang.personal.pojo.PersonWord;
import net.linxingyang.personal.pojo.PersonWordExample;

import org.apache.ibatis.annotations.Param;

public interface PersonWordMapper {
    int countByExample(PersonWordExample example);

    int deleteByExample(PersonWordExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PersonWord record);

    int insertSelective(PersonWord record);

    List<PersonWord> selectByExample(PersonWordExample example);

    PersonWord selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") PersonWord record, @Param("example") PersonWordExample example);

    int updateByExample(@Param("record") PersonWord record, @Param("example") PersonWordExample example);

    int updateByPrimaryKeySelective(PersonWord record);

    int updateByPrimaryKey(PersonWord record);
}