package kr.co.mypet.shopping.model;

public class DivisionVo {
	private String dvs_id;
	private String dvs_name;
	private String dvs_parent;
	
	public DivisionVo() {
	}

	public String getDvs_id() {
		return dvs_id;
	}

	public void setDvs_id(String dvs_id) {
		this.dvs_id = dvs_id;
	}

	public String getDvs_name() {
		return dvs_name;
	}

	public void setDvs_name(String dvs_name) {
		this.dvs_name = dvs_name;
	}

	public String getDvs_parent() {
		return dvs_parent;
	}

	public void setDvs_parent(String dvs_parent) {
		this.dvs_parent = dvs_parent;
	}

	@Override
	public String toString() {
		return "DivisionVo [dvs_id=" + dvs_id + ", dvs_name=" + dvs_name + ", dvs_parent=" + dvs_parent + "]";
	}
	
	
}
