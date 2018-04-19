package com.faint.domain;

import java.util.Arrays;
import java.util.Date;

public class PostVO {
	private int id;
	private int userid;
	private int cateid;
	private String caption;
	
	private Date regdate;
	private Date moddate;	// 수정date
	private String location;	// 위치
	
	private int replyCount;
	private int likeCount;
	private String url; //추출시에는 모든 파일명 출력되며 |를 기준으로 파일명 구분됨
	private String filter; //추출시에는 모든 파일명 출력되며 |를 기준으로 파일명 구분됨

	private int row;				//row추가(table에 없는 변수)
	
	private String[] files;
	private String[] filters;

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}
	
	public String[] getFilters() {
		return filters;
	}

	public void setFilters(String[] filters) {
		this.filters = filters;
	}

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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "PostVO [id=" + id + ", userid=" + userid + ", cateid=" + cateid + ", caption=" + caption + ", regdate="
				+ regdate + ", moddate=" + moddate + ", location=" + location + ", replyCount=" + replyCount
				+ ", likeCount=" + likeCount + ", url=" + url + ", filter=" + filter + ", row=" + row + ", files="
				+ Arrays.toString(files) + ", filters=" + Arrays.toString(filters) + "]";
	}

}
