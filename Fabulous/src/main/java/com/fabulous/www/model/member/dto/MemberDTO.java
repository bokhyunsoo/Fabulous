package com.fabulous.www.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private String userId;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private Date join_date; // java.util.Date
	
	public MemberDTO() {}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", join_date=" + join_date + "]";
	}
}
