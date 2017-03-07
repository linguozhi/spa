package com.dazi.spa.portal;

import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.shiro.token.manager.TokenManager;
import com.dazi.spa.console.BaseController;
import com.dazi.spa.modules.user.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lingz on 17/2/24.
 */
@Controller
@RequestMapping("portal/user")
public class PortalUserController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(PortalUserController.class);

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

    @RequestMapping("/login")
    public String login(Model model) {
        return "login";
    }

}
