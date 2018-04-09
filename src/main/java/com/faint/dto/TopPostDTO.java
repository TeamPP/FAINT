package com.faint.dto;

import java.util.Arrays;
import java.util.Date;
//�α� �Խù� ����
//tbl_post + tbl_attach
public class TopPostDTO {

	private int id;
	private int userid;
	private int cateid;
	private String caption;
	private String nickname;
	
	private int likeCount;
	private int replyCount;
	
	private Date regdate;
	private String url;
	
	private String[] files;

	
	//getter, setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
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

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}
	
	
	//toString
	@Override
	public String toString() {
		return "TopPostDTO [id=" + id + ", userid=" + userid + ", cateid=" + cateid + ", caption=" + caption
				+ ", nickname=" + nickname + ", likeCount=" + likeCount + ", replyCount=" + replyCount + ", regdate="
				+ regdate + ", url=" + url + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
