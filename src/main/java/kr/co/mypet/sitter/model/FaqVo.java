package kr.co.mypet.sitter.model;

import java.util.Date;

public class FaqVo {
	private String psf_id;
	private String psf_text;
	private String psf_name;
	private Date psf_date;
	private String psf_mem;
	public String getPsf_id() {
		return psf_id;
	}
	public void setPsf_id(String psf_id) {
		this.psf_id = psf_id;
	}
	public String getPsf_text() {
		return psf_text;
	}
	public void setPsf_text(String psf_text) {
		this.psf_text = psf_text;
	}
	public String getPsf_name() {
		return psf_name;
	}
	public void setPsf_name(String psf_name) {
		this.psf_name = psf_name;
	}
	public Date getPsf_date() {
		return psf_date;
	}
	public void setPsf_date(Date psf_date) {
		this.psf_date = psf_date;
	}
	public String getPsf_mem() {
		return psf_mem;
	}
	public void setPsf_mem(String psf_mem) {
		this.psf_mem = psf_mem;
	}
	
	@Override
	public String toString() {
		return "FaqVo [psf_id=" + psf_id + ", psf_text=" + psf_text + ", psf_name=" + psf_name + ", psf_date="
				+ psf_date + ", psf_mem=" + psf_mem + "]";
	}
	
	
}
