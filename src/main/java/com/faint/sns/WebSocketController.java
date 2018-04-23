package com.faint.sns;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
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
	
	@MessageMapping("/hi")
    @SendToUser("/access/followers")	
	public String followers(SimpMessageHeaderAccessor headerAccessor, UserVO vo, Principal principal) throws Exception {
		this.logger.info("메시지: {}", vo.getId());
		sessions.put(principal.getName(), headerAccessor.getSessionAttributes().get("sessionId").toString());
		logger.info(sessions+"");
		return new String("Hello, " + vo.getId() + "!");
	}
	
	@MessageMapping("/hello")
	@SendTo("/access/notify")
	public String notify(UserVO vo){
		
		return new String("Hello, " + vo.getId() + "!");
	}
	
	
}
