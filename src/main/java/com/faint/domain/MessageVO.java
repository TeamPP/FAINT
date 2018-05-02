package com.faint.domain;

import java.util.Date;

public class MessageVO {
	private int id; //메시지 번호
	private int roomid;	//채팅방  번호
	private String comment; //메시지 내용
	private Date sendtime; //보낸시간
	private int sender; //보낸사람 아이디
	
	private String profilephoto; //보낸사람 프로필사진
	private String senderNickname; //보낸사람 닉네임
	private String senderEmail; //보낸사람 이메일(소켓은 principal로 email값만 가져오기때문에 검증용으로)
	
	private String users; //메시지 저장시 반환될 유저리스트(group_concat("|"))
	private int readstatus; //읽은 사람 수 만큼 카운트
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	public String getSenderNickname() {
		return senderNickname;
	}
	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public int getReadstatus() {
		return readstatus;
	}
	public void setReadstatus(int readstatus) {
		this.readstatus = readstatus;
	}
	@Override
	public String toString() {
		return "MessageVO [id=" + id + ", roomid=" + roomid + ", comment=" + comment + ", sendtime=" + sendtime
				+ ", sender=" + sender + ", profilephoto=" + profilephoto + ", senderNickname=" + senderNickname
				+ ", senderEmail=" + senderEmail + ", users=" + users + ", readstatus=" + readstatus + "]";
	}
}
