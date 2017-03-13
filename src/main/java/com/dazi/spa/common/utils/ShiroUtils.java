package com.dazi.spa.common.utils;

import com.dazi.spa.modules.user.model.User;
import org.apache.shiro.SecurityUtils;

/**
 * @author : linguozhi@52tt.com
 * @desc :
 * @date :  2017/3/13
 */
public class ShiroUtils {
    public static Long getUserId() {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        Long userId = 0L;
        if (null != user) {
            userId = user.getId();
        }

        return userId;
    }
}
