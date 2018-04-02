package com.faint.service;

import java.util.Date;
import java.util.List;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.FollowDTO;
import com.faint.dto.LoginDTO;

public interface UserService {
	
	//=================읽기=================
	public List<UserVO> listAll() throws Exception; //사용자 전체목록 + 임시용으로 사용(profile_main에서)
	
	public UserVO userRead(FollowDTO dto) throws Exception;//특정 사용자 정보 로그인한 유저의 id값과 해당 페이지 유저의 닉네임값을 이용하여 follow여부까지 추출z

	//=================팔로우=================
	public void flwCreate(FollowDTO dto) throws Exception;

	public void flwDelete(FollowDTO dto) throws Exception;

	public List<UserVO> flwnList(FollowDTO dto) throws Exception;

	public List<UserVO> flwdList(FollowDTO dto) throws Exception;
	
	//=================인기유저=================
	public List<String> rank() throws Exception;
	
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
	
	public void keepLogin(Integer userid, String sessionKey, Date next) throws Exception; //로그인 유지

	public UserVO checkLoginBefore(String value); //세션키 확인
	
	public UserVO naverLogin(LoginDTO dto) throws Exception;  // 네이버 로그인
	
	//=================회원정보변경=================
	public int checkPassWord(int id, String pw) throws Exception; //비밀번호 체크
	
	public void modifypassUser(UserVO vo) throws Exception; //비밀번호 수정

	public UserVO read(Integer id) throws Exception; //회원정보읽기
	
	public int checkNick(String nickname) throws Exception; //닉네임 체크

	public int modify(UserVO user) throws Exception; //유저정보 변경

	public void remove(Integer id) throws Exception; //탈퇴회원 제거
	
	public int modifyPhoto(Integer id, String url) throws Exception; //프로필 사진 변경
	
	
}
