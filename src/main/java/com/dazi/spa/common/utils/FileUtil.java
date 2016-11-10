package com.dazi.spa.common.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * @desc:
 * @author:linguozhi@52tt.com
 * @date: 2016/11/10
 */
@Component
public class FileUtil {

    //文件上传
    public static String uploadFile(MultipartFile file, String filePath, HttpServletRequest request) throws IOException {

        String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        String fileName =  new Date().getTime() + "." + ext;
        File tempFile = new File(filePath, String.valueOf(fileName));
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);
        return tempFile.getPath();
    }

    public static File getFile(String fileName, String filePath) {
        return new File(filePath, fileName);
    }
}
