package kr.co.mypet.shopping.model;

public class ShopNoticeVo {
	private String snot_id;
	private String snot_title;
	private String snot_text;
	private String snot_date;
	private String snot_mem;
	private String snot_pimg;
	private String snot_img;
	private int snot_chk;
	
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

	public String getSnot_pimg() {
		return snot_pimg;
	}

	public void setSnot_pimg(String snot_pimg) {
		this.snot_pimg = snot_pimg;
	}

	public String getSnot_img() {
		return snot_img;
	}

	public void setSnot_img(String snot_img) {
		this.snot_img = snot_img;
	}

	public int getSnot_chk() {
		return snot_chk;
	}

	public void setSnot_chk(int snot_chk) {
		this.snot_chk = snot_chk;
	}

	@Override
	public String toString() {
		return "ShopNoticeVo [snot_id=" + snot_id + ", snot_title=" + snot_title + ", snot_text=" + snot_text
				+ ", snot_date=" + snot_date + ", snot_mem=" + snot_mem + ", snot_pimg=" + snot_pimg + ", snot_img="
				+ snot_img + ", snot_chk=" + snot_chk + "]";
	}

	
	

}
