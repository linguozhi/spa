package com.dazi.spa.modules.client.model;

import java.io.Serializable;

public class UserClient implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  用户id
     */
    private Long uid;

    /**
     *  客户id
     */
    private Integer cid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}