package com.faint.service;


import java.util.List;

import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;

public interface ActivityService {
	
	//나와 나의 추천리스트 사람들의 활동표 가져오기
	public List<ActivityDTO> activityTbl(int userid) throws Exception;
	
	//본인 id를 넣고 그에 따른 추천할 UserVO 받아오기
	public List<UserVO> recomm(int userid) throws Exception;
}
