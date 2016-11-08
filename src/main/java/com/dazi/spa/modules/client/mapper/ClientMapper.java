package com.dazi.spa.modules.client.mapper;

import java.util.List;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.client.model.Client;
import org.apache.ibatis.annotations.Param;

public interface ClientMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Client record);

    int insertSelective(Client record);

    Client selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Client record);

    int updateByPrimaryKey(Client record);

    int selectTotal(@Param("record") Client record);

    List<Client> selectList(@Param("record") Client record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}