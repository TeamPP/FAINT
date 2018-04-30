package com.faint.util;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.faint.domain.UserVO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.RelationDTO;
import com.faint.service.UserService;

import net.sf.json.JSONObject;

 
@Repository
public class EchoHandler extends TextWebSocketHandler{
	
	//로그
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Inject
    UserService userService;
    
    //전체 접속 유저 소켓
	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

	//접속자 이메일 리스트
    private Map<String, List> userList = new HashMap<String, List>();
  
    //접속 유저값
    private Map<String, String> userOn = new HashMap<String, String>();
    
    //접속해제 유저값
    private Map<String, String> userOff = new HashMap<String, String>();
    
    
    //클라이언트 접속 이후 실행 메서드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
    	//세션맵에 (이메일, 소켓 세션)으로 저장
    	sessions.put(session.getPrincipal().getName(), session);
    	logger.info("1");
    	//JSONobject로 만들기 위한 인스턴스값 생성
    	JSONObject jsonObj=new JSONObject();
    	logger.info("2");
        //인증키를 통해 팔로우하고 있는 리스트 호출
        Authentication auth=SecurityContextHolder.getContext().getAuthentication();
        logger.info((auth==null) + "");
        CustomUserDetails user=(CustomUserDetails)auth.getPrincipal();
        RelationDTO dto=new RelationDTO();
		dto.setLoginid(user.getVo().getId());
		dto.setUserid(user.getVo().getId());
		
		logger.info("3");
		//팔로우하고 있는 사람들의 email리스트
		List<UserVO> users=userService.flwnList(dto);
		List<String> emails=new ArrayList();
		for(UserVO vo : users){
			emails.add(vo.getEmail());
		}
		
		logger.info("4");
		//email리스트가 map의 key에 있을 경우 userList에 메일 넣어줌
		userList.put("initUserList", emails);
		
		logger.info("5");
		//팔로우하고 있는 사람들의 리스트를 받아옴
        sessions.get(session.getPrincipal().getName()).sendMessage(new TextMessage(jsonObj.fromObject(userList).toString()));
        logger.info(jsonObj.fromObject(userList).toString());
        logger.info("안들어오나?");
        
        //===================================================
        
		//나를 팔로우하고 있는 사람들의 email리스트
		users = userService.flwdList(dto);
		emails.clear();
		for(UserVO vo : users){
			emails.add(vo.getEmail());
		}
		
		//나를 팔로우하고 있는 사람들에게 userOn을 보내줌
		userOn.put("userOn", user.getVo().getEmail());
		for (String email : emails) {
			if(sessions.containsKey(email)){
				sessions.get(email).sendMessage(new TextMessage(jsonObj.fromObject(userOn).toString()));
			}
		}
			
    }
    
    
    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
    	//for (WebSocketSession webSocketSession : sessionList) {
		//	
		//}
    		
    		logger.info("for debugging handleTextMessage()*****************************************************************"); // 디버그용
    		
    		String bNick=message.getPayload();
    		
    		System.out.println("bnick"+bNick);
        //0번째에 session.getId() 1번째에 message.getPayload() 넣음
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});
        
        String name = session.getPrincipal().getName();
        session.getPrincipal();
        
        
/*        //연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        for(WebSocketSession sess : sessions){
            sess.sendMessage(new TextMessage(name + ":" + message.getPayload()));
        }
        */
        
        // 맵 방법.
/*        Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    

     //클라이언트 연결을 끊었을 때 실행되는 메소드

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	
    	//세션맵에 나간사람 삭제
    	sessions.remove(session.getPrincipal().getName());

    	//JSONobject로 만들기 위한 인스턴스값 생성
    	JSONObject jsonObj=new JSONObject();
    	
        //인증키를 통해 팔로우하고 있는 리스트 호출
        UserVO user = userService.detailByEmail(session.getPrincipal().getName());
        RelationDTO dto = new RelationDTO();
		dto.setLoginid(user.getId());
		dto.setUserid(user.getId());
		
        //나를 팔로우 하고 있는 사람들의 리스트
		//나를 팔로우하고 있는 사람들의 email리스트
		List<UserVO> users = userService.flwdList(dto);
		List<String> emails = new ArrayList();
		for(UserVO vo : users){
			emails.add(vo.getEmail());
		}
		//나를 팔로우하고 있는 사람들에게 userOn을 보내줌
		userOff.put("userOff", session.getPrincipal().getName());
		for (String email : emails) {
			if(sessions.containsKey(email)){
				sessions.get(email).sendMessage(new TextMessage(jsonObj.fromObject(userOff).toString()));
			}
		}

    }
 
}