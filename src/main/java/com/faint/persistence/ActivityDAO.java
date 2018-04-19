package com.faint.persistence;

import java.util.ArrayList;
import java.util.List;

import com.faint.domain.PostVO;
import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;

public interface ActivityDAO {
	
	
	//나와 나의 추천리스트 사람들의 활동표 가져오기
	public List<ActivityDTO> activityTbl(int userid) throws Exception;
	
	//list타입의 uerid를 토대로 UserVO 객체 가져오기
	public List<UserVO> getRecomm2list(ArrayList<Integer> item) throws Exception;

	
	//list타입의 uerid를 토대로 PostVO 객체 가져오기(추천계정들의 게시글)
	public List<PostVO> getRecommPost(ArrayList<Integer> item) throws Exception;

	
	
	
}
