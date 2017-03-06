package com.dazi.spa.console;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.shiro.token.manager.TokenManager;
import com.dazi.spa.modules.user.model.User;
import com.dazi.spa.modules.user.service.UserService;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index() {
        return "index.html";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(User user, Order order, int start, int length, int draw) {
        int total = userService.selectTotal(user);
        List<User> list = null;
        if(total > 0) {
            list = userService.selectList(user, order, start, length);
        }
        
        return ResponseHelper.buildDataTable(draw, total, list);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(User user) {
        Assert.notNull("user.getId() , id not null");
        
        if (userService.updateByPrimaryKeySelective(user) < 1 ) {
            return ResponseHelper.buildErrorResult("更新失败");
        }
        
        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(User user) {
        if (userService.insertSelective(user) < 1 ) {
            return ResponseHelper.buildErrorResult(" 添加失败 ");
        }
        
        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/detail")
    public String detail(Long id, Model model) {
        User user = userService.selectByPrimaryKey(id);

        model.addAttribute("user", user);
        return "user/detail";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(Long id) {
        if (userService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }
        
        return ResponseHelper.buildSuccessResult("删除成功");
    }

}