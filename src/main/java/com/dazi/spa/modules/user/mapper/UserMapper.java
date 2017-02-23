package com.dazi.spa.modules.user.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.user.model.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int selectTotal(@Param("record") User record);

    List<com.dazi.spa.modules.user.model.User> selectList(@Param("record") User record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}