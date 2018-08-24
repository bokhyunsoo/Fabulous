package com.fabulous.www.controller.shop;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.shop.dto.ProductDTO;
import com.fabulous.www.service.shop.ProductService;

@Controller
@RequestMapping("shop/product/*")
public class ProductController {
	
	@Inject // 의존관계 주입
	ProductService productService;
	
	@RequestMapping("list.do") // 세부적인 url pattern
	public ModelAndView list(ModelAndView mav) {
		// 포워딩할 뷰의 경로
		mav.setViewName("/shop/product_list");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	
	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		// 포워딩할 뷰의 경로
		mav.setViewName("/shop/product_detail");
		// 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "shop/product_write";
	}
	
 	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		// 뷰의 이름
		mav.setViewName("/shop/product_edit");
		// 뷰에 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_id));
		// product_edit.jsp로 포워딩
		return mav;
	}
 	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
 		
 		String description_filename = "-";
 		String picture_filename = "-";
		if (!dto.getDescription_file().isEmpty() || !dto.getPicture_file().isEmpty()) { // 첨부파일 존재
			description_filename = dto.getDescription_file().getOriginalFilename();
			picture_filename = dto.getPicture_file().getOriginalFilename();
			
			try {
				// 개발 디렉토리
				// String path =
				// "D:\\Spring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
				// 배포 디렉토리
				String path = "D:\\Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Fabulous\\WEB-INF\\views\\images\\";
 				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
				dto.getDescription_file().transferTo(new File(path + description_filename));
				dto.getPicture_file().transferTo(new File(path + picture_filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
 		}
		dto.setDescription(description_filename);
		dto.setPicture_url(picture_filename);
		
		// 상품정보를 레코드에 저장
		productService.insertProduct(dto);
		// 상품 목록 페이지로 이동
		
		System.out.println(dto);
		
		return "redirect:/shop/product/list.do";
	}
 	@RequestMapping("update.do")
	public String update(@ModelAttribute ProductDTO dto) {
 		System.out.println(dto);
 		String description_filename = "-";
 		String picture_filename = "-";
		if (!dto.getDescription_file().isEmpty() && !dto.getPicture_file().isEmpty()) { // 첨부파일 존재
			description_filename = dto.getDescription_file().getOriginalFilename();
			picture_filename = dto.getPicture_file().getOriginalFilename();
			try {
				// 개발 디렉토리
				// String path =
				// "D:\\Spring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
				// 배포 디렉토리
				String path = "D:\\Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Fabulous\\WEB-INF\\views\\images\\";
 				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
 				dto.getDescription_file().transferTo(new File(path + description_filename));
				dto.getPicture_file().transferTo(new File(path + picture_filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
				dto.setPicture_url(picture_filename);
				dto.setDescription(description_filename);
				
		} else if(!dto.getDescription_file().isEmpty() && dto.getPicture_file().isEmpty()) {
			description_filename = dto.getDescription_file().getOriginalFilename();
			picture_filename = dto.getPicture_file().getOriginalFilename();
			try {
				// 개발 디렉토리
				// String path =
				// "D:\\Spring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
				// 배포 디렉토리
				String path = "D:\\Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Fabulous\\WEB-INF\\views\\images\\";
 				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
 				dto.getDescription_file().transferTo(new File(path + description_filename));
				dto.getPicture_file().transferTo(new File(path + picture_filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
			dto.setDescription(description_filename);
			dto.setPicture_url(dto2.getPicture_url());
			
		} else if(dto.getDescription_file().isEmpty() && !dto.getPicture_file().isEmpty()) {
			description_filename = dto.getDescription_file().getOriginalFilename();
			picture_filename = dto.getPicture_file().getOriginalFilename();
			try {
				// 개발 디렉토리
				// String path =
				// "D:\\Spring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
				// 배포 디렉토리
				String path = "D:\\Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Fabulous\\WEB-INF\\views\\images\\";
 				new File(path).mkdir();
				// 업로드된 임시파일을 원하는 디렉토리로 복사
 				dto.getDescription_file().transferTo(new File(path + description_filename));
				dto.getPicture_file().transferTo(new File(path + picture_filename));
			} catch (Exception e) {
				e.printStackTrace();
			} 
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
			dto.setPicture_url(picture_filename);
			dto.setDescription(dto2.getDescription());
			
		} else {
			// 새로운 파일 첨부가 없을 때
			// 기존의 첨부파일 정보가 지워지지 않도록 처리
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
			dto.setDescription(dto2.getDescription());
			dto.setPicture_url(dto2.getPicture_url());
		}
		productService.updateProduct(dto);
		// 상품 목록 페이지로 이동
 		return "redirect:/shop/product/list.do";
	}
			
	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {
		// 상품코드에 해당하는 첨부파일 이름 조회
		String picture_filename = productService.fileInfo(product_id);
		System.out.println("첨부파일 이름:"+picture_filename);
		String description_filename = productService.descriptionInfo(product_id);
		if(picture_filename != null || picture_filename.equals("-") || description_filename != null || description_filename.equals("-")) { // 첨부파일이 존재하면
			String path="D:\\Spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Fabulous\\WEB-INF\\views\\images\\"; // 첨부파일의 디렉토리
			File f = new File(path+picture_filename);
			System.out.println("파일존재여부:"+f.exists());
			File f2 = new File(path+description_filename);
			if(f.exists() || f2.exists()) { // 파일이 존재하면
				f.delete(); // 파일삭제
				f2.delete();
			}
		}
		productService.deleteProduct(product_id);
		return "redirect:/shop/product/list.do";
	}
}
