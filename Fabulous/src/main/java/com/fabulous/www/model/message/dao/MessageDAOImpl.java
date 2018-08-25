package com.fabulous.www.model.message.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fabulous.www.model.message.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void create(MessageDTO dto) {
		sqlSession.insert("message.create", dto);
	}

	@Override
	public MessageDTO readMessage(int mid) {
		return null;
	}

	@Override
	public void updateState(int mid) {
		// TODO Auto-generated method stub

	}

}
