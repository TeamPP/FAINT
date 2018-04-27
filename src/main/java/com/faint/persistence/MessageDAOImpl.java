package com.faint.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.MessageVO;
import com.faint.dto.RelationDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.messageMapper";

	@Override
	public int insertFirstMessage(MessageVO vo) throws Exception{
		System.out.println(vo.toString());
		session.insert(namespace+".insertFirstMessage", vo);
		System.out.println(vo.toString());
		return vo.getRoomid();
	}
	
	@Override
	public List<MessageVO> getMessages(RelationDTO dto) throws Exception{
		return session.selectList(namespace+".getMessages", dto);
	}
	
	@Override
	public String registMessage(MessageVO vo) throws Exception{
		System.out.println("유저리스트 이건가?1"+ vo.getUsers());
		session.selectList(namespace+".registMessage", vo);
		System.out.println("유저리스트 이건가?2"+ vo.getUsers());
		return vo.getUsers();
	}
	
}
