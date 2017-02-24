package com.dazi.spa.modules.client.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.client.model.UserClient;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserClientMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserClient record);

    int insertSelective(UserClient record);

    UserClient selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserClient record);

    int updateByPrimaryKey(UserClient record);

    int selectTotal(@Param("record") UserClient record);

    List<com.dazi.spa.modules.client.model.UserClient> selectList(@Param("record") UserClient record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}