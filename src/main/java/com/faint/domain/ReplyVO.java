package com.faint.domain;

import java.util.Date;

public class ReplyVO {
	
	private int id;
	private int postid;
	private int postWriter;
	private int userid;
	private String username;
	private String comment;
	private Date regdate;
	
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
	public int getPostwriter() {
		return postWriter;
	}
	public void setPostwriter(int postWriter) {
		this.postWriter = postWriter;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [id=" + id + ", postid=" + postid + ", postWriter=" + postWriter + ", userid=" + userid
				+ ", username=" + username + ", comment=" + comment + ", regdate=" + regdate + "]";
	}
}