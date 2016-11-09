package com.dazi.spa.modules.client.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.client.model.CheckRecord;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CheckRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CheckRecord record);

    int insertSelective(CheckRecord record);

    CheckRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CheckRecord record);

    int updateByPrimaryKey(CheckRecord record);

    int selectTotal(@Param("record") CheckRecord record);

    List<com.dazi.spa.modules.client.model.CheckRecord> selectList(@Param("record") CheckRecord record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}