package kr.co.mypet.sitter.model;

import java.util.Date;

public class SitterAppVo {
	private String sta_id;
	private String sta_mem;
	private String sta_text;
	private String sta_suc;
	private Date sta_date; // 지원날짜
	private String sta_file;
	private String sta_kind;
	private String sta_num;
	private String sta_pay; // 결재여부
	private String sta_price; // 결재금액

	private String mem_name;
	private String mem_hp;

	private int rnum;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getSta_kind() {
		return sta_kind;
	}

	public void setSta_kind(String sta_kind) {
		this.sta_kind = sta_kind;
	}

	public String getSta_num() {
		return sta_num;
	}

	public void setSta_num(String sta_num) {
		this.sta_num = sta_num;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
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

	public String getSta_pay() {
		return sta_pay;
	}

	public void setSta_pay(String sta_pay) {
		this.sta_pay = sta_pay;
	}

	public String getSta_price() {
		return sta_price;
	}

	public void setSta_price(String sta_price) {
		this.sta_price = sta_price;
	}

	@Override
	public String toString() {
		return "SitterAppVo [sta_id=" + sta_id + ", sta_mem=" + sta_mem + ", sta_text=" + sta_text + ", sta_suc="
				+ sta_suc + ", sta_date=" + sta_date + ", sta_file=" + sta_file + ", sta_kind=" + sta_kind
				+ ", sta_num=" + sta_num + ", sta_pay=" + sta_pay + ", sta_price=" + sta_price + ", mem_name="
				+ mem_name + ", mem_hp=" + mem_hp + ", rnum=" + rnum + "]";
	}

}
