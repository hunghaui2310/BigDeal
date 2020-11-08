package com.bigdeal.model;

import javax.persistence.Column;

import com.bigdeal.entity.Product;

import java.util.Date;
import java.util.List;

public class ProductInfo {
	private String code;
	private String name;
	private double price;
	private Long categoryId;
	private Long brandId;
	private String categoryName;
	private String brandName;
	private int discount;
	private String urlImage;
	private List<String> lstFileName;
	private Date createDate;
	private int rating;

	public ProductInfo() {
	}

	public ProductInfo(Product product) {
		this.code = product.getCode();
		this.name = product.getName();
		this.price = product.getPrice();
		this.categoryId = product.getCategoryId();
		this.brandId = product.getBrandId();
	}

	// Sử dụng trong JPA/Hibernate query
	public ProductInfo(String code, String name, double price, Long categoryId, Long brandId, int discount, Date createDate) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.categoryId = categoryId;
		this.brandId = brandId;
		this.discount = discount;
		this.createDate = createDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public Long getBrandId() {
		return brandId;
	}

	public void setBrandId(Long brandId) {
		this.brandId = brandId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public List<String> getLstFileName() {
		return lstFileName;
	}

	public void setLstFileName(List<String> lstFileName) {
		this.lstFileName = lstFileName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
}
