package com.bigdeal.controller.client;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.dao.CategoryDAO;
import com.bigdeal.dao.ProductDAO;
import com.bigdeal.entity.Brands;
import com.bigdeal.entity.Categories;
import com.bigdeal.form.ResponseForm;
import com.bigdeal.model.ProductInfo;
import com.bigdeal.pagination.PaginationResult;
import com.bigdeal.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "/api/product")
public class ProductControllerAPI {

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private CategoryDAO categoryDAO;
    @Autowired
    private BrandDAO brandDAO;

    @Value("${path.product.root}")
    private String uploadFolder;

    @Value("${url.product.root}")
    private String urlProductFolder;

    @GetMapping("/getAll")
    public ResponseForm getAllProduct(@RequestParam(value = "name", defaultValue = "") String likeName,
                                      @RequestParam(value = "page", defaultValue = "1") int page) {
        try {
            PaginationResult<ProductInfo> result = productDAO.queryProducts(page,
                    Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE, likeName);
            for (ProductInfo productInfo : result.getList()) {
                Categories category = categoryDAO.findById(productInfo.getCategoryId());
                Brands brand = brandDAO.findById(productInfo.getBrandId());
                if (category != null) {
                    productInfo.setCategoryName(category.getCategoryName());
                }
                if (brand != null) {
                    productInfo.setBrandName(brand.getBrandName());
                }
                File folder = new File(uploadFolder + "/" + category.getId() + "/" + productInfo.getCode());
                File[] listOfFiles = folder.listFiles();
                List<String> lstNames = new ArrayList<>();
                for (File file : listOfFiles) {
                    lstNames.add(file.getName());
                }
                productInfo.setProductImage(urlProductFolder + "/" + category.getId() + "/" + productInfo.getCode());
                productInfo.setLstFileName(lstNames);
            }
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), null);
        }
    }
}
