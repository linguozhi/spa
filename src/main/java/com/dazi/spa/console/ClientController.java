package com.dazi.spa.console;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import com.dazi.spa.modules.client.model.Client;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import com.dazi.spa.modules.client.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("client")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @Autowired
    private CheckItemService checkItemService;

    @Autowired
    private CheckResultService checkResultService;

    @Autowired
    private CheckRecordService checkRecordService;

    @RequestMapping("/index")
    public String index() {
        return "client/client/index";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(Client client, Order order, int start, int length, int draw) {
        int total = clientService.selectTotal(client);
        List<Client> list = null;
        if(total > 0) {
            list = clientService.selectList(client, order, start, length);
        }

        return ResponseHelper.buildDataTable(draw, total, list);
    }



    @RequestMapping("/edit")
    public String edit(Integer id, Model model) {
        Client client = new Client();
        if(IntegerUtil.gtZero(id)) {
            client = clientService.selectByPrimaryKey(id);
        }

        model.addAttribute("client", client);

        return "client/client/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(Client client) {

        int total = clientService.selectTotal(new Client());

        client.setCreateTime(new Date());
        if(clientService.insertSelective(client) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(Client client) {
        Assert.notNull(client.getId(), "id不能为空");

        if(clientService.updateByPrimaryKeySelective(client) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(clientService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    /**
     * 计算客户分值
     * @param id
     * @return
     */
    @RequestMapping("/caculate")
    @ResponseBody  public Map caculte(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id), "id不能小于1");

        Client client = clientService.selectByPrimaryKey(id);
        Assert.notNull(client, "客户信息为空");

        // 生成检测记录
        if(checkRecordService.save(id) < 1) {
            return ResponseHelper.buildErrorResult("生成检测记录失败");
        }


        // 获取顶级品项
        List<CheckItem> topItemList = checkItemService.getTopItemList();

        // 计算顶级品项分数
        checkResultService.caculateTopItemList(client, topItemList);

        return ResponseHelper.buildSuccessResult("检测完成");


    }

}