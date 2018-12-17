package kr.co.mypet.shopping.model;

public class BrandVo {
	private String brd_id;
	private String brd_name;
	public BrandVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getBrd_id() {
		return brd_id;
	}
	public void setBrd_id(String brd_id) {
		this.brd_id = brd_id;
	}
	public String getBrd_name() {
		return brd_name;
	}
	public void setBrd_name(String brd_name) {
		this.brd_name = brd_name;
	}
	@Override
	public String toString() {
		return "BrandVo [brd_id=" + brd_id + ", brd_name=" + brd_name + "]";
	}
	
	
}
