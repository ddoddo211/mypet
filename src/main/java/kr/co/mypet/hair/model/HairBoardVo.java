package kr.co.mypet.hair.model;

import java.util.Date;

public class HairBoardVo {
	private String hbrd_id;
	private String hbrd_title;
	private String hbrd_text;
	private int hbrd_gn;
	private Date hbrd_date;
	private String hbrd_pid;
	private String hbrd_has;
	private String hbrd_mem;
	private String hbrd_brdt;
	private String hbrd_fac;
	public String getHbrd_id() {
		return hbrd_id;
	}
	public void setHbrd_id(String hbrd_id) {
		this.hbrd_id = hbrd_id;
	}
	public String getHbrd_title() {
		return hbrd_title;
	}
	public void setHbrd_title(String hbrd_title) {
		this.hbrd_title = hbrd_title;
	}
	public String getHbrd_text() {
		return hbrd_text;
	}
	public void setHbrd_text(String hbrd_text) {
		this.hbrd_text = hbrd_text;
	}
	public int getHbrd_gn() {
		return hbrd_gn;
	}
	public void setHbrd_gn(int hbrd_gn) {
		this.hbrd_gn = hbrd_gn;
	}
	public Date getHbrd_date() {
		return hbrd_date;
	}
	public void setHbrd_date(Date hbrd_date) {
		this.hbrd_date = hbrd_date;
	}
	public String getHbrd_pid() {
		return hbrd_pid;
	}
	public void setHbrd_pid(String hbrd_pid) {
		this.hbrd_pid = hbrd_pid;
	}
	public String getHbrd_has() {
		return hbrd_has;
	}
	public void setHbrd_has(String hbrd_has) {
		this.hbrd_has = hbrd_has;
	}
	public String getHbrd_mem() {
		return hbrd_mem;
	}
	public void setHbrd_mem(String hbrd_mem) {
		this.hbrd_mem = hbrd_mem;
	}
	public String getHbrd_brdt() {
		return hbrd_brdt;
	}
	public void setHbrd_brdt(String hbrd_brdt) {
		this.hbrd_brdt = hbrd_brdt;
	}
	public String getHbrd_fac() {
		return hbrd_fac;
	}
	public void setHbrd_fac(String hbrd_fac) {
		this.hbrd_fac = hbrd_fac;
	}
	@Override
	public String toString() {
		return "HairBoardVo [hbrd_id=" + hbrd_id + ", hbrd_title=" + hbrd_title + ", hbrd_text=" + hbrd_text
				+ ", hbrd_gn=" + hbrd_gn + ", hbrd_date=" + hbrd_date + ", hbrd_pid=" + hbrd_pid + ", hbrd_has="
				+ hbrd_has + ", hbrd_mem=" + hbrd_mem + ", hbrd_brdt=" + hbrd_brdt + ", hbrd_fac=" + hbrd_fac + "]";
	}
	
	
	
	

}
