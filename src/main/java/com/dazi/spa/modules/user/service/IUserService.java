package com.dazi.spa.modules.user.service;

import com.dazi.spa.modules.user.model.User;

/**
 * @author : linguozhi@52tt.com
 * @desc :
 * @date :  2017/2/23
 */
public interface IUserService {
    User login(String username, String pswd);

    int updateByPrimaryKeySelective(User user);
}
