package com.dazi.spa.portal;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.modules.client.model.Client;
import com.dazi.spa.modules.client.service.ClientService;
import com.dazi.spa.modules.user.model.User;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @desc: 前台客户
 * @author:linguozhi@52tt.com
 * @date: 2016/11/14
 */
@Controller
@RequestMapping("portal/client")
public class PortalClientController {
    @Autowired
    private ClientService clientService;

//    @RequestMapping("/index")
//    public String index() {
//
//        return "portal/client/index";
//    }

    @RequestMapping("/client")
    public String client() {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        System.out.print(user.getEmail());
        return "client";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(Client client, int start, int length) {
        int total = clientService.selectTotal(client);
        List<Client> list = null;
        if(total > 0) {
            list = clientService.getList(client, Order.build(), start, length);
        }

        return ResponseHelper.buildDataTable(1, total, list);
    }
}
