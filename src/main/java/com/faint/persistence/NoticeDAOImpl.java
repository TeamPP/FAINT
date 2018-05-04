package com.faint.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.ReplyVO;
import com.faint.dto.NoticeDTO;
import com.faint.dto.RelationDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.noticeMapper";
	
	@Override
	public List<NoticeDTO> getNoticeList(int userid) throws Exception {
		return session.selectList(namespace+".getNoticeList", userid);
		
	}
	
	@Override
	public void createFollowNotice(RelationDTO dto) throws Exception{
		if(dto.getLoginid()!=dto.getUserid()){
			dto.setType("F");
			session.insert(namespace+".createFollowNotice", dto);
		}
	}
	
	@Override
	public Integer createTaggingNotice(NoticeDTO dto) throws Exception{
		if(dto.getFromid()!=dto.getTargetid()){
			dto.setType("T");
			return session.insert(namespace+".createTaggingNotice", dto);
		}
		return 0;
	}
	
	@Override
	public void createLikeNotice(RelationDTO dto) throws Exception{
		if(dto.getLoginid()!=dto.getUserid()){
			dto.setType("L");
			session.insert(namespace+".createLikeNotice", dto);
		}
	}
	
	@Override
	public void createReplyNotice(RelationDTO dto) throws Exception{
		if(dto.getLoginid()!=dto.getUserid()){
			dto.setType("R");
			session.insert(namespace+".createReplyNotice", dto);
		}
	}
	
	
}
