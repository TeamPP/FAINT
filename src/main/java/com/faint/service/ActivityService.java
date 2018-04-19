package com.faint.service;


import java.util.ArrayList;
import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;

public interface ActivityService {
	
	//나와 나의 추천리스트 사람들의 활동표 가져오기
	public List<ActivityDTO> activityTbl(int userid) throws Exception;
	
	//본인 id를 넣고 그에 따른 추천할 UserVO 받아오기
	public List<UserVO> recomm(int userid) throws Exception;
	
	//list타입의 uerid를 토대로 PostVO 객체 가져오기(추천계정들의 게시글)
	public List<PostVO> RecommPost(int userid) throws Exception;
	
}
