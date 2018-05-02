package com.faint.persistence;

import com.faint.dto.Message;

public interface SocketDAO {
    int selectMessageUnreadCount(String username);
    
    Integer updateMessageUnreadCount(Message message);

    boolean isMember(String username);
}
