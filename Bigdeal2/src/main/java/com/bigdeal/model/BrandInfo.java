package com.bigdeal.model;

import java.util.Date;

public class BrandInfo {

	private Long id;
	private String brandName;
	private String image;
	private String description;
	private Date deletedAt;
	private Date createdAt;
	private Date updatedAt;

	public BrandInfo() {
	}

	public BrandInfo(String brandName) {
		this.brandName = brandName;
	}

	public BrandInfo(Long id, String brandName, String description, Date createdAt, Date deletedAt,
			Date updatedAt) {
		this.id = id;
		this.brandName = brandName;
		this.description = description;
		this.deletedAt = deletedAt;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public BrandInfo(Long id, String brandName, String description) {
		this.id = id;
		this.brandName = brandName;
		this.description = description;
	}

	public Long getId() {
		return this.id;
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
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDeletedAt() {
		return this.deletedAt;
	}

	public void setDeletedAt(Date deletedAt) {
		this.deletedAt = deletedAt;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
