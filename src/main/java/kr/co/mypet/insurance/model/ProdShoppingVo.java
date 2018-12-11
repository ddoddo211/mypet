package kr.co.mypet.insurance.model;

import java.util.Date;

public class ProdShoppingVo {
	
	// 장바구니 역할이 없어서 장바구니를 만들어줌(보험상품 Vo + 보험 Vo) 합친것

	private String ins_id;
	private String ins_mem;
	private String ins_insp;
	private String ins_myp;
	private Date ins_start;
	private Date ins_end;
	private String ins_stat;
	private String ins_dis;
	private String ins_total;
	
	private String insp_id;
	private String insp_name;
	private String insp_join;
	private String insp_kind;
	private int insp_fees;
	private int insp_maxins;
	private int insp_minage;
	private int insp_maxage;
	private int insp_period;
	private String insp_sick;
	private String insp_img;
	private String insp_text;
	private String insp_insimg;
	private String insp_instext;
	private String insp_joinimg;
	private String insp_jointext;
	private String insp_reqimg;
	private String insp_reqtext;
	private String insp_del;
	
	
	
	
	@Override
	public String toString() {
		return "prodShoppingVo [ins_id=" + ins_id + ", ins_mem=" + ins_mem + ", ins_insp=" + ins_insp + ", ins_myp="
				+ ins_myp + ", ins_start=" + ins_start + ", ins_end=" + ins_end + ", ins_stat=" + ins_stat
				+ ", ins_dis=" + ins_dis + ", ins_total=" + ins_total + ", insp_id=" + insp_id + ", insp_name="
				+ insp_name + ", insp_join=" + insp_join + ", insp_kind=" + insp_kind + ", insp_fees=" + insp_fees
				+ ", insp_maxins=" + insp_maxins + ", insp_minage=" + insp_minage + ", insp_maxage=" + insp_maxage
				+ ", insp_period=" + insp_period + ", insp_sick=" + insp_sick + ", insp_img=" + insp_img
				+ ", insp_text=" + insp_text + ", insp_insimg=" + insp_insimg + ", insp_instext=" + insp_instext
				+ ", insp_joinimg=" + insp_joinimg + ", insp_jointext=" + insp_jointext + ", insp_reqimg=" + insp_reqimg
				+ ", insp_reqtext=" + insp_reqtext + ", insp_del=" + insp_del + "]";
	}
	
	
	public String getIns_id() {
		return ins_id;
	}
	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
	}
	public String getIns_mem() {
		return ins_mem;
	}
	public void setIns_mem(String ins_mem) {
		this.ins_mem = ins_mem;
	}
	public String getIns_insp() {
		return ins_insp;
	}
	public void setIns_insp(String ins_insp) {
		this.ins_insp = ins_insp;
	}
	public String getIns_myp() {
		return ins_myp;
	}
	public void setIns_myp(String ins_myp) {
		this.ins_myp = ins_myp;
	}
	public Date getIns_start() {
		return ins_start;
	}
	public void setIns_start(Date ins_start) {
		this.ins_start = ins_start;
	}
	public Date getIns_end() {
		return ins_end;
	}
	public void setIns_end(Date ins_end) {
		this.ins_end = ins_end;
	}
	public String getIns_stat() {
		return ins_stat;
	}
	public void setIns_stat(String ins_stat) {
		this.ins_stat = ins_stat;
	}
	public String getIns_dis() {
		return ins_dis;
	}
	public void setIns_dis(String ins_dis) {
		this.ins_dis = ins_dis;
	}
	public String getIns_total() {
		return ins_total;
	}
	public void setIns_total(String ins_total) {
		this.ins_total = ins_total;
	}
	public String getInsp_id() {
		return insp_id;
	}
	public void setInsp_id(String insp_id) {
		this.insp_id = insp_id;
	}
	public String getInsp_name() {
		return insp_name;
	}
	public void setInsp_name(String insp_name) {
		this.insp_name = insp_name;
	}
	public String getInsp_join() {
		return insp_join;
	}
	public void setInsp_join(String insp_join) {
		this.insp_join = insp_join;
	}
	public String getInsp_kind() {
		return insp_kind;
	}
	public void setInsp_kind(String insp_kind) {
		this.insp_kind = insp_kind;
	}
	public int getInsp_fees() {
		return insp_fees;
	}
	public void setInsp_fees(int insp_fees) {
		this.insp_fees = insp_fees;
	}
	public int getInsp_maxins() {
		return insp_maxins;
	}
	public void setInsp_maxins(int insp_maxins) {
		this.insp_maxins = insp_maxins;
	}
	public int getInsp_minage() {
		return insp_minage;
	}
	public void setInsp_minage(int insp_minage) {
		this.insp_minage = insp_minage;
	}
	public int getInsp_maxage() {
		return insp_maxage;
	}
	public void setInsp_maxage(int insp_maxage) {
		this.insp_maxage = insp_maxage;
	}
	public int getInsp_period() {
		return insp_period;
	}
	public void setInsp_period(int insp_period) {
		this.insp_period = insp_period;
	}
	public String getInsp_sick() {
		return insp_sick;
	}
	public void setInsp_sick(String insp_sick) {
		this.insp_sick = insp_sick;
	}
	public String getInsp_img() {
		return insp_img;
	}
	public void setInsp_img(String insp_img) {
		this.insp_img = insp_img;
	}
	public String getInsp_text() {
		return insp_text;
	}
	public void setInsp_text(String insp_text) {
		this.insp_text = insp_text;
	}
	public String getInsp_insimg() {
		return insp_insimg;
	}
	public void setInsp_insimg(String insp_insimg) {
		this.insp_insimg = insp_insimg;
	}
	public String getInsp_instext() {
		return insp_instext;
	}
	public void setInsp_instext(String insp_instext) {
		this.insp_instext = insp_instext;
	}
	public String getInsp_joinimg() {
		return insp_joinimg;
	}
	public void setInsp_joinimg(String insp_joinimg) {
		this.insp_joinimg = insp_joinimg;
	}
	public String getInsp_jointext() {
		return insp_jointext;
	}
	public void setInsp_jointext(String insp_jointext) {
		this.insp_jointext = insp_jointext;
	}
	public String getInsp_reqimg() {
		return insp_reqimg;
	}
	public void setInsp_reqimg(String insp_reqimg) {
		this.insp_reqimg = insp_reqimg;
	}
	public String getInsp_reqtext() {
		return insp_reqtext;
	}
	public void setInsp_reqtext(String insp_reqtext) {
		this.insp_reqtext = insp_reqtext;
	}
	public String getInsp_del() {
		return insp_del;
	}
	public void setInsp_del(String insp_del) {
		this.insp_del = insp_del;
	}
	
	
}
