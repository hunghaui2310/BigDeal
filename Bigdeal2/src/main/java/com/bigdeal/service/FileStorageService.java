package com.bigdeal.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public interface FileStorageService {

    File getFolderUpload(String path);

    boolean save(MultipartFile file, File uploadFolder);
}
