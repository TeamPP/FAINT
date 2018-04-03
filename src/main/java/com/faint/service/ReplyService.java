package com.faint.service;

import java.util.List;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;

public interface ReplyService{
	
	public void regist(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> read(RelationDTO dto) throws Exception;
	
	public void remove(Integer id) throws Exception;
	
}