package com.dazi.spa.modules.client.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.client.mapper.CheckRecordMapper;
import com.dazi.spa.modules.client.model.CheckRecord;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class CheckRecordService {
    @Autowired
    private CheckRecordMapper checkRecordMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return checkRecordMapper.deleteByPrimaryKey(id);
    }

    public int insert(CheckRecord record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkRecordMapper.insert(record);
    }

    public int insertSelective(CheckRecord record) {
        Assert.notNull(record, "查询对象不能为空");
        record.setCreateTime(new Date());
        return checkRecordMapper.insertSelective(record);
    }

    public CheckRecord selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return checkRecordMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(CheckRecord record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkRecordMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(CheckRecord record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkRecordMapper.selectTotal(record);
    }

    public List<CheckRecord> selectList(CheckRecord record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return checkRecordMapper.selectList(record, order, offset, count);
    }

    public int save(Integer clientId) {
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord record = new CheckRecord();
        record.setClientId(clientId);

        return insertSelective(record);
    }

    public List<CheckRecord> getListByClientId(Integer clientId) {
        Assert.isTrue(IntegerUtil.gtZero(clientId), "clientId not less than 1");

        CheckRecord record = new CheckRecord();
        record.setClientId(clientId);

        return selectList(record, null, 0, -1);
    }
}