package net.linxingyang.book.mapper;

import java.util.List;
import net.linxingyang.book.pojo.BooklistConfig;
import net.linxingyang.book.pojo.BooklistConfigExample;
import org.apache.ibatis.annotations.Param;

public interface BooklistConfigMapper {
    int countByExample(BooklistConfigExample example);

    int deleteByExample(BooklistConfigExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BooklistConfig record);

    int insertSelective(BooklistConfig record);

    List<BooklistConfig> selectByExample(BooklistConfigExample example);

    BooklistConfig selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BooklistConfig record, @Param("example") BooklistConfigExample example);

    int updateByExample(@Param("record") BooklistConfig record, @Param("example") BooklistConfigExample example);

    int updateByPrimaryKeySelective(BooklistConfig record);

    int updateByPrimaryKey(BooklistConfig record);
}