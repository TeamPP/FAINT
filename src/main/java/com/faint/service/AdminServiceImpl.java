package com.faint.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.UserVO;
import com.faint.persistence.AdminDAO;

import util.Paging;
import util.SearchMemberCriteria;

@Service
public class AdminServiceImpl  implements AdminService{
	
	@Inject
	private AdminDAO dao;
	
	 @Override
	 public void getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object>map ) {
		 
		  System.out.println("11111멤버리스트 보러 왔니??? ");
			List<UserVO> lists = new ArrayList<UserVO>();
			lists = dao.getSearchMemberList(scri,map);

			int totalRecordCount = dao.getTotalMemberCount(scri);
			String pagingDiv = Paging.pagingAjaxMember(totalRecordCount, scri, "memberPaging");
			System.out.println("송민석송민석 ");
			map.put("memberLists", lists);
			System.out.println(lists.size());
			map.put("memberPagingDiv", pagingDiv);
	 }
	 
	 @Override
	 public List<UserVO> listAll() throws Exception{
		 return dao.listAll();
	 }
	 
		@Override
		public int deleteMember(String memberEmail) {
			
			return dao.deleteMember(memberEmail);
		}
}
