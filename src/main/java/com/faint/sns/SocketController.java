package com.faint.sns;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.MessageVO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.FollowinPostDTO;



@Controller
public class SocketController {
	
	@RequestMapping("/chatting/chat")
	public String viewChattingPage() {
		return "chatting/chat";
	}
	
	@RequestMapping("/paint")
	public String viewPaintingPage() {
		return "chatting/paint";
	}
	
	//채팅 뷰페이
	@ResponseBody
	@RequestMapping(value = "/chatting/chatView22", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<List<MessageVO>> viewChattinPageAdmin22(Model model, Authentication authentication, HttpServletRequest request) throws Exception{
		
		System.out.println(authentication.getPrincipal());
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();	
		System.out.println("대단인간들 ");
		//로그인한 세션에 담겨있는 정보 가져옴
	//	HttpSession session = request.getSession();
		//UserVO user = (UserVO)session.getAttribute("login");
		
		/*model.addAttribute("list", service.adminMessage(user.getEmail())); */
	//	logger.info("chatAdmin22 데려온다...");

		ResponseEntity<List<MessageVO>> entity=null;
		List list=new ArrayList();
		list.add(" 메세지 전내용 들 ");
	//	model.addAttribute("list", list); //세션 아이디값을 통해 현재 팔로우중인 유저들의 게시물정보 및 유저정보 등을 받아옴
	 
		entity = new ResponseEntity<List<MessageVO>>(list, HttpStatus.OK);
		
		return entity;
		
	}
	


}
