package com.bigdeal.form;

import com.bigdeal.entity.Account;
import com.bigdeal.entity.Customers;

public class AccountForm {
	private String userName;
	private String userRole;
	private String password;
	private boolean active;

	private boolean newMode = false;

	public AccountForm() {
		this.newMode = true;
	}

	public AccountForm(Account item) {

		this.userName = item.getUserName();
		this.userRole = item.getUserRole();
		this.active = item.isActive();
		this.password = item.getEncrytedPassword();
	}

	public boolean isNewMode() {
		return newMode;
	}

	public void setNewMode(boolean newMode) {
		this.newMode = newMode;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}