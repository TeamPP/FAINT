package util;

public class Criteria {

	
	//int pageSize = 3; // 한 페이지에 출력할 게시물의 개수
	//int blockPage = 2; // 한 블럭에 표시할 페이지 번호의 개수
	
	private int nowPage;
	private int pageSize;
	
	private int blockPage;
	
	
	public Criteria(){
		this.nowPage = 1;
		this.pageSize = 10;
		this.blockPage= 10;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage){
		
		if(nowPage <= 0){
			this.nowPage = 1;
			return;
		}
		
		this.nowPage = nowPage;
	}
	
	public int getPageSize(){
		
		return this.pageSize;
	}

	public void setPageSize(int pageSize){
		
		if(pageSize <= 0 || pageSize > 100){
			this.pageSize = 10;
			return;
		}
		
		this.pageSize = pageSize;
	}
	


	public int getBlockPage() {
		return blockPage;
	}
		
	public void setBlockPage(int blockPage) {
		
		if(blockPage <= 0 || blockPage > 100){
			this.blockPage = 10;
			return;
		}
		
		this.blockPage = blockPage;
	}
	

	//method for MyBatis SQL Mapper
	public int getPageStart() {
		
		return (this.nowPage - 1) * pageSize +1;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPageEnd() {
		return nowPage * pageSize;
	}
	
	@Override
	public String toString() {
		return "Criteria [nowPage=" + nowPage + ", pageSize=" + pageSize + "]";
	}
}

