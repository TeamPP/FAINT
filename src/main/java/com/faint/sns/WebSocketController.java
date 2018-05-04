package com.faint.sns;


import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.faint.domain.ChatroomVO;
import com.faint.domain.MessageVO;
import com.faint.domain.UserVO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.NoticeDTO;
import com.faint.dto.RelationDTO;
import com.faint.service.MessageService;
import com.faint.service.NoticeService;

import net.sf.json.JSONArray;

@Controller
public class WebSocketController {
	
	//로거
	Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Inject
    private SimpMessagingTemplate messagingTemplate;
	
	@Inject
	private NoticeService ntcService;
	
	@Inject
	private MessageService msgService;
	
	//==============================================알림==============================================
	
	//알림 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getNotice", produces = "application/json; charset=utf8", method=RequestMethod.GET)
	public ResponseEntity<String> noticeList(Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		List<NoticeDTO> noticeList=ntcService.getNoticeList(vo.getId());
    	
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

		if (type.equals("reply")){
			int count = ntcService.createTaggingNotice(vo.getNickname(), usernickname, postid);
			this.logger.info("이게 태그 카운터"+count);
			
			if(count == 1){
				Message="SUCCESS";
			}
			
		}else if (type.equals("post")){
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
	
	//==============================================채팅==============================================
	
	//채팅방 생성 및 채팅방 번호값 가져오기
	@MessageMapping("/chat/create/{targetNickname}")
	public void reply(@DestinationVariable("targetNickname") String targetNickname, Principal principal, MessageVO vo) throws Exception {

		if(principal.getName().equals(vo.getSenderEmail())){

			RelationDTO dto=new RelationDTO();
			dto.setLoginEmail(principal.getName());
			dto.setUserNickname(targetNickname);
			
			try{
				int roomId = msgService.chatCreate(dto, vo);
				//나에게 알리기
				messagingTemplate.convertAndSend("/chatWait/" + vo.getSenderNickname(), "c"+roomId);
				//상대에게 알리기
				messagingTemplate.convertAndSend("/chatWait/" + targetNickname, "c"+roomId);
				
				return;
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		//나에게 실패했음 알리기
		messagingTemplate.convertAndSend("/chatWait/" + vo.getSenderNickname(), "FAIL");
	}
	
	//채팅방 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="/getChatList", method=RequestMethod.GET)
	public ResponseEntity<List<ChatroomVO>> getChatList(Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		ResponseEntity<List<ChatroomVO>> entity=null;
		try{
			List<ChatroomVO> chatList=msgService.getChatList(vo.getId());
			entity=new ResponseEntity<List<ChatroomVO>>(chatList, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//채팅방 세부 메세지들 가져오기
	@ResponseBody
	@RequestMapping(value="/getChat/{roomid}", produces = "application/json; charset=utf8", method=RequestMethod.GET)
	public ResponseEntity<String> getChatRoom(@PathVariable("roomid") int roomid, Authentication authentication) throws Exception {

		ResponseEntity<String> entity=null;
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		try{
			
			Map<String, Object> map = msgService.getMessages(roomid, vo.getId());
			
			List<MessageVO> messageList = (List<MessageVO>)map.get("messages");
			String chatRoom=JSONArray.fromObject(messageList).toString();
			//읽은 사람이 없을경우 실행 X
			if(map.get("users")!=null){
				
				String users=map.get("users").toString();
				String[] userArray = users.split("\\|");
				
				//상대들에게 누군가 읽었음을 알리기
				for(String nickname : userArray){
					messagingTemplate.convertAndSend("/chatWait/" + nickname, "r"+roomid+chatRoom);
				}
				
				//나에게 다시 알리기
				messagingTemplate.convertAndSend("/chatWait/" + vo.getNickname(), "r"+roomid+chatRoom);
				
			}
			
			//JSONArray로 만들기 위한 인스턴스값 생성

			entity=new ResponseEntity<String>(chatRoom, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//새로운 메세지 등록
	@MessageMapping("/chat/sendMsg")
	public void registMessage(Principal principal, MessageVO vo) throws Exception {

		if(principal.getName().equals(vo.getSenderEmail())){
			try{
				String users = msgService.registMessage(vo);
				
				if(users!="" || users!=null){
					
					//나에게 알리기
					messagingTemplate.convertAndSend("/chatWait/" + vo.getSenderNickname(), "n"+vo.getRoomid());
					
					String[] userArray = users.split("\\|");
					//상대들에게 알리기
					for(String user : userArray){
						messagingTemplate.convertAndSend("/chatWait/" + user, "n"+vo.getRoomid());
					}
					return;
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		//나에게 실패했음 알리기
		messagingTemplate.convertAndSend("/chatWait/" + vo.getSenderNickname(), "FAIL");
	}
	
}

