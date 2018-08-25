package com.fabulous.www.service.message;

import com.fabulous.www.model.message.dto.MessageDTO;

public interface MessageService {
	public void addMessage(MessageDTO dto);
	public MessageDTO readMessage(String userid, int mid);
}
