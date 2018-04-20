package com.faint.domain;

import java.util.Date;

public class AdminReportVO {
	private int id;
	private int cateid;
	private int postid;
	private String title;
	private String nickname;
	private String writer;
	private String caption;
	private Date regdate;
	private int reportid;
	private int userid;
	private int isRead;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCateid() {
		return cateid;
	}
	public void setCateid(int cateid) {
		this.cateid = cateid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getReportid() {
		return reportid;
	}
	public void setReportid(int reportid) {
		this.reportid = reportid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	@Override
	public String toString() {
		return "AdminReportVO [id=" + id + ", cateid=" + cateid + ", postid=" + postid + ", title=" + title
				+ ", nickname=" + nickname + ", writer=" + writer + ", caption=" + caption + ", regdate=" + regdate
				+ ", reportid=" + reportid + ", userid=" + userid + ", isRead=" + isRead + "]";
	}
	
	
}
