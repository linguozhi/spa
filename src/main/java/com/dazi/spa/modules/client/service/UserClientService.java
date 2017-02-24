package com.dazi.spa.modules.client.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.client.mapper.UserClientMapper;
import com.dazi.spa.modules.client.model.UserClient;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class UserClientService {
    @Autowired
    private UserClientMapper userClientMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id,"id不能为空");
        return userClientMapper.deleteByPrimaryKey(id);
    }

    public int insert(UserClient record) {
        Assert.notNull(record, "查询对象不能为空");
        return userClientMapper.insert(record);
    }

    public int insertSelective(UserClient record) {
        Assert.notNull(record, "查询对象不能为空");
        return userClientMapper.insertSelective(record);
    }

    public UserClient selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return userClientMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(UserClient record) {
        Assert.notNull(record, "查询对象不能为空");
        return userClientMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(UserClient record) {
        Assert.notNull(record, "查询对象不能为空");
        return userClientMapper.selectTotal(record);
    }

    public List<UserClient> selectList(UserClient record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return userClientMapper.selectList(record, order, offset, count);
    }
}