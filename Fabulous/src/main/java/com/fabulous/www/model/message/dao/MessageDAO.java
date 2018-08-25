package com.fabulous.www.model.message.dao;

import com.fabulous.www.model.message.dto.MessageDTO;

public interface MessageDAO {
	public void create(MessageDTO dto);
	public MessageDTO readMessage(int mid);
	public void updateState(int mid);
}
