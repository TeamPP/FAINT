package com.faint.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.DefaultSimpUserRegistry;
import org.springframework.web.socket.messaging.SessionConnectedEvent;

import com.faint.domain.UserVO;
import com.faint.dto.CustomUserDetails;

@Component
public class StompConnectedEvent implements ApplicationListener<SessionConnectedEvent> {

    private static final Logger logger = LoggerFactory.getLogger(StompConnectedEvent.class);

    @Override
    public void onApplicationEvent(SessionConnectedEvent event) {
    	DefaultSimpUserRegistry registry = new DefaultSimpUserRegistry();
    	registry.onApplicationEvent(event);
    	
    	
    	

        logger.info("Session Connected "+event.getUser());
        // you can use a controller to send your msg here
        
    }
}
