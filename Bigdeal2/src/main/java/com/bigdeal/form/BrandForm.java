package com.bigdeal.form;

import org.springframework.web.multipart.MultipartFile;

import com.bigdeal.entity.Brands;

public class BrandForm {
	private Long id;
	private String brandName;

	private String description;

	private boolean newMode = false;

	// Upload file.
	private MultipartFile fileData;

	public BrandForm() {
		this.newMode = true;
	}

	public BrandForm(Brands category) {
		this.id = category.getId();
		this.brandName = category.getBrandName();
		this.description = category.getDescription();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isNewMode() {
		return newMode;
	}

	public void setNewMode(boolean newMode) {
		this.newMode = newMode;
	}

	public MultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(MultipartFile fileData) {
		this.fileData = fileData;
	}

}