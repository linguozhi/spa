package com.dazi.spa.modules.checkItem.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.checkItem.mapper.ItemLevelMapper;
import com.dazi.spa.modules.checkItem.model.ItemLevel;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class ItemLevelService {
    @Autowired
    private ItemLevelMapper itemLevelMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return itemLevelMapper.deleteByPrimaryKey(id);
    }

    public int insert(ItemLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return itemLevelMapper.insert(record);
    }

    public int insertSelective(ItemLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return itemLevelMapper.insertSelective(record);
    }

    public ItemLevel selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return itemLevelMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(ItemLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return itemLevelMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(ItemLevel record) {
        Assert.notNull(record, "查询对象不能为空");
        return itemLevelMapper.selectTotal(record);
    }

    public List<ItemLevel> selectList(ItemLevel record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return itemLevelMapper.selectList(record, order, offset, count);
    }


    /**
     * 根据分数获取对应品项等级
     * @param itemId
     * @param topScore
     * @return
     */
    public ItemLevel get(Integer itemId, BigDecimal score) {
        Assert.notNull(itemId, "itemId not null");
        Assert.notNull(score, "score not null");

        ItemLevel itemLevel = new ItemLevel();
        itemLevel.setItemId(itemId);
        itemLevel.setScore(score);

        List<ItemLevel> list = selectList(itemLevel, null, 0, 1);
        return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}