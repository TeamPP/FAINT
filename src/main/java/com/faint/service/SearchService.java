package com.faint.service;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.dto.SearchDTO;

public interface SearchService {

	public List<SearchDTO> listKeyword(SearchCriteria cri) throws Exception;			// 검색창 검색어
}
