package com.dazi.spa.modules.product.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.product.mapper.ProductImageMapper;
import com.dazi.spa.modules.product.model.ProductImage;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class ProductImageService {
    @Autowired
    private ProductImageMapper productImageMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return productImageMapper.deleteByPrimaryKey(id);
    }

    public int insert(ProductImage record) {
        Assert.notNull(record, "查询对象不能为空");
        return productImageMapper.insert(record);
    }

    public int insertSelective(ProductImage record) {
        Assert.notNull(record, "查询对象不能为空");
        record.setCreateTime(new Date());
        return productImageMapper.insertSelective(record);
    }

    public ProductImage selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return productImageMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(ProductImage record) {
        Assert.notNull(record, "查询对象不能为空");
        return productImageMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(ProductImage record) {
        Assert.notNull(record, "查询对象不能为空");
        return productImageMapper.selectTotal(record);
    }

    public List<ProductImage> selectList(ProductImage record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return productImageMapper.selectList(record, order, offset, count);
    }

    public int update(Integer productId, String imageIdStr) {
        Assert.isTrue(IntegerUtil.gtZero(productId), "productId not lesss than 1");
        Assert.hasLength(imageIdStr, "图片id不能为空");

        ProductImage record = new ProductImage();
        record.setImageIdStr(imageIdStr);
        record.setProductId(productId);

        return productImageMapper.updateByImageIdStrSelective(record);
    }

    public List<ProductImage> selectListByProductId(Integer productId) {
        Assert.isTrue(IntegerUtil.gtZero(productId), "productId not lesss than 1");

        ProductImage record = new ProductImage();
        record.setProductId(productId);

        return selectList(record, null, 0, -1);
    }
}