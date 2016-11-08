package com.dazi.spa.modules.checkItem.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CheckItem implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  检查品项
     */
    private String name;

    /**
     *  排序号
     */
    private Integer orderNo;

    /**
     *  权重
     */
    private BigDecimal weight;

    /**
     *  显示比例
     */
    private BigDecimal showRatio;

    /**
     *  随机比例
     */
    private BigDecimal randRatio;

    /**
     *  体验后增益比例
     */
    private BigDecimal addRatio;

    /**
     *  天衰减比例
     */
    private BigDecimal minusRatio;

    /**
     *  最大衰减比例
     */
    private BigDecimal maxMinusRatio;

    /**
     *  父品项id
     */
    private Integer parentId;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public BigDecimal getShowRatio() {
        return showRatio;
    }

    public void setShowRatio(BigDecimal showRatio) {
        this.showRatio = showRatio;
    }

    public BigDecimal getRandRatio() {
        return randRatio;
    }

    public void setRandRatio(BigDecimal randRatio) {
        this.randRatio = randRatio;
    }

    public BigDecimal getAddRatio() {
        return addRatio;
    }

    public void setAddRatio(BigDecimal addRatio) {
        this.addRatio = addRatio;
    }

    public BigDecimal getMinusRatio() {
        return minusRatio;
    }

    public void setMinusRatio(BigDecimal minusRatio) {
        this.minusRatio = minusRatio;
    }

    public BigDecimal getMaxMinusRatio() {
        return maxMinusRatio;
    }

    public void setMaxMinusRatio(BigDecimal maxMinusRatio) {
        this.maxMinusRatio = maxMinusRatio;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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
}