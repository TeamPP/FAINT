package com.faint.persistence;

import java.util.Date;
import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;

public interface UserDAO {

	public void create(UserVO vo) throws Exception;

	// ======================사용자 읽기======================
	public List<UserVO> listAll() throws Exception;
	
	public UserVO read(FollowDTO dto) throws Exception;

	// ======================사용자 키워드 목록(String타입의 키워드를 매개변수로 받음)======================
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;

	// ======================팔로우====================== 
	public void flwCreate(FollowDTO dto) throws Exception;

	public void flwDelete(FollowDTO dto) throws Exception;

	public List<UserVO> flwnList(FollowDTO dto) throws Exception;

	public List<UserVO> flwdList(FollowDTO dto) throws Exception;
	
	public List<String> rank() throws Exception;

	// ======================회원가입 및 정보변경======================
	public void insertUser(UserVO vo) throws Exception;  // 회원 등
	
	public void updateUser(UserVO vo) throws Exception; // 회원수정
	
	public UserVO userRead(UserVO vo) throws Exception; // 멤버 읽기 
	
	// ======================로그인======================

	public UserVO login(LoginDTO dto) throws Exception; // 로그
	
	public void keepLogin(Integer memberID, String sessionKey, Date next);  // 로그인 유지  세션 에 담기 

	public UserVO checkSessionKey(String value);   // 세션 확인 
	
	// ======================인증키 관련======================

	public void createAuthKey(String userEmail, String memberAuthKey) throws Exception; // 인증키 발행
	
	public UserVO chkAuth(UserVO vo) throws Exception; // 인증키 확인 

	public void userAuth(UserVO vo) throws Exception; // 인증키 로 인한 -> 유저State 변

	public UserVO authenticate(String email) throws Exception; 

	public UserVO authenticateName(String str) throws Exception;

	public void updateAuthKey(String memberEmail, String memberAuthKey) throws Exception; // 인증키 변경 및 재 발행

	public void updatePassword(UserVO vo) throws Exception; //패스워드 변경

	public void successAuth (UserVO vo) throws Exception;  // 인증완료로 인한인증키 삭제 
	
	// ======================유저정보 읽기======================

	public String getUserProfile(int id) throws Exception;  //유저 프로필 사진 

	public UserVO getUserPw(String email) throws Exception; // 유저비밀번호 등
}
