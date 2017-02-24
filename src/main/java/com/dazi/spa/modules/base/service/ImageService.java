package com.dazi.spa.modules.base.service;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.datatable.Order;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.utils.FileUtil;
import com.dazi.spa.modules.base.mapper.ImageMapper;
import com.dazi.spa.modules.base.model.Image;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.dazi.spa.modules.user.model.User;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
    private static final Logger logger = LoggerFactory.getLogger(ImageService.class);

    @Autowired
    private ImageMapper imageMapper;

    @Value("${upload.path}")
    private String FILE_PATH;

    @Value("${upload.shortPath}")
    private String SHORT_FILE_PATH;


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

    /**
     * 将文件上传至指定路径
     * @param file
     * @return
     */
    public String upload(MultipartFile file) {
        String filePath = null;
        try {
            filePath = FileUtil.uploadFile(file, FILE_PATH, null);

        } catch (IOException ex) {
            logger.error("上传错误", ex);
            return null;
        }

        User user = (User) SecurityUtils.getSubject().getPrincipal();
        Long userId = user == null ? 0l: user.getId();
        // 路径存库
        Image image = new Image();
        image.setShortUrl(SHORT_FILE_PATH + "/" + userId + filePath.substring(filePath.lastIndexOf(File.separator) + 1));
        image.setUrl(filePath);

        if(insertSelective(image) < 1) {
            logger.error("保存失败,image:{}", JSON.toJSONString(image));
        }

        return image.getShortUrl();

    }

}