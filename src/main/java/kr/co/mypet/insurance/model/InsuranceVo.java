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
	private String act_id;
	

	// 보상안내 부분에 나오기 위해서 설정
	private String petk_id;
	private String petk_name;
	private String petk_am;
	private String petk_size;
	private String myp_mem;
	private String myp_petk;
	private Date myp_birth;
	private String myp_sick;
	private String myp_img;
	private String myp_neu;
	private String myp_gender;
	private String myp_name;
	
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
	private String insp_del;
	

	@Override
	public String toString() {
		return "InsuranceVo [ins_id=" + ins_id + ", ins_start=" + ins_start + ", ins_end=" + ins_end + ", ins_stat="
				+ ins_stat + ", ins_dis=" + ins_dis + ", ins_total=" + ins_total + ", myp_id=" + myp_id + ", mem_id="
				+ mem_id + ", inssp_id=" + inssp_id + ", act_id=" + act_id + ", petk_id=" + petk_id + ", petk_name="
				+ petk_name + ", petk_am=" + petk_am + ", petk_size=" + petk_size + ", myp_mem=" + myp_mem
				+ ", myp_petk=" + myp_petk + ", myp_birth=" + myp_birth + ", myp_sick=" + myp_sick + ", myp_img="
				+ myp_img + ", myp_neu=" + myp_neu + ", myp_gender=" + myp_gender + ", myp_name=" + myp_name
				+ ", insp_id=" + insp_id + ", insp_name=" + insp_name + ", insp_join=" + insp_join + ", insp_kind="
				+ insp_kind + ", insp_fees=" + insp_fees + ", insp_maxins=" + insp_maxins + ", insp_minage="
				+ insp_minage + ", insp_maxage=" + insp_maxage + ", insp_period=" + insp_period + ", insp_sick="
				+ insp_sick + ", insp_del=" + insp_del + "]";
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









	public String getInsp_del() {
		return insp_del;
	}









	public void setInsp_del(String insp_del) {
		this.insp_del = insp_del;
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







	public String getMyp_name() {
		return myp_name;
	}







	public void setMyp_name(String myp_name) {
		this.myp_name = myp_name;
	}







	public String getPetk_id() {
		return petk_id;
	}




	public void setPetk_id(String petk_id) {
		this.petk_id = petk_id;
	}




	public String getPetk_name() {
		return petk_name;
	}




	public void setPetk_name(String petk_name) {
		this.petk_name = petk_name;
	}




	public String getPetk_am() {
		return petk_am;
	}




	public void setPetk_am(String petk_am) {
		this.petk_am = petk_am;
	}




	public String getPetk_size() {
		return petk_size;
	}




	public void setPetk_size(String petk_size) {
		this.petk_size = petk_size;
	}




	public String getInsp_kind() {
		return insp_kind;
	}


	public void setInsp_kind(String insp_kind) {
		this.insp_kind = insp_kind;
	}
	
	


	public String getAct_id() {
		return act_id;
	}


	public void setAct_id(String act_id) {
		this.act_id = act_id;
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
