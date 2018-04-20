package com.faint.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faint.domain.AdminPostVO;
import com.faint.domain.AdminReplyVO;
import com.faint.domain.AdminReportVO;
import com.faint.domain.AdminUserVO;
import com.faint.domain.UserVO;
import com.faint.persistence.AdminDAO;

import util.AdminCriteria;
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
	
		// 유저 관리자

		
		// 유저 관리 리스트
		@Override
		public List<AdminUserVO> AUList(AdminCriteria ac) throws Exception{
			return dao.AUList(ac);
		}
		@Override
		public int AULCount(AdminCriteria ac) throws Exception {
		  return dao.AULCount(ac);
		}
		
		// 유저 관리 리스트 삭제
		@Override
		public void AUDelete(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.AUDelete(value);
		}
		
		// 유저 영구 정지
		@Override
		public void AUPStop(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.AUPStop(value);
		}
		
		// 유저 정지
		@Override
		public void AUStop(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.AUStop(value);
		}
		
		// 게시물 관리자

		// 게시물 관리 리스트
		@Override
		public List<AdminPostVO> APList(AdminCriteria ac) throws Exception {
			return dao.APList(ac);
		}
		@Override
		public int APLCount(AdminCriteria ac) throws Exception {
		  return dao.APLCount(ac);
		}
		
		// 게시물 관리 리스트 삭제
		@Override
		public void APDelete(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.APDelete(value);
		}
		
		// 게시물 관리자 외 비공개 처리
		@Override
		public void APBlock(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.APBlock(value);
		}
		
		
		// 댓글 관리자

		// 댓글 관리 리스트
		@Override
		public List<AdminReplyVO> ARList(AdminCriteria ac) throws Exception {
			return dao.ARList(ac);
		}
		@Override
		public int ARLCount(AdminCriteria ac) throws Exception {
		  return dao.ARLCount(ac);
		}

		// 댓글 관리 리스트 삭제
		@Override
		public void ARDelete(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.ARDelete(value);
		}

		
		
		// 유저 신고 관리자

		// 유저 신고 게시글 작성
		@Override
		public void ARUCreate(AdminReportVO vo) throws Exception {
			dao.ARUCreate(vo);
		}
		@Override
		public int ARULCount(AdminCriteria ac) throws Exception {
		  return dao.ARULCount(ac);
		}

		// 유저 신고 게시글 리스트
		@Override
		public List<AdminReportVO> ARUList(AdminCriteria ac) throws Exception {
			return dao.ARUList(ac);
		}

		// 유저 신고 게시글 삭제
		@Override
		public void ARUDelete(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.ARUDelete(value);
		}

		// 유저 신고 게시글 상세페이지
		@Override
		public AdminReportVO ARURead(Integer id) throws Exception {
			return dao.ARURead(id);
		}

		// 유저 신고 게시글 읽은 관리자 체크
		@Override
		public void ARUCheck(AdminReportVO vo) throws Exception {
			dao.ARUCheck(vo);
		}

		
		
		// 게시물 신고 관리자

		// 게시물 신고 게시글 작성
		@Override
		public void ARPCreate(AdminReportVO vo) throws Exception {
			dao.ARPCreate(vo);
		}
		@Override
		public int ARPLCount(AdminCriteria ac) throws Exception {
		  return dao.ARPLCount(ac);
		}

		// 게시물 신고 리스트
		@Override
		public List<AdminReportVO> ARPList(AdminCriteria ac) throws Exception {
			return dao.ARPList(ac);
		}

		// 게시물 신고 리스트 삭제
		@Override
		public void ARPDelete(List<String> values) throws Exception {

			String value = "";
			for (int i = 0; i < values.size(); i++) {
				if (i != values.size() - 1) {
					value += values.get(i) + ",";
				} else {
					value += values.get(i);
				}
			}

			dao.ARPDelete(value);
		}
		// 게시물 신고 게시글 상세페이지
		@Override
		public AdminReportVO ARPRead(Integer id) throws Exception {
			return dao.ARPRead(id);
		}

		// 게시물 신고 게시글 읽은 관리자 체크
		@Override
		public void ARPCheck(AdminReportVO vo) throws Exception {
			dao.ARPCheck(vo);
		}

}
