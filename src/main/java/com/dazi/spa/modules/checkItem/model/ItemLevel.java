package com.dazi.spa.modules.checkItem.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class ItemLevel implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  名称
     */
    private String name;

    /**
     *  品项id
     */
    private Integer itemId;

    /**
     *  分值(左开)
     */
    private BigDecimal gtScore;

    /**
     *  分值(右闭)
     */
    private BigDecimal ltScore;

    /**
     *  创建时间
     */
    private Date createTime;

    /**
     *  修改时间
     */
    private Date modifyTime;

    private static final long serialVersionUID = 1L;
    private BigDecimal score;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public BigDecimal getGtScore() {
        return gtScore;
    }

    public void setGtScore(BigDecimal gtScore) {
        this.gtScore = gtScore;
    }

    public BigDecimal getLtScore() {
        return ltScore;
    }

    public void setLtScore(BigDecimal ltScore) {
        this.ltScore = ltScore;
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

    public void setScore(BigDecimal score) {
        this.score = score;
    }

    public BigDecimal getScore() {
        return score;
    }
}