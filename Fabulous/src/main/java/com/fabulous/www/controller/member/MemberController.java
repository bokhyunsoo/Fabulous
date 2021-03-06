package com.fabulous.www.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fabulous.www.model.member.dto.MemberDTO;
import com.fabulous.www.service.member.MemberService;

@Controller // 컨트롤러 빈으로 등록
@RequestMapping("member/*") // 공통적인 url 매핑
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("login.do") // 세부적인 url 매핑
	public String login() {
		return "member/login"; // login.jsp로 이동
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		boolean result = memberService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result) { // 로그인 성공
			mav.setViewName("redirect:/"); // 뷰의 이름
		} else { // 로그인 실패
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		//세션 초기화
		memberService.logout(session);
//		session.invalidate();
		// login.jsp로 이동
		mav.setViewName("member/login");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("insert.do")
	public ModelAndView insertMember(@ModelAttribute MemberDTO dto, ModelAndView mav) {
		
		memberService.inserMember(dto);
		
		mav.setViewName("member/login");
		mav.addObject("message", "success");
		return mav;
	}
	
}
