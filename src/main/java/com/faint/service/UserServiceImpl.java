package com.faint.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.faint.domain.Authority;
import com.faint.domain.AuthorityId;
import com.faint.domain.UserVO;

import com.faint.domain.UsersException;
import com.faint.dto.RelationDTO;
import com.faint.dto.BlockedUserDTO;
import com.faint.dto.LoginDTO;

import com.faint.persistence.AuthorityDao;
import com.faint.persistence.UserDAO;

import common.MailHandler;
import common.TempKey;



@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Autowired
	private AuthorityDao authorityDao;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	PasswordEncoder passwordEncoder;

	//=================읽기=================
	
	//사용자 전체목록 + pagerank에서 사용
	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}
	// 특정 사용자 정보 = 로그인한 유저의 id값과 해당 페이지 유저의 닉네임값을 이용하여 follow여부까지 추출
	@Override
	public UserVO userRead(RelationDTO dto) throws Exception{
		return dao.userRead(dto);
	}
	
	//============================팔로우============================
	@Override
	public void flwCreate(RelationDTO dto)throws Exception{
		dao.flwCreate(dto);
	}
	
	@Override
	public void flwDelete(RelationDTO dto)throws Exception{
		dao.flwDelete(dto);
	}
	
	@Override
	public List<UserVO> flwnList(RelationDTO dto) throws Exception{
		return dao.flwnList(dto);
	}
	
	@Override
	public List<UserVO> flwdList(RelationDTO dto) throws Exception{
		return dao.flwdList(dto);
	}
	
	//=================인기유저=================
	@Override
	public List<String> rank() throws Exception{
		return dao.rank();
	}
	
	//=================회원차단=================
	
	@Transactional
	@Override
	public void userBlock(RelationDTO dto) throws Exception{
		
		//내가 팔로우하는 것 삭제
		dao.flwDelete(dto);
		
		//상대가 팔로우하는 것 삭제
		RelationDTO dto2=new RelationDTO();
		dto2.setLoginid(dto.getUserid());
		dto2.setUserid(dto.getLoginid());
		dao.flwDelete(dto2);
		
		//차단
		dao.userBlock(dto);
	}
	
	//차단 해제
	@Override
	public void userUnblock(RelationDTO dto) throws Exception{
		dao.userUnblock(dto);
	}
	
	@Override
	public List<BlockedUserDTO> readBlockedList(int uid) throws Exception {
		return dao.readBlockedList(uid);
	}
	//=================회원가입 및 정보수정=================
	@Override
	public void regist(UserVO vo) throws Exception{
		System.out.println("서비스레지스");

		String encPassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encPassword);
		//System.out.println("암호화된 비밀번호 : "+user.getUserPassword());
		
		// 가입하려는 사용자의 권한을 입력 (일반사용자 권한: 20, "USER")
		Authority auth = new Authority(AuthorityId.USER.getAuthorityId(), AuthorityId.USER.name());
		
		// Set 컬렉션을 이용하여 users 객체에 권한을 담기
		Set<Authority> auths = new HashSet<>();
		auths.add(auth);
		vo.setAuthorities(auths);
		
		dao.insertUser(vo);
		
		System.out.println(vo.getId());
		
		// 방금 등록한 users의 사용자 번호를 가져온다.
		
		// 가져온 사용자 번호를 users 객체에 담는다.
		Integer id =vo.getId();
		
		System.out.println(id+"방금 가입한 아이 아이디 번호는/");
		dao.insertAuthority(vo);
		
		
		System.out.println(vo);
		System.out.println("///////////////////////  찍히");
		String key = new TempKey().getKey(50,false);  // 인증키 생성

		dao.createAuthKey(vo.getEmail(),key); //인증키 db 저장
		//메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("FAINT  서비스 이메일 인증]");
		sendMail.setText(
		new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8181/user/emailConfirm?userEmail=").append(vo.getEmail()).append("&memberAuthKey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("sososososo@gmail.com", "서어비스센터 ");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(vo.getEmail());
		sendMail.send();
	}
	
	//============================로그인============================
	@Override
	public UserVO login(LoginDTO dto)throws Exception{
		System.out.println("service dto: "+dto);
		System.out.println("멤버서비스 dto");
		try {
			String pw = dao.getUserPw(dto.getEmail()).getPassword();
			String rawPw = dto.getPassword();
			
			System.out.println("pw====================="+pw);
			System.out.println("raw===================="+rawPw);
			//System.out.println("db pW  : "+pw);
			//System.out.println("입렵Pw:"+rawPw);
			//System.out.println(passwordEncoder.matches(rawPw, pw));
			if(passwordEncoder.matches(rawPw, pw)) {
				System.out.println("비밀번호 일치");
				dto.setPassword(pw);
				System.out.println("비밀번호 일치1");
			}else {
				//============System.out.println("비밀번호 불일치");=======================
				//주석 해제 시 비 암호화 설정된 db Pw  값으로  로그인 되지 않음
				
				dto.setPassword(rawPw);
				System.out.println("ㅁ");
			}
		}catch(NullPointerException npe){
			System.out.println("ㅁ11");
			UserVO vo=new UserVO();
			vo=null;
			System.out.println(vo);
			return vo;
		}catch (Exception e){
			UserVO vo=new UserVO();
			vo=null;
			return vo;
		}
		return dao.login(dto);
	}
	
	//이메일 인증 키 검증
	@Override
	public UserVO userAuth(UserVO user) throws Exception{
        UserVO vo = new UserVO();
		System.out.println(user+"user");
        vo=dao.chkAuth(user);
        //System.out.println("ser.userAuth.chkauth"+vo);
        if(vo!=null){
            try{
            	System.out.println(vo+"vo");
                dao.userAuth(user);
				dao.successAuth(vo);
            }catch (Exception e) {
                e.printStackTrace();
            }}
        return vo;
	}
	
	//패스워드 찾기 이메일 인증 검증
	@Override
	public UserVO userAuthFindPassword(UserVO user) throws Exception{
		UserVO vo =new UserVO();
		vo=dao.chkAuth(user);
		if(vo!=null){
			try{
				System.out.println("패스워드 찾기 이메일 인증성공 !!!");
				dao.successAuth(user);
			}catch (Exception e) {
				e.printStackTrace();
			}}
		return vo;
	}
	
	//구글 oauth login
  @Override
  public UserVO googleLogin(LoginDTO dto) throws Exception {
  	System.out.println("구글 로그인을 시작한다. ");
  	UserVO vo =new UserVO();
  	System.out.println(vo.toString()+"sd1wd");
  	System.out.println(dto.getEmail());
  	
  	vo =dao.selectByEmail(dto.getEmail());
//      vo=dao.naverReadUser(dto);
      if(vo==null){
          try{
              dao.naverInsertUser(dto);
          }catch (Exception e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }}
      return dao.selectByEmail(dto.getEmail());
  }
	
	//이메일 아이디 중복 관련 코드 전송
	@Override
	public String authenticate(String email) throws Exception{
		UserVO vo = dao.authenticate(email);
		if(vo == null) {
			return "T";
		}else if(vo.getPrilevel() == 0){
			return "F";
		}else{
			return "D";
		}
	}
	
	// 네이버 로그인 
	@Override
	public UserVO naverLogin(LoginDTO dto) throws Exception {

		UserVO vo =new UserVO();
		vo=dao.naverReadUser(dto);
		if(vo==null){
			try{
				dao.naverInsertUser(dto);
			}catch (Exception e) {
			e.printStackTrace();
			}}
		return dao.naverReadUser(dto);
	}
	
	//이름 중복관련 코드 전송
	@Override
	public String authenticateName(String nickname) throws Exception{
		UserVO vo = dao.authenticateName(nickname);
		System.out.println(nickname.toString());
		System.out.println("dao vo:"+vo);
		if(vo == null) {
			return "T";
		}else{
			return "F";
		}
	}
	
	
	

	@Override
	public UserVO find_by_id(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.find_by_id(vo);
	}
	//비밀번호 찾기
	@Override
	public void findPassword(UserVO user) throws Exception {
		
		String key = new TempKey().getKey(8,false);
		
		String encPassword = passwordEncoder.encode(key);
		
		
		
		user.setPassword(encPassword);
		
		System.out.println("비밀번호 찾기 서비스 시작 ");
		
		System.out.println(key+"임시 키 ");
		dao.createTempPassword(user.getEmail(),encPassword); //인증키 db 저장
		
		
		System.out.println(encPassword.toString()+"비번은?? ");
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[서어비스 센터 비밀번호 찾기 ]");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호</h1>").append(key)
				.append("입니다. 로그인 후 비밀번호를 변경해주세요.</br>").append("<a href='http://localhost:8181/").append("' target='_blank'>Faint  tttt 바로가기</a>").toString());
		sendMail.setFrom("somony9292@gmail.com", "fififias");
		//System.out.println("getEmail"+user.getUserEmail());
		sendMail.setTo(user.getEmail());
		sendMail.send();
	}
	
	//로그인 유지
	@Override
	public void keepLogin(String email, String sessionId, Date next) throws Exception{
		System.out.println("세션키 저장하러 오나요?service에  ");

		dao.keepLogin(email, sessionId, next);
	}

	//세션키 확인
	@Override
	public UserVO checkLoginBefore(String value){
		return dao.checkSessionKey(value);
	}
	
	//============================회원정보 변경============================
	
	//비밀번호 체크
		@Override
		public int checkPassWord(int id, String pw) throws Exception {
			
			System.out.println("service dto: "+id+"비번"+pw);
			System.out.println("멤버서비스 dto");
			
			
			UserVO vo = dao.read(id);
			
			
			try {
				System.out.println(pw);
				pw = dao.getUserPw1(vo.getId()).getPassword();
				String rawPw = vo.getPassword();
				
				System.out.println("pw====================="+pw);
				System.out.println("raw===================="+rawPw);
				//System.out.println("db pW  : "+pw);
				//System.out.println("입렵Pw:"+rawPw);
				//System.out.println(passwordEncoder.matches(rawPw, pw));
				if(passwordEncoder.matches(rawPw, pw)) {
					System.out.println("비밀번호 일치");
					vo.setPassword(pw);
				}else {
					//============System.out.println("비밀번호 불일치");=======================
					//주석 해제 시 비 암호화 설정된 db Pw  값으로  로그인 되지 않음
					vo.setPassword(rawPw);
				}
			}catch(NullPointerException npe){
				UserVO v1=new UserVO();
				v1=null;
				System.out.println(v1);
				return 0;
			}catch (Exception e){
				UserVO v1=new UserVO();
				vo=null;
				return 0;
			}
			
			return dao.checkPassWord(id, pw);
		}
	
	//비밀번호 수정
	@Override
	public void modifypassUser(UserVO vo) throws Exception{
		System.out.println("여기 모디 파이 패스 실행 ");
		System.out.println("dao.vo 입력 값"+vo);
		String encPassword = passwordEncoder.encode(vo.getPassword());
		System.out.println(vo.getPassword().toString()+"입력받은 비밀번호 ");
		
		vo.setPassword(encPassword);
		System.out.println("암호화된 비밀번호 : "+vo.getPassword());
		try {
			System.out.println("실행실행 실행 ");
			dao.successAuth(vo);
			dao.updatePassword(vo);
			System.out.println("///////////////////////변경하자 ");

		}catch (Exception e){
			System.out.println("모디파이 패스 유저 되라 11111111111");
			e.printStackTrace();
		}
	}
	//asdf
	//회원정보읽기
	@Override
	public UserVO read(Integer id) throws Exception{
		return dao.read(id);
	}
	
	//닉네임 체크
	@Override
	public int checkNick(String nickname) throws Exception {
		return dao.chkNick(nickname);
	}

	//회원정보 수정
	@Override
	public int modify(UserVO user) throws Exception{
		return dao.update(user);
	}
	
	//회원삭제
	@Override
	public void remove(Integer id) throws Exception{
		dao.delete(id);
	}
	
	//프로필 사진 변경
	@Override
	public int modifyPhoto(Integer id, String url) throws Exception {
		return dao.updatePhoto(id, url);
	}
	
	
	//============================시큐리티 인증관련============================
	// 이메일로 사용자의 모든 정보 가져오기
	@Override
	public UserVO detailByEmail(String email) throws UsersException {
		return dao.selectByEmail(email);
	}
	
	// 사용자 권한 가져오기
	@Override
	public Authority getAuthority(Integer id) throws UsersException {
		return authorityDao.select(id);
	}
	
	// Principal 객체 가져오기
	@Override
	public UserDetails getPrincipal() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		if (principal instanceof UserDetails) {
			return (UserDetails) principal;
		}
		
		return null;
	}
	
	// 로그아웃
	@Override
	public void logout(HttpServletRequest req, HttpServletResponse resp) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(req, resp, auth);
		}
		
	}
	
	// 패스워드 일치 확인
	@Override
	public boolean isPasswordMatched(String oldPassword) throws UsersException {
		// 현재 로그인한 사용자의 암호화된 비밀번호를 가져온다.
		String email = this.getPrincipal().getUsername();
		UserVO users = dao.selectByEmail(email);
		
		System.err.println(users.toString());
		System.out.println(oldPassword);
		// 입력한 비밀번호와 기존 비밀번호를 비교하여 일치하면 true, 아니면 false 리턴
		return passwordEncoder.matches(oldPassword, users.getPassword());
	}
	
}
