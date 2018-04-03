package com.faint.persistence;

import java.util.Date;
import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.RelationDTO;
import com.faint.dto.LoginDTO;

public interface UserDAO {

	public void create(UserVO vo) throws Exception;

	// ======================사용자 읽기======================
	public List<UserVO> listAll() throws Exception;
	
	public UserVO userRead(RelationDTO dto) throws Exception;

	// ======================사용자 키워드 목록(String타입의 키워드를 매개변수로 받음)======================
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception;

	//=================회원차단=================
	public void userBlock(RelationDTO dto) throws Exception;
	
	public void userUnblock(RelationDTO dto) throws Exception;

	// ======================팔로우====================== 
	public void flwCreate(RelationDTO dto) throws Exception;

	public void flwDelete(RelationDTO dto) throws Exception;

	public List<UserVO> flwnList(RelationDTO dto) throws Exception;

	public List<UserVO> flwdList(RelationDTO dto) throws Exception;
	
	public List<String> rank() throws Exception;

	// ======================회원가입 및 정보변경======================
	public void insertUser(UserVO vo) throws Exception;  // 회원 등
	
	public void updateUser(UserVO vo) throws Exception; // 회원수정
	
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

	public void successAuth (UserVO vo) throws Exception;  // 인증완료로 인한인증키 삭제 
	
	// ======================유저정보 읽기======================

	public String getUserProfile(int id) throws Exception;  //유저 프로필 사진 

	public UserVO getUserPw(String email) throws Exception; // 유저비밀번호 등
	
	// ======================회원정보 변경======================
	
	public int checkPassWord(int id, String pw) throws Exception; //비밀번호 체크
	
	public void updatePassword(UserVO vo) throws Exception; //패스워드 변경
	
	public void createTempPassword(String email, String password) throws Exception;

	public UserVO read(Integer id) throws Exception; //회원정보읽기
	
	public int chkNick(String nickname) throws Exception; //닉네임 체크

	public int update(UserVO vo) throws Exception; //유저정보 변경

	public void delete(Integer id) throws Exception; //탈퇴회원 제거
	
	public int updatePhoto(int id, String url) throws Exception; //프로필 사진 변경
	
	public UserVO naverReadUser(LoginDTO dto) throws Exception; // 네이버 유저읽기( 아직 안됨)
	
	public void naverInsertUser(LoginDTO dto) throws Exception; // 네이버 등
}
