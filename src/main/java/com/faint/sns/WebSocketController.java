package com.faint.sns;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.UserVO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.NoticeDTO;
import com.faint.dto.RelationDTO;
import com.faint.service.NoticeService;

import net.sf.json.JSONArray;

@Controller
public class WebSocketController {
	
	//로거
	Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	//현재시간
	private Date today=new Date();
	private SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");

	@Inject
	private NoticeService service;
	
	//접속유저리스트
	private Map<String, String> sessions=new HashMap<String, String>();
	
	//=======================알림=======================
	
	//알림 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getNotice", method=RequestMethod.GET)
	public ResponseEntity<List<NoticeDTO>> flwnList(Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();

		ResponseEntity<List<NoticeDTO>> entity=null;
		try{
			entity=new ResponseEntity<List<NoticeDTO>>(service.getNoticeList(vo.getId()), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//알림메세지 보내기-follow
	@MessageMapping("/notify/{loginid}/follow")
    @SendTo("/notify/{loginid}")
	public String follow(@DestinationVariable("loginid") int loginid, UserVO vo) throws Exception {
			
		return "SUCCESS";
		
		//자원  = 행동한사람의 이메일(시큐리티) / 넘겨받는 loginid변수 
		//principal - 행동한사람의 principal이 들어옴
		//SimpMessageHeaderAccessor headerAccessor - 행동한사람의  정보가 들어옴
	}
	
	//알림메세지 보내기-tagging
	@MessageMapping("/notify/{nickname}/tagging/{postid}")
    @SendTo("/notify/{nickname}")
	public String tagging(@DestinationVariable("nickname") String userid, @DestinationVariable("postid") int postid, UserVO vo) throws Exception {
		
		int count = service.createTaggingNotice(vo.getNickname(), userid, postid);
		
		if(count==1){
			return "SUCCESS";
		}else{
			return "FAIL";
		}
		
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

