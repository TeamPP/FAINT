package com.faint.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.faint.domain.Answer;
import com.faint.persistence.PaintDAO;

public class PaintHandler extends TextWebSocketHandler{

	private Logger logger = LoggerFactory.getLogger(PaintHandler.class);
	
	private PaintDAO paintDAO;
	
	public void setPaintDAO(PaintDAO paintDAO) {
		this.paintDAO = paintDAO;
	}

	/**
	 * 서버에 연결한 사용자들을 저장하는 리스트.
	 */
	private List<WebSocketSession> connectedUsers;
	private Answer question;
	
	public PaintHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		question = new Answer();
	}
	
	/**
	 * 접속과 관련되어 있는 Event Method
	 * @param WebSocketSession 접속한 사용자
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		if ( connectedUsers.size() == 4 ) {
		}
		else if ( connectedUsers.size() == 3 ) {
			
			while ( true ) {
				
				if ( paintDAO.getAnswer() != null && !paintDAO.getAnswer().getAnswer().equals("") ) {
					question = paintDAO.getAnswer();
					
					for (int i = 0; i < connectedUsers.size(); i++) {
						if ( question.getIp().equals( connectedUsers.get(i).getRemoteAddress().getHostName()) ) {
							connectedUsers.get(i).sendMessage( new TextMessage( "!@#OK" ) );
						}
						else {
							connectedUsers.get(i).sendMessage( new TextMessage( "!@#NO" ) );
						}
					}
					
					session.sendMessage( new TextMessage("!@#NO") );
					
					break;
				}
				
			}
			
		}
		
		logger.info(session.getId() + "님이 접속했습니다.");
		logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		logger.info(connectedUsers.size() + "");
		for (WebSocketSession webSocketSession : connectedUsers) {
			webSocketSession.sendMessage( new TextMessage( "{ \"mode\" : \"fill\", \"color\" : \"#FFFFFF\" }" ) );
		}
		
	}
	
	/**
	 * 두 가지 이벤트를 처리함.
	 * 1. Send : 클라이언트가 서버에게 메시지를 보냄
	 * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지를 보냄
	 * 
	 * @param WebSocketSession 메시지를 보낸 클라이언트
	 * @param TextMessage 메시지의 내용
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		if ( !question.getAnswer().equals(paintDAO.getAnswer().getAnswer()) ) {
			
			for (WebSocketSession webSocketSession : connectedUsers) {
				webSocketSession.sendMessage( new TextMessage( "{ \"mode\" : \"fill\", \"color\" : \"#FFFFFF\" }" ) );
			}
			
			question = paintDAO.getAnswer();
			
			for (int i = 0; i < connectedUsers.size(); i++) {
				if ( question.getIp().equals( connectedUsers.get(i).getRemoteAddress().getHostName()) ) {
					connectedUsers.get(i).sendMessage( new TextMessage( "!@#OK" ) );
				}
				else {
					connectedUsers.get(i).sendMessage( new TextMessage( "!@#NO" ) );
				}
			}
			
		}
		
		for (WebSocketSession webSocketSession : connectedUsers) {
			if ( !webSocketSession.getId().equals(session.getId()) ) {
				webSocketSession.sendMessage(new TextMessage(message.getPayload()));
			}
		}
	}
}
