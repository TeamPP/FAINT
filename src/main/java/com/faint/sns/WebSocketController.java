package com.faint.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.client.WebSocketClient;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;
import org.springframework.web.socket.messaging.WebSocketStompClient;

import com.faint.domain.UserVO;

@Controller
public class WebSocketController {
	
	Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	WebSocketClient webSocketClient = new StandardWebSocketClient();
	WebSocketStompClient stompClient = new WebSocketStompClient(webSocketClient);

	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public String websocket() {
		return "NewFile";
	}
	
	@MessageMapping("/hi")
    @SendTo("/access/greetings")
	public String websocket(UserVO vo) {
		this.logger.info("메시지: {}", vo.getId());
		return new String("Hello, " + vo.getId() + "!");
	}
	
	
}
