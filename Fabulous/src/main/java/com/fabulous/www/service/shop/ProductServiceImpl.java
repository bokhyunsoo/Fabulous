package com.fabulous.www.service.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Service;

import com.fabulous.www.model.shop.dao.ProductDAO;
import com.fabulous.www.model.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO productDao;
	
	@Override
	public List<ProductDTO> listSkewer(int start, int end) {
		return productDao.listSkewer(start, end);
	}
	
	@Override
	public List<ProductDTO> listDog(int start, int end) {
		return productDao.listDog(start, end);
	}

	@Override
	public List<ProductDTO> listSausage(int start, int end) {
		return productDao.listSausage(start, end);
	}
	
	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto);
	}

	@Override
	public void deleteProduct(int product_id) {
		productDao.deleteProduct(product_id);
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		productDao.insertProduct(dto);
	}

	@Override
	public String fileInfo(int product_id) {
		return productDao.fileInfo(product_id);
	}

	@Override
	public String descriptionInfo(int product_id) {
		return productDao.descriptionInfo(product_id);
	}

	@Override
	public int dogcount() throws Exception {
		return productDao.dogcount();
	}

	@Override
	public int skewercount() throws Exception {
		return productDao.skewercount();
	}

	@Override
	public int sausagecount() throws Exception {
		return productDao.sausagecount();
	}
}
