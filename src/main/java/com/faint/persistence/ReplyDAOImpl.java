package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.faint.mapper.replyMapper";
	
	@Override
	public void create(ReplyVO vo) throws Exception{
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public List<ReplyVO> read(RelationDTO dto) throws Exception{
		return session.selectList(namespace+".read", dto);
	}
	
	@Override
	public void delete(Integer id) throws Exception{
		session.delete(namespace+".delete", id);
	}
	
}