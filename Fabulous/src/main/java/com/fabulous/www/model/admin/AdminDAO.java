package com.fabulous.www.model.admin;

import com.fabulous.www.model.member.dto.MemberDTO;

public interface AdminDAO {
	public String loginCheck(MemberDTO dto);
}
