package kr.co.mypet.sitter.model;

import java.util.Date;

public class PetSitterVo {
	private String pst_id;
	private String pst_mem;
	private String pst_img;
	private String pst_text;
	private Date pst_date;
	private int pst_score;
	private int pst_view;
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
		return "PetSitterVo [pst_id=" + pst_id + ", pst_mem=" + pst_mem + ", pst_img=" + pst_img + ", pst_text="
				+ pst_text + ", pst_date=" + pst_date + ", pst_score=" + pst_score + ", pst_view=" + pst_view + "]";
	}
	
}
