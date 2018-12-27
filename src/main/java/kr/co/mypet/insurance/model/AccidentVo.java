package kr.co.mypet.insurance.model;

import java.util.Date;

public class AccidentVo {
	
	// 보험 청구할때 사고 추가하는 Vo

	private String accd_id;
	private Date accd_date;
	private String accd_addr;
	private String accd_text;
	private String accd_img;
	private String accd_recp;
	private String accd_stat;
	private String accd_res;
	private String accd_insp;
	private String accd_mem;
	private String accd_myp; 
	private String accd_ins;
	private String accd_act;
	
	@Override
	public String toString() {
		return "AccidentVo [accd_id=" + accd_id + ", accd_date=" + accd_date + ", accd_addr=" + accd_addr
				+ ", accd_text=" + accd_text + ", accd_img=" + accd_img + ", accd_recp=" + accd_recp + ", accd_stat="
				+ accd_stat + ", accd_res=" + accd_res + ", accd_insp=" + accd_insp + ", accd_mem=" + accd_mem
				+ ", accd_myp=" + accd_myp + ", accd_ins=" + accd_ins + ", accd_act=" + accd_act + "]";
	}
	
	
	public String getAccd_id() {
		return accd_id;
	}
	public void setAccd_id(String accd_id) {
		this.accd_id = accd_id;
	}
	public Date getAccd_date() {
		return accd_date;
	}
	public void setAccd_date(Date accd_date) {
		this.accd_date = accd_date;
	}
	public String getAccd_addr() {
		return accd_addr;
	}
	public void setAccd_addr(String accd_addr) {
		this.accd_addr = accd_addr;
	}
	public String getAccd_text() {
		return accd_text;
	}
	public void setAccd_text(String accd_text) {
		this.accd_text = accd_text;
	}
	public String getAccd_img() {
		return accd_img;
	}
	public void setAccd_img(String accd_img) {
		this.accd_img = accd_img;
	}
	public String getAccd_recp() {
		return accd_recp;
	}
	public void setAccd_recp(String accd_recp) {
		this.accd_recp = accd_recp;
	}
	public String getAccd_stat() {
		return accd_stat;
	}
	public void setAccd_stat(String accd_stat) {
		this.accd_stat = accd_stat;
	}
	public String getAccd_res() {
		return accd_res;
	}
	public void setAccd_res(String accd_res) {
		this.accd_res = accd_res;
	}
	public String getAccd_insp() {
		return accd_insp;
	}
	public void setAccd_insp(String accd_insp) {
		this.accd_insp = accd_insp;
	}
	public String getAccd_mem() {
		return accd_mem;
	}
	public void setAccd_mem(String accd_mem) {
		this.accd_mem = accd_mem;
	}
	public String getAccd_myp() {
		return accd_myp;
	}
	public void setAccd_myp(String accd_myp) {
		this.accd_myp = accd_myp;
	}
	public String getAccd_ins() {
		return accd_ins;
	}
	public void setAccd_ins(String accd_ins) {
		this.accd_ins = accd_ins;
	}
	public String getAccd_act() {
		return accd_act;
	}
	public void setAccd_act(String accd_act) {
		this.accd_act = accd_act;
	}
	

	
	

}
