package kr.co.mypet.sitter.model;

import java.util.Date;

public class SitterRevVo {
	
	private String stv_id;
	private String stv_text;
	private Date stv_date;
	private String stv_pst;
	private String stv_mem;
	public String getStv_id() {
		return stv_id;
	}
	public void setStv_id(String stv_id) {
		this.stv_id = stv_id;
	}
	public String getStv_text() {
		return stv_text;
	}
	public void setStv_text(String stv_text) {
		this.stv_text = stv_text;
	}
	public Date getStv_date() {
		return stv_date;
	}
	public void setStv_date(Date stv_date) {
		this.stv_date = stv_date;
	}
	public String getStv_pst() {
		return stv_pst;
	}
	public void setStv_pst(String stv_pst) {
		this.stv_pst = stv_pst;
	}
	public String getStv_mem() {
		return stv_mem;
	}
	public void setStv_mem(String stv_mem) {
		this.stv_mem = stv_mem;
	}
	@Override
	public String toString() {
		return "SitterRevVo [stv_id=" + stv_id + ", stv_text=" + stv_text + ", stv_date=" + stv_date + ", stv_pst="
				+ stv_pst + ", stv_mem=" + stv_mem + "]";
	}
	
	
}
