package com.faint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.SearchCriteria;
import com.faint.domain.TagVO;
import com.faint.persistence.TagDAO;

@Service
public class TagServiceImpl implements TagService {
	
	@Inject
	private TagDAO dao;
	
	
	@Override
	public void regist(TagVO vo) throws Exception {
		dao.create(vo);
	}

	// 태그 목록
	@Override
	public List<TagVO> listAll() throws Exception {
		return dao.listAll();
	}
	// 태그 검색
	@Override
	public List<String> listKeyword(SearchCriteria cri) throws Exception {
		return dao.listKeyword(cri);
	}

	// 태그 정보
	@Override
	public List<TagVO> tagInfo(String name) throws Exception {
		return dao.tagInfo(name);
	}
	
	// 인기 태그
	@Override
	public List<TagVO> topTag() throws Exception {
		return dao.topTag();
	}
	



}
