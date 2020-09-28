package net.linxingyang.diary.mapper;

import java.util.List;
import net.linxingyang.diary.pojo.Bill;
import net.linxingyang.diary.pojo.BillExample;
import org.apache.ibatis.annotations.Param;

public interface BillMapper {
    int countByExample(BillExample example);

    int deleteByExample(BillExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bill record);

    int insertSelective(Bill record);

    List<Bill> selectByExample(BillExample example);

    Bill selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByExample(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
}