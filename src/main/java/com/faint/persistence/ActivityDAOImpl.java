package com.faint.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.TagVO;
import com.faint.domain.UserVO;
import com.faint.dto.ActivityDTO;


@Repository
public class ActivityDAOImpl implements ActivityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.faint.mapper.ActivityMapper";
	
	
	
	//나와 친구의친구 활동표
	@Override
	public List<ActivityDTO> activityTbl(int userid) throws Exception {
		return sqlSession.selectList(namespace+".activityTbl", userid);
	}

	//추천받는 reId (List형태) 넣고 UserVo객체 받기
	@Override
	public List<UserVO> getRecomm2list(ArrayList<Integer> item) throws Exception {
		return sqlSession.selectList(namespace+".getRecomm2list", item);
	}
	
	
	//나의 활동표
	@Override
	public ActivityDTO myActivity(int userid) throws Exception {
		return sqlSession.selectOne(namespace+".myActivity", userid);
	}

	//내친구의 친구 활동표
	@Override
	public List<ActivityDTO> friendsActivity(int userid) throws Exception {
		return sqlSession.selectList(namespace+".friendsActivity", userid);
	}


	


}
