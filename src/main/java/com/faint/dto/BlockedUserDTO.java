package com.faint.dto;

public class BlockedUserDTO {
	private int userid;
	private int blockedid;
	private String nickname;
	private String name;
	private String profilephoto;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getBlockedid() {
		return blockedid;
	}
	public void setBlockedid(int blockedid) {
		this.blockedid = blockedid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	@Override
	public String toString() {
		return "BlockedUserDTO [userid=" + userid + ", blockedid=" + blockedid + ", nickname=" + nickname + ", name="
				+ name + ", profilephoto=" + profilephoto + "]";
	} 
	
	
}
