package kr.co.mypet.shopping.model;

public class ProddvVo {
	private String pdd_id;
	private String pdd_name;
	private String pdd_am;
	
	public ProddvVo() {
	}

	public String getPdd_id() {
		return pdd_id;
	}

	public void setPdd_id(String pdd_id) {
		this.pdd_id = pdd_id;
	}

	public String getPdd_name() {
		return pdd_name;
	}

	public void setPdd_name(String pdd_name) {
		this.pdd_name = pdd_name;
	}

	public String getPdd_am() {
		return pdd_am;
	}

	public void setPdd_am(String pdd_am) {
		this.pdd_am = pdd_am;
	}

	@Override
	public String toString() {
		return "ProddvVo [pdd_id=" + pdd_id + ", pdd_name=" + pdd_name + ", pdd_am=" + pdd_am + "]";
	}

	
}
