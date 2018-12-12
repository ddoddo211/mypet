package kr.co.mypet.insurance.model;

import java.util.Date;

public class InsuranceVo {
	
	// 보험가입상품
	private String ins_id;
	private Date  ins_start;
	private Date  ins_end;
	private String ins_stat;
	private String ins_dis;
	private int ins_total;
	private String myp_id;
	private String mem_id;
	private String inssp_id;
	
	
	@Override
	public String toString() {
		return "InsuranceVo [ins_id=" + ins_id + ", ins_start=" + ins_start + ", ins_end=" + ins_end + ", ins_stat="
				+ ins_stat + ", ins_dis=" + ins_dis + ", ins_total=" + ins_total + ", myp_id=" + myp_id + ", mem_id="
				+ mem_id + ", inssp_id=" + inssp_id + "]";
	}
	
	
	public String getIns_id() {
		return ins_id;
	}
	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
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
	public int getIns_total() {
		return ins_total;
	}
	public void setIns_total(int ins_total) {
		this.ins_total = ins_total;
	}
	public String getMyp_id() {
		return myp_id;
	}
	public void setMyp_id(String myp_id) {
		this.myp_id = myp_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getInssp_id() {
		return inssp_id;
	}
	public void setInssp_id(String inssp_id) {
		this.inssp_id = inssp_id;
	}
	
	
	
	
	
	

}
