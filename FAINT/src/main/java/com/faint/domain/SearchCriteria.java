package com.faint.domain;

public class SearchCriteria {
	
	//305p
	private String keyword;	// 검색어는 String이므로 Type 필요없음
	private int row;				// 무한 스크롤 row
	
	private int loginid;

	//getter, setter
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}
	
	public int getLoginid() {
		return loginid;
	}

	public void setLoginid(int loginid) {
		this.loginid = loginid;
	}


	//toString()
	@Override
	public String toString() {
		return "SearchCriteria [keyword=" + keyword + ", row=" + row + "]";
	}

	




	
	
}
