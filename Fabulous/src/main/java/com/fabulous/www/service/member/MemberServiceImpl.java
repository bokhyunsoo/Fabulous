package com.fabulous.www.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.fabulous.www.model.member.dao.MemberDAO;
import com.fabulous.www.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDao.loginCheck(dto);
		if(result) { // 로그인 성공
			//세션변수에 값 저장
			MemberDTO dto2 = viewMember(dto.getUserId());
			session.setAttribute("userid", dto.getUserId());
			session.setAttribute("name", dto2.getName());
		}
		return result;
	}
 	@Override
	public void logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
	}
 	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}
	@Override
	public void inserMember(MemberDTO dto) {
		memberDao.inserMember(dto);
	}
	@Override
	public String selectUserid(MemberDTO dto) {
		return memberDao.selectUserid(dto);
	}

}
