package com.dazi.spa.modules.product.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.product.mapper.ProductMapper;
import com.dazi.spa.modules.product.model.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return productMapper.deleteByPrimaryKey(id);
    }

    public int insert(Product record) {
        Assert.notNull(record, "查询对象不能为空");
        return productMapper.insert(record);
    }

    public int insertSelective(Product record) {
        Assert.notNull(record, "查询对象不能为空");
        return productMapper.insertSelective(record);
    }

    public Product selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return productMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Product record) {
        Assert.notNull(record, "查询对象不能为空");
        return productMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(Product record) {
        Assert.notNull(record, "查询对象不能为空");
        return productMapper.selectTotal(record);
    }

    public List<Product> selectList(Product record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return productMapper.selectList(record, order, offset, count);
    }
}