package com.dazi.spa.portal;

import com.dazi.spa.common.datatable.DataTable;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.ItemLevel;
import com.dazi.spa.modules.checkItem.service.ItemLevelService;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.CheckResult;
import com.dazi.spa.modules.client.service.CheckRecordService;
import com.dazi.spa.modules.client.service.CheckResultService;
import com.dazi.spa.modules.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by lingz on 17/2/24.
 */
@Controller
@RequestMapping("portal/checkRecord")
public class PortalCheckRecordController {
    @Autowired
    private CheckRecordService checkRecordService;

    @Autowired
    private CheckResultService checkResultService;

    @Autowired
    private ItemLevelService itemLevelService;

    @Autowired
    private ProductService productService;

    /**
     * 获取客户所有的检测记录
     * @param clientId
     * @return
     */
    @RequestMapping("/loadList")
    @ResponseBody
    public DataTable loadList(Integer clientId, int start, int length) {
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord checkRecord = new CheckRecord();
        checkRecord.setClientId(clientId);

        int total = checkRecordService.selectTotal(checkRecord);
        List<CheckRecord> list = null;
        if (total > 0) {
            list = checkRecordService.selectList(checkRecord, Order.build("create_time"), start, length);
            if (!CollectionUtils.isEmpty(list)) {
                for (CheckRecord cr : list) {
                    cr.setCheckResultList(checkResultService.getListByRecordId(cr.getId()));
                    cr.setDiffDay();
                }
            }
        }

        return ResponseHelper.buildDataTable(1, total, list);
    }

    /**
     * 获取客户检测记录
     * @param clientId
     * @param recordId
     * @return
     */
    @RequestMapping("/get")
    @ResponseBody
    public Map get(Integer recordId, Integer clientId) {
        Assert.isTrue(IntegerUtil.gtZero(recordId), "recordId not less than 1");
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord checkRecord = checkRecordService.selectByPrimaryKey(recordId);
        if (null != checkRecord) {
            List<CheckResult> checkResultList = checkResultService.getListByRecordId(checkRecord.getId());
            if (!CollectionUtils.isEmpty(checkResultList)) {
                for (CheckResult checkResult : checkResultList) {
                    // 检测等级
                    List<ItemLevel> itemLevelList = itemLevelService.getByItemId(checkResult.getItemId());
                    if (!CollectionUtils.isEmpty(itemLevelList)) {
                        for (ItemLevel itemLevel : itemLevelList) {
                            if (checkResult.getItemLevelId() == itemLevel.getId()) {
                                itemLevel.setSelected(1);
                            }
                        }
                    }

                    checkResult.setItemLevelList(itemLevelList);

                    // 推荐产品
                    checkResult.setProduct(productService.getByItemId(checkResult.getItemId()));
                }
            }
            checkRecord.setCheckResultList(checkResultList);
            checkRecord.setDiffDay();

        }
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, checkRecord);
    }

    /**
     * 删除检测记录
     * @param recordId
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(Integer recordId) {
        Assert.isTrue(IntegerUtil.gtZero(recordId), "recordId not less than 1");

        if (checkRecordService.deleteByPrimaryKey(recordId) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }

}
