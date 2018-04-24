package com.faint.dto;

import java.util.Date;

public class NoticeDTO {

	private String fromid;
	private String targetid;
	private String type;
	
	private int postid; //null가능
	private int isFlw; //null가능
	
	private Date regdate;
	
	private String postPic; //null가능
	private String filter; //null가능
	
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public String getTargetid() {
		return targetid;
	}
	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getIsFlw() {
		return isFlw;
	}
	public void setIsFlw(int isFlw) {
		this.isFlw = isFlw;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getPostPic() {
		return postPic;
	}
	public void setPostPic(String postPic) {
		this.postPic = postPic;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	@Override
	public String toString() {
		return "NoticeDTO [fromid=" + fromid + ", targetid=" + targetid + ", type=" + type + ", postid=" + postid
				+ ", isFlw=" + isFlw + ", regdate=" + regdate + ", postPic=" + postPic + ", filter=" + filter + "]";
	}
	
	

}
