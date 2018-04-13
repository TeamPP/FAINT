package com.faint.sns;

import java.security.Principal;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.UserVO;
import com.faint.service.PostService;
import com.faint.service.UserService;

@Controller
public class MainController {

	@Inject
	private PostService service;
	
	@Autowired
	private UserService uservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		
		//인가받은 유저가 접속할 경우
		if(principal!=null){
			return "redirect:/main";
		}
		
		//인가받지 않은 유저가 접속할 경우
		return "forward:/user/loginTest";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpServletRequest request, Model model,Principal principal)throws Exception{
		
		
		System.out.println("인증받고 '/'들렀다가 'main'들어옴");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserVO users = uservice.detailByEmail(authentication.getName());
		
		//세션 생성 및 메인 피드 생성
		if(users!=null){
			
			HttpSession session=request.getSession();
			session.setAttribute("login", users);
			
			model.addAttribute("list", service.mainRead(users.getId())); //세션 아이디값을 통해 현재 팔로우중인 유저들의 게시물정보 및 유저정보 등을 받아옴
			
		}
		System.out.println("안들어가나요?");
	}
	
	@RequestMapping(value = "/empty", method = RequestMethod.GET)
	public void empty(Model model)throws Exception{

	}
	// 접근 제한 페이지
	@RequestMapping(value="/access-denied", method=RequestMethod.GET)
	public String accessDenied(Model model) {
		
		System.out.println("sasdsadasdsad");
		
		model.addAttribute("email", uservice.getPrincipal().getUsername());
		
		return "access-denied";
	}

	
	@RequestMapping(value = "/chatTest", method = RequestMethod.GET)
	public void chatTest(Model model)throws Exception{

	}
//	// 로그아웃
//	@RequestMapping(value="/logout", method=RequestMethod.GET)
//	public String logout(HttpServletRequest req, HttpServletResponse resp) {
//		// 서비스의 로그아웃 메소드 호출
//		
//		System.out.println("로그아웃한다난 ");
//			uservice.logout(req, resp);
//		System.out.println("친구들아 들어오ㅓ");
//		
//		// 로그아웃 한 뒤 로그인 페이지로 이동 후 로그아웃 메시지 출력을 위해 쿼리문자열 사용
//		return "redirect:/main";
//	}

}
