package com.dazi.spa.modules.product.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.base.model.Image;
import com.dazi.spa.modules.product.mapper.ProductImageMapper;
import com.dazi.spa.modules.product.model.Product;
import com.dazi.spa.modules.product.model.ProductImage;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

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

    /**
     * 根据产品id查询
     * @param id
     * @return
     */
    public List<ProductImage> selectListByProductId(Integer productId) {
        Assert.isTrue(IntegerUtil.gtZero(productId), "productId not less than 1");

        ProductImage productImage = new ProductImage();
        productImage.setProductId(productId);

        return selectList(productImage, null, 0, -1);
    }

    /**
     * 更新产品图片
     * @param productId
     * @param imageIdStr
     * @return
     */
    public int update(Integer productId, String imageIdStr) {
        Assert.isTrue(IntegerUtil.gtZero(productId), "productId not less than 1");
        Assert.notNull(imageIdStr, "imageIdStr not null");

        if (deleteByProductId(productId) < 1) {
            //todo log error
        }

        List<String> imageIdList = Arrays.asList(imageIdStr.split(","));
        for (String imageId : imageIdList) {
            ProductImage productImage = new ProductImage();
            productImage.setProductId(productId);
            productImage.setImageId(Integer.parseInt(imageId));
            if (insertSelective(productImage) < 1) {
                // log error
            }
        }

        return 1;
    }

    public int deleteByProductId(Integer productId) {
        Assert.notNull(productId,"");

        return productImageMapper.deleteByProductId(productId);
    }


    /**
     * 根据产品id获取一张产品图片
     * @param id
     * @return
     */
    public ProductImage getByProductId(Integer productId) {
        Assert.isTrue(IntegerUtil.gtZero(productId), "productId not less than 1");

        List<ProductImage> list = selectListByProductId(productId);
        return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}