package com.faint.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;
import com.faint.persistence.NoticeDAO;
import com.faint.persistence.ReplyDAO;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private NoticeDAO nDao;
	
	@Transactional
	@Override
	public void regist(ReplyVO vo) throws Exception{
		dao.create(vo);
		
		//reply 소켓 알림
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getUserid());
		dto.setUserid(vo.getPostwriter());
		dto.setPostid(vo.getPostid());
		nDao.createReplyNotice(dto);
	}
	
	@Override
	public List<ReplyVO> read(RelationDTO dto) throws Exception{
		return dao.read(dto);
	}
	
	@Override
	public void remove(int id, int userid) throws Exception{
		dao.delete(id);
	}
	
	@Override
	public Integer writeCount(ReplyVO vo) {
		return dao.writeCount(vo);
	}
	
}