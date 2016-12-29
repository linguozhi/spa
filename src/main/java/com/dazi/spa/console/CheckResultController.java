package com.dazi.spa.console;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.client.model.CheckResult;
import com.dazi.spa.modules.client.service.CheckResultService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 检测结果
 * Created by lingz on 16/11/8.
 */
@Controller
@RequestMapping("checkResult")
public class CheckResultController {
    @Autowired
    private CheckResultService checkResultService;

    @RequestMapping("/index")
    public String index(CheckResult checkResult, Model model) {
        model.addAttribute("checkResult", checkResult);
        return "client/checkResult/index";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(CheckResult checkResult, Order order, int start, int length, int draw) {
        int total = checkResultService.selectTotal(checkResult);
        List<CheckResult> list = null;
        if(total > 0) {
            list = checkResultService.selectList(checkResult, order, start, length);
        }

        return ResponseHelper.buildDataTable(draw, total, list);
    }



    @RequestMapping("/edit")
    public String edit(Integer id, Model model) {
        CheckResult checkResult = new CheckResult();
        if(IntegerUtil.gtZero(id)) {
            checkResult = checkResultService.selectByPrimaryKey(id);
        }

        model.addAttribute("checkResult", checkResult);

        return "checkResult/checkResult/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(CheckResult checkResult) {

        int total = checkResultService.selectTotal(new CheckResult());

        if(checkResultService.insertSelective(checkResult) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(CheckResult checkResult) {
        Assert.notNull(checkResult.getId(), "id不能为空");

        if(checkResultService.updateByPrimaryKeySelective(checkResult) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(checkResultService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }
}
