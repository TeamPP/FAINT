package com.faint.dto;

import java.util.Arrays;
import java.util.Date;

public class FollowinPostDTO {
	//팔로우중인 유저들의 게시물과 그 게시자의 정보
	private int postid;
	private int userid;
	private String caption;
	private int cateid;
	private String location;
	private String url; //모든 첨부파일 통합 String '|'로 파일명 구분
	private String usernickname;
	private String profilephoto;
	private Date regdate;
	private int isLike; //userid or null(=0)
	private int isStore; //userid or null(=0)
	
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsernickname() {
		return usernickname;
	}
	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}
	public String getProfilephoto() {
		return profilephoto;
	}
	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getIsLike() {
		return isLike;
	}
	public void setIsLike(int isLike) {
		this.isLike = isLike;
	}
	public int getIsStore() {
		return isStore;
	}
	public void setIsStore(int isStore) {
		this.isStore = isStore;
	}
	@Override
	public String toString() {
		return "FollowinPostDTO [postid=" + postid + ", userid=" + userid + ", caption=" + caption + ", cateid="
				+ cateid + ", location=" + location + ", url=" + url + ", usernickname=" + usernickname
				+ ", profilephoto=" + profilephoto + ", regdate=" + regdate + ", isLike=" + isLike + ", isStore="
				+ isStore + "]";
	}
	
}
