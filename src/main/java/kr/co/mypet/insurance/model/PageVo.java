package kr.co.mypet.insurance.model;

public class PageVo extends InsProdVo  {
	
	// 페이징 처리
	private int rnum;
	
	private int page;
	private int pageSize;
	
	
	//조회 조건주기 위해 설정 
	private String petKind;
	
	// 우리아이 보험추천 부분에 나와야 하기 때문에 설정
	private String petBirth;
	private String petSick;
	

	@Override
	public String toString() {
		return "PageVo [rnum=" + rnum + ", page=" + page + ", pageSize=" + pageSize + ", petKind=" + petKind
				+ ", petBirth=" + petBirth + ", petSick=" + petSick + "]";
	}



	public String getPetBirth() {
		return petBirth;
	}







	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
	}







	public String getPetSick() {
		return petSick;
	}




	public void setPetSick(String petSick) {
		this.petSick = petSick;
	}




	public String getPetKind() {
		return petKind;
	}




	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}




	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	


	
	
}
