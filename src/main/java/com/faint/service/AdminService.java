package com.faint.service;

import java.util.HashMap;
import java.util.List;

import com.faint.domain.UserVO;

import util.SearchMemberCriteria;

public interface AdminService {
	void getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map	);
	
	public List<UserVO> listAll() throws Exception;
	
	public int deleteMember(String memberEmail);
}
