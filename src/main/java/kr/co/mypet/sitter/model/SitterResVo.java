package kr.co.mypet.sitter.model;

import java.util.Date;

public class SitterResVo {
	private String str_id;
	private Date sta_date;
	private String str_spec;
	private int str_price;
	private int str_time;
	private int str_atime;
	private int str_arr;
	private String str_pst;
	private String str_mem;
	private String str_myp;
	public String getStr_id() {
		return str_id;
	}
	public void setStr_id(String str_id) {
		this.str_id = str_id;
	}
	public Date getSta_date() {
		return sta_date;
	}
	public void setSta_date(Date sta_date) {
		this.sta_date = sta_date;
	}
	public String getStr_spec() {
		return str_spec;
	}
	public void setStr_spec(String str_spec) {
		this.str_spec = str_spec;
	}
	public int getStr_price() {
		return str_price;
	}
	public void setStr_price(int str_price) {
		this.str_price = str_price;
	}
	public int getStr_time() {
		return str_time;
	}
	public void setStr_time(int str_time) {
		this.str_time = str_time;
	}
	public int getStr_atime() {
		return str_atime;
	}
	public void setStr_atime(int str_atime) {
		this.str_atime = str_atime;
	}
	public int getStr_arr() {
		return str_arr;
	}
	public void setStr_arr(int str_arr) {
		this.str_arr = str_arr;
	}
	public String getStr_pst() {
		return str_pst;
	}
	public void setStr_pst(String str_pst) {
		this.str_pst = str_pst;
	}
	public String getStr_mem() {
		return str_mem;
	}
	public void setStr_mem(String str_mem) {
		this.str_mem = str_mem;
	}
	public String getStr_myp() {
		return str_myp;
	}
	public void setStr_myp(String str_myp) {
		this.str_myp = str_myp;
	}
	
	@Override
	public String toString() {
		return "SitterResVo [str_id=" + str_id + ", sta_date=" + sta_date + ", str_spec=" + str_spec + ", str_price="
				+ str_price + ", str_time=" + str_time + ", str_atime=" + str_atime + ", str_arr=" + str_arr
				+ ", str_pst=" + str_pst + ", str_mem=" + str_mem + ", str_myp=" + str_myp + "]";
	}
	
	
}
