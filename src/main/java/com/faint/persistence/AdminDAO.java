package com.faint.persistence;

import java.util.HashMap;

import java.util.List;

import com.faint.domain.UserVO;

import util.SearchMemberCriteria;

// 관리자 
public interface AdminDAO {
		List<UserVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map); //  회원목록 불러오기 
		
		int getTotalMemberCount(SearchMemberCriteria scri);   //전체 회원수 
		
		public List<UserVO> listAll() throws Exception;
		
		public int deleteMember(String memberEmail);
}
