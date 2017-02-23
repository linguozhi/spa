package com.dazi.spa.modules.user.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.user.mapper.UserMapper;
import com.dazi.spa.modules.user.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class UserService implements IUserService {
    @Autowired
    private UserMapper userMapper;

    public int deleteByPrimaryKey(Long id) {
        Assert.notNull(id,"id不能为空");
        return userMapper.deleteByPrimaryKey(id);
    }

    public int insert(User record) {
        Assert.notNull(record, "查询对象不能为空");
        return userMapper.insert(record);
    }

    public int insertSelective(User record) {
        Assert.notNull(record, "查询对象不能为空");
        return userMapper.insertSelective(record);
    }

    public User selectByPrimaryKey(Long id) {
        Assert.notNull(id, "查询对象不能为空");
        return userMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(User record) {
        Assert.notNull(record, "查询对象不能为空");
        return userMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(User record) {
        Assert.notNull(record, "查询对象不能为空");
        return userMapper.selectTotal(record);
    }

    public List<User> selectList(User record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return userMapper.selectList(record, order, offset, count);
    }

    /**
     * 登录
     * @param username
     * @param pswd
     * @return
     */
    @Override
    public User login(String username, String pswd) {
        Assert.notNull(username, "用户名不能为空");
        Assert.notNull(pswd, "密码不能为空");

        User user = new User();
        user.setEmail(username);
        user.setPswd(pswd);
        user.setStatus(1l);

        List<User> list = selectList(user, null, 0, 1);
        return CollectionUtils.isEmpty(list) ? null : list.get(0);

    }

}