package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.dto.NoticeDTO;
import com.faint.dto.RelationDTO;
import com.faint.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO noticeDao;
	
	@Override
	public List<NoticeDTO> getNoticeList(int userid) throws Exception{
		return noticeDao.getNoticeList(userid);
	}
	
	@Override
	public Integer createTaggingNotice(String fromid, String targetid, int postid) throws Exception{
		
		NoticeDTO dto=new NoticeDTO();
		dto.setFromid(fromid); //String인 nickname값으로 들어감
		dto.setTargetid(targetid); //String인 nickname값으로 들어감
		dto.setPostid(postid);
		
		System.out.println(dto.toString());
		
		return noticeDao.createTaggingNotice(dto);
	}
	
}
