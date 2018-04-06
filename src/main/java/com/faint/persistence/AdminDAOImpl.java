package com.faint.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.UserVO;

import util.SearchMemberCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.faint.mapper.AdminMapper";
	
	@Override
	public List<UserVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map) {
		
	System.out.println(" 여기 서에러 날수도 있겠다 ");
		
		return sqlSession.selectList(namespace+".getSearchMemberList", scri);
	}
	
	@Override
	public int getTotalMemberCount(SearchMemberCriteria scri) {
		return sqlSession.selectOne(namespace+".getTotalMemberCount", scri);
	}
	@Override
	public List<UserVO> listAll()throws Exception{
		return sqlSession.selectList(namespace+".getSearchMemberList");
	}
	
	@Override
	
	public int deleteMember(String email) {
		
		return sqlSession.delete(namespace+".deleteMember", email);
	}
	
}
