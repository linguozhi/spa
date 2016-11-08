package com.dazi.spa.modules.client.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.client.model.CheckResult;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CheckResultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CheckResult record);

    int insertSelective(CheckResult record);

    CheckResult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CheckResult record);

    int updateByPrimaryKey(CheckResult record);

    int selectTotal(@Param("record") CheckResult record);

    List<com.dazi.spa.modules.client.model.CheckResult> selectList(@Param("record") CheckResult record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}