package com.faint.persistence;

import java.util.HashMap;

import java.util.List;

import com.faint.domain.AdminPostVO;
import com.faint.domain.AdminReplyVO;
import com.faint.domain.AdminReportVO;
import com.faint.domain.AdminUserVO;
import com.faint.domain.UserVO;

import util.AdminCriteria;
import util.SearchMemberCriteria;

// 관리자 
public interface AdminDAO {
		List<UserVO> getSearchMemberList(SearchMemberCriteria scri, HashMap<String, Object> map); //  회원목록 불러오기 
		
		int getTotalMemberCount(SearchMemberCriteria scri);   //전체 회원수 
		
		public List<UserVO> listAll() throws Exception;
		
		public int deleteMember(String memberEmail);
		
		// 유저 관리자
		
		// 유저 관리 리스트 
		public List<AdminUserVO> AUList(AdminCriteria ac) throws Exception;
		public int AULCount(AdminCriteria ac) throws Exception;
		
		// 유저 관리 리스트 삭제
		public void AUDelete(String value) throws Exception;
		// 유저 영구 정지
		public void AUPStop(String value) throws Exception;
		// 유저 정지
		public void AUStop(String value) throws Exception;
		
		// 게시물 관리자
		
		// 게시물 관리 리스트
		public List<AdminPostVO> APList(AdminCriteria ac) throws Exception;
		public int APLCount(AdminCriteria ac) throws Exception;
		// 게시물 관리 리스트 삭제
		public void APDelete(String value) throws Exception;
		// 게시물 관리자 외 비공개 처리
		public void APBlock(String value) throws Exception;
		
		// 댓글 관리자
		
		// 댓글 관리 리스트
		public List<AdminReplyVO> ARList(AdminCriteria ac) throws Exception;
		public int ARLCount(AdminCriteria ac) throws Exception;
		// 댓글 관리 리스트 삭제
		public void ARDelete(String value) throws Exception;
		
		
		// 유저 신고 관리자
		
		// 유저 신고
		public void ARUCreate(AdminReportVO vo) throws Exception;
		// 유저 신고 리스트
		public List<AdminReportVO> ARUList(AdminCriteria ac) throws Exception;
		public int ARULCount(AdminCriteria ac) throws Exception;
		// 유저 신고 리스트 삭제
		public void ARUDelete(String value) throws Exception;
		// 유저 신고 리스트 상세페이지
		public AdminReportVO ARURead(Integer id) throws Exception;
		// 유저 신고 리스트 상세페이지 읽은 관리자 체크
		public void ARUCheck(AdminReportVO vo) throws Exception;

		
		// 게시물 신고 관리자		
		
		// 게시물 신고
		public void ARPCreate(AdminReportVO vo) throws Exception;
		// 게시물 신고 리스트
		public List<AdminReportVO> ARPList(AdminCriteria ac) throws Exception;
		public int ARPLCount(AdminCriteria ac) throws Exception;
		// 게시물 신고 리스트 삭제
		public List<String> ARPDelete(String value) throws Exception;
		// 게시물 신고 리스트 상세페이지
		public AdminReportVO ARPRead(Integer id) throws Exception;
		// 게시물 신고 리스트 상세페이지 읽은 관리자 체크
		public void ARPCheck(AdminReportVO vo) throws Exception;

}
