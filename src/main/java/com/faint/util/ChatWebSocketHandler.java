/*package com.faint.util;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.faint.domain.MessageVO;
import com.faint.domain.UserVO;

import net.sf.json.JSONArray;


public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);

	private List<WebSocketSession> connectedUsers;
	  private List<String> emailList = new ArrayList<String>();

	private Map<String, String> users = new ConcurrentHashMap<String, String>();
	
//	@Inject
//	private MessageDAO dao;
	
	//서버에 연결한 사용자들 저장
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		
		System.out.println("chatwebsocket->실행1!!!!!!!!!!!!!!!!!!!!!!! ");
	}
	
	// 접속 관련 이벤트 메소드 
	// @param websocketsession 접속 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("chatwebsocket->실행 ");
		
		//HttpSession 정보를 가져온다
		Map<String, Object> map = session.getAttributes(); 	
		
    //정보 가져오기   
		connectedUsers.add(session);
		System.out.println(connectedUsers.add(session));
        
        JSONArray jsonArray=new JSONArray();
        emailList.add(session.getPrincipal().getName());
///////////////////////////////
        //0번째 중괄호에 session.getId()을 넣으라는뜻
        logger.info("{} 연결됨", session.getPrincipal().getName()); 
        logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
        
        
        ///////////////////////////////
		//유저와  다른 유져 분할 
		if(map.get("login") instanceof UserVO){
			System.out.println("user==========");
			UserVO login = (UserVO) map.get("login");
			users.put(session.getId(), login.getEmail());			
			logger.info(login.getEmail() +"님 접속");
		}else{
			System.out.println("상대방이따. =========================");
			//users.put(session.getId(), admin.getId());
			//	logger.info(admin.getId() +"님 접속");
		}
		
		//웹 소켓 세션의 아이디, 로그인한 사용자 아이디를 담아준다
		connectedUsers.add(session);
		
	//	logger.info("연결 ip : "+session.getRemoteAddress().getHostName());
	}
	
	// 클라이언트가 서버와 연결 종료
	// @param websocketsession 연결을 끊은 클라이언트
	// @param closestatus 연결 상태(확인 필요)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info(users.get(session.getId())+" 님 접속 종료");
		
		connectedUsers.remove(session);
		users.remove(session.getId());

	}

	// 2가지 이벤트 처리
	// 1.send : 클라이언트가 서버에게 메시지 보냄
	// 2.emit : 서버에 연결되어 있는 클라이언트에게 메시지 보냄
	// @param websocketsession 메시지를 보낸 클라이언트
	// @param textmessage 메시지의 내용
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		//payload = 사용자가 보낸 메시지
		MessageVO messageVO = MessageVO.converMessage(message.getPayload());
		
		logger.info("0");
	
		messageVO.setEmail(users.get(session.getId()));
		messageVO.setMessage(messageVO.getMessage());
		messageVO.setReceiver(messageVO.getReceiver());
		
		logger.info("1");
		
		//메시지 내역 DB 저장
		//dao.send(messageVO);
	    
		logger.info("2");
		
	    //연결된 모든 클라이언트에게 메시지 전송 
	     for (WebSocketSession webSocketSession : connectedUsers) {
	    	 
	 		//logger.info("로그인 한 아이디 : "+ login.getEmail());
	    	//logger.info(login.getEmail()+ " 님이 메시지 전송 "+messageVO.getMessage());
	    	
	 		//전체 보내기인 경우===========================================
	         if (messageVO.getType().equals("all")) {
	        	//보낸 사용자는 받지 않기 위한 조건문
	            if (!session.getId().equals(webSocketSession.getId())) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(
	                        		 "<span style='color:green;'> 전체 : "
	                        		+ messageVO.getEmail() + " ▶ " + messageVO.getMessage()
	                        		+ "</span>"));
	            }
	        //귓속말인 경우===============================================
	         } else { 
	        	 String inTime   = new java.text.SimpleDateFormat("HH:mm").format(new java.util.Date());
	        	 
	        	 	//to의 대상과 users의 웹소켓아이디와 매칭된 이메일 정보 가져와서 비교
	        	 	if (messageVO.getReceiver().equals(users.get(webSocketSession.getId()))) {
	            		 webSocketSession.sendMessage(
	            				 new TextMessage(
	            						 "<div class='row msg_container base_receive'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_receive'>"
	            							+ messageVO.getMessage() + "<br><time>"
	            							+ inTime + "</time></div></div></div>"	 
	            						 ));
	            		 break;
	            	 }
	          }
	         //else 끝 ===================================
	         //
	         
	      }
	   }

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}*/