package com.fabulous.www.service.shop;

import java.util.List;

import org.apache.catalina.connector.Request;

import com.fabulous.www.model.shop.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> listSkewer(int start, int end);
	List<ProductDTO> listDog(int start, int end);
	List<ProductDTO> listSausage(int start, int end);
	ProductDTO detailProduct(int product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
	String fileInfo(int product_id);
	String descriptionInfo(int product_id);
	public int dogcount() throws Exception;
	public int skewercount() throws Exception;
	public int sausagecount() throws Exception;
}
