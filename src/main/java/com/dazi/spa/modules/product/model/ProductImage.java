package com.dazi.spa.modules.product.model;

import java.io.Serializable;
import java.util.Date;

public class ProductImage implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  产品id
     */
    private Integer productId;

    /**
     *  短地址
     */
    private String shortUrl;

    /**
     *  完整地址
     */
    private String url;

    /**
     *  创建时间
     */
    private Date createTime;

    /**
     *  修改时间
     */
    private Date modifyTime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getShortUrl() {
        return shortUrl;
    }

    public void setShortUrl(String shortUrl) {
        this.shortUrl = shortUrl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    // extend fields
    private String imageIdStr;

    public String getImageIdStr() {
        return imageIdStr;
    }

    public void setImageIdStr(String imageIdStr) {
        this.imageIdStr = imageIdStr;
    }

    private Integer itemId;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
}