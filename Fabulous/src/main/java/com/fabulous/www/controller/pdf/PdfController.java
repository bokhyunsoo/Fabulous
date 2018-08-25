package com.fabulous.www.controller.pdf;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.service.pdf.PdfService;

@Controller
@RequestMapping("/pdf/*")
public class PdfController {
	@Inject
	PdfService pdfService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		// pdf 문서 생성, 결과 리턴
		String result = pdfService.createPdf();
		// result.jsp로 포워딩
		return new ModelAndView("pdf/result","message", result);
	}
}
