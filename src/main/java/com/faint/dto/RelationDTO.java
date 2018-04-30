package com.faint.dto;

public class RelationDTO {
	private String nickname;
	private int userid;
	private int loginid;
	private int postid;
	
	private int roomid; //message용 변수
	private String userNickname; //message용 변수
	private String loginEmail; //message용 변수
	
	private String type; //notice용 변수

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getLoginid() {
		return loginid;
	}

	public void setLoginid(int loginid) {
		this.loginid = loginid;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public int getRoomid() {
		return roomid;
	}

	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getLoginEmail() {
		return loginEmail;
	}

	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "RelationDTO [nickname=" + nickname + ", userid=" + userid + ", loginid=" + loginid + ", postid="
				+ postid + ", roomid=" + roomid + ", userNickname=" + userNickname + ", loginEmail=" + loginEmail
				+ ", type=" + type + "]";
	}
	
	
}
