package kr.co.mypet.insurance.model;

public class PageVo extends InsProdVo  {
	
	// 페이징 처리
	private int rnum;
	
	private int page;
	private int pageSize;
	

	@Override
	public String toString() {
		return "PageVo [rnum=" + rnum + ", page=" + page + ", pageSize=" + pageSize + "]";
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
