package com.dazi.spa.modules.base.mapper;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.base.model.Image;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Image record);

    int insertSelective(Image record);

    Image selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Image record);

    int updateByPrimaryKey(Image record);

    int selectTotal(@Param("record") Image record);

    List<Image> selectList(@Param("record") Image record, @Param("order") Order order, @Param("offset") int offset, @Param("count") int count);
}