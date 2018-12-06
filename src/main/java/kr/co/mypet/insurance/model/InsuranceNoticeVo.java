package kr.co.mypet.insurance.model;

import java.util.Date;

public class InsuranceNoticeVo {
	
	
	private String inot_id;
	private String inot_title;
	private String inot_text;
	private Date inot_date;
	
	
	
	@Override
	public String toString() {
		return "InsuranceNoticeVo [inot_id=" + inot_id + ", inot_title=" + inot_title + ", inot_text=" + inot_text
				+ ", inot_date=" + inot_date + "]";
	}
	
	
	
	public String getInot_id() {
		return inot_id;
	}
	public void setInot_id(String inot_id) {
		this.inot_id = inot_id;
	}
	public String getInot_title() {
		return inot_title;
	}
	public void setInot_title(String inot_title) {
		this.inot_title = inot_title;
	}
	public String getInot_text() {
		return inot_text;
	}
	public void setInot_text(String inot_text) {
		this.inot_text = inot_text;
	}
	public Date getInot_date() {
		return inot_date;
	}
	public void setInot_date(Date inot_date) {
		this.inot_date = inot_date;
	}
	
	

}
