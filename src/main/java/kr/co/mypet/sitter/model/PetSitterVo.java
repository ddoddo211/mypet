package kr.co.mypet.sitter.model;

import java.util.Date;

public class PetSitterVo {
	private int rnum;

	private String mem_name;
	private String mem_addr;
	private String mem_id;
	private String mem_img;
	private String mem_hp;

	private String pst_id;
	private String pst_mem;
	private String pst_img;
	private String pst_title;
	private String pst_text;
	private Date pst_date;
	private int pst_score;
	private int pst_view;
	private int pst_price1; // 데이케어 가격
	private int pst_price2; // 1박 가격
	private String pst_cidate; // 체크인 시간
	private String pst_codate; // 체크아웃 시간
	private String pst_chk; // 삭제여부

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

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}

	public String getPst_cidate() {
		return pst_cidate;
	}

	public void setPst_cidate(String pst_cidate) {
		this.pst_cidate = pst_cidate;
	}

	public String getPst_codate() {
		return pst_codate;
	}

	public void setPst_codate(String pst_codate) {
		this.pst_codate = pst_codate;
	}

	public String getPst_title() {
		return pst_title;
	}

	public void setPst_title(String pst_title) {
		this.pst_title = pst_title;
	}

	public int getPst_price1() {
		return pst_price1;
	}

	public void setPst_price1(int pst_price1) {
		this.pst_price1 = pst_price1;
	}

	public int getPst_price2() {
		return pst_price2;
	}

	public void setPst_price2(int pst_price2) {
		this.pst_price2 = pst_price2;
	}

	public String getPst_id() {
		return pst_id;
	}

	public void setPst_id(String pst_id) {
		this.pst_id = pst_id;
	}

	public String getPst_mem() {
		return pst_mem;
	}

	public void setPst_mem(String pst_mem) {
		this.pst_mem = pst_mem;
	}

	public String getPst_img() {
		return pst_img;
	}

	public void setPst_img(String pst_img) {
		this.pst_img = pst_img;
	}

	public String getPst_text() {
		return pst_text;
	}

	public void setPst_text(String pst_text) {
		this.pst_text = pst_text;
	}

	public Date getPst_date() {
		return pst_date;
	}

	public void setPst_date(Date pst_date) {
		this.pst_date = pst_date;
	}

	public int getPst_score() {
		return pst_score;
	}

	public void setPst_score(int pst_score) {
		this.pst_score = pst_score;
	}

	public int getPst_view() {
		return pst_view;
	}

	public void setPst_view(int pst_view) {
		this.pst_view = pst_view;
	}

	public String getPst_chk() {
		return pst_chk;
	}

	public void setPst_chk(String pst_chk) {
		this.pst_chk = pst_chk;
	}

	@Override
	public String toString() {
		return "PetSitterVo [rnum=" + rnum + ", mem_name=" + mem_name + ", mem_addr=" + mem_addr + ", mem_id=" + mem_id
				+ ", mem_img=" + mem_img + ", mem_hp=" + mem_hp + ", pst_id=" + pst_id + ", pst_mem=" + pst_mem
				+ ", pst_img=" + pst_img + ", pst_title=" + pst_title + ", pst_text=" + pst_text + ", pst_date="
				+ pst_date + ", pst_score=" + pst_score + ", pst_view=" + pst_view + ", pst_price1=" + pst_price1
				+ ", pst_price2=" + pst_price2 + ", pst_cidate=" + pst_cidate + ", pst_codate=" + pst_codate
				+ ", pst_chk=" + pst_chk + "]";
	}

}
