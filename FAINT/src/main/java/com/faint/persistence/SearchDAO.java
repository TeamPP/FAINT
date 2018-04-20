
package com.faint.persistence;

import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.dto.SearchDTO;

public interface SearchDAO {
	
	public List<SearchDTO> listKeyword(SearchCriteria cri) throws Exception;		// 검색창 검색어 키워드
}
