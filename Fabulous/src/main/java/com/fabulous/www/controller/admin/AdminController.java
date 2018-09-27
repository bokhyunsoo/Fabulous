package com.fabulous.www.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.member.dto.MemberDTO;
import com.fabulous.www.service.admin.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	AdminService adminService;
	
	@RequestMapping("login.do")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session, ModelAndView mav) {
		String name = adminService.loginCheck(dto);
		if(name != null) { // 로그인 성공
			session.setAttribute("admin_userid", dto.getUserId());
			session.setAttribute("admin_name", name);
			session.setAttribute("userid", dto.getUserId());
			session.setAttribute("name", name);
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		//세션 초기화
		adminService.logout(session);
//		session.invalidate();
		// login.jsp로 이동
		mav.setViewName("admin/login");
		mav.addObject("message", "logout");
		return mav;
	}
}
