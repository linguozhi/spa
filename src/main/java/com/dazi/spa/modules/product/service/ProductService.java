package com.dazi.spa.modules.product.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.base.model.Image;
import com.dazi.spa.modules.base.service.ImageService;
import com.dazi.spa.modules.product.mapper.ProductMapper;
import com.dazi.spa.modules.product.model.Product;
import java.util.List;

import com.dazi.spa.modules.product.model.ProductImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ProductImageService productImageService;

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

    public Product getByItemId(Integer itemId) {
        Assert.isTrue(IntegerUtil.gtZero(itemId), "itemId not less than1");

        Product product = new Product();
        product.setItemId(itemId);

        List<Product> list = selectList(product, null, 0, 1);
        product = CollectionUtils.isEmpty(list) ? null : list.get(0);
        if (null != product) {
            ProductImage productImage = productImageService.getByProductId(product.getId());
            if (null != productImage) {
                product.setImageUrl(productImage.getShortUrl());
            }
        }

        return product;
    }
}