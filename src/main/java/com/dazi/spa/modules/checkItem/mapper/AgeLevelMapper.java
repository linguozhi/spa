package com.dazi.spa.modules.checkItem.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.checkItem.model.AgeLevel;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AgeLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AgeLevel record);

    int insertSelective(AgeLevel record);

    AgeLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AgeLevel record);

    int updateByPrimaryKey(AgeLevel record);

    int selectTotal(@Param("record") AgeLevel record);

    List<com.dazi.spa.modules.checkItem.model.AgeLevel> selectList(@Param("record") AgeLevel record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);

    int deleteByItemId(Integer itemId);
}