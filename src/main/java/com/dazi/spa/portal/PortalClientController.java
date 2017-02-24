package com.dazi.spa.portal;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.DateUtils;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.base.model.Image;
import com.dazi.spa.modules.base.service.ImageService;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.Client;
import com.dazi.spa.modules.client.model.UserClient;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import com.dazi.spa.modules.client.service.ClientService;
import com.dazi.spa.modules.client.service.UserClientService;
import com.dazi.spa.modules.user.model.User;
import com.dazi.spa.modules.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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


    @Autowired
    private ImageService imageService;

    @Autowired
    private UserClientService userClientService;


    @Autowired
    private CheckResultService checkResultService;


    @Autowired
    private CheckRecordService checkRecordService;

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

    @RequestMapping("/save")
    @ResponseBody
    public Map save(Client client) throws Exception{
        User user = (User)SecurityUtils.getSubject().getPrincipal();
        // 校验
        Assert.notNull(client.getName(), "客户名称不能为空");
        Assert.isTrue(IntegerUtil.gtZero(client.getAge()), "客户年龄不能小于1");

        if (!StringUtils.isEmpty(client.getBirthdayStr())) {
            client.setBirthday(DateUtils.parse(client.getBirthdayStr(), "yyyy-MM-dd"));
        }
        if(clientService.insertSelective(client) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        // 保存用户客户关系
        UserClient userClient = new UserClient();
        userClient.setCid(client.getId());
        userClient.setUid(user.getId());

        if (userClientService.insertSelective(userClient) < 1) {
            return ResponseHelper.buildErrorResult("用户-客户关系保存失败");
        }

        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, client.getId());
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

        Map<String , Object> result = new HashMap<>();
        result.put("recordId", checkRecord.getId());

        if(CollectionUtils.isEmpty(errors)) {
            return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, result);

        } else {
            return ResponseHelper.buildErrorResult("检测完成,但存在错误:" + JSON.toJSONString(errors));
        }
    }

}
