package com.bigdeal.controller.client;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.dao.CategoryDAO;
import com.bigdeal.dao.ProductDAO;
import com.bigdeal.dao.ProductRatingDAO;
import com.bigdeal.entity.Brands;
import com.bigdeal.entity.Categories;
import com.bigdeal.entity.ProductRating;
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
import java.util.Date;
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

    @Autowired
    private ProductRatingDAO productRatingDAO;

    @Value("${path.product.root}")
    private String uploadFolder;

    @Value("${url.product.root}")
    private String urlProductFolder;

    @GetMapping("/getByCategory")
    public ResponseForm getAllProduct(@RequestParam(value = "categoryId", defaultValue = "1") Long categoryId,
                                      @RequestParam(value = "page", defaultValue = "1") int page) {
        try {
            PaginationResult<ProductInfo> result = productDAO.queryProductsByCategory(categoryId, page,  Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE);
            for (ProductInfo productInfo : result.getList()) {
                Categories category = categoryDAO.findById(productInfo.getCategoryId());
                List<ProductRating> productRatings = productRatingDAO.findByProductCode(productInfo.getCode());
                int rating = 0;
                for (ProductRating productRating : productRatings) {
                    rating += productRating.getRating();
                }
                productInfo.setRating(Math.round((float)rating / productRatings.size()));
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
                productInfo.setUrlImage(urlProductFolder + "/" + category.getId() + "/" + productInfo.getCode());
                productInfo.setLstFileName(lstNames);
                // set la san pham moi neu thoi gian tao < thoi gian hien tai 1 thang
                if (productInfo.getCreateDate().getMonth() > new Date().getMonth() + 1) {
                    productInfo.setCreateDate(null);
                }
            }
            return ResponseForm.build(HttpServletResponse.SC_OK, true, "", result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseForm.build(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, false, e.getMessage(), null);
        }
    }
}
