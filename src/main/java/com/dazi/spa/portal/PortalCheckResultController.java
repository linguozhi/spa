package com.dazi.spa.portal;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.CheckResult;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @desc: 检测成绩
 * @author:linguozhi@52tt.com
 * @date: 2016/11/11
 */
@Controller
@RequestMapping("portal/checkResult")
public class PortalCheckResultController {

    @Autowired
    private CheckResultService checkResultService;

    @Autowired
    private CheckRecordService checkRecordService;

    @Autowired
    private CheckItemService checkItemService;

    @RequestMapping("/index")
    public String index(CheckResult checkResult, int start, int length, Model model) {
        Assert.isTrue(IntegerUtil.gtZero(checkResult.getClientId()), "请选择查看用户");

        // 获取用户最近的检测记录
        CheckRecord latestCheckRecord = null;
        if(IntegerUtil.gtZero(checkResult.getRecordId())){
            latestCheckRecord = checkRecordService.selectByPrimaryKey(checkResult.getRecordId());
        } else {
            latestCheckRecord = checkRecordService.getLatest(checkResult.getClientId());
        }

        Assert.notNull(latestCheckRecord, "找不到该客户的检测记录");

        CheckItem record = new CheckItem();
        record.setParentId(0);
        int total = checkItemService.selectTotal(record);
        // 查看父品项
        CheckItem topCheckItem = null;
        if(IntegerUtil.gtZero(checkResult.getItemId())) {
            topCheckItem = checkItemService.selectByPrimaryKey(checkResult.getItemId());
        } else {
            List<CheckItem> topCheckItemList = checkItemService.selectList(record, Order.build("order_no", "asc"), start, length);
            topCheckItem = CollectionUtils.isEmpty(topCheckItemList) ? null : topCheckItemList.get(0);
        }

        Assert.notNull(topCheckItem, "找不到检测项");

        // 查找父品项检测成绩
        CheckResult checkResultRecord = new CheckResult();
        checkResultRecord.setRecordId(latestCheckRecord.getId());
        checkResultRecord.setItemId(topCheckItem.getId());
        List<CheckResult> topCheckResultList = checkResultService.selectList(checkResultRecord, null, 0, 1);

        CheckResult topCheckResult = CollectionUtils.isEmpty(topCheckResultList) ? null : topCheckResultList.get(0);

        // 查找子品项检测成绩
        checkResultRecord = new CheckResult();
        checkResultRecord.setRecordId(latestCheckRecord.getId());
        checkResultRecord.setParentId(topCheckItem.getId());

        List<CheckResult> childCheckResultList = checkResultService.selectList(checkResultRecord, null, 0, -1);

        model.addAttribute("topCheckItem", topCheckItem);
        model.addAttribute("topCheckResult", topCheckResult);
        model.addAttribute("childCheckResultList", childCheckResultList);
        model.addAttribute("total", total);
        model.addAttribute("start", start);
        model.addAttribute("clientId", checkResult.getClientId());
        return "portal/checkResult/index";
    }
}
