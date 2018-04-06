package com.faint.domain;

public class PostedTagVO {
	
	private int postid;
	private int tagid;
	
	//getter, setter
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getTagid() {
		return tagid;
	}
	public void setTagid(int tagid) {
		this.tagid = tagid;
	}

	
	//toString()
	@Override
	public String toString() {
		return "PostedTagVO [postid=" + postid + ", tagid=" + tagid + "]";
	}
	
	
	
}
