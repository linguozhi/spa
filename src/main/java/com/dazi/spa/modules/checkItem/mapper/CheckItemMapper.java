package com.dazi.spa.modules.checkItem.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CheckItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CheckItem record);

    int insertSelective(CheckItem record);

    CheckItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CheckItem record);

    int updateByPrimaryKey(CheckItem record);

    int selectTotal(@Param("record") CheckItem record);

    List<CheckItem> selectList(@Param("record") CheckItem record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);

    int deleteByParentId(Integer parentId);
}