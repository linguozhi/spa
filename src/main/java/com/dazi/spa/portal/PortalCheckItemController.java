package com.dazi.spa.portal;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.console.BaseController;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by lingz on 17/2/24.
 */
@Controller
@RequestMapping("portal/checkItem")
public class PortalCheckItemController extends BaseController {
    @Autowired
    private CheckItemService checkItemService;

    /**
     * 获取所有检测品项
     * @return
     */
    @RequestMapping("/loadList")
    @ResponseBody
    public Map loadList(CheckItem checkItem, int start, int length) {
        checkItem.setParentId(0);

        List<CheckItem> list = checkItemService.selectList(checkItem, Order.build("order_no", "asc"), start, length);
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, list);
    }

}
