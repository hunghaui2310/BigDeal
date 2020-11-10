package com.bigdeal.controller.client;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.form.BrandForm;
import com.bigdeal.form.ResponseForm;
import com.bigdeal.model.BrandInfo;
import com.bigdeal.pagination.PaginationResult;
import com.bigdeal.service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;

@RestController
@RequestMapping(value = "/api/brand")
public class BrandControllerAPI {

    @Autowired
    private BrandDAO brandDAO;

    @Value("${path.product.root}")
    private String uploadFolder;

    @Autowired
    private FileStorageService storageService;

    @GetMapping("/getAll")
    public ResponseForm getAllBrand(@RequestParam(value = "name", defaultValue = "") String likeName,
                                    @RequestParam(value = "page", defaultValue = "1") int page) {
        try {
            PaginationResult<BrandInfo> result = brandDAO.query(page, Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE, likeName);
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), null);
        }
    }

    @PutMapping("/save")
    public ResponseForm saveBrand(@RequestParam(value = "brandName") String brandName,
                                  @RequestParam(value = "description") String description,
                                  @RequestParam(value = "id", required = false) Long id,
                                  @RequestParam(value = "files", required = false) MultipartFile[] files) {
        try {
            BrandForm brandForm = new BrandForm();
            brandForm.setBrandName(brandName);
            brandForm.setDescription(description);
            if (id != null) {
                brandDAO.save(brandForm);
                brandForm.setId(brandDAO.getLastId());
            } else {
                brandForm.setId(id);
            }
            if (files != null) {
                String pathFile = uploadFolder + "/" + Consts.FOLDER.BRAND + "/" + brandForm.getId();
                File folderBrand = storageService.getFolderUpload(pathFile);
                for (MultipartFile file : files) {
                    boolean isSuccess = storageService.save(file, folderBrand);
                    if (isSuccess && id != null) {
                        brandDAO.save(brandForm);
                    }
                }
            }
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", Consts.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), Consts.FAILED);
        }
    }
}
