package com.dazi.spa.modules.client.model;

import java.io.Serializable;
import java.util.Date;

public class Client implements Serializable {
    /**
     *  自增id
     */
    private Integer id;

    /**
     *  客户姓名
     */
    private String name;

    /**
     *  年龄
     */
    private Integer age;

    /**
     *  创建时间
     */
    private Date createTime;

    /**
     *  修改时间
     */
    private Date modifyTime;

    /**
     *  生日
     */
    private Date birthday;

    /**
     *  地址
     */
    private String addr;

    /**
     *  性别。0：女：1：男：3：其他
     */
    private Integer sex;

    /**
     *  联系电话
     */
    private String phone;

    /**
     *  用户头像
     */
    private Integer headImageId;

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

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
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

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // extend fields
    private Integer recordId;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getHeadImageId() {
        return headImageId;
    }

    public void setHeadImageId(Integer headImageId) {
        this.headImageId = headImageId;
    }

    private String headImageUrl;


    public String getHeadImageUrl() {
        return headImageUrl;
    }

    public void setHeadImageUrl(String headImageUrl) {
        this.headImageUrl = headImageUrl;
    }
}