package com.faint.persistence;

import java.util.List;

import com.faint.dto.NoticeDTO;
import com.faint.dto.RelationDTO;

public interface NoticeDAO {
	
	public List<NoticeDTO> getNoticeList(int userid) throws Exception;
	
	public void createFollowNotice(RelationDTO dto) throws Exception;
	
	public Integer createTaggingNotice(NoticeDTO dto) throws Exception;
	
	public void createLikeNotice(RelationDTO dto) throws Exception;
	
	public void createReplyNotice(RelationDTO dto) throws Exception;
	
}
