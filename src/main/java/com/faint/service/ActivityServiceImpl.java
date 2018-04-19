package com.faint.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.PostVO;
import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;
import com.faint.persistence.ActivityDAO;
import com.faint.util.Simility;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Inject
	private ActivityDAO dao;
	
	
	//userid에 따른 본인과 추천받을 사람들의 활동표
	@Override
	public List<ActivityDTO> activityTbl(int userid) throws Exception {
		return dao.activityTbl(userid);
	}
	
	//본인 id를 넣고 그에 따른 추천할 UserVO 받아오기
	@Override
	public List<UserVO> recomm(int userid) throws Exception {
		List<ActivityDTO> activity=dao.activityTbl(userid);
		ArrayList<Integer> reList=Simility.getRecomId(activity);
		return dao.getRecomm2list(reList);
	
	}
	
	
	//list타입의 uerid를 토대로 PostVO 객체 가져오기(추천계정들의 게시글)
	@Override
	public List<PostVO> RecommPost(int userid) throws Exception {
		List<ActivityDTO> activity=dao.activityTbl(userid);
		ArrayList<Integer> reList=Simility.getRecomId(activity);
		return dao.getRecommPost(reList);
	}

}
