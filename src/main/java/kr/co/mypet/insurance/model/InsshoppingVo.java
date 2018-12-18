package kr.co.mypet.insurance.model;

import java.util.Date;

public class InsshoppingVo {

	// 플랜정보 화면
	private String inssp_id;
	private String inssp_mem;
	private String inssp_insp;
	

	// 펫정보 
	private String myp_id;
	private String myp_mem;
	private String myp_petk;
	private Date myp_birth;
	private String myp_sick;
	private String myp_img;
	private String myp_neu;
	private String myp_gender;
	private String myp_name;
	
	
	// 회원이 추가한 보험장바구니 정보 
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
		return "InsshoppingVo [inssp_id=" + inssp_id + ", inssp_mem=" + inssp_mem + ", inssp_insp=" + inssp_insp
				+ ", myp_id=" + myp_id + ", myp_mem=" + myp_mem + ", myp_petk=" + myp_petk + ", myp_birth=" + myp_birth
				+ ", myp_sick=" + myp_sick + ", myp_img=" + myp_img + ", myp_neu=" + myp_neu + ", myp_gender="
				+ myp_gender + ", myp_name=" + myp_name + ", insp_id=" + insp_id + ", insp_name=" + insp_name
				+ ", insp_join=" + insp_join + ", insp_kind=" + insp_kind + ", insp_fees=" + insp_fees
				+ ", insp_maxins=" + insp_maxins + ", insp_minage=" + insp_minage + ", insp_maxage=" + insp_maxage
				+ ", insp_period=" + insp_period + ", insp_sick=" + insp_sick + ", insp_img=" + insp_img
				+ ", insp_text=" + insp_text + ", insp_insimg=" + insp_insimg + ", insp_instext=" + insp_instext
				+ ", insp_joinimg=" + insp_joinimg + ", insp_jointext=" + insp_jointext + ", insp_reqimg=" + insp_reqimg
				+ ", insp_reqtext=" + insp_reqtext + ", insp_del=" + insp_del + "]";
	}




	public String getMyp_name() {
		return myp_name;
	}




	public void setMyp_name(String myp_name) {
		this.myp_name = myp_name;
	}




	public String getInssp_id() {
		return inssp_id;
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
	public void setInssp_id(String inssp_id) {
		this.inssp_id = inssp_id;
	}
	public String getInssp_mem() {
		return inssp_mem;
	}
	public void setInssp_mem(String inssp_mem) {
		this.inssp_mem = inssp_mem;
	}
	public String getInssp_insp() {
		return inssp_insp;
	}
	public void setInssp_insp(String inssp_insp) {
		this.inssp_insp = inssp_insp;
	}
	
	
	
}
