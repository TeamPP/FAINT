package com.faint.dto;

public class SearchDTO {

	private int type;
	private int score;
	private String tagname;		
	private int postedtagCnt;		
	
	private String nickname;		
	private String name;	
	private String profilephoto;
	
	private String location;

	// getter, setter
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public String getProfilephoto() {
		return profilephoto;
	}

	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	//toString
	@Override
	public String toString() {
		return "SearchDTO [type=" + type + ", score=" + score + ", tagname=" + tagname + ", postedtagCnt="
				+ postedtagCnt + ", nickname=" + nickname + ", name=" + name + ", profilephoto=" + profilephoto
				+ ", location=" + location + "]";
	}


}
