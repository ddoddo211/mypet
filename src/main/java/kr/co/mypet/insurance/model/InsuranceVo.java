package kr.co.mypet.insurance.model;

import java.util.Date;

public class InsuranceVo {
	
	private String ins_id;
	private String ins_mem;
	private String ins_insp;
	private String ins_myp;
	private Date ins_start;
	private Date ins_end;
	private String ins_stat;
	private String ins_dis;
	private String ins_total;
	
	
	
	
	@Override
	public String toString() {
		return "InsuranceVo [ins_id=" + ins_id + ", ins_mem=" + ins_mem + ", ins_insp=" + ins_insp + ", ins_myp="
				+ ins_myp + ", ins_start=" + ins_start + ", ins_end=" + ins_end + ", ins_stat=" + ins_stat
				+ ", ins_dis=" + ins_dis + ", ins_total=" + ins_total + "]";
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
	
	

}
