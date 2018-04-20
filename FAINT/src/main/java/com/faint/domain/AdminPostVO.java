package com.faint.domain;

import java.util.Date;

public class AdminPostVO {
	
	private int id;
	private int postid;
	private String email;
	private String name;
	private String nickname;
	private int cateid;
	private String caption;
	private Date regdate;
	private String url;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "AdminPostVO [id=" + id + ", postid=" + postid + ", email=" + email + ", name=" + name + ", nickname="
				+ nickname + ", cateid=" + cateid + ", caption=" + caption + ", regdate=" + regdate + ", url=" + url
				+ "]";
	}
}
