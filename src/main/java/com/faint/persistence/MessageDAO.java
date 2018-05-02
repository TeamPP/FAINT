package com.faint.persistence;

import java.util.List;

import com.faint.domain.MessageVO;
import com.faint.dto.RelationDTO;

public interface MessageDAO {

	public int insertFirstMessage(MessageVO vo) throws Exception;
	
	public int readMessages(RelationDTO dto) throws Exception;
	
	public List<MessageVO> getMessages(RelationDTO dto) throws Exception;
	
	public void registMessage(MessageVO vo) throws Exception;
	
	public String getUsers(MessageVO vo) throws Exception;
}
