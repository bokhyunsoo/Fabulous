package com.fabulous.www.service.admin;

import javax.servlet.http.HttpSession;

import com.fabulous.www.model.member.dto.MemberDTO;

public interface AdminService {
	public String loginCheck(MemberDTO dto);
	public void logout(HttpSession session);
}
