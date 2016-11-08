package com.dazi.spa.modules.checkItem.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.checkItem.mapper.CheckItemMapper;
import com.dazi.spa.modules.checkItem.model.CheckItem;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

@Service
public class CheckItemService {
    @Autowired
    private CheckItemMapper checkItemMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return checkItemMapper.deleteByPrimaryKey(id);
    }

    public int insert(CheckItem record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkItemMapper.insert(record);
    }

    public int insertSelective(CheckItem record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkItemMapper.insertSelective(record);
    }

    public CheckItem selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return checkItemMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(CheckItem record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkItemMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(CheckItem record) {
        Assert.notNull(record, "查询对象不能为空");
        return checkItemMapper.selectTotal(record);
    }

    public List<CheckItem> selectList(CheckItem record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return checkItemMapper.selectList(record, order, offset, count);
    }

    public List<CheckItem> selectListByParentId(Integer parentId) {
        Assert.isTrue(IntegerUtil.gtZero(parentId), "品项id不能小于1");

        CheckItem record = new CheckItem();
        record.setParentId(parentId);

        return selectList(record, null, 0, -1);


    }

    /**
     * 保存品项
     * @param list
     * @return
     */
    public int save(Integer parentId, List<CheckItem> list, boolean delOld) {
        Assert.isTrue(IntegerUtil.gtZero(parentId), "父品项id不能小于1");

        if(delOld) {
            deleteByParentId(parentId);
        }

        if(CollectionUtils.isEmpty(list)) {
            return 1;
        }

        setParentId(parentId, list);

        return save(list);

    }

    private void setParentId(Integer parentId, List<CheckItem> list) {
        for (CheckItem ci : list) {
            ci.setParentId(parentId);
        }
    }

    private int save(List<CheckItem> list) {
        Assert.notEmpty(list, "列表不能为空");

        int success = 0;
        for (CheckItem ci : list) {
            success += insertSelective(ci);
        }

        return success;
    }

    private int deleteByParentId(Integer parentId) {
        Assert.isTrue(IntegerUtil.gtZero(parentId), "父品项id不能小于1");

        return checkItemMapper.deleteByParentId(parentId);
    }

    /**
     * 获取顶级品项:parent_id=0
     * @return
     */
    public List<CheckItem> getTopItemList() {
        CheckItem record = new CheckItem();
        record.setParentId(0);

        return selectList(record, null, 0, -1);
    }

    /**
     * 根据父id获取品相列表
     * @param id
     * @return
     */
    public List<CheckItem> getListByParentId(Integer parentId) {
        Assert.isTrue(IntegerUtil.gtZero(parentId), "parentId not less than 1");

        CheckItem record = new CheckItem();
        record.setParentId(parentId);

        return selectList(record, null, 0, -1);

    }
}