package net.linxingyang.book.mapper;

import java.util.List;

import net.linxingyang.book.pojo.Booklist;
import net.linxingyang.book.pojo.BooklistExample;

import org.apache.ibatis.annotations.Param;

public interface BooklistMapper {
    int countByExample(BooklistExample example);

    int deleteByExample(BooklistExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Booklist record);

    int insertSelective(Booklist record);

    List<Booklist> selectByExample(BooklistExample example);

    Booklist selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Booklist record, @Param("example") BooklistExample example);

    int updateByExample(@Param("record") Booklist record, @Param("example") BooklistExample example);

    int updateByPrimaryKeySelective(Booklist record);

    int updateByPrimaryKey(Booklist record);
}