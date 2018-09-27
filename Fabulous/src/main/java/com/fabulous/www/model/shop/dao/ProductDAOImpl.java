package com.fabulous.www.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fabulous.www.model.shop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> listSkewer(int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("product.skewer_list",map);
	}
	
	@Override
	public List<ProductDTO> listDog(int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("product.dog_list",map);
	}

	@Override
	public List<ProductDTO> listSausage(int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("product.sausage_list",map);
	}
	
	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne("product.detail_product", product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.update_product", dto);
	}

	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.delete", product_id);
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("product.insert", dto);
	}

	@Override
	public String fileInfo(int product_id) {
		return sqlSession.selectOne("product.file_info", product_id);
	}

	@Override
	public String descriptionInfo(int product_id) {
		return sqlSession.selectOne("product.description_info", product_id);
	}

	@Override
	public int dogcount() throws Exception {
		return sqlSession.selectOne("product.dogcount");
	}

	@Override
	public int skewercount() throws Exception {
		return sqlSession.selectOne("product.skewercount");
	}

	@Override
	public int sausagecount() throws Exception {
		return sqlSession.selectOne("product.sausagecount");
	}

	
}
