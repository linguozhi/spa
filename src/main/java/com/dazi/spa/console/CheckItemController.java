package com.dazi.spa.console;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.AgeLevel;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.AgeLevelService;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import org.apache.commons.lang.StringUtils;
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
@RequestMapping("checkItem")
public class CheckItemController {
    @Autowired
    private CheckItemService checkItemService;

    @Autowired
    private AgeLevelService ageLevelService;


    @RequestMapping("/index")
    public String index() {
        return "checkItem/checkItem/index";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(CheckItem checkItem, Order order, int start, int length, int draw) {
        // 查询一级品项
        checkItem.setParentId(0);
        int total = checkItemService.selectTotal(checkItem);
        List<CheckItem> list = null;
        if(total > 0) {
            list = checkItemService.selectList(checkItem, order, start, length);
        }

        return ResponseHelper.buildDataTable(draw, total, list);
    }



    @RequestMapping("/edit")
    public String edit(Integer id, Model model) {
        CheckItem checkItem = new CheckItem();
        List<AgeLevel> ageLevelList = null;
        List<CheckItem> childItemList = null;

        if(IntegerUtil.gtZero(id)) {
            checkItem = checkItemService.selectByPrimaryKey(id);

            // search age level list
            ageLevelList = ageLevelService.selectListByItemId(id);

            // search child items
            childItemList = checkItemService.selectListByParentId(id);
        }

        model.addAttribute("childItemList", childItemList);
        model.addAttribute("ageLevelList", ageLevelList);
        model.addAttribute("checkItem", checkItem);

        return "checkItem/checkItem/edit";
    }

    @RequestMapping("/save")
    @ResponseBody
    public Map save(CheckItem checkItem, String ageLevelStr, String childItemStr) {

        checkItem.setCreateTime(new Date());
        if(checkItemService.insertSelective(checkItem) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        // 年龄设置
        List<AgeLevel> ageLevelList = null;
        if(StringUtils.isNotEmpty(ageLevelStr)){
            ageLevelList = JSON.parseArray(ageLevelStr, AgeLevel.class);
        }


        if(ageLevelService.save(checkItem.getId(), ageLevelList, false) < 1) {
            return ResponseHelper.buildErrorResult("年龄设置保存失败");
        }

        // 子品项设置
        List<CheckItem> childItemList = null;
        if(StringUtils.isNotEmpty(childItemStr)) {
            childItemList = JSON.parseArray(childItemStr, CheckItem.class);
        }

        if(checkItemService.save(checkItem.getId(), childItemList, false) < 1) {
            return ResponseHelper.buildErrorResult("子品项保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(CheckItem checkItem, String ageLevelStr, String childItemStr) {
        Assert.notNull(checkItem.getId(), "id不能为空");

        if(checkItemService.updateByPrimaryKeySelective(checkItem) < 1) {
            return ResponseHelper.buildErrorResult("保存失败");
        }

        List<AgeLevel> ageLevelList = null;
        if(StringUtils.isNotEmpty(ageLevelStr)){
            ageLevelList = JSON.parseArray(ageLevelStr, AgeLevel.class);
        }

        if(ageLevelService.save(checkItem.getId(), ageLevelList, true) < 1) {
            return ResponseHelper.buildErrorResult("年龄设置保存失败");
        }

        // 子品项设置
        List<CheckItem> childItemList = null;
        if(StringUtils.isNotEmpty(childItemStr)) {
            childItemList = JSON.parseArray(childItemStr, CheckItem.class);
        }

        if(checkItemService.save(checkItem.getId(), childItemList, true) < 1) {
            return ResponseHelper.buildErrorResult("子品项保存失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(checkItemService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

    /**
     * 获取所有检测品项
     * @return
     */
    @RequestMapping("/loadList")
    @ResponseBody
    public Map loadList(CheckItem checkItem, int start, int length) {
        checkItem.setParentId(0);

        List<CheckItem> list = checkItemService.selectList(checkItem, Order.build("order_no", "asc"), 0, -1);
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, list);
    }

}