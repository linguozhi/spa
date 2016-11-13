package com.dazi.spa.modules.client.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CheckResult implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  客户id
     */
    private Integer clientId;

    /**
     *  品项id
     */
    private Integer itemId;

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


    /**
     * 检测记录id
     */
    private Integer recordId;

    /**
     * 参考值
     */
    private BigDecimal generalScore;

    private static final long serialVersionUID = 1L;
    private Integer parentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
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

    public BigDecimal getGeneralScore() {
        return generalScore;
    }

    public void setGeneralScore(BigDecimal generalScore) {
        this.generalScore = generalScore;
    }


    // extend fields
    /**
     * 客户姓名
     */
    private String clientName;

    /**
     * 品项名称
     */
    private String itemName;

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getParentId() {
        return parentId;
    }
}