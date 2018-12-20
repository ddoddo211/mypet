package kr.co.mypet.common.model;

public class PetkindVo {
	
	private String petk_id;
	private String petk_name;
	private String petk_am;
	private String petk_size;
	
	// 펫 품종에서 AM_NAME가지고 오기 위해서 설정
	private String am_name;
	
	
	@Override
	public String toString() {
		return "PetkindVo [petk_id=" + petk_id + ", petk_name=" + petk_name + ", petk_am=" + petk_am + ", petk_size="
				+ petk_size + ", am_name=" + am_name + "]";
	}
	public String getAm_name() {
		return am_name;
	}
	public void setAm_name(String am_name) {
		this.am_name = am_name;
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
	
	

}
