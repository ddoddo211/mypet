package kr.co.mypet.common.model;

public class AccountVo {
	
	//계좌관리 테이블
	
	private String act_id;
	private String act_bank;
	private String act_num;
	private String act_name;
	private String act_mem;
	
	
	@Override
	public String toString() {
		return "AccountVo [act_id=" + act_id + ", act_bank=" + act_bank + ", act_num=" + act_num + ", act_name="
				+ act_name + ", act_mem=" + act_mem + "]";
	}
	public String getAct_id() {
		return act_id;
	}
	public void setAct_id(String act_id) {
		this.act_id = act_id;
	}
	public String getAct_bank() {
		return act_bank;
	}
	public void setAct_bank(String act_bank) {
		this.act_bank = act_bank;
	}
	public String getAct_num() {
		return act_num;
	}
	public void setAct_num(String act_num) {
		this.act_num = act_num;
	}
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public String getAct_mem() {
		return act_mem;
	}
	public void setAct_mem(String act_mem) {
		this.act_mem = act_mem;
	}
	
	

}
