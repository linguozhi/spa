package com.dazi.spa.modules.client.service;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.model.AgeLevel;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import com.dazi.spa.modules.checkItem.model.ItemLevel;
import com.dazi.spa.modules.checkItem.service.AgeLevelService;
import com.dazi.spa.modules.checkItem.service.CheckItemService;
import com.dazi.spa.modules.checkItem.service.ItemLevelService;
import com.dazi.spa.modules.client.mapper.CheckResultMapper;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.CheckResult;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dazi.spa.modules.client.model.Client;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class CheckResultService {
    private static Logger logger = LoggerFactory.getLogger(CheckResultService.class);


    @Autowired
    private CheckItemService checkItemService;

    @Autowired
    private AgeLevelService ageLevelService;

    @Autowired
    private CheckResultMapper checkResultMapper;

    @Autowired
    private ItemLevelService itemLevelService;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return checkResultMapper.deleteByPrimaryKey(id);
    }

    public int insert(CheckResult record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkResultMapper.insert(record);
    }

    public int insertSelective(CheckResult record) {
        Assert.notNull(record, "查询对象不能为空");
        record.setCreateTime(new Date());
        return checkResultMapper.insertSelective(record);
    }

    public CheckResult selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return checkResultMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(CheckResult record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkResultMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(CheckResult record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkResultMapper.selectTotal(record);
    }

    public List<CheckResult> selectList(CheckResult record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return checkResultMapper.selectList(record, order, offset, count);
    }

    public void caculateTopItemList(Client client, List<CheckItem> topItemList, List<String> errors) {
        Assert.notNull(client, "客户信息不能为空");

        Assert.notEmpty(topItemList, "检测父品项不能为空");

        for (CheckItem ci: topItemList) {
            caculateTopItem(client, ci, errors);
        }
    }


    /**
     * get list by recordId
     * @param recordId
     * @return
     */
    public List<CheckResult> getListByRecordId(Integer recordId) {
        Assert.isTrue(IntegerUtil.gtZero(recordId), "recordId not less than 1");

        CheckResult record = new CheckResult();
        record.setRecordId(recordId);

        return selectList(record, null, 0, -1);
    }

    /**
     * 计算检测值
     * @param client
     * @param checkItem
     */
    private void caculateTopItem(Client client, CheckItem checkItem, List<String> errors) {

        int age = client.getAge();
        // 获取年龄对应分值
        AgeLevel ageLevel = ageLevelService.getBy(checkItem.getId(), age);
        if(ageLevel == null) {
            errors.add("年龄为空");
            logger.error("年龄阶梯为空, info:{}", JSON.toJSONString(checkItem));
            return;
        }

        // r = -1 or r = 1
        int r = (int)Math.pow(-1, (int)(Math.random()*2));
        // 随机比例, 添加了浮动参数
        BigDecimal rd = checkItem.getRandRatio().multiply(new BigDecimal(Math.random())).multiply(new BigDecimal(r));
        // 最终显示比例
        BigDecimal finalShowRatio = checkItem.getShowRatio().add(rd);

        // 当前分值
        BigDecimal topScore = ageLevel.getScore().multiply(finalShowRatio);
        // 当前分值对应的等级
        ItemLevel itemLevel = itemLevelService.get(checkItem.getId(), topScore);

        CheckResult checkResult = new CheckResult();
        checkResult.setItemId(checkItem.getId());
        checkResult.setClientId(client.getId());
        checkResult.setRecordId(client.getRecordId());
        checkResult.setScore(topScore);
        checkResult.setGeneralScore(ageLevel.getScore());
        if (itemLevel != null) {
            checkResult.setItemLevelId(itemLevel.getId());
        }

        if(insertSelective(checkResult) < 1) {
            errors.add("检测结果入库失败");
            // log error
            logger.error("insert top item checkResult failed, info:{}" , JSON.toJSONString(checkItem));
            return;
        }

        // 计算子品项分值
//        List<CheckItem> childItemList = checkItemService.getListByParentId(checkItem.getId());
//        if(CollectionUtils.isEmpty(childItemList)) {
//            errors.add("子品项为空");
//            logger.error("子品项为空,info:{}", JSON.toJSONString(checkItem));
//            return;
//        }
//
//        for (CheckItem child : childItemList) {
//            r = (int)Math.pow(-1, (int)(Math.random()*2));
//            rd = checkItem.getRandRatio().multiply(new BigDecimal(Math.random())).multiply(new BigDecimal(r));
//            finalShowRatio = new BigDecimal(1).add(rd);
//            // 子相分值=父项分值 * 比例
//            BigDecimal childScore = topScore.multiply(finalShowRatio);
//
//            checkResult = new CheckResult();
//            checkResult.setScore(childScore);
//            checkResult.setItemId(child.getId());
//            checkResult.setClientId(client.getId());
//            checkResult.setRecordId(client.getRecordId());
//            checkResult.setGeneralScore(ageLevel.getScore());
//
//            if(insertSelective(checkResult) < 1) {
//                errors.add("子品项入库失败");
//                logger.error("insert child item checkResult failed,info:{}", JSON.toJSONString(child));
//            }
//        }
    }

    public void caculate(Client client, List<String> errors) {
        Assert.notNull(client, "client not null");

        // 获取顶级品项
        List<CheckItem> topItemList = checkItemService.getTopItemList();

        caculateTopItemList(client, topItemList, errors);
    }

    /**
     * 计算检测值
     * @param client
     * @param latestCheckRecord
     * @param errors
     */
    public void caculate(Client client, CheckRecord latestCheckRecord, List<String> errors) {
        Assert.notNull(client, "client not null");
        Assert.notNull(latestCheckRecord, "latestCheckRecord not null");

        // 获取顶级品项
        List<CheckItem> topItemList = checkItemService.getTopItemList();
        Assert.notEmpty(topItemList, "检测品项不能为空");

        // 获取上次检测大项
        CheckResult record = new CheckResult();
        record.setClientId(client.getId());
        record.setRecordId(latestCheckRecord.getId());
        record.setParentId(0);

        List<CheckResult> topCheckResultList = selectList(record, null, 0, -1);
        Assert.notEmpty(topCheckResultList, "上次检测结果为空");

        List<CheckResult> caculateList = new ArrayList<>();

        for (CheckResult lastTopCheckResult : topCheckResultList) {
            CheckItem topCheckItem = checkItemService.selectByPrimaryKey(lastTopCheckResult.getItemId());
            // 体验后增益比例
            BigDecimal addRatio = topCheckItem.getAddRatio();
            // 获取上次子项检测结果
//            record.setParentId(topCheckItem.getId());
//            List<CheckResult> lastChildCheckResultList = selectList(record, null, 0, -1);

            // 计算增益后分数
            CheckResult newTopCheckResult = countScore(lastTopCheckResult, addRatio, client.getRecordId());
            // 当前分值对应的等级
            ItemLevel itemLevel = itemLevelService.get(topCheckItem.getId(), newTopCheckResult.getScore());
            if (itemLevel != null) {
                newTopCheckResult.setItemLevelId(itemLevel.getId());
            }
//            List<CheckResult> newChildCheckResultList = countScore(lastChildCheckResultList, addRatio, client.getRecordId());

            caculateList.add(newTopCheckResult);
//            caculateList.addAll(newChildCheckResultList);
        }

        // 最新检测分数入库
        if(save(caculateList) < 1) {
            errors.add("检测结果入库失败");
            logger.error("save check result failed,info:{}", JSON.toJSONString(caculateList));
        }
    }

    public int save(List<CheckResult> caculateList) {
        Assert.notEmpty(caculateList, "caculateList not empty");
        int success = 0;
        for (CheckResult checkResult : caculateList) {
            success += insertSelective(checkResult);
        }

        return success;
    }

    /**
     * 在上次检测结果上计算新的检测分数
     * @param oldcheckResult
     * @param addRatio
     * @param newRecordId
     * @return
     */
    public CheckResult countScore(CheckResult oldcheckResult, BigDecimal addRatio, Integer newRecordId) {
        CheckResult newCheckResult = new CheckResult();
        BigDecimal score = oldcheckResult.getScore().multiply(new BigDecimal(1).add(addRatio));

        newCheckResult.setScore(score);
        newCheckResult.setRecordId(newRecordId);
        newCheckResult.setClientId(oldcheckResult.getClientId());
        newCheckResult.setItemId(oldcheckResult.getItemId());
        newCheckResult.setGeneralScore(oldcheckResult.getGeneralScore());

        return newCheckResult;
    }

    /**
     * 在上次检测结果上计算新的检测分数
     * @param checkResultList
     * @param addRatio
     * @param newRecordId
     * @return
     */
    public List<CheckResult> countScore(List<CheckResult> checkResultList, BigDecimal addRatio, Integer newRecordId) {
        List<CheckResult> newCheckResultList = new ArrayList<>();
        for (CheckResult checkResult : checkResultList) {
            newCheckResultList.add(countScore(checkResult, addRatio, newRecordId));
        }

        return newCheckResultList;
    }

    /**
     * 计算综合分数
     * @param childCheckResultList
     * @return
     */
    public void countMultipleScore(List<CheckResult> topCheckResultList, CheckResult multipleCheckResult) {
        Assert.notEmpty(topCheckResultList, "检查品项不能为空");

        // 检测值
        BigDecimal totalScore = new BigDecimal(0);
        // 标准值
        BigDecimal generalScore = new BigDecimal(0);

        for (CheckResult checkResult : topCheckResultList) {
            CheckItem checkItem = checkItemService.selectByPrimaryKey(checkResult.getItemId());
            // 权重分数
            BigDecimal weightScore = checkResult.getScore().multiply(checkItem.getWeight());
            totalScore = totalScore.add(weightScore);

            generalScore = generalScore.add(checkResult.getGeneralScore().multiply(checkItem.getWeight()));
        }

        multipleCheckResult.setScore(totalScore);
        multipleCheckResult.setGeneralScore(generalScore);

    }
}