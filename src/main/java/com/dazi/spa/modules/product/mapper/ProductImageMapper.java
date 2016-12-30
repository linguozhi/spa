package com.dazi.spa.modules.product.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.product.model.ProductImage;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);

    ProductImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKey(ProductImage record);

    int selectTotal(@Param("record") ProductImage record);

    List<ProductImage> selectList(@Param("record") ProductImage record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);

    int deleteByProductId(Integer productId);
}