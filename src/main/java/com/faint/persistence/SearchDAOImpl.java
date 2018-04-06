
package com.faint.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.SearchCriteria;
import com.faint.dto.SearchDTO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.faint.mapper.SearchMapper";

	@Override
	public List<SearchDTO> listKeyword(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listKeyword", cri);
	}
}

