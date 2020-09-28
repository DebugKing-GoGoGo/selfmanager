package net.linxingyang.personal.mapper;

import java.util.List;

import net.linxingyang.personal.pojo.FutureLetter;
import net.linxingyang.personal.pojo.FutureLetterExample;

import org.apache.ibatis.annotations.Param;

public interface FutureLetterMapper {
    int countByExample(FutureLetterExample example);

    int deleteByExample(FutureLetterExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FutureLetter record);

    int insertSelective(FutureLetter record);

    List<FutureLetter> selectByExampleWithBLOBs(FutureLetterExample example);

    List<FutureLetter> selectByExample(FutureLetterExample example);

    FutureLetter selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FutureLetter record, @Param("example") FutureLetterExample example);

    int updateByExampleWithBLOBs(@Param("record") FutureLetter record, @Param("example") FutureLetterExample example);

    int updateByExample(@Param("record") FutureLetter record, @Param("example") FutureLetterExample example);

    int updateByPrimaryKeySelective(FutureLetter record);

    int updateByPrimaryKeyWithBLOBs(FutureLetter record);

    int updateByPrimaryKey(FutureLetter record);
}