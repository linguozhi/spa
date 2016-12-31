package com.dazi.spa.portal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @desc: 前台客户
 * @author:linguozhi@52tt.com
 * @date: 2016/11/14
 */
@Controller
@RequestMapping("")
public class PortalClientController {

//    @RequestMapping("/index")
//    public String index() {
//
//        return "portal/client/index";
//    }

    @RequestMapping("/client")
    public String client() {
        return "client";
    }
}
