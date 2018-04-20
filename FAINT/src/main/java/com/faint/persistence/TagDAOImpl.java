package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;

@Repository
public class TagDAOImpl implements TagDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.faint.mapper.TagMapper";
	
	// 태그 등록
	@Override
	public void create(TagVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	// 태그 전체 목록
	@Override
	public List<TagVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	// 태그 검색
	@Override
	public List<String> listKeyword(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listKeyword", cri);
	}
	
	//태그 정보 출력
	@Override
	public List<TagVO> tagInfo(String name) throws Exception {
		tagCnt(name);	// 태그카운트+1
		return session.selectList(namespace+".tagInfo", name);
	}
	
	//태그 카운트 
	@Override
	public void tagCnt(String name) throws Exception {
		session.update(namespace+".tagCnt", name);		
	}

	//인기 태그
	@Override
	public List<TagVO> topTag() throws Exception {
		return session.selectList(namespace+".topTag");
	}
	
	
}
