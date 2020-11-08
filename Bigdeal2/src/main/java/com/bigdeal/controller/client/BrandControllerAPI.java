package com.bigdeal.controller.client;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.form.BrandForm;
import com.bigdeal.form.ResponseForm;
import com.bigdeal.model.BrandInfo;
import com.bigdeal.pagination.PaginationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value = "/api/brand")
public class BrandControllerAPI {

    @Autowired
    private BrandDAO brandDAO;

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

    @GetMapping("/save")
    public ResponseForm saveBrand(@RequestParam(value = "brandName") String brandName,
                                  @RequestParam(value = "description") String description,
                                  @RequestParam(value = "id", required = false) Long id) {
        try {
            BrandForm brandForm = new BrandForm();
            brandForm.setBrandName(brandName);
            brandForm.setId(id);
            brandForm.setDescription(description);
            brandDAO.save(brandForm);
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", Consts.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), Consts.FAILED);
        }
    }
}
