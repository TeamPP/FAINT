package util;

import java.sql.Date;

public class MemberCriteria extends Criteria {
	
	
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
	private String sessionkey;
	private int sessionlimit;
	private String memberAuthKey;
	
	private Date regdate;
	private int isFollow; //로그인한 유저가 팔로우할경우 해당 유저의 id값 반환 아닐경우 null(0)반환
	
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
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public int getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(int sessionlimit) {
		this.sessionlimit = sessionlimit;
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
	
	
}
