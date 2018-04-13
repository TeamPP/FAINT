package com.faint.sns;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.UserVO;
import com.faint.dto.FollowinPostDTO;
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
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserVO users = uservice.detailByEmail(authentication.getName());
		session.setAttribute("login", users);
		
		//이미지 확장자 리스트
		List<String> imageType = Arrays.asList("jpg", "bmp", "gif", "png", "jpeg");
		//비디오 확장자 리스트
		List<String> videoType = Arrays.asList("avi", "mp4", "mpg", "mpeg", "mpe", "wmv", "asf", "flv", "ogg");
				
		List<FollowinPostDTO> list = service.mainRead(users.getId());
		List<JSONArray> fileInfoList = new ArrayList<JSONArray>();
		Date dt = new Date();
		if(users!=null){
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
		}
		System.out.println("메인 종료 시간 : " + dt.toString());

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
