package com.faint.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.faint.domain.SearchCriteria;
import com.faint.domain.UserVO;
import com.faint.dto.RelationDTO;
import com.faint.dto.BlockedUserDTO;
import com.faint.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.faint.mapper.userMapper";

	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	// 회원전체목록
	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public UserVO userRead(RelationDTO dto) throws Exception {
		return session.selectOne(namespace + ".userRead", dto);
	}

	// 회원키워드목록
	@Override
	public List<UserVO> listKeyword(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listKeyword", cri);
	}

	// 유저비밀번호 읽기
	public UserVO getUserPw1(int id) throws Exception {
		return session.selectOne(namespace + ".getUserPassword1", id);
	}

	// =================회원차단=================
	@Override
	public void userBlock(RelationDTO dto) throws Exception {
		session.insert(namespace + ".userBlock", dto);
	}

	@Override
	public void userUnblock(RelationDTO dto) throws Exception {
		session.delete(namespace + ".userUnblock", dto);
	}

	@Override
	public List<BlockedUserDTO> readBlockedList(int uid) throws Exception {
		return session.selectList(namespace + ".readblocked", uid);
	}

	// ======================팔로우======================
	@Override
	public void flwCreate(RelationDTO dto) throws Exception {
		session.insert(namespace + ".flwCreate", dto);
	};

	@Override
	public void flwDelete(RelationDTO dto) throws Exception {
		session.delete(namespace + ".flwDelete", dto);
	};

	@Override
	public List<UserVO> flwnList(RelationDTO dto) throws Exception {
		return session.selectList(namespace + ".flwnList", dto);
	};

	@Override
	public List<UserVO> flwdList(RelationDTO dto) throws Exception {
		return session.selectList(namespace + ".flwdList", dto);
	};

	@Override
	public List<String> rank() throws Exception {
		return session.selectList(namespace + ".rank");
	}

	// ======================회원가입 및 정보변경======================
	// 회원 등
	public void insertUser(UserVO vo) throws Exception {
		System.out.println("회원등록완료 !!!");
		session.insert(namespace + ".insertUser", vo);
		System.out.println("//////////////////////////////////");
		System.out.println("회원등록완료 !!!");
	}

	// 회원정보수정
	public void updateUser(UserVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace + ".updateUser", vo);
	}

	// ======================로그인======================

	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	// // 로그인 유지 세션 에 담기
	// public void keepLogin(Integer userID, String sessionkey, Date next){
	// System.out.println("세션키 저장하러 오나요?1 ");
	// Map<String, Object> paramMap = new HashMap<String, Object>();
	// paramMap.put("userID", userID);
	// paramMap.put("sessionKey", sessionkey);
	// paramMap.put("next", next);
	//
	// session.update(namespace + ".keepLogin", paramMap);
	// }
	// 세션으로 로그인 여부 판단
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		System.out.println("aa" + sessionId);

		session.update(namespace + ".keepLogin", paramMap);
	}

	// 세션 확인
	public UserVO checkSessionKey(String value) {
		return session.selectOne(namespace + ".checkSessionKey", value);
	}

	// ======================인증키 관련======================

	// 인증키 발행
	public void createAuthKey(String email, String memberAuthKey) throws Exception {
		UserVO vo = new UserVO();
		vo.setMemberAuthKey(memberAuthKey);
		vo.setEmail(email);
		session.update(namespace + ".createAuthKey", vo);
	}

	// 인증키 확인
	public UserVO chkAuth(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".chkAuth", vo);
	}

	// 인증키 로 인한 -> 유저State 변경
	public void userAuth(UserVO vo) throws Exception {
		System.out.println("인증하나요??");

		session.update(namespace + ".userAuth", vo);
		System.out.println(vo.getPrilevel());
	}

	public UserVO authenticate(String email) throws Exception {
		return session.selectOne(namespace + ".checkdupl", email);
	}

	public UserVO authenticateName(String str) throws Exception {
		return session.selectOne(namespace + ".checkduplName", str);
	}

	// 인증키 변경 및 재 발행
	public void updateAuthKey(String email, String memberAuthKey) throws Exception {
		UserVO vo = new UserVO();
		vo.setMemberAuthKey(memberAuthKey);
		vo.setEmail(email);
		session.update(namespace + ".createAuthKey", vo);
	}

	// 인증완료로 인한인증키 삭제
	public void successAuth(UserVO vo) throws Exception {
		System.out.println("인증 되었으므로 인증키 null 값 반환 ");
		session.update(namespace + ".successAuth", vo);
	}
	// ======================ip차단 관련(댓글에 한정)======================

	// i ip 차단 리스트 뽑
	@Override
	public List<String> find_ip_ban_list() throws Exception {
		return session.selectList(namespace + ".find_ip_ban_list");
	}

	// ip -insert
	@Override
	public void insert_ip_ban(String ip) throws Exception {
		session.insert(namespace + ".insert_ip_ban", ip);
	}

	// ======================유저정보 읽기======================

	// 유저 프로필 사진
	public String getUserProfile(int id) throws Exception {
		return session.selectOne(namespace + ".getUserProfile", id);
	}

	// 유저비밀번호 읽기
	public UserVO getUserPw(String email) throws Exception {
		return session.selectOne(namespace + ".getUserPassword", email);
	}

	// ======================회원정보 변경======================

	// 비밀번호 체크
	@Override
	public int checkPassWord(int id, String pw) throws Exception {
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(pw);
		return session.selectOne(namespace + ".checkPassWord", vo);
	}

	// 패스워드 변경
	public void updatePassword(UserVO vo) throws Exception {
		System.out.println("////////////패스워드변경");
		System.out.println("비밀번호 변경이 되냐 ");
		System.out.println(vo.getPassword());
		System.out.println(vo.getId());

		session.update(namespace + ".updatePassword", vo);
		System.out.println("변경 된듯 !!!!!!");
	}

	// 임시 비밀번호 생성
	@Override
	public void createTempPassword(String email, String tempPassword) throws Exception {
		UserVO vo = new UserVO();
		vo.setEmail(email);
		vo.setPassword(tempPassword);

		session.update(namespace + ".createTempPassword", vo);
	}

	// 회원정보읽기
	@Override
	public UserVO read(Integer id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	};

	// 닉네임 체크
	@Override
	public int chkNick(String nickname) throws Exception {
		return session.selectOne(namespace + ".chkNick", nickname);
	};

	// 유저정보 변경
	@Override
	public int update(UserVO vo) throws Exception {
		return session.update(namespace + ".update", vo);
	};

	// 탈퇴회원 제거
	@Override
	public void delete(Integer id) throws Exception {
		session.delete(namespace + ".delete", id);
	};

	// 소셜 로그인 회원 정보 입력
	@Override
	public void naverInsertUser(LoginDTO dto) throws Exception {
		session.insert(namespace + ".naverInsertUser", dto);
	}

	// 소셜 로그인 회원 정보 확인
	@Override
	public UserVO naverReadUser(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".naverReadUser", dto);
	}

	// 프로필 사진 변경
	@Override
	public int updatePhoto(int id, String url) throws Exception {
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setProfilephoto(url);
		return session.update(namespace + ".updatePhoto", vo);
	};
}
