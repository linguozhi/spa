package com.dazi.spa.console;

import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.protocol.StatusCodeEnum;
import com.dazi.spa.common.utils.FileUtil;
import com.dazi.spa.common.utils.IntegerUtil;
import com.dazi.spa.modules.product.model.ProductImage;
import com.dazi.spa.modules.product.service.ProductImageService;
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
import java.io.IOException;
import java.util.Map;

/**
 * @desc: 图片
 * @author:linguozhi@52tt.com
 * @date: 2016/11/10
 */

@Controller
@RequestMapping("image")
public class ImageController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(ImageController.class);

    @Value("${upload.path}")
    private String FILE_PATH;

    @Autowired
    private ProductImageService productImageService;

    @RequestMapping("/upload")
    @ResponseBody
    public Map upload(@RequestParam(value = "productImage") MultipartFile file
            , HttpServletRequest request
            , HttpServletResponse response) throws IOException {
        String filePath = FileUtil.uploadFile(file, FILE_PATH, request);
        logger.info("filePath:" + filePath);

        // save
        ProductImage productImage = new ProductImage();
        productImage.setUrl(filePath);

        if(productImageService.insertSelective(productImage) < 1) {
            ResponseHelper.buildErrorResult("上传失败");
        }
        return ResponseHelper.buildResult(StatusCodeEnum.SUCCESS, productImage.getId().toString());
    }

    @RequestMapping("/del")
    @ResponseBody  public Map delete(Integer id) {
        Assert.isTrue(IntegerUtil.gtZero(id) , "id不能小于1");

        if(productImageService.deleteByPrimaryKey(id) < 1) {
            return ResponseHelper.buildErrorResult("删除失败");
        }

        return ResponseHelper.buildSuccessResult();
    }
}