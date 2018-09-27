package com.fabulous.www.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fabulous.www.model.board.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("bno", bno);
		return sqlSession.selectList("reply.listReply", map);
	}

	@Override
	public int count(int bno) {
		return sqlSession.selectOne("reply.count", bno);
	}

	@Override
	public void create(ReplyDTO dto) {
		sqlSession.insert("reply.insertReply", dto);
	}

	@Override
	public void update(ReplyDTO dto) {
		sqlSession.update("reply.updateReply", dto);
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("reply.deleteReply", rno);
	}

	@Override
	public ReplyDTO detail(int rno) {
		return sqlSession.selectOne("reply.detailReply", rno);
	}

}
