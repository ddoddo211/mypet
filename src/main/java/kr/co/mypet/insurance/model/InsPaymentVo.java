package kr.co.mypet.insurance.model;

import java.util.Date;

public class InsPaymentVo {
	
	private String ipm_id;
	private String ipm_mem;
	private String ipm_ins;
	private Date ipm_date;
	private Date ipm_ndate;
	private String ipm_chk;
	private String ipm_nonpay;
	
	
	
	
	@Override
	public String toString() {
		return "InsPaymentVo [ipm_id=" + ipm_id + ", ipm_mem=" + ipm_mem + ", ipm_ins=" + ipm_ins + ", ipm_date="
				+ ipm_date + ", ipm_ndate=" + ipm_ndate + ", ipm_chk=" + ipm_chk + ", ipm_nonpay=" + ipm_nonpay + "]";
	}
	
	
	
	public String getIpm_id() {
		return ipm_id;
	}
	public void setIpm_id(String ipm_id) {
		this.ipm_id = ipm_id;
	}
	public String getIpm_mem() {
		return ipm_mem;
	}
	public void setIpm_mem(String ipm_mem) {
		this.ipm_mem = ipm_mem;
	}
	public String getIpm_ins() {
		return ipm_ins;
	}
	public void setIpm_ins(String ipm_ins) {
		this.ipm_ins = ipm_ins;
	}
	public Date getIpm_date() {
		return ipm_date;
	}
	public void setIpm_date(Date ipm_date) {
		this.ipm_date = ipm_date;
	}
	public Date getIpm_ndate() {
		return ipm_ndate;
	}
	public void setIpm_ndate(Date ipm_ndate) {
		this.ipm_ndate = ipm_ndate;
	}
	public String getIpm_chk() {
		return ipm_chk;
	}
	public void setIpm_chk(String ipm_chk) {
		this.ipm_chk = ipm_chk;
	}
	public String getIpm_nonpay() {
		return ipm_nonpay;
	}
	public void setIpm_nonpay(String ipm_nonpay) {
		this.ipm_nonpay = ipm_nonpay;
	}
	
	
	
	

}
