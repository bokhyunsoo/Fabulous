package com.fabulous.www.model.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_id;
	private String product_name;
	private int price;
	private String description;
	private String picture_url;
	private MultipartFile description_file;
	private MultipartFile picture_file; // 첨부파일
	
	public ProductDTO() {}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	
	public MultipartFile getDescription_file() {
		return description_file;
	}

	public void setDescription_file(MultipartFile description_file) {
		this.description_file = description_file;
	}

	public MultipartFile getPicture_file() {
		return picture_file;
	}

	public void setPicture_file(MultipartFile picture_file) {
		this.picture_file = picture_file;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
				+ ", description=" + description + ", picture_url=" + picture_url + ", description_file="
				+ description_file + ", picture_file=" + picture_file + "]";
	}
}
