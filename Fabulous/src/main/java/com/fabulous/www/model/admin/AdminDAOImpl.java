package com.fabulous.www.model.admin;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fabulous.www.model.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlsession.selectOne("admin.login_check", dto);
	}

}
