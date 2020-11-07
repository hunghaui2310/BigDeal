package com.bigdeal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.BrandDAO;
import com.bigdeal.dao.CategoryDAO;
import com.bigdeal.dao.ProductDAO;
import com.bigdeal.dao.ProductRatingDAO;
import com.bigdeal.entity.Brands;
import com.bigdeal.entity.Categories;
import com.bigdeal.entity.Product;
import com.bigdeal.entity.ProductRating;
import com.bigdeal.form.ProductForm;
import com.bigdeal.model.BrandInfo;
import com.bigdeal.model.CategoryInfo;
import com.bigdeal.model.ProductInfo;
import com.bigdeal.pagination.PaginationResult;

@Controller
@Transactional
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private BrandDAO brandDAO;
	@Autowired
	private ProductRatingDAO productRatingDAO;

	// Danh sách sản phẩm.
	@RequestMapping({ "/admin/products" })
	public String listProductHandler(Model model, //
			@RequestParam(value = "name", defaultValue = "") String likeName,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		PaginationResult<ProductInfo> result = productDAO.queryProducts(page, //
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
		}
		model.addAttribute("paginationProducts", result);

		return "product/index";
	}

	// GET: Hiển thị product
	@RequestMapping(value = "/admin/product/edit", method = RequestMethod.GET)
	public String editUser(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
		ProductForm productForm = null;

		if (code != null && code.length() > 0) {
			Product product = productDAO.findProduct(code);
			if (product != null) {
				productForm = new ProductForm(product);
			}
		}
		if (productForm == null) {
			productForm = new ProductForm();
			productForm.setNewProduct(true);
		}
		PaginationResult<CategoryInfo> categories = categoryDAO.query(1, //
				1000, 1000, "");
		PaginationResult<BrandInfo> brands = brandDAO.query(1, //
				1000, 1000, "");
		model.addAttribute("productForm", productForm);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);
		return "/product/edit";
	}

	@RequestMapping(value = "/admin/product/view", method = RequestMethod.GET)
	public String view(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
		if (code != null && code.length() > 0) {
			List<ProductRating> productRatings = productRatingDAO.findByProductCode(code);
			model.addAttribute("productRatings", productRatings);
		} else {
			return "/product/index";
		}

		return "/product/view";
	}

	@RequestMapping(value = "/admin/product/delete", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("code") String code, Model model) {
		productDAO.delete(code);
		return "redirect:/admin/products";
	}

	// POST: Save product
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST)
	public String productSave(Model model, //
			@ModelAttribute("productForm") @Validated ProductForm productForm, //
			BindingResult result, //
			final RedirectAttributes redirectAttributes) {
		PaginationResult<CategoryInfo> categories = categoryDAO.query(1, //
				1000, 1000, "");
		PaginationResult<BrandInfo> brands = brandDAO.query(1, //
				1000, 1000, "");
		model.addAttribute("productForm", productForm);
		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);
		if (result.hasErrors()) {
			return "product/edit";
		}
		try {
			productDAO.save(productForm);
		} catch (Exception e) {
			Throwable rootCause = ExceptionUtils.getRootCause(e);
			String message = rootCause.getMessage();
			model.addAttribute("errorMessage", message);
			// Show product form.
			return "product/edit";
		}

		return "redirect:/admin/products";
	}

	@RequestMapping(value = { "/productImage" }, method = RequestMethod.GET)
	public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("code") String code) throws IOException {
		Product product = null;
		if (code != null) {
			product = this.productDAO.findProduct(code);
		}
		response.getOutputStream().close();
	}

}
