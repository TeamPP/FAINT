package com.faint.dto;

public class FollowDTO {
	private String nickname;
	private int userid;
	private int loginid;
	
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
	@Override
	public String toString() {
		return "FollowDTO [nickname=" + nickname + ", userid=" + userid + ", loginid=" + loginid + "]";
	}
}
