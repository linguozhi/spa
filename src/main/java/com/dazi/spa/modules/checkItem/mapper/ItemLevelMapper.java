package com.dazi.spa.modules.checkItem.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.checkItem.model.ItemLevel;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ItemLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ItemLevel record);

    int insertSelective(ItemLevel record);

    ItemLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ItemLevel record);

    int updateByPrimaryKey(ItemLevel record);

    int selectTotal(@Param("record") ItemLevel record);

    List<com.dazi.spa.modules.checkItem.model.ItemLevel> selectList(@Param("record") ItemLevel record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}