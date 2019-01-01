package kr.co.mypet.sitter.model;

public class SitterAppVo {
	private String sta_id;
	private String sta_mem;
	private String sta_text;
	private String sta_suc;
	private String sta_num;
	private int sta_kind;
	
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
	public String getSta_num() {
		return sta_num;
	}
	public void setSta_num(String sta_num) {
		this.sta_num = sta_num;
	}
	public int getSta_kind() {
		return sta_kind;
	}
	public void setSta_kind(int sta_kind) {
		this.sta_kind = sta_kind;
	}
	@Override
	public String toString() {
		return "SitterAppVo [sta_id=" + sta_id + ", sta_mem=" + sta_mem + ", sta_text=" + sta_text + ", sta_suc="
				+ sta_suc + ", sta_num=" + sta_num + ", sta_kind=" + sta_kind + "]";
	}
	
	
}
