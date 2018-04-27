package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.faint.domain.ChatroomVO;
import com.faint.domain.MessageVO;
import com.faint.dto.RelationDTO;
import com.faint.persistence.ChatDAO;
import com.faint.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {
	
	//채팅방 관련
	@Inject
	private ChatDAO cDao;
	
	//메세지 관련
	@Inject
	private MessageDAO mDao;
	
	//=================채팅방 관련=================
	
	//채팅방 생성
	@Transactional
	@Override
	public int chatCreate(RelationDTO dto, MessageVO vo) throws Exception{
		//채팅방 생성
		cDao.chatCreate();
		//채팅방 인원 삽입
		cDao.chatCreateAndUserInsert(dto);
		//첫 메세지 삽입
		int roomId = mDao.insertFirstMessage(vo);
		
		return roomId;
		
	}
	
	@Override
	public List<MessageVO> getMessages(int roomid, int loginid) throws Exception{
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(loginid);
		dto.setRoomid(roomid);
		
		return mDao.getMessages(dto);
	}
	
	@Override
	public List<ChatroomVO> getChatList(int userid) throws Exception{
		return cDao.getChatList(userid);
	}
	
	@Transactional
	@Override
	public String registMessage(MessageVO vo) throws Exception{
		mDao.registMessage(vo);
		return mDao.getUsers(vo);
	}
	
}
