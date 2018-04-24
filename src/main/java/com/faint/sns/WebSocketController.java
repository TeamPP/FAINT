package com.faint.sns;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.faint.domain.UserVO;
import com.faint.service.UserService;

@Controller
public class WebSocketController {
	//로거
	Logger logger = LoggerFactory.getLogger(WebSocketController.class);

	//접속유저리스트
	private Map<String, String> sessions=new HashMap<String, String>();
	
	@Inject
	UserService service;

	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public String websocket() {
		return "NewFile";
	}
	
	@MessageMapping("/notify/{loginid}/follow")
    @SendTo("/notify/{loginid}/follow")
	public String follow(@DestinationVariable("loginid") String loginid, UserVO vo) throws Exception {
		return vo.getNickname()+"님이 " + loginid + "님을 팔로우하기 시작했습니다!";
		
		//자원  = 행동한사람의 이메일(시큐리티) / 넘겨받는 loginid변수 
		//principal - 행동한사람의 principal이 들어옴
		//SimpMessageHeaderAccessor headerAccessor - 행동한사람의  정보가 들어옴
	}
	
	@MessageMapping("/notify/{nickname}/tagging")
    @SendTo("/notify/{nickname}/tagging")	
	public String tagging(@DestinationVariable("nickname") String loginid, UserVO vo) throws Exception {
		return new String(vo.getNickname()+"님이 " + loginid + "님을 태그하였습니다");
	}
	
	@MessageMapping("/notify/{loginid}/like/{postid}")
    @SendTo("/notify/{loginid}/like")
	public String like(@DestinationVariable("loginid") String loginid, @DestinationVariable("postid") String postid, UserVO vo) throws Exception {
		return new String("Hello, " + loginid + "!");
	}
	
	@MessageMapping("/notify/{loginid}/reply/{postid}")
    @SendTo("/notify/{loginid}/reply")
	public String reply(@DestinationVariable("loginid") String loginid, @DestinationVariable("postid") String postid, UserVO vo) throws Exception {

		return new String("Hello, " + loginid + "!");
	}
	
	@MessageMapping("/hello")
	@SendTo("/access/notify")
	public String notify(SimpMessageHeaderAccessor headerAccessor, UserVO vo, Principal principal){
		
		sessions.put(principal.getName(), headerAccessor.getSessionAttributes().get("sessionId").toString());
		return new String("Hello, " + vo.getId() + "!");
	}
	
	
}

