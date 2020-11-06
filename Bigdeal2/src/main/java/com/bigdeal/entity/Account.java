package com.bigdeal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "accounts")
public class Account implements Serializable {

	private static final long serialVersionUID = -2054386655979281969L;

	public static final String ROLE_MANAGER = "ROLE_MANAGER";
	public static final String ROLE_EMPLOYEE = "ROLE_EMPLOYEE";

	@Id
	@Column(name = "User_Name", length = 20, nullable = false)
	private String userName;

	@Column(name = "Encryted_Password", length = 128, nullable = false)
	private String encrytedPassword;

	@Column(name = "Active", length = 1, nullable = false)
	private boolean active;

	@Column(name = "User_Role", length = 20, nullable = false)
	private String userRole;

	@Column(name = "email")
	private String email;

	@Column(name = "reset_code")
	private Integer resetCode;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
	}

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getResetCode() {
		return resetCode;
	}

	public void setResetCode(Integer resetCode) {
		this.resetCode = resetCode;
	}

	@Override
	public String toString() {
		return "Account{" +
				"userName='" + userName + '\'' +
				", encrytedPassword='" + encrytedPassword + '\'' +
				", active=" + active +
				", userRole='" + userRole + '\'' +
				", email='" + email + '\'' +
				", resetCode='" + resetCode + '\'' +
				'}';
	}
}
