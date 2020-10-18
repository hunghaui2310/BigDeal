package com.bigdeal.controller.frontend;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BannerDAO;
import com.bigdeal.dao.BlogDAO;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.dao.CategoryDAO;
import com.bigdeal.dao.ProductDAO;
import com.bigdeal.dao.ProductRatingDAO;
import com.bigdeal.entity.Product;
import com.bigdeal.form.ProductRatingForm;
import com.bigdeal.pagination.PaginationResult;

@Controller
@Transactional
public class HomeController {
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private BrandDAO brandDAO;
	@Autowired
	private BannerDAO bannerDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private BlogDAO blogDAO;

	@Autowired
	private ProductRatingDAO productRatingDAO;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("categories", categoryDAO.findAll());
		model.addAttribute("brands", brandDAO.findAll());
		model.addAttribute("banners", bannerDAO.findAll());
		model.addAttribute("blogs", blogDAO.findAll());

		return "/frontend/home";
	}

	@RequestMapping("/product-list")
	public String productList(Model model, @RequestParam(value = "categoryId", required = false) Long categoryId,
			@RequestParam(value = "productName", required = false) String productName,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		model.addAttribute("categories", categoryDAO.findAll());
		model.addAttribute("brands", brandDAO.findAll());
		model.addAttribute("banners", bannerDAO.findAll());
		PaginationResult<Product> products;
		if (productName != null && !productName.isEmpty()) {
			products = productDAO.findByName(productName, page, //
					Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE);
			model.addAttribute("products", products);
			return "/frontend/product-list";
		}
		if (categoryId != null) {
			products = productDAO.findByCategory(categoryId, page, //
					Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE);
		} else {
			products = productDAO.findAll(page, //
					Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE);
		}

		model.addAttribute("products", products);
		return "/frontend/product-list";
	}

	@RequestMapping("/product-detail")
	public String productDetail(Model model, @RequestParam(value = "code", required = true) String code) {
		model.addAttribute("categories", categoryDAO.findAll());
		model.addAttribute("brands", brandDAO.findAll());
		model.addAttribute("banners", bannerDAO.findAll());
		Product product = productDAO.findProduct(code);
		model.addAttribute("product", product);
		List<Product> products = productDAO.findByCategory(product.getCategoryId(),1, 100, 100).getList();
		model.addAttribute("products", products);
		ProductRatingForm ratingForm = new ProductRatingForm();
		ratingForm.setProductCode(code);
		model.addAttribute("productRatingForm", ratingForm);
		model.addAttribute("ratingMessage", productRatingDAO.findByProductCode(code));
		return "/frontend/product-detail";
	}

	@RequestMapping("/blog-detail")
	public String blogDetail(Model model, @RequestParam(value = "blogId", required = true) Long blogId) {
		model.addAttribute("categories", categoryDAO.findAll());
		model.addAttribute("brands", brandDAO.findAll());
		model.addAttribute("banners", bannerDAO.findAll());
		model.addAttribute("blog", blogDAO.findById(blogId));

		return "/frontend/blog-details";
	}
}
