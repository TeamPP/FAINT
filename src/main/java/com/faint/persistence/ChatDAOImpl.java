package com.faint.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.ChatroomVO;
import com.faint.dto.RelationDTO;

@Repository
public class ChatDAOImpl implements ChatDAO {
	
	@Inject
	private SqlSession session;
	
	//채팅방 Mapper
	private static String namespace = "com.faint.mapper.chatMapper";
	
	//채팅방 생성1
	@Override
	public void chatCreate() throws Exception{
		session.insert(namespace+".chatCreate");
	}
	
	//채팅방 생성2 - 채팅방 생성 및 유저 입력
	@Override
	public void chatCreateAndUserInsert(RelationDTO dto) throws Exception{
		session.insert(namespace+".chatCreateAndUserInsert", dto);
	}
	
	//채팅방 리스트 가져오기
	@Override
	public List<ChatroomVO> getChatList(int userid) throws Exception{
		return session.selectList(namespace+".getChatList", userid);
	}
	
}
