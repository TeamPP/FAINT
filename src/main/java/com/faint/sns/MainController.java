package com.faint.sns;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
import com.faint.dto.CustomUserDetails;
import com.faint.service.CustomUserDetailsService;
import com.faint.service.PostService;

@Controller
public class MainController {

	@Inject
	private PostService service;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private CustomUserDetailsService uService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal, HttpServletRequest req, ModelAndView mv) {
		
		System.out.println("메인으로 오는 url: "+req.getRequestURL());
		System.out.println(req.getParameter("logout"));
		
		
		//인가받은 유저가 접속할 경우
		if(principal!=null){
			return "forward:/main";
		}
		
		//인가받지 않은 유저가 접속할 경우
		return "forward:/user/loginTest";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(HttpServletRequest request, Model model, Authentication authentication)throws Exception{
		System.out.println(authentication.getPrincipal());
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		//이미지 확장자 리스트
		List<String> imageType = Arrays.asList("jpg", "bmp", "gif", "png", "jpeg");
		//비디오 확장자 리스트
		List<String> videoType = Arrays.asList("avi", "mp4", "mpg", "mpeg", "mpe", "wmv", "asf", "flv", "ogg");
				
		List<FollowinPostDTO> list = service.mainRead(user.getVo().getId());
		List<JSONArray> fileInfoList = new ArrayList<JSONArray>();
		Date dt = new Date();
		if(user!=null){
			for(int i =0; i< list.size(); i++){
				String[] url = list.get(i).getUrl().split("\\|");
				JSONArray jArray = new JSONArray();
				for(int j =0; j<url.length;j++){
					String tmp = url[j].substring(url[j].lastIndexOf('.')+1);
					String type ="";
					
					//파일 타입체크
					if(imageType.contains(tmp.toLowerCase())){
						type = "image";
					}else if (videoType.contains(tmp.toLowerCase())){
						type = "video";
					}
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("fileUrl", url[j]);
					jsonObj.put("fileType", type);
					jArray.add(jsonObj);
				}
				
				fileInfoList.add(jArray);
			}
			model.addAttribute("list", list); //세션 아이디값을 통해 현재 팔로우중인 유저들의 게시물정보 및 유저정보 등을 받아옴
			model.addAttribute("fileInfoList", fileInfoList); //게시글별 파일 정보 리스트 
			
			HttpSession session=request.getSession();
			session.setAttribute("login", user.getVo());
			
		}else{
			System.out.println("안들어가나요?");
		}
	}
	
	@RequestMapping(value = "/login-processing", method = RequestMethod.GET)
	public void loginProcessGET(Model model, HttpServletRequest req, HttpServletResponse res)throws Exception{
		System.out.println("언제들어오나-get");
	}
	
	@RequestMapping(value = "/login-processing", method = RequestMethod.POST)
	public void loginProcessing(Model model, HttpServletRequest req, HttpServletResponse res)throws Exception{
		System.out.println("언제들어오나-post");
	}
	
	@RequestMapping(value = "/empty", method = RequestMethod.GET)
	public void empty(Model model)throws Exception{

	}
	
/*	// 접근 제한 페이지
	@RequestMapping(value="/access-denied", method=RequestMethod.GET)
	public String accessDenied(Model model) {
		
		System.out.println("sasdsadasdsad");
		
		model.addAttribute("email", uService.getUsername());
		
		return "access-denied";
	}*/

	
	@RequestMapping(value = "/chatTest", method = RequestMethod.GET)
	public void chatTest(Model model)throws Exception{
		
		
	}

}
