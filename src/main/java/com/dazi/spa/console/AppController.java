package com.dazi.spa.console;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @desc: 应用入口
 * @author:linguozhi@52tt.com
 * @date: 2016/10/19
 */
@Controller
@RequestMapping("")
public class AppController extends BaseController {

    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
