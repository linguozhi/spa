package com.dazi.spa.console;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.CheckResult;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author : linguozhi@52tt.com
 * @desc : 检测记录
 * @date :  2016/12/27
 */
@Controller
@RequestMapping("checkRecord")
public class CheckRecordController {
    @Autowired
    private CheckRecordService checkRecordService;

    @Autowired
    private CheckResultService checkResultService;

    @RequestMapping("/index")
    public String index() {
        return "client/checkRecord/index";
    }

    @RequestMapping("/getList")
    @ResponseBody
    public DataTable getList(CheckRecord checkRecord, Order order, int start, int length, int draw) {
        int total = checkRecordService.selectTotal(checkRecord);
        List<CheckRecord> list = null;
        if(total > 0) {
            list = checkRecordService.selectList(checkRecord, order, start, length);
        }

        return ResponseHelper.buildDataTable(draw, total, list);
    }

    /**
     * 获取客户检测记录
     * @param clientId
     * @param recordId
     * @return
     */
    @RequestMapping("/get")
    @ResponseBody
    public Map get(Integer id, Integer clientId) {
        Assert.isTrue(IntegerUtil.gtZero(id), "id not less than 1");
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord checkRecord = checkRecordService.selectByPrimaryKey(id);
        if (null != checkRecord) {
            checkRecord.setCheckResultList(checkResultService.getListByRecordId(checkRecord.getId()));
        }
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, checkRecord);
    }

    /**
     * 获取客户所有的检测记录
     * @param clientId
     * @return
     */
    @RequestMapping("/loadList")
    @ResponseBody
    public Map loadList(Integer clientId, int start, int length) {
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord checkRecord = new CheckRecord();
        checkRecord.setClientId(clientId);
        List<CheckRecord> list = checkRecordService.selectList(checkRecord, Order.build("create_time"), start, length);
        if (!CollectionUtils.isEmpty(list)) {
            for (CheckRecord cr : list) {
                cr.setCheckResultList(checkResultService.getListByRecordId(cr.getId()));
            }
        }
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, list);
    }
}