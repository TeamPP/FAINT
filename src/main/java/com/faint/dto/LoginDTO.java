package com.faint.dto;

public class LoginDTO {
	private String email;
	private String bPass;
	private boolean useCookie;
	private String snsID;
	private String nickname;
	private String profilephoto;
	
	
	
	
	
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getbPass() {
		return bPass;
	}
	public void setbPass(String bPass) {
		this.bPass = bPass;
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
		return "LoginDTO [email=" + email + ", password=" + bPass + ", useCookie=" + useCookie + ", snsID=" + snsID
				+ ", nickname=" + nickname + "]";
	}

}
