package kr.co.mypet.sitter.model;

import java.util.Date;

public class PetSitterVo {
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

	@Override
	public String toString() {
		return "PetSitterVo [pst_id=" + pst_id + ", pst_mem=" + pst_mem + ", pst_img=" + pst_img + ", pst_title="
				+ pst_title + ", pst_text=" + pst_text + ", pst_date=" + pst_date + ", pst_score=" + pst_score
				+ ", pst_view=" + pst_view + ", pst_price1=" + pst_price1 + ", pst_price2=" + pst_price2
				+ ", pst_cidate=" + pst_cidate + ", pst_codate=" + pst_codate + "]";
	}

}
