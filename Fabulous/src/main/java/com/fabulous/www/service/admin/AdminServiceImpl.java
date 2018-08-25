package com.fabulous.www.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fabulous.www.model.admin.AdminDAO;
import com.fabulous.www.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return adminDao.loginCheck(dto);
	}

}
