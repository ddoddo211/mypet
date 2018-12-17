package kr.co.mypet.shopping.model;

public class AnimalVo {
	private String am_id;
	private String am_name;
	public AnimalVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getAm_id() {
		return am_id;
	}
	public void setAm_id(String am_id) {
		this.am_id = am_id;
	}
	public String getAm_name() {
		return am_name;
	}
	public void setAm_name(String am_name) {
		this.am_name = am_name;
	}
	@Override
	public String toString() {
		return "AnimalVo [am_id=" + am_id + ", am_name=" + am_name + "]";
	}
	
	
}
