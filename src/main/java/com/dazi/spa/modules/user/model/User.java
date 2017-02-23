package com.dazi.spa.modules.user.model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    /**
     *  
     */
    private Long id;

    /**
     *  用户昵称
     */
    private String nickname;

    /**
     *  邮箱|登录帐号
     */
    private String email;

    /**
     *  密码
     */
    private String pswd;

    /**
     *  创建时间
     */
    private Date createTime;

    /**
     *  最后登录时间
     */
    private Date lastLoginTime;

    /**
     *  1:有效，0:禁止登录
     */
    private Long status;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }
}