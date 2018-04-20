package com.faint.persistence;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;

public interface TagDAO {
	
	// 태그 등록
	public void create(TagVO vo) throws Exception;

	// 태그 전체 목록
	public List<TagVO> listAll() throws Exception;
	
	// 태그 검색
	public List<String> listKeyword(SearchCriteria cri) throws Exception;
	
	//태그 정보 출력
	public List<TagVO> tagInfo(String name) throws Exception;
	
	//태그 카운트 
	public void tagCnt(String name) throws Exception;
	
	//인기 태그
	public List<TagVO> topTag() throws Exception;
}

