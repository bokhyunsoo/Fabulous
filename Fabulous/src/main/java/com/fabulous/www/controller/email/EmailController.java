package com.fabulous.www.controller.email;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fabulous.www.model.email.EmailDTO;
import com.fabulous.www.service.email.EmailService;

@Controller
@RequestMapping("/email/*")
public class EmailController {
	
	@Inject
	EmailService emailService;
	
	@RequestMapping("write.do")
	public String write() {
		return "/email/write";
	}
	
	@RequestMapping("send.do")
	public String send(@ModelAttribute EmailDTO dto, Model model) {
		try {
			emailService.sendMail(dto);
			model.addAttribute("message", "메일이 발송되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 발송 실패...");
		}
		return "/email/write"; // write.jsp로 포워딩
	}
}
