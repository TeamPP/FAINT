package com.faint.domain;

import java.sql.Date;

public class UserVO {
	private int id;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phonenumber;
	private String profilephoto; //memberPicture
	private int sex;
	private String website;
	private String intro;
	
	private int prilevel; //userState
	private int userlevel; //비공개여부
	private String sessionkey;
	private String memberAuthKey;
	
	private Date regdate;
	private int isFollow; //로그인한 유저가 팔로우할경우 해당 유저의 id값 반환 아닐경우 null(0)반환
	private int blocked; //차단여부 확인 - 로그인한 유저가 차단당하지 않은 경우 0반환
	private int isBlock; //차단여부 확인 - 로그인한 유저가 해당 유저를 차단하지 않았을 경우 0반환
	private int postCount;
	
	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getProfilephoto() {
		return profilephoto;
	}

	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
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

	public int getUserlevel() {
		return userlevel;
	}

	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}

	public String getSessionkey() {
		return sessionkey;
	}

	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}

	public String getMemberAuthKey() {
		return memberAuthKey;
	}

	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthKey = memberAuthKey;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(int isFollow) {
		this.isFollow = isFollow;
	}

	public int getBlocked() {
		return blocked;
	}

	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}

	public int getIsBlock() {
		return isBlock;
	}

	public void setIsBlock(int isBlock) {
		this.isBlock = isBlock;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", nickname="
				+ nickname + ", phonenumber=" + phonenumber + ", profilephoto=" + profilephoto + ", sex=" + sex
				+ ", website=" + website + ", intro=" + intro + ", prilevel=" + prilevel + ", userlevel=" + userlevel
				+ ", sessionkey=" + sessionkey + ", memberAuthKey=" + memberAuthKey + ", regdate=" + regdate
				+ ", isFollow=" + isFollow + ", blocked=" + blocked + ", isBlock=" + isBlock + ", postCount="
				+ postCount + "]";
	}

}
