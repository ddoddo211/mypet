package kr.co.mypet.insurance.model;

import java.util.Date;

public class MypetVo {
	
	private String myp_id;
	private String myp_mem;
	private String myp_petk;
	private Date myp_birth;
	private String myp_size;
	private String myp_sick;
	private String myp_img;
	private String myp_neu;
	private String myp_gender;
	
	
	@Override
	public String toString() {
		return "MypetVo [myp_id=" + myp_id + ", myp_mem=" + myp_mem + ", myp_petk=" + myp_petk + ", myp_birth="
				+ myp_birth + ", myp_size=" + myp_size + ", myp_sick=" + myp_sick + ", myp_img=" + myp_img
				+ ", myp_neu=" + myp_neu + ", myp_gender=" + myp_gender + "]";
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
	public String getMyp_size() {
		return myp_size;
	}
	public void setMyp_size(String myp_size) {
		this.myp_size = myp_size;
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
	
	

}
