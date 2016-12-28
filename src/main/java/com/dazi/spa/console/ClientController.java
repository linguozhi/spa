package com.dazi.spa.console;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.DateUtils;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.base.model.Image;
import com.dazi.spa.modules.base.service.ImageService;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import com.dazi.spa.modules.client.enums.SexEnum;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.Client;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import com.dazi.spa.modules.client.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("client")
public class ClientController extends BaseController {
    @Autowired
    private ClientService clientService;

    @Autowired
    private CheckItemService checkItemService;

    @Autowired
    private CheckResultService checkResultService;

    @Autowired
    private CheckRecordService checkRecordService;

    @Autowired
    private ImageService imageService;

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

        // 用户头像
        Image image = new Image();
        if(IntegerUtil.gtZero(id)) {
            client = clientService.selectByPrimaryKey(id);
            image = imageService.selectByPrimaryKey(client.getHeadImageId());
        }

        SexEnum[] sexList = SexEnum.values();

        model.addAttribute("client", client);
        model.addAttribute("sexList", sexList);
        model.addAttribute("image", image);

        return "client/client/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(Client client) {
        // 校验
        Assert.notNull(client.getName(), "客户名称不能为空");
        Assert.isTrue(IntegerUtil.gtZero(client.getAge()), "客户年龄不能小于1");

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
     * 获取客户信息
     * @param id
     * @return
     */
    @RequestMapping("/get")
    @ResponseBody
    public Map get(Integer id) {
        Assert.notNull(id, "id不能为空");

        Client client = clientService.selectByPrimaryKey(id);
        if (null != client) {
            Image image = imageService.selectByPrimaryKey(client.getHeadImageId());

            client.setHeadImageUrl(image == null ? "" : image.getShortUrl());
        }

        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, client);
    }

    /**
     * 计算客户分值
     * @param id
     * @return
     */
    @RequestMapping("/caculate")
    @ResponseBody
    public Map caculate(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id), "id不能小于1");

        Client client = clientService.selectByPrimaryKey(id);
        Assert.notNull(client, "客户信息为空");

        // 最近检测记录
        CheckRecord latestCheckRecord = checkRecordService.getLatest(client.getId());

        // 生成检测记录
        CheckRecord checkRecord = new CheckRecord();
        checkRecord.setClientId(id);
        if(checkRecordService.save(checkRecord) < 1) {
            return ResponseHelper.buildErrorResult("生成检测记录失败");
        }

        client.setRecordId(checkRecord.getId());

        List<String> errors = new ArrayList<>();
        // 当天检测
        if(latestCheckRecord != null
                && DateUtils.format(latestCheckRecord.getCreateTime(), "yyyyMMdd").equals(DateUtils.format(new Date(), "yyyyMMdd"))) {
            // 计算
            checkResultService.caculate(client, latestCheckRecord, errors);
        } else {
            checkResultService.caculate(client, errors);
        }

        if(CollectionUtils.isEmpty(errors)) {
            return ResponseHelper.buildSuccessResult("检测完成");

        } else {
            return ResponseHelper.buildErrorResult("检测完成,但存在错误:" + JSON.toJSONString(errors));
        }
    }

}