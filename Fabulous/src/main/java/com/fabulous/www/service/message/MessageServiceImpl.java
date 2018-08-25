package com.fabulous.www.service.message;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fabulous.www.model.message.dao.MessageDAO;
import com.fabulous.www.model.message.dao.PointDAO;
import com.fabulous.www.model.message.dto.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	MessageDAO messageDao;
	
	@Inject
	PointDAO pointDao;
	
	@Transactional // 트랜잭션 처리 적용
	
	@Override
	public void addMessage(MessageDTO dto) {
		// 메시지 저장
		messageDao.create(dto);
		// 메시지 발신자에게 10포인트 적립
		pointDao.updatePoint(dto.getSender(), 10);
	}

	@Override
	public MessageDTO readMessage(String userid, int mid) {
		// TODO Auto-generated method stub
		return null;
	}

}
