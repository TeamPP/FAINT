package com.faint.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;
import com.faint.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void regist(ReplyVO vo) throws Exception{
		dao.create(vo);
	}
	
	@Override
	public List<ReplyVO> read(RelationDTO dto) throws Exception{
		return dao.read(dto);
	}
	
	@Override
	public void remove(Integer id) throws Exception{
		dao.delete(id);
	}
	
	@Override
	public Integer writeCount(ReplyVO vo) {
		return dao.writeCount(vo);
	}
	
}