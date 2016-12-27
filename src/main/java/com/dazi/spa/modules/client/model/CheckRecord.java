package com.dazi.spa.modules.client.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CheckRecord implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  客户id
     */
    private Integer clientId;

    /**
     *  创建时间
     */
    private Date createTime;

    /**
     *  修改时间
     */
    private Date modifyTime;

    /**
     *  上次检测时间
     */
    private Date prevTime;

    /**
     *  第几次检测
     */
    private Integer times;

    private static final long serialVersionUID = 1L;

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

    public Date getPrevTime() {
        return prevTime;
    }

    public void setPrevTime(Date prevTime) {
        this.prevTime = prevTime;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    // ext
    private String clientName;

    public String getClientName() {

        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    /**
     * 检测记录对应的检测成绩
     */
    private List<CheckResult> checkResultList;

    public List<CheckResult> getCheckResultList() {
        return checkResultList;
    }

    public void setCheckResultList(List<CheckResult> checkResultList) {
        this.checkResultList = checkResultList;
    }
}