package kr.co.mypet.sitter.model;

import java.util.Date;

public class SitterAppVo {
	private String sta_id;
	private String sta_mem;
	private String sta_text;
	private String sta_suc;
	private Date sta_date;
	private String sta_file;

	private String mem_name;

	private int rnum;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getSta_id() {
		return sta_id;
	}

	public void setSta_id(String sta_id) {
		this.sta_id = sta_id;
	}

	public String getSta_mem() {
		return sta_mem;
	}

	public void setSta_mem(String sta_mem) {
		this.sta_mem = sta_mem;
	}

	public String getSta_text() {
		return sta_text;
	}

	public void setSta_text(String sta_text) {
		this.sta_text = sta_text;
	}

	public String getSta_suc() {
		return sta_suc;
	}

	public void setSta_suc(String sta_suc) {
		this.sta_suc = sta_suc;
	}

	public Date getSta_date() {
		return sta_date;
	}

	public void setSta_date(Date sta_date) {
		this.sta_date = sta_date;
	}

	public String getSta_file() {
		return sta_file;
	}

	public void setSta_file(String sta_file) {
		this.sta_file = sta_file;
	}

	@Override
	public String toString() {
		return "SitterAppVo [sta_id=" + sta_id + ", sta_mem=" + sta_mem + ", sta_text=" + sta_text + ", sta_suc="
				+ sta_suc + ", sta_date=" + sta_date + ", sta_file=" + sta_file + ", mem_name=" + mem_name + ", rnum="
				+ rnum + "]";
	}

}
