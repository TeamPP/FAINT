package com.faint.persistence;

import java.util.List;

import com.faint.domain.ChatroomVO;
import com.faint.dto.RelationDTO;

public interface ChatDAO {

	//채팅방 생성 메서드-1
	public void chatCreate() throws Exception;
	//채팅방 생성 메서드-2
	public void chatCreateAndUserInsert(RelationDTO dto) throws Exception;
	
	//채팅방 리스트 가져오기
	public List<ChatroomVO> getChatList(int userid) throws Exception;
}
