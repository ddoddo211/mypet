package kr.co.mypet.shopping.model;

public class BdetailVo {
	private String bd_id;
	private String bd_brand;
	private String bd_proddv;
	
	
	public BdetailVo() {
	}
	public String getBd_id() {
		return bd_id;
	}
	public void setBd_id(String bd_id) {
		this.bd_id = bd_id;
	}
	public String getBd_brand() {
		return bd_brand;
	}
	public void setBd_brand(String bd_brand) {
		this.bd_brand = bd_brand;
	}
	public String getBd_proddv() {
		return bd_proddv;
	}
	public void setBd_proddv(String bd_proddv) {
		this.bd_proddv = bd_proddv;
	}
	@Override
	public String toString() {
		return "BdetailVo [bd_id=" + bd_id + ", bd_brand=" + bd_brand + ", bd_proddv=" + bd_proddv + "]";
	}
	
}
