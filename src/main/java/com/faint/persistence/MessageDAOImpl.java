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
	public int readMessages(RelationDTO dto) throws Exception{
		return session.update(namespace+".readMessages", dto);
	}
	
	@Override
	public List<MessageVO> getMessages(RelationDTO dto) throws Exception{
		return session.selectList(namespace+".getMessages", dto);
	}
	
	@Override
	public void registMessage(MessageVO vo) throws Exception{
		session.insert(namespace+".registMessage", vo);
	}
	
	@Override
	public String getUsers(MessageVO vo) throws Exception{
		return session.selectOne(namespace+".getUsers", vo);
	}
	
}
