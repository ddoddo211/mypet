package kr.co.mypet.shopping.model;

public class ProddvVo {
	private String pdd_id;
	private String pdd_dvs;
	private String pdd_prod;
	
	public ProddvVo() {
	}

	public String getPdd_id() {
		return pdd_id;
	}

	public void setPdd_id(String pdd_id) {
		this.pdd_id = pdd_id;
	}

	public String getPdd_dvs() {
		return pdd_dvs;
	}

	public void setPdd_dvs(String pdd_dvs) {
		this.pdd_dvs = pdd_dvs;
	}

	public String getPdd_prod() {
		return pdd_prod;
	}

	public void setPdd_prod(String pdd_prod) {
		this.pdd_prod = pdd_prod;
	}

	@Override
	public String toString() {
		return "ProddvVo [pdd_id=" + pdd_id + ", pdd_dvs=" + pdd_dvs + ", pdd_prod=" + pdd_prod + "]";
	}
	
}
