package com.fabulous.www.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fabulous.www.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImple implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.login_check", dto);
		// 조건식 ? true일 때의 값 : false일 때의 값
		return (name == null) ? false : true;
	}
 	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}
 	
	@Override
	public void inserMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember", dto);
	}
	@Override
	public String selectUserid(MemberDTO dto) {
		return sqlSession.selectOne("member.selectUserid", dto);
	}
 }
