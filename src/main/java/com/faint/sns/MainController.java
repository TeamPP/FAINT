package com.faint.sns;

import java.security.Principal;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	public String home(Locale locale, Model model) {
		
		return "forward:/user/login_view";
		
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpServletRequest request, Model model,Principal principal)throws Exception{
		HttpSession session=request.getSession();
		//UserVO vo=(UserVO)session.getAttribute("principal");
		
		System.out.println("---------------------123");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserVO users = uservice.detailByEmail(authentication.getName());
		System.out.println("_-------------p;;;;;;;-------princiapl");
		System.out.println("아이디 들어옴>"+authentication.getName());
		session.setAttribute("login", users);
		System.out.println(authentication.toString());
		System.out.println(users.toString());
		System.out.println(users.getId());
	//	model.addAttribute("principal", principal);
	//	System.out.println(principal.getName());
	 
		
			
		if(users!=null){
			
				model.addAttribute("list", service.mainRead(users.getId())); //세션 아이디값을 통해 현재 팔로우중인 유저들의 게시물정보 및 유저정보 등을 받아옴
		}
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

}
