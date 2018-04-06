package com.faint.dto;

public class LoginDTO {
	private String email;
	private String password;
	private boolean useCookie;
	private String snsID;
	private String nickname;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	public String getSnsID() {
		return snsID;
	}
	public void setSnsID(String snsID) {
		this.snsID = snsID;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "LoginDTO [email=" + email + ", password=" + password + ", useCookie=" + useCookie + ", snsID=" + snsID
				+ ", nickname=" + nickname + "]";
	}

}
