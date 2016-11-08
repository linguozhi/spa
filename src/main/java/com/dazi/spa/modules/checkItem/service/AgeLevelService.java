package com.dazi.spa.modules.checkItem.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.mapper.AgeLevelMapper;
import com.dazi.spa.modules.checkItem.model.AgeLevel;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class AgeLevelService {
    @Autowired
    private AgeLevelMapper ageLevelMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return ageLevelMapper.deleteByPrimaryKey(id);
    }

    public int insert(AgeLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return ageLevelMapper.insert(record);
    }

    public int insertSelective(AgeLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        record.setCreateTime(new Date());
        return ageLevelMapper.insertSelective(record);
    }

    public AgeLevel selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return ageLevelMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(AgeLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return ageLevelMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(AgeLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return ageLevelMapper.selectTotal(record);
    }

    public List<AgeLevel> selectList(AgeLevel record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return ageLevelMapper.selectList(record, order, offset, count);
    }

    public int save(Integer checkItemId, List<AgeLevel> ageLevelList, boolean delOld) {
        Assert.isTrue(IntegerUtil.gtZero(checkItemId), "品项id不能小于1");

        if(delOld) {
            // 删除原有配置
            deleteByItemId(checkItemId);
        }

        if(CollectionUtils.isEmpty(ageLevelList)) {
            return 1;
        }

        setItemId(checkItemId, ageLevelList);
        return save(ageLevelList);
    }

    public int save(List<AgeLevel> ageLevelList) {
        Assert.notNull(ageLevelList, "年龄设置列表不能为空");

        int success = 0;
        for (AgeLevel ageLevel : ageLevelList) {
            success += insertSelective(ageLevel);
        }

        return success;
    }

    private void setItemId(Integer itemId, List<AgeLevel> ageLevelList) {
        for (AgeLevel ag : ageLevelList) {
            ag.setItemId(itemId);
        }
    }

    private int deleteByItemId(Integer checkItemId) {
        Assert.isTrue(IntegerUtil.gtZero(checkItemId),"品项id不能小于1");

        return ageLevelMapper.deleteByItemId(checkItemId);
    }

    public List<AgeLevel> selectListByItemId(Integer itemId) {
        Assert.isTrue(IntegerUtil.gtZero(itemId), "品项id不能小于1");

        AgeLevel record = new AgeLevel();
        record.setItemId(itemId);

        return selectList(record, null, 0, -1);
    }

    public AgeLevel getBy(Integer itemId, int age) {
        Assert.isTrue(IntegerUtil.gtZero(itemId), "itemId not less than 1");
        Assert.isTrue(IntegerUtil.gtZero(age), "age not less than 1");

        AgeLevel record = new AgeLevel();
        record.setItemId(itemId);
        record.setAge(age);
        List<AgeLevel> list = selectList(record, null, 0, 1);
        return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}