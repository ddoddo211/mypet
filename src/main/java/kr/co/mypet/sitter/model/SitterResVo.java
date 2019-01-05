package kr.co.mypet.sitter.model;

import java.util.Date;

public class SitterResVo {

	private String myp_name;

	private String mem_name;

	private String str_id;
	private Date str_date;
	private String str_spec;
	private int str_price;
	private int str_time;
	private int str_atime;
	private int str_arr;
	private String str_pst;
	private String str_mem;
	private String str_myp;
	private String str_pay;

	// 펫시터 집에 맡기기 용
	private String str_start;
	private String str_stop;

	public String getStr_start() {
		return str_start;
	}

	public void setStr_start(String str_start) {
		this.str_start = str_start;
	}

	public String getStr_stop() {
		return str_stop;
	}

	public void setStr_stop(String str_stop) {
		this.str_stop = str_stop;
	}

	public String getStr_pay() {
		return str_pay;
	}

	public void setStr_pay(String str_pay) {
		this.str_pay = str_pay;
	}

	public String getMyp_name() {
		return myp_name;
	}

	public void setMyp_name(String myp_name) {
		this.myp_name = myp_name;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getStr_id() {
		return str_id;
	}

	public void setStr_id(String str_id) {
		this.str_id = str_id;
	}

	public Date getStr_date() {
		return str_date;
	}

	public void setStr_date(Date str_date) {
		this.str_date = str_date;
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
		return "SitterResVo [myp_name=" + myp_name + ", mem_name=" + mem_name + ", str_id=" + str_id + ", str_date="
				+ str_date + ", str_spec=" + str_spec + ", str_price=" + str_price + ", str_time=" + str_time
				+ ", str_atime=" + str_atime + ", str_arr=" + str_arr + ", str_pst=" + str_pst + ", str_mem=" + str_mem
				+ ", str_myp=" + str_myp + ", str_pay=" + str_pay + ", str_start=" + str_start + ", str_stop="
				+ str_stop + "]";
	}

}
