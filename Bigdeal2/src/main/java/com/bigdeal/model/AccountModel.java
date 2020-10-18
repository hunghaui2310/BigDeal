package com.bigdeal.model;

import java.util.Date;

public class AccountModel {

	private String userName;
	private String userRole;
	private String password;
	private boolean active;
	public AccountModel() {
	}

//	public CustomerModel(String title, String shortDescription, String description, byte[] image, Date deletedAt,
//			Date createdAt, Date updatedAt) {
//		this.title = title;
//		this.shortDescription = shortDescription;
//		this.description = description;
//		this.image = image;
//
//		this.deletedAt = deletedAt;
//		this.createdAt = createdAt;
//		this.updatedAt = updatedAt;
//	}
//
	public AccountModel(String userName, String userRole, boolean active) {
		this.userName = userName;
		this.userRole = userRole;
		this.active = active;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	

}
