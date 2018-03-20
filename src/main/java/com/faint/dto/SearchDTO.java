package com.faint.dto;

// �˻�â �˻�
public class SearchDTO {
	
	/*�±�*/
	private int tagid;				// �±� id
	private String tagname;		// �±� �̸�
	private int postedtagCnt;		// �±׿� ����� �Խñ� ����
	
	/*�����*/
	private String nickname;		// ����� nick
	private String name;			// ����� �̸�
	private int userid;				// ����� id
	
	/*��ġ*/
	private int postid;				// �Խñ� ��ȣ
	private int cateid;				// �Խñ� ī�װ� ��ȣ
	private String location;		// ��ġ
	
	
	//getter, setter
	public int getTagid() {
		return tagid;
	}

	public void setTagid(int tagid) {
		this.tagid = tagid;
	}
	
	public String getTagname() {
		return tagname;
	}
	
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	
	public int getPostedtagCnt() {
		return postedtagCnt;
	}
	
	public void setPostedtagCnt(int postedtagCnt) {
		this.postedtagCnt = postedtagCnt;
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
	
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
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

	//toString
	@Override
	public String toString() {
		return "SearchDTO [tagid=" + tagid + ", tagname=" + tagname + ", postedtagCnt=" + postedtagCnt + ", nickname="
				+ nickname + ", name=" + name + ", userid=" + userid + ", postid=" + postid + ", cateid=" + cateid
				+ ", location=" + location + "]";
	}

	
	
	
}
