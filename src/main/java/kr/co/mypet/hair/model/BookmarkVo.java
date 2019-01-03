package kr.co.mypet.hair.model;

public class BookmarkVo {
	private String bmk_id;
	private String bmk_mem;
	private String bmk_has;
	private String bmk_fac;
	
	private String has_name;
	private String has_addr;
	private String has_addr2;
	private String has_img;
	
	
	
	public String getHas_img() {
		return has_img;
	}
	public void setHas_img(String has_img) {
		this.has_img = has_img;
	}
	public String getHas_name() {
		return has_name;
	}
	public void setHas_name(String has_name) {
		this.has_name = has_name;
	}
	public String getHas_addr() {
		return has_addr;
	}
	public void setHas_addr(String has_addr) {
		this.has_addr = has_addr;
	}
	public String getHas_addr2() {
		return has_addr2;
	}
	public void setHas_addr2(String has_addr2) {
		this.has_addr2 = has_addr2;
	}
	public String getBmk_id() {
		return bmk_id;
	}
	public void setBmk_id(String bmk_id) {
		this.bmk_id = bmk_id;
	}
	public String getBmk_mem() {
		return bmk_mem;
	}
	public void setBmk_mem(String bmk_mem) {
		this.bmk_mem = bmk_mem;
	}
	public String getBmk_has() {
		return bmk_has;
	}
	public void setBmk_has(String bmk_has) {
		this.bmk_has = bmk_has;
	}
	public String getBmk_fac() {
		return bmk_fac;
	}
	public void setBmk_fac(String bmk_fac) {
		this.bmk_fac = bmk_fac;
	}
	@Override
	public String toString() {
		return "BookmarkVo [bmk_id=" + bmk_id + ", bmk_mem=" + bmk_mem + ", bmk_has=" + bmk_has + ", bmk_fac=" + bmk_fac
				+ "]";
	}
	
	
	
	
}
