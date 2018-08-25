package com.fabulous.www.model.member.dao;

import com.fabulous.www.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public void inserMember(MemberDTO dto);
	public String selectUserid(MemberDTO dto);
}
