package com.dazi.spa.modules.base.service;

import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.modules.base.mapper.ImageMapper;
import com.dazi.spa.modules.base.model.Image;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class ImageService {
    @Autowired
    private ImageMapper imageMapper;

    public int deleteByPrimaryKey(Integer id) {
        Assert.notNull(id, "id不能为空");
        return imageMapper.deleteByPrimaryKey(id);
    }

    public int insert(Image record) {
        Assert.notNull(record, "查询对象不能为空");
        return imageMapper.insert(record);
    }

    public int insertSelective(Image record) {
        Assert.notNull(record, "查询对象不能为空");
        return imageMapper.insertSelective(record);
    }

    public Image selectByPrimaryKey(Integer id) {
        Assert.notNull(id, "查询对象不能为空");
        return imageMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Image record) {
        Assert.notNull(record, "查询对象不能为空");
        return imageMapper.updateByPrimaryKeySelective(record);
    }

    public int selectTotal(Image record) {
        Assert.notNull(record, "查询对象不能为空");
        return imageMapper.selectTotal(record);
    }

    public List<Image> selectList(Image record, Order order, int offset, int count) {
        Assert.notNull(record, "查询对象不能为空");
        return imageMapper.selectList(record, order, offset, count);
    }

}