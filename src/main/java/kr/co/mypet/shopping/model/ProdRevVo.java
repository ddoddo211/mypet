package kr.co.mypet.shopping.model;

import java.util.Date;

public class ProdRevVo {
	private String prev_id;
	private String prev_title;
	private String prev_text;
	private String prev_prod;
	private String prev_mem;
	private Date prev_date;
	private String prev_num;
	
	public ProdRevVo() {
	}
	public String getPrev_id() {
		return prev_id;
	}
	public void setPrev_id(String prev_id) {
		this.prev_id = prev_id;
	}
	public String getPrev_title() {
		return prev_title;
	}
	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}
	public String getPrev_text() {
		return prev_text;
	}
	public void setPrev_text(String prev_text) {
		this.prev_text = prev_text;
	}
	public String getPrev_prod() {
		return prev_prod;
	}
	public void setPrev_prod(String prev_prod) {
		this.prev_prod = prev_prod;
	}
	public String getPrev_mem() {
		return prev_mem;
	}
	public void setPrev_mem(String prev_mem) {
		this.prev_mem = prev_mem;
	}
	public Date getPrev_date() {
		
		return prev_date;
	}
	public void setPrev_date(Date prev_date) {
		
		this.prev_date = prev_date;
	}
	
	public String getPrev_num() {
		return prev_num;
	}
	public void setPrev_num(String prev_num) {
		this.prev_num = prev_num;
	}
	
	@Override
	public String toString() {
		return "ProdRev [prev_id=" + prev_id + ", prev_title=" + prev_title + ", prev_text=" + prev_text 
				+ ", prev_prod=" + prev_prod + ", prev_mem=" + prev_mem + ", prev_date=" + prev_date + ", prev_num=" + prev_num + "]";
	}
	
	
	
	
}
