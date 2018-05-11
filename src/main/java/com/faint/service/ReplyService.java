package com.faint.service;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;

public interface ReplyService{
	
	@PreAuthorize("isAuthenticated() and #vo.userid == principal.vo.id")
	public void regist(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> read(RelationDTO dto) throws Exception;
	
	@PreAuthorize("isAuthenticated() and #userid == principal.vo.id")
	public void remove(int id, int userid) throws Exception;
	
	public Integer writeCount(ReplyVO vo);
}