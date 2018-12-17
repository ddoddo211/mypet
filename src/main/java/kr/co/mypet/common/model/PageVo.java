package kr.co.mypet.common.model;

public class PageVo {
	private int page;
	private int pageSize;
	
	
	public PageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PageVo(int page, int pageSize) {
		super();
		this.page = page;
		this.pageSize = pageSize;
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
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", pageSize=" + pageSize + "]";
	}
	
	
	
}
