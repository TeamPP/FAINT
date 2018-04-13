package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.TagVO;
import com.faint.dto.ActivityDTO;


@Repository
public class ActivityDAOImpl implements ActivityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.faint.mapper.ActivityMapper";
	
	
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
	
	//나와 친구의친구 활동표
	@Override
	public List<ActivityDTO> activityTbl(int userid) throws Exception {
		return sqlSession.selectList(namespace+".activityTbl", userid);
	}



}
