package com.dazi.spa.modules.checkItem.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class AgeLevel implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  品项id
     */
    private Integer itemId;

    /**
     *  年龄(左开)
     */
    private Integer gtAge;

    /**
     *  年龄(右闭)
     */
    private Integer ltAge;

    /**
     *  分值
     */
    private BigDecimal score;

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

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getGtAge() {
        return gtAge;
    }

    public void setGtAge(Integer gtAge) {
        this.gtAge = gtAge;
    }

    public Integer getLtAge() {
        return ltAge;
    }

    public void setLtAge(Integer ltAge) {
        this.ltAge = ltAge;
    }

    public BigDecimal getScore() {
        return score;
    }

    public void setScore(BigDecimal score) {
        this.score = score;
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
    private Integer age;

    public Integer getAge() {
        return this.age;
    }

    public void setAge(int age) {
        this.age = age;

    }
}