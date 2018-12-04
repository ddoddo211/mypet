package kr.co.mypet.shopping.model;

public class ShopNoticeVo {
	private String snot_id;
	private String snot_title;
	private String snot_text;
	private String snot_date;
	private String snot_mem;
	private String snot_profile;
	
	public ShopNoticeVo() {
		
	}
	
	public String getSnot_id() {
		return snot_id;
	}
	public void setSnot_id(String snot_id) {
		this.snot_id = snot_id;
	}
	public String getSnot_title() {
		return snot_title;
	}
	public void setSnot_title(String snot_title) {
		this.snot_title = snot_title;
	}
	public String getSnot_text() {
		return snot_text;
	}
	public void setSnot_text(String snot_text) {
		this.snot_text = snot_text;
	}
	public String getSnot_date() {
		return snot_date;
	}
	public void setSnot_date(String snot_date) {
		this.snot_date = snot_date;
	}
	public String getSnot_mem() {
		return snot_mem;
	}
	public void setSnot_mem(String snot_mem) {
		this.snot_mem = snot_mem;
	}
	public String getSnot_profile() {
		return snot_profile;
	}
	public void setSnot_profile(String snot_profile) {
		this.snot_profile = snot_profile;
	}

	@Override
	public String toString() {
		return "ShopNoticeVo [snot_id=" + snot_id + ", snot_title=" + snot_title + ", snot_text=" + snot_text
				+ ", snot_date=" + snot_date + ", snot_mem=" + snot_mem + ", snot_profile=" + snot_profile + "]";
	}
	
	
	

}
