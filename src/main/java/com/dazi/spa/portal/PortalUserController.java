package com.dazi.spa.portal;

import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.shiro.token.manager.TokenManager;
<<<<<<< HEAD
import com.dazi.spa.console.BaseController;
import com.dazi.spa.modules.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
=======
import com.dazi.spa.modules.user.model.User;
import com.dazi.spa.modules.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
>>>>>>> 36c5b6cb52df82e8c70cbda2cc85192a86782092
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
<<<<<<< HEAD
 * Created by lingz on 17/2/24.
 */
@Controller
@RequestMapping("portal/user")
public class PortalUserController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(PortalUserController.class);
=======
 * @author : linguozhi@52tt.com
 * @desc :
 * @date :  2017/3/2
 */
@Controller
@RequestMapping("portal/user")
public class PortalUserController {
    private static final Logger logger = LoggerFactory.getLogger(PortalUserController.class);
    @Autowired
    private UserService userService;
>>>>>>> 36c5b6cb52df82e8c70cbda2cc85192a86782092
    /**
     * 登录
     */
    @RequestMapping("/submitLogin")
    @ResponseBody
    public Map submitLogin(User user, HttpServletRequest request) {
        try {
            TokenManager.login(user, true);
            return ResponseHelper.buildSuccessResult("登录成功");
        } catch (Exception ex) {
            logger.error("登录错误", ex);
            return ResponseHelper.buildErrorResult("登录失败");
        }
    }
<<<<<<< HEAD
=======

    @RequestMapping("/login")
    public String login(Model model) {
        return "login";
    }
>>>>>>> 36c5b6cb52df82e8c70cbda2cc85192a86782092
}
