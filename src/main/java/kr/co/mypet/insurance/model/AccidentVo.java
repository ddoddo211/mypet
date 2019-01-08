package kr.co.mypet.insurance.model;

import java.util.Date;

/**
 * @author Yumint
 *
 */
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
	private Date accd_pay;
	
	// 보험청구대상 부분에 나와야 하기 때문에 설정
	private String myp_name;
	private String insp_name;
	
	// 계좌번호 나와야 하기떄문에 설정
	private String act_id;
	private String act_bank;
	private String act_num;
	private String act_name;
	private String act_mem;
	
	// 보험금 확인내역 부분에 나와야 하기 때문에 설정
	private String myp_id;
	private String myp_mem;
	private String myp_petk;
	private Date myp_birth;
	private String myp_sick;
	private String myp_img;
	private String myp_neu;
	private String myp_gender;
	
	private String insp_kind;
	
	// 관리자용에서 보험금 청구 관리 화면에 나와야 하기 때문에 설정
	private String mem_name; 
	
	@Override
	public String toString() {
		return "AccidentVo [accd_id=" + accd_id + ", accd_date=" + accd_date + ", accd_addr=" + accd_addr
				+ ", accd_text=" + accd_text + ", accd_img=" + accd_img + ", accd_recp=" + accd_recp + ", accd_stat="
				+ accd_stat + ", accd_res=" + accd_res + ", accd_insp=" + accd_insp + ", accd_mem=" + accd_mem
				+ ", accd_myp=" + accd_myp + ", accd_ins=" + accd_ins + ", accd_act=" + accd_act + ", accd_pay="
				+ accd_pay + ", myp_name=" + myp_name + ", insp_name=" + insp_name + ", act_id=" + act_id
				+ ", act_bank=" + act_bank + ", act_num=" + act_num + ", act_name=" + act_name + ", act_mem=" + act_mem
				+ ", myp_id=" + myp_id + ", myp_mem=" + myp_mem + ", myp_petk=" + myp_petk + ", myp_birth=" + myp_birth
				+ ", myp_sick=" + myp_sick + ", myp_img=" + myp_img + ", myp_neu=" + myp_neu + ", myp_gender="
				+ myp_gender + ", insp_kind=" + insp_kind + ", mem_name=" + mem_name + "]";
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getInsp_kind() {
		return insp_kind;
	}
	public void setInsp_kind(String insp_kind) {
		this.insp_kind = insp_kind;
	}
	public String getMyp_id() {
		return myp_id;
	}
	public void setMyp_id(String myp_id) {
		this.myp_id = myp_id;
	}
	public String getMyp_mem() {
		return myp_mem;
	}
	public void setMyp_mem(String myp_mem) {
		this.myp_mem = myp_mem;
	}
	public String getMyp_petk() {
		return myp_petk;
	}
	public void setMyp_petk(String myp_petk) {
		this.myp_petk = myp_petk;
	}
	public Date getMyp_birth() {
		return myp_birth;
	}
	public void setMyp_birth(Date myp_birth) {
		this.myp_birth = myp_birth;
	}
	public String getMyp_sick() {
		return myp_sick;
	}
	public void setMyp_sick(String myp_sick) {
		this.myp_sick = myp_sick;
	}
	public String getMyp_img() {
		return myp_img;
	}
	public void setMyp_img(String myp_img) {
		this.myp_img = myp_img;
	}
	public String getMyp_neu() {
		return myp_neu;
	}
	public void setMyp_neu(String myp_neu) {
		this.myp_neu = myp_neu;
	}
	public String getMyp_gender() {
		return myp_gender;
	}
	public void setMyp_gender(String myp_gender) {
		this.myp_gender = myp_gender;
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
	public Date getAccd_pay() {
		return accd_pay;
	}
	public void setAccd_pay(Date accd_pay) {
		this.accd_pay = accd_pay;
	}
	public String getMyp_name() {
		return myp_name;
	}
	public void setMyp_name(String myp_name) {
		this.myp_name = myp_name;
	}
	public String getInsp_name() {
		return insp_name;
	}
	public void setInsp_name(String insp_name) {
		this.insp_name = insp_name;
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
