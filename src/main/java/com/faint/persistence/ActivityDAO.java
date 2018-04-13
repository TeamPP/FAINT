package com.faint.persistence;

import java.util.List;

import com.faint.domain.TagVO;
import com.faint.dto.ActivityDTO;

public interface ActivityDAO {
	
	//나의 활동표 가져오기
	public ActivityDTO myActivity(int userid) throws Exception;
	
	//나의 친구들의 친구 활둉표가져오기
	public List<ActivityDTO> friendsActivity(int userid) throws Exception;
	
	//나와 나의 추천리스트 사람들의 활동표 가져오기
	public List<ActivityDTO> activityTbl(int userid) throws Exception;
	
	
	
}
