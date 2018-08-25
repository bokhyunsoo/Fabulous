package com.fabulous.www.service.member;

import javax.servlet.http.HttpSession;

import com.fabulous.www.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String userid);
	public void inserMember(MemberDTO dto);
	public String selectUserid(MemberDTO dto);
}
