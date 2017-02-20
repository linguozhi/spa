package com.dazi.spa.modules.client.service;

import java.util.Date;
import java.util.List;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.DateUtils;
import com.dazi.spa.modules.client.mapper.ClientMapper;
import com.dazi.spa.modules.client.model.CheckRecord;
import com.dazi.spa.modules.client.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class ClientService {
    @Autowired
    private ClientMapper clientMapper;

    @Autowired
    private CheckRecordService checkRecordService;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return clientMapper.deleteByPrimaryKey(id);
    }

    public int insert(Client record) {
        Assert.notNull(record, "查询对象不能为空");
        return clientMapper.insert(record);
    }

    public int insertSelective(Client record) {
        Assert.notNull(record, "查询对象不能为空");
        record.setCreateTime(new Date());
        return clientMapper.insertSelective(record);
    }

    public Client selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return clientMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Client record) {
        Assert.notNull(record, "查询对象不能为空");
        return clientMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(Client record) {
        Assert.notNull(record, "查询对象不能为空");
        return clientMapper.selectTotal(record);
    }

    public List<Client> selectList(Client record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return clientMapper.selectList(record, order, offset, count);
    }

    public List<Client> getList(Client client, Order order, int start, int length) {
        List<Client> list = selectList(client, order, start, length);
        for (Client record : list) {
            CheckRecord last = checkRecordService.getLatest(record.getId());
            if (null != last) {
                record.setPrevTimeStr(DateUtils.format(last.getModifyTime(), "yyyy-MM-dd"));
                record.setTimes(last.getTimes());
                record.setInvervalDays(DateUtils.getDiff(last.getModifyTime(), new Date()));
            }
        }
        // convert
        return list;
    }
}