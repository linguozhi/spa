package com.dazi.spa.console;

import com.dazi.spa.common.protocol.ResponseHelper;
import com.dazi.spa.common.utils.poi.core.POIException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Map;

/**
 * @desc: 基础控制类
 * @author:linguozhi@52tt.com
 * @date: 2016/10/19
 */
@ControllerAdvice
public class BaseController {
    private static Logger logger = LoggerFactory.getLogger(BaseController.class);

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseBody
    public Map handleIllegalArgumentException(IllegalArgumentException ex) {
        logger.warn("参数错误，{}" ,ex.getMessage());
        return ResponseHelper.buildErrorResult(ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Map handleException(Exception ex) {
        logger.error("未知，{}" ,ex);
        return ResponseHelper.buildErrorResult(ex.getMessage());
    }

    @ExceptionHandler(POIException.class)
    @ResponseBody
    public Map handlePOIException(POIException ex) {
        logger.error("导出错误", ex);
        return ResponseHelper.buildErrorResult(ex.getMessage());
    }

    @ExceptionHandler(IOException.class)
    @ResponseBody
    public Map handleIOException(IOException ex) {
        logger.error("IO错误", ex);
        return ResponseHelper.buildErrorResult(ex.getMessage());
    }

}
