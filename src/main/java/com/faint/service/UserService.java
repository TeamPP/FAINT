package com.faint.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetails;

import com.faint.domain.Authority;
import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.domain.UsersException;
import com.faint.dto.RelationDTO;
import com.faint.dto.BlockedUserDTO;
import com.faint.dto.LoginDTO;

public interface UserService {
	//=================읽기=================
	public List<UserVO> listAll() throws Exception; //사용자 전체목록 + pagerank에서 사용
	
	public UserVO userRead(RelationDTO dto) throws Exception;//특정 사용자 정보 로그인한 유저의 id값과 해당 페이지 유저의 닉네임값을 이용하여 follow여부까지 추출z

	//=================팔로우=================
	public void flwCreate(RelationDTO dto) throws Exception;

	public void flwDelete(RelationDTO dto) throws Exception;

	public List<UserVO> flwnList(RelationDTO dto) throws Exception;

	public List<UserVO> flwdList(RelationDTO dto) throws Exception;
	
	//=================인기유저=================
	public List<String> rank() throws Exception;
	
	//=================회원차단=================
	public void userBlock(RelationDTO dto) throws Exception;
	
	public void userUnblock(RelationDTO dto) throws Exception;
	
	//차단목록가져오기
	public List<BlockedUserDTO> readBlockedList(int uid) throws Exception;
	
	//=================회원가입 및 정보변경=================
	public void regist(UserVO user) throws Exception;
	
	//=================로그인=================
	public UserVO login(LoginDTO dto) throws Exception;
	
	public UserVO userAuth(UserVO vo) throws Exception; //이메일 인증 키 검증

	public UserVO userAuthFindPassword(UserVO vo) throws Exception; //패스워드 찾기 이메일 인증 검증
	
	public UserVO googleLogin(LoginDTO dto) throws Exception; //구글 oauth login 사용예정
	
	public String authenticate(String email) throws Exception; //이메일 아이디 중복 관련 코드 전송

	public String authenticateName(String nickname) throws Exception; //이름 중복관련 코드 전송
	
	public void findPassword(UserVO vo) throws Exception; //비번찾기
	
	public void keepLogin(String email, String sessionId, Date next) throws Exception;

	public UserVO checkLoginBefore(String value); //세션키 확인
	
	public UserVO naverLogin(LoginDTO dto) throws Exception;  // 네이버 로그인
	
	//=================회원정보변경=================
	
	@PreAuthorize("isAuthenticated() and #id == principal.vo.id")
	public int checkPassWord(int id, String pw) throws Exception; //비밀번호 체크
	
	public void modifypassUser(UserVO vo) throws Exception; //비밀번호 수정

	public UserVO read(Integer id) throws Exception; //회원정보읽기
	
	public int checkNick(String nickname) throws Exception; //닉네임 체크

	public int modify(UserVO user) throws Exception; //유저정보 변경

	public void remove(Integer id) throws Exception; //탈퇴회원 제거
	
	public int modifyPhoto(Integer id, String url) throws Exception; //프로필 사진 변경
	
	
	//============================시큐리티 인증관련============================
	
	public UserVO detailByEmail(String email) throws UsersException; // 이메일로 사용자의 모든 정보 가져오기
	
	public Authority getAuthority(Integer id) throws UsersException; // 사용자 권한 가져오기
	// 임 시 사용자 비번호 찾기 
	public UserVO find_by_id(UserVO vo);
	// 로그아웃
	/*
	 *  Principal 객체 가져오기
	 *  Principal: 시스템을 사용하려고 하는 사용자 (로그인한 사용자)
	 */
	/*public void logout(HttpServletRequest req, HttpServletResponse resp); // 로그아웃*/
	
	public UserDetails getPrincipal(); // Principal 객체 가져오기 (*Principal: 시스템을 사용하려고 하는 사용자 (로그인한 사용자))

	
	public boolean isPasswordMatched(String oldPassword) throws UsersException; // 비밀번호 일치 여부 확인하는 메소드
	
	
	
}
