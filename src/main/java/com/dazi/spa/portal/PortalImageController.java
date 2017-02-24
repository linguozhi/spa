package com.dazi.spa.portal;

import com.alibaba.fastjson.JSON;
import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.FileUtil;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.console.BaseController;
import com.dazi.spa.modules.base.model.Image;
import com.dazi.spa.modules.base.service.ImageService;
import com.dazi.spa.modules.user.model.User;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * Created by lingz on 17/2/24.
 */
@Controller
@RequestMapping("portal/image")
public class PortalImageController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(PortalImageController.class);

    @Autowired
    private ImageService imageService;

    @Value("${upload.path}")
    private String FILE_PATH;

    @Value("${upload.shortPath}")
    private String SHORT_FILE_PATH;

    @RequestMapping("/upload")
    @ResponseBody
    public Map upload(@RequestParam(value = "image") MultipartFile file
            , HttpServletRequest request
            , HttpServletResponse response) throws IOException {

        String filePath = imageService.upload(file);
        logger.info("filePath:" + filePath);

        // save
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        Long userId = user == null ? 0l: user.getId();
        // 路径存库
        Image image = new Image();
        image.setShortUrl(SHORT_FILE_PATH + "/" + userId + filePath.substring(filePath.lastIndexOf(File.separator) + 1));
        image.setUrl(filePath);

        if(imageService.insertSelective(image) < 1) {
            ResponseHelper.buildErrorResult("上传失败");
        }

        image = imageService.selectByPrimaryKey(image.getId());
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, image);
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(imageService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }
}
