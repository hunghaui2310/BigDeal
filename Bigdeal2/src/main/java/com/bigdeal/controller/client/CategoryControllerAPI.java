package com.bigdeal.controller.client;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.CategoryDAO;
import com.bigdeal.form.ResponseForm;
import com.bigdeal.model.CategoryInfo;
import com.bigdeal.pagination.PaginationResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value = "/api/category")
public class CategoryControllerAPI {

    @Autowired
    private CategoryDAO categoryDAO;

    // get danh sach the loai
    @GetMapping("/getAll")
    public ResponseForm getAllCategory(@RequestParam(value = "name", defaultValue = "") String likeName,
                                       @RequestParam(value = "page", defaultValue = "1") int page) {
        try {
            PaginationResult<CategoryInfo> result = categoryDAO.query(page, Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE, likeName);
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), null);
        }
    }
}
