package com.faint.sns;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.UserVO;
import com.faint.dto.LoginDTO;
import com.faint.service.UserService;
import com.faint.util.UploadFileUtils;
import com.github.scribejava.core.model.OAuth2AccessToken;

import common.JsonStringParse;
import common.TempKey;
import naver.NaverLoginBO;
import validator.FindPassValidator;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//유저 등록
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(UserVO board, Model model) throws Exception {
		
    	System.out.println("register GET 진입");
    }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String RegisterPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception{
    
		System.out.println("regesterPost 진입 ");
    	service.regist(user);
        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
		return "redirect:/";
	}
	
	
	///////////////////////
	@RequestMapping(value="/find_passView", method = RequestMethod.GET)
	public String Find_passView() {
		return "find_passView";
	}
	
//	@RequestMapping(value="/find_pass", method = RequestMethod.POST)
//	public String find_pass(UserVO vo,RedirectAttributes redirectattr,Errors errors) {
//		new FindPassValidator().validate(vo, errors);
//		
//		if(errors.hasErrors())
//			return "find_passView";
//			
//		try {
//			UserVO resultdto = service.find_by_id(vo);
//			if(resultdto == null)
//				throw new Exception();
//			
//			double randomvalue = Math.random();
//			int random = (int)(randomvalue * 1000000) +1;
//			String password = passwordEncoder.encode(String.valueOf(random));
//			
//			resultdto.setPassword(password); //��ȣȭ�� ��й�ȣ�� ��� ��������.
//			service.pass(resultdto); //��ȣȭ�� ��й�ȣ�� ��� ��������.
//			
//			resultdto.setbPass(String.valueOf(random));
//			
//			redirectattr.addFlashAttribute("resultDto", resultdto); 
//			return "redirect:sendpass";
//		}catch(Exception e)
//		{
//			errors.reject("IDNotExist");
//			return "find_passView"; 
//		}
//		
//	}
//	
//	
	/////////////////////

    //유저 email 중복 체크
	@RequestMapping(value = "/authenticate" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String checkDuplicate(HttpServletResponse response, @RequestParam("email") String email, Model model)throws Exception {

		String msg = service.authenticate(email);
		//System.out.println("/authenticate 진입"+msg);
		String responseMsg;
		if(msg == "T") {
			responseMsg = "{\"msg\":\""+"사용가능한 이메일 입니다."+"\",\"chk\":\""+"T"+"\"}";
		}else if(msg == "F"){
			responseMsg = "{\"msg\":\""+"인증 대기중인 이메일 입니다. 인증해주세요."+"\"}";
		}else{
			responseMsg = "{\"msg\":\""+"사용이 불가한 이메일 입니다."+"\"}";
		}
		URLEncoder.encode(responseMsg , "UTF-8");
		//System.out.println(userEmail);
		//System.out.println(responseMsg);
		return responseMsg;
	}

    //유저 네임 중복 체크
    @RequestMapping(value = "/authenticateName" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody
    String checkDuplicateName(HttpServletResponse response, @RequestParam("nickname") String nickname, Model model)throws Exception {
        System.out.println("/authenticateName 진입");
        
        String msg = service.authenticateName(nickname);
       // System.out.println("/authenticateName 진입"+msg);
        String responseMsg;
        if(msg == "T") {
            responseMsg = "{\"msg\":\""+"사용가능한 이름 입니다."+"\",\"chk\":\""+"T"+"\"}";
        }else{
            responseMsg = "{\"msg\":\""+"중복된 이름 입니다. 다시 설정해 주세요"+"\"}";
        }
        URLEncoder.encode(responseMsg , "UTF-8");
        //System.out.println(userName);
        //System.out.println(responseMsg);
        return responseMsg;

    }
	//이메일 인증 코드 검증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(UserVO user,Model model,RedirectAttributes rttr) throws Exception { // 이메일인증
		
		System.out.println("cont get user"+user);
		UserVO vo = new UserVO();
		vo=service.userAuth(user);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("login",vo);
		return "/user/emailConfirm";
	}

	//비밀번호 찾기 기능
    @RequestMapping(value = "/findPassword", method = RequestMethod.GET)
    public void findPasswordGET(UserVO user, Model model) throws Exception {
        System.out.println("password 찾기 GET 진입");

    }
	//이메일 확인 후
    @RequestMapping(value = "/findPassword", method = RequestMethod.POST)
    public String findPasswordPost(UserVO user, Model model,RedirectAttributes rttr) throws Exception{
        System.out.println("find passwordPost 진입 ");
		//userEmail 값으로 회원 여부 확인 requestparam 으로 변경??
        String str= user.getEmail();
		String msg = service.authenticate(str);
		System.out.println("/authenticate 진입"+msg);
        //계정 상태에 따른 메시지
		if(msg == "T") {
			rttr.addFlashAttribute("msg" , "이메일이 없습니다. 회원가입을 해주세요");
		}else if(msg == "F"){
			rttr.addFlashAttribute("msg" , "인증 대기중인 이메일 입니다. 인증해주세요.");
		}else{
			System.out.println("올소 ");
			service.findPassword(user);
			rttr.addFlashAttribute("msg" , "이메일 인증 후 비밀번호를 변경해 주세요");
		}
        return "redirect:/";
    }
    //비밀번호 찾기 이메일 인증 코드 검증
    @RequestMapping(value = "/findPasswordConfirm", method = RequestMethod.GET)
    public String passwordSetConfirm(UserVO user, Model model, RedirectAttributes rttr) throws Exception { // 이메일인증
        System.out.println("컨트롤러 입력 정보: "+user);
    	UserVO vo=service.userAuthFindPassword(user);
        System.out.println("controller 서비스에서 받은: "+vo);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		int id=vo.getId();
		System.out.println("아이디 ? "+id);
		
        rttr.addFlashAttribute("setPassword",true);
        rttr.addAttribute("userId", id);

		//model.addAttribute("userId",id);
	   // model.addAttribute("user",vo);
		//rttr.addAttribute("login",vo);
		System.out.println("Confirm VO : "+vo);
		System.out.println("아이디 ? "+id);
        return "redirect:setPassword";
    }

    @RequestMapping(value = "/setPassAuthCheck", method = RequestMethod.GET)
    public void setPassUserAuthGet(UserVO user,Model model) throws Exception{
    	System.out.println("=============/setpassAuthcht.GET");

    }
    @RequestMapping(value = "/setPassAuthCheck", method = RequestMethod.POST)
    public String setPassUserAuthPost(@ModelAttribute("dto") LoginDTO dto,Model model,RedirectAttributes rttr) throws Exception{
        //System.out.println(dto);
    	System.out.println("===============setPassAuthCHeck===POST");
    	UserVO vo = service.login(dto);
       
    	System.out.println(vo);
    		
        if(vo == null) {
            return "user/setPassAuthCheck";
        }
        //System.out.println("usercontroller vo =" +vo);
        model.addAttribute("userVO",vo);
        //model.addAttribute("modify",true);
        int id=vo.getId();
        rttr.addFlashAttribute("userId",id);
        //패스워드 권한 인증 코드 전송
        System.out.println("aoaoooaoosdoaidousadsadasadsd!!!");
        rttr.addFlashAttribute("setPassword",true);
        return "redirect:/user/setPassword";

    }

	@RequestMapping(value = "/setPassword", method = RequestMethod.GET)
	public void setPassword(UserVO user, Model model, RedirectAttributes rttr) throws Exception {
		System.out.println("setPassword GET");
		 
		   System.out.println(user);
		   System.out.println("왜 null 값이 나올까"+user.toString());

	}
	
	//패스워드 변경
	@RequestMapping(value = "/setPassword", method = RequestMethod.POST)
	public String setPasswordPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception {
		System.out.println("setPassword POST");
			System.out.println("패스워드 변경 값//////"+user.toString());
			System.out.println("여기서부터 오류 ");
    	try{
    			System.out.println("aaaaaa");
			service.modifypassUser(user);
			System.out.println("변경완료 ?? 인가 ");
			rttr.addFlashAttribute("msg" , "변경되었습니다. 변경된 패스워드로 로그인해 주세요");
		}catch (Exception e){
			System.out.println("왜 안되니?? ");
			rttr.addFlashAttribute("msg" , "오류가 발생했습니다. 관리자에게 문의 주세요");
		}
    	
    		System.out.println("에러가 안남 ");
		return "redirect:/";
	}
	
	@RequestMapping(value="/loginTest", method = {RequestMethod.GET, RequestMethod.POST} )
	public void login_view(Model model) {
/*		model.addAttribute("principal", principal);
		System.out.println("여기는 UC loginTest1: "+principal);
		System.out.println("여기는 UC loginTest2: ");
		return "user/loginTest";*/
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model,RedirectAttributes rttr) throws Exception{
		System.out.println("loginPost");
		System.out.println("////////////////");
		System.out.println(" 로그인포스트  ");
		UserVO vo = service.login(dto);
		System.out.println(vo);
		//System.out.println("usercontroller vo =" +vo);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "아이디 또는 비밀번호가 일치하지 않습니다.");
			System.out.println("아이디 비밀번호 실패");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getPrilevel()==0){
			rttr.addFlashAttribute("msg" , "인증 대기 중인 아이디 입니다.\n 메일에 접속해 인증해주세요");
			System.out.println("인증대기");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getPrilevel()==2){
			rttr.addFlashAttribute("msg" , "탈퇴된 회원입니다. \n 관리자에게 문의해주세요");
			System.out.println("탈퇴");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getPrilevel()==9) {
			rttr.addFlashAttribute("msg", "관리자 계정입니다. \n 환영합니다.");
			System.out.println("관리자 로그인");
			model.addAttribute("userVO", vo);
			return ;
		}
		System.out.println("=\2=2=2=2=22==");
		System.out.println(dto.isUseCookie());
		
		if (!dto.isUseCookie()) {
			System.out.println("쿠키");
			int amount = 60 * 60 * 24;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getEmail(), session.getId(), sessionLimit);
			System.out.println(vo.getEmail()+"아이디"+session.getId()+"ㅅㅔ션"+sessionLimit);
			System.out.println("세션에 값좀 넣어주셈 ");
		}

		
		System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO", vo);
		System.out.println("====================");
		rttr.addFlashAttribute("msg","로그인 되었습니다.");
		System.out.println(vo);

	}
	

	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		//바로 login
		System.out.println("로그인포스후 ㅎㄷㅅ ㅁ");
		session.setAttribute("dest","/");
	}

	@RequestMapping(value = "/socialLoginPost", method = RequestMethod.GET)
	public void socialLoginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
       //소셜 id 정보 변경 관련 권한
        session.setAttribute("socialID","true");
        session.setAttribute("modify","true");
	}

    //유저 정보변경 권한 체크
	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.GET)
	public void ModifyUserAuthGet(UserVO user,Model model) throws Exception{

	}

	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.POST)
	public String ModifyUserAuthPost(@ModelAttribute("dto") LoginDTO dto,Model model,RedirectAttributes rttr) throws Exception{

    	//System.out.println(dto);
    	UserVO vo = service.login(dto);
		//System.out.println(vo);
		if(vo == null) {
			return "user/modifyAuthCheck";
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);
		//model.addAttribute("modify",true);
		rttr.addFlashAttribute("modify",true);
		return "redirect:/user/modifyUser";
	}
	
	//유저 정보변경 인증후 변경 페이지
	@RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
	public void ModifyUserGet(UserVO user,Model model) throws Exception{
	}
	//mypage 페이지
    @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public void myinfo() throws Exception {
	}


	//업로드 파일의 경로 설정
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST, produces = "text/plane;charset=UTF-8")
	public String ModifyUserPost(UserVO user,Model model,RedirectAttributes rttr,HttpSession session, MultipartFile file) throws Exception{
		
		
		System.out.println("바꾸러 왔다 ");
		//profile 정보 확인
        String test=user.getProfilephoto();
        //user 정보 저장
		String userId= user.getId()+"";
		UserVO ssvo = (UserVO)session.getAttribute("login");

		String ssuserId =ssvo.getId()+"";


		System.out.println("userId"+userId);
		System.out.println("ssuserId"+ssuserId);
		
		if(!userId.equals(ssuserId)){
			
			System.out.println(userId);
			System.out.println(ssuserId);
			rttr.addFlashAttribute("msg","비정상적인 접근입니다. 경고");
			System.out.println("uid 다름");
			return "redirect:/user/modifyAuthCheck";
		}

		if(userId.equals(ssuserId)){
		String imagedefualt=user.getProfilephoto();
		System.out.println(imagedefualt);
		String defualtprofile ="basic";
		/////////////////////
		//file 업로드 여부 확인
		///////////////////////////////
		System.out.println("file 업로드 여부 확인 ");
		if(!file.isEmpty()) {
            String uploadedFileName = UploadFileUtils.uploadFile(uploadPath,
                    file.getOriginalFilename(),
                    file.getBytes(),
                    userId);
           System.out.println("파일 업로드 완료");
            user.setProfilephoto(uploadedFileName);
        }else{
				System.out.println("imagedefualt: "+imagedefualt);
        			System.out.println("ㅁㄴㅇㅁㄴㅇㄴㅁ");
//			if(imagedefualt.equals("basic")){
//				user.setProfilephoto(null);
//				System.out.println("basic"+user.getProfilephoto());
//			}else {
//					System.out.println("//프로필 업로드 하지 않을 때 원래 정보를 저장");
//				//프로필 업로드 하지 않을 때 원래 정보를 저장
//				UserVO vot = (UserVO) session.getAttribute("login");
//				user.setProfilephoto(vot.getProfilephoto());
//				System.out.println("no basic"+user.getProfilephoto());
//				}
		    }

		System.out.println("실행 직전 ");
		//UserVO vo=service.modifyUser(user);

		//session.setAttribute("login",vo);  // 여기서 부터 수정 
		System.out.println("asdasdasdas");
		rttr.addFlashAttribute("msg" , "회원 정보가 변경되었습니다.");
		}
		return "redirect:/user/myinfo";
	}
	/* GoogleLogin */
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;



	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

//		googleOAuth2Parameters.setRedirectUri("http://localhost:8080/user/googleLogincallback");
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
       // System.out.println("/user/googleLogincallback, url : " + url);
        model.addAttribute("url",url);

        return "user/googleLogin";

    }


    @RequestMapping(value = "/googleSignInCallback")
    public String doSessionAssignActionPage(HttpServletRequest request, Model modell)throws Exception{
     //System.out.println("/user/googleLogincallback");
    System.out.println("야 왜 안되냐 뒤질래 가자1");
        String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);
	    System.out.println("야 왜 안되냐 뒤질래 가자2");
		String accessToken = accessGrant.getAccessToken();
		System.out.println("야 왜 안되냐 뒤질래 가자22");
		Long expireTime = accessGrant.getExpireTime();
		System.out.println("야 왜 안되냐 뒤질래 가자33");
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
			
			   System.out.println("야 왜 안되냐 뒤질래 가자3");
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		   System.out.println("야 왜 안되냐 뒤질래 가자4");
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

//		System.out.println("UserVO 전");
//		System.out.println("person getId: "+person.getId());


        LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();

  //      System.out.println(person.getDisplayName());
        dto.setEmail("google"+"_"+TK.generateNumber(6));
        dto.setNickname(person.getDisplayName()+"_"+TK.generateNumber(5));
        dto.setSnsID("g"+person.getId());
        HttpSession session = request.getSession();
//		System.out.println("controller dto: "+dto);

		UserVO vo = new UserVO();
		
	//	vo = service.detailByEmail(dto.getEmail());
		System.out.println("vo");
		try {
			vo = service.googleLogin(dto);

		} catch (Exception e) {
			e.printStackTrace();
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		}


		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="user/socialLoginPost"){
				session.setAttribute("dest","/");
			}
			//System.out.println("postHandle dest: "+dest);
			if(dest==null){
				session.setAttribute("dest","/");
			}
		}else{
			session.setAttribute("dest","/user/loginTest");
			System.out.println("11");
		}



//        session.setAttribute("login", vo );
//		model.addAttribute("userVO",vo);
		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
        return "redirect:/user/socialLoginPost";
    }

//	// GoogleLogin
//	@Inject
//	private GoogleConnectionFactory googleConnectionFactory;
//	@Inject
//	private OAuth2Parameters googleOAuth2Parameters;
//
//
//
//	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
//    public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
//        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//
////		googleOAuth2Parameters.setRedirectUri("http://localhost:8080/user/googleLogincallback");
//        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//       // System.out.println("/user/googleLogincallback, url : " + url);
//        model.addAttribute("url",url);
//
//        return "user/googleLogin";
//
//    }
//
//
//    @RequestMapping(value = "/googleSignInCallback")
//    public String doSessionAssignActionPage(HttpServletRequest request, Model model)throws Exception{
//     //System.out.println("/user/googleLogincallback");
//    
//        String code = request.getParameter("code");
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
//				null);
//		String accessToken = accessGrant.getAccessToken();
//		Long expireTime = accessGrant.getExpireTime();
//		if (expireTime != null && expireTime < System.currentTimeMillis()) {
//			accessToken = accessGrant.getRefreshToken();
//			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
//		}
//		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
//		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
//		PlusOperations plusOperations = google.plusOperations();
//		Person person = plusOperations.getGoogleProfile();
//
////		System.out.println("UserVO 전");
////		System.out.println("person getId: "+person.getId());
//
//
//        LoginDTO dto = new LoginDTO();
//		TempKey TK = new TempKey();
//
//  //      System.out.println(person.getDisplayName());
//        dto.setMemberEmail("google"+"#"+TK.generateNumber(6));
//        dto.setMemberName(person.getDisplayName()+"#"+TK.generateNumber(5));
//        dto.setSnsID("g"+person.getId());
//        HttpSession session = request.getSession();
////		System.out.println("controller dto: "+dto);
//
//		UserVO vo = new UserVO();
//
//		try {
//			vo = service.googleLogin(dto);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
//		}
//
//
//		if(vo != null) {
//			session.setAttribute("login", vo );
//			//response.sendRedirect("/");
//			//System.out.println(userVO);
//			Object dest = session.getAttribute("dest");
//			if(dest=="user/socialLoginPost"){
//				session.setAttribute("dest","/");
//			}
//			//System.out.println("postHandle dest: "+dest);
//			if(dest==null){
//				session.setAttribute("dest","/");
//			}
//		}else{
//			session.setAttribute("dest","/user/login");
//		}
//
//
////        session.setAttribute("login", vo );
////		model.addAttribute("userVO",vo);
//		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
//        return "redirect:/user/socialLoginPost";
//    }

//oauth2 로그인 방식
//	//Login Api======================================================================
	private NaverLoginBO naverLoginBo;
	private String apiResult = null;
	/* NaverLoginBO */
	@Inject
	private void setNaverLoginBO(NaverLoginBO naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}

	//JSON과 STRING 분석 메서드 사용
	@Autowired
	private JsonStringParse jsonparse;

	@RequestMapping(value="/naverLogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		//System.out.println("naverLogin controller 호출");
		//System.out.println(naverAuthUrl);
		return new ModelAndView("user/naverLogin", "url", naverAuthUrl);
	}
	//API 에서 토큰을 받을 콜백 주소
	@RequestMapping(value="/callback",method = RequestMethod.GET)
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException{
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
	/*	System.out.println("/callback 진입 토튼 발급 전 ");
		System.out.println("session : "+session);
		System.out.println("state : "+state);
		System.out.println("code : "+code);*/

		OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);
		apiResult = naverLoginBo.getUserProfile(oauthToken);

		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");

		String userSocialId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "name");

		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();


		dto.setEmail("naver"+"@"+TK.generateNumber(6));
		dto.setSnsID("naver"+userSocialId);
		dto.setNickname("naver"+name+TK.generateNumber(5));

		System.out.println("======================JSON 파싱값================");

		System.out.println("name: "+name);
		System.out.println("id: "+userSocialId );
		System.out.println("UserVO "+vo);
		System.out.println("UserVO "+dto);
		try {
			vo = service.naverLogin(dto);

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		
		}



		//소셜아이디로 uid를 찾는 로직 추가 해야함


		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="/user/socialLoginPost"){
				session.setAttribute("dest","/");
			}
			//System.out.println("postHandle dest: "+dest);
			if(dest==null){
			session.setAttribute("dest","/");
		}

		}else{
			session.setAttribute("dest","/user/loginTest");
		}

	return new ModelAndView("redirect:/user/socialLoginPost", "result", vo);
	}

////////////////
	@RequestMapping(value = "/naverSuccess", method = RequestMethod.GET)
	public void naverSuccess (HttpSession session, UserVO user,Model model) throws Exception{

}

    //google 로그인 컨트롤러

	/* GoogleLogin */
//	@Inject
//	private GoogleConnectionFactory googleConnectionFactory;
//	@Inject
//	private OAuth2Parameters googleOAuth2Parameters;
//
//
//
//	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
//    public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
//        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//
////		googleOAuth2Parameters.setRedirectUri("http://localhost:8080/user/googleLogincallback");
//        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//       // System.out.println("/user/googleLogincallback, url : " + url);
//        model.addAttribute("url",url);
//
//        return "user/googleLogin";
//
//    }
//
//
//    @RequestMapping(value = "/googleLogincallback")
//    public String doSessionAssignActionPage(HttpServletRequest request, Model model)throws Exception{
//        //System.out.println("/user/googleLogincallback");
//        String code = request.getParameter("code");
//
//		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
//				null);
//
//		String accessToken = accessGrant.getAccessToken();
//		Long expireTime = accessGrant.getExpireTime();
//		if (expireTime != null && expireTime < System.currentTimeMillis()) {
//			accessToken = accessGrant.getRefreshToken();
//			//System.out.printf("accessToken is expired. refresh token = {}", accessToken);
//		}
//		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
//		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
//
//		PlusOperations plusOperations = google.plusOperations();
//		Person person = plusOperations.getGoogleProfile();
//
////		System.out.println("UserVO 전");
////		System.out.println("person getId: "+person.getId());
//
//
//        LoginDTO dto = new LoginDTO();
//		TempKey TK = new TempKey();
//
//  //      System.out.println(person.getDisplayName());
//        dto.setUserEmail("google"+"#"+TK.generateNumber(6));
//        dto.setUserName(person.getDisplayName()+"#"+TK.generateNumber(5));
//        dto.setUserSocialId("g"+person.getId());
//        HttpSession session = request.getSession();
////		System.out.println("controller dto: "+dto);
//
//		UserVO vo = new UserVO();
//
//		try {
//			vo = service.googleLogin(dto);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
//		}
//
//
//		if(vo != null) {
//			session.setAttribute("login", vo );
//			//response.sendRedirect("/");
//			//System.out.println(userVO);
//			Object dest = session.getAttribute("dest");
//			if(dest=="user/socialLoginPost"){
//				session.setAttribute("dest","/");
//			}
//			//System.out.println("postHandle dest: "+dest);
//			if(dest==null){
//				session.setAttribute("dest","/");
//			}
//		}else{
//			session.setAttribute("dest","/user/login");
//		}
//
//
//
////        session.setAttribute("login", vo );
////		model.addAttribute("userVO",vo);
//		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
//        return "redirect:/user/socialLoginPost";
//    }

//======================================github login ==================================================

//
//	private GithubLoginBo githubLoginBo;
//	private String githubapiResult = null;
//
//	/* githubLoginBO */
//
//	@Inject
//	private void setGithubLoginBo(GithubLoginBo githubLoginBo) {
//		this.githubLoginBo = githubLoginBo;
//	}
//
//	@RequestMapping(value="/githubLogin", method = RequestMethod.GET)
//	public ModelAndView githublogin(HttpSession session) {
//		/* github 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
//		String githubAuthUrl = githubLoginBo.getAuthorizationUrl(session);
//	//	System.out.println("github Login controller 호출");
//	//	System.out.println(githubAuthUrl);
//		return new ModelAndView("user/githubLogin", "url", githubAuthUrl);
//	}
//
//	@RequestMapping(value="/githubcallback",method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView githubcallback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException {
//		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
////		System.out.println("/callback 진입 토튼 발급 전 ");
////		System.out.println("session : "+session);
////		System.out.println("state : "+state);
////		System.out.println("code : "+code);
//
//		//토큰 생성
//		OAuth2AccessToken oauthToken = githubLoginBo.getAccessToken(session, code, state);
//
//		//System.out.println("github oauthToken 값: "+oauthToken);
//		githubapiResult = githubLoginBo.getUserProfile(oauthToken);
//		//System.out.println(githubapiResult);
//
//		//JSON 형식을 parsing 하기 위한 준비
//		Object obj = null;
//		JSONParser parser = new JSONParser();
//		try {
//			obj = parser.parse(githubapiResult);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		//JSON 객체 생성
//		JSONObject jsonobj = (JSONObject) obj;
//
//		System.out.println(jsonobj);
//		String name = (String) jsonparse.JsonToString(jsonobj, "login");
//		String userSocialId = (String) (jsonparse.JsonToString(jsonobj, "id")+"");
//
//
//		UserVO vo =new UserVO();
//		LoginDTO dto = new LoginDTO();
//		TempKey TK = new TempKey();
//
//		dto.setUserEmail("github"+"#"+TK.generateNumber(6));
//		dto.setUserSocialId("git"+userSocialId);
//		dto.setUserName(name+"#"+TK.generateNumber(5));
//
//		System.out.println("======================JSON 파싱값================");
//		System.out.println("name: "+name);
//		System.out.println("id: "+userSocialId );
//		System.out.println("UserVO "+vo);
//		System.out.println("UserVO "+dto);
//		try {
//			vo = service.naverLogin(dto);
//
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		//세션 생성
//		if(vo != null) {
//			session.setAttribute("login", vo );
//			Object dest = session.getAttribute("dest");
//			if(dest=="/user/socialLoginPost"){
//				session.setAttribute("dest","/");
//			}
//			System.out.println("postHandle dest: "+dest);
//			if(dest==null){
//				session.setAttribute("dest","/");
//			}
//		}else{
//			session.setAttribute("dest","/user/login");
//		}
//		session.setAttribute("login",vo);
//		model.addAttribute("userVO",vo);
//		return new ModelAndView("redirect:/user/socialLoginPost", "result", vo);
//	}


}
