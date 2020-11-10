package com.bigdeal.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class FileStorageServiceImpl implements FileStorageService {

    @Override
    public File getFolderUpload(String path) {
        File folderUpload = new File(path);
        try {
            if (!folderUpload.exists()) {
                folderUpload.mkdirs();
            }
        } catch (Exception se) {
            se.printStackTrace();
        }
        return folderUpload;
    }

    @Override
    public boolean save(MultipartFile file, File uploadFolder) {
        try {
            String fileName = file.getOriginalFilename();
            File rs = new File(uploadFolder, fileName);
            if (rs.exists()) {
                rs.delete();
            }
            file.transferTo(rs);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
