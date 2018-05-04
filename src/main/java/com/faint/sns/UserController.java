package com.faint.sns;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.UserVO;
import com.faint.dto.LoginDTO;
import com.faint.service.UserService;
import com.github.scribejava.core.model.OAuth2AccessToken;

import common.JsonStringParse;
import common.TempKey;
import naver.NaverLoginBO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;

	//유저 등록
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(UserVO board, Model model) throws Exception {
		
    	System.out.println("register GET 진입");
    }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String RegisterPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception{
    
		System.out.println("regesterPost 진입 ");
		service.regist(user);
        rttr.addFlashAttribute("msg" , "이메일 인증 후 로그인해 주십시오");
		return "redirect:/";
	}

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
	public String emailConfirm(UserVO user, Model model, RedirectAttributes rttr) throws Exception { // 이메일인증
		
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
    public String findPasswordPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception{
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
	
	@RequestMapping(value="/loginTest", method = {RequestMethod.GET, RequestMethod.POST} )
	public void login_view(Model model) {
		
	}

	@RequestMapping(value = "/socialLoginPost", method = RequestMethod.GET)
	public void socialLoginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
       //소셜 id 정보 변경 관련 권한
        session.setAttribute("socialID","true");
        session.setAttribute("modify","true");
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
    public String doSessionAssignActionPage(HttpServletRequest request, Model model,Principal principal)throws Exception{
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
			System.out.println(" asdjaslkdjs");
			vo = service.googleLogin(dto);
			System.out.println(vo.toString()+"여기는 왜 널이 나오는 걸까 ");

		} catch (Exception e) {
			e.printStackTrace();
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		}

		System.out.println(vo.toString());
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
		
		System.out.println(principal.toString());
		//인가받은 유저가 접속할 경우
		if(principal!=null){
			return "forward:/main";
		}

//        session.setAttribute("login", vo );
//		model.addAttribute("userVO",vo);
		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
        return "redirect:/user/socialLoginPost";
    }

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
		System.out.println("네이버 로그인 ");
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		System.out.println("naverLogin controller 호출");
		System.out.println(naverAuthUrl);
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




}
