package com.faint.domain;

import java.util.Date;

public class AdminUserVO {
	private int id;
	private String email;
	private String name;
	private String nickname;
	private String phonenumber;
	private String website;
	private int sex;
	private String intro;
	private int prilevel;
	private String snsid;
	private int userlevel;
	private Date regdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getPrilevel() {
		return prilevel;
	}
	public void setPrilevel(int prilevel) {
		this.prilevel = prilevel;
	}
	public String getSnsid() {
		return snsid;
	}
	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}
	public int getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "AdminUserVO [id=" + id + ", email=" + email + ", name=" + name + ", nickname=" + nickname
				+ ", phonenumber=" + phonenumber + ", website=" + website + ", sex=" + sex + ", intro=" + intro
				+ ", prilevel=" + prilevel + ", snsid=" + snsid + ", userlevel=" + userlevel + ", regdate=" + regdate
				+ "]";
	}
	
	
}
