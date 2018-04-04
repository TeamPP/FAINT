package com.faint.persistence;

import java.util.List;

import com.faint.domain.ReplyVO;
import com.faint.dto.RelationDTO;

public interface ReplyDAO {
	
	public void create(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> read(RelationDTO dto) throws Exception;
	
	public void delete(Integer id) throws Exception;
	
	//개인 하루 글 작성 개수 계산
	public Integer writeCount(ReplyVO vo);
}