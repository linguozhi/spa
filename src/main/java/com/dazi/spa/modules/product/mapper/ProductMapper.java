package com.dazi.spa.modules.product.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.product.model.Product;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    int selectTotal(@Param("record") Product record);

    List<Product> selectList(@Param("record") Product record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}