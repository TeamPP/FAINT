package com.faint.sns;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.UserVO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.NoticeDTO;
import com.faint.service.NoticeService;

import net.sf.json.JSONArray;

@Controller
public class WebSocketController {
	
	//로거
	Logger logger = LoggerFactory.getLogger(WebSocketController.class);

	@Inject
	private NoticeService service;
	
	//=======================알림=======================
	
	//알림 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getNotice", method=RequestMethod.GET)
	public ResponseEntity<String> noticeList(Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		List<NoticeDTO> noticeList=service.getNoticeList(vo.getId());
    	
		//JSONobject로 만들기 위한 인스턴스값 생성
    	String notice=JSONArray.fromObject(noticeList).toString();
    	
		ResponseEntity<String> entity=null;
		try{
			entity=new ResponseEntity<String>(notice, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//알림구독시 메세지 보내기
	@SubscribeMapping("/notify/{loginid}")
	public String noticeSubscribe(@DestinationVariable("loginid") int loginid) throws Exception {
		return "SUCCESS";
	}
	
	//알림메세지 보내기-follow
	@MessageMapping("/notify/{loginid}/follow")
    @SendTo("/notify/{loginid}")
	public String follow(@DestinationVariable("loginid") int loginid) throws Exception {
		return "SUCCESS";
		
		//자원  = 행동한사람의 이메일(시큐리티) / 넘겨받는 loginid변수 
		//principal - 행동한사람의 principal이 들어옴
		//SimpMessageHeaderAccessor headerAccessor - 행동한사람의  정보가 들어옴
	}
	
	//알림메세지 보내기-tagging
	@MessageMapping("/notify/{nickname}/tagging/{postid}/{type}")
    @SendTo("/notify/{nickname}")
	public String tagging(@DestinationVariable("nickname") String usernickname, @DestinationVariable("postid") int postid, @DestinationVariable("type") String type, UserVO vo) throws Exception {
		
		String Message="FAIL";
		
		if (type=="reply"){
			int count = service.createTaggingNotice(vo.getNickname(), usernickname, postid);
			
			if(count==1){
				Message="SUCCESS";
			}
			
		}else if (type=="post"){
			Message="SUCCESS";
		}
		
		return Message;
		
	}
	
	//알림메세지 보내기-like
	@MessageMapping("/notify/{loginid}/like/{postid}")
    @SendTo("/notify/{loginid}")
	public String like(@DestinationVariable("loginid") String loginid, @DestinationVariable("postid") String postid) throws Exception {
		return "SUCCESS";
	}
	
	//알림메세지 보내기-reply
	@MessageMapping("/notify/{loginid}/reply/{postid}")
    @SendTo("/notify/{loginid}")
	public String reply(@DestinationVariable("loginid") String loginid, @DestinationVariable("postid") String postid) throws Exception {
		return "SUCCESS";
	}
	
}

