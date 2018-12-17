package kr.co.mypet.shopping.model;

public class ProdAgeVo {
	private String page_id;
	private String page_name;
	public ProdAgeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPage_id() {
		return page_id;
	}
	public void setPage_id(String page_id) {
		this.page_id = page_id;
	}
	public String getPage_name() {
		return page_name;
	}
	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}
	@Override
	public String toString() {
		return "ProdAgeVo [page_id=" + page_id + ", page_name=" + page_name + "]";
	}
	
	
}
