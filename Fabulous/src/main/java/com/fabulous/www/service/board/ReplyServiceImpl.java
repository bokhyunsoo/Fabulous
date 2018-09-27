package com.fabulous.www.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.fabulous.www.model.board.dao.ReplyDAO;
import com.fabulous.www.model.board.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO replyDao;
	
	@Override
	public List<ReplyDTO> list(int bno, int start, int end, HttpSession session) {
		List<ReplyDTO> items = replyDao.list(bno, start, end);
		// 세션에서 현재 사용자 id값 저장
		String userid = (String) session.getAttribute("userid");
		for(ReplyDTO dto : items) {
			// 댓글 목록중에 비밀 댓글이 있을 경우
			if(dto.getSecretReply().equals("y")) {
				if(userid==null) { // 비로그인 상태면 비밀 댓글로 처리
					dto.setReplytext("비밀 댓글입니다.");
				} else {
					String writer = dto.getWriter(); // 게시물 작성자 저장
					String replyer = dto.getReplyer(); // 댓글 작성자 저장
					// 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
					if(!userid.equals(writer) && !userid.equals(replyer)) {
						dto.setReplytext("비밀 댓글입니다.");
					}
				}
			}
		}
		return items;
	}

	@Override
	public int count(int bno) {
		return replyDao.count(bno);
	}

	@Override
	public void create(ReplyDTO dto) {
		replyDao.create(dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		replyDao.update(dto);
	}

	@Override
	public void delete(int rno) {
		replyDao.delete(rno);
	}

	@Override
	public ReplyDTO detail(int rno) {
		return replyDao.detail(rno);
	}

}
