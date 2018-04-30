package com.faint.domain;

import java.util.Date;

public class ChatroomVO {
	
	private int id;
	private String usersNickname; //user들의 nickname jsonArray
	private String usersPhoto; //user들의 profilePhoto jsonArray
	private String lastMessage;
	private Date lastMessageDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsersNickname() {
		return usersNickname;
	}
	public void setUsersNickname(String usersNickname) {
		this.usersNickname = usersNickname;
	}
	public String getUsersPhoto() {
		return usersPhoto;
	}
	public void setUsersPhoto(String usersPhoto) {
		this.usersPhoto = usersPhoto;
	}
	public String getLastMessage() {
		return lastMessage;
	}
	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}
	public Date getLastMessageDate() {
		return lastMessageDate;
	}
	public void setLastMessageDate(Date lastMessageDate) {
		this.lastMessageDate = lastMessageDate;
	}
	@Override
	public String toString() {
		return "ChatroomVO [id=" + id + ", usersNickname=" + usersNickname + ", usersPhoto=" + usersPhoto
				+ ", lastMessage=" + lastMessage + ", lastMessageDate=" + lastMessageDate + "]";
	}

}
