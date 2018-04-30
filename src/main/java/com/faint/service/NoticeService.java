package com.faint.service;

import java.util.List;

import com.faint.dto.NoticeDTO;


public interface NoticeService {
	
	public List<NoticeDTO> getNoticeList(int userid) throws Exception;
	
	public Integer createTaggingNotice(String fromid, String targetid, int postid) throws Exception;
	
}
