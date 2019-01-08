package kr.co.mypet.insurance.model;

public class InsProdVo {
	
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
		return "InsProdVo [insp_id=" + insp_id + ", insp_name=" + insp_name + ", insp_join=" + insp_join
				+ ", insp_kind=" + insp_kind + ", insp_fees=" + insp_fees + ", insp_maxins=" + insp_maxins
				+ ", insp_minage=" + insp_minage + ", insp_maxage=" + insp_maxage + ", insp_period=" + insp_period
				+ ", insp_sick=" + insp_sick + ", insp_del=" + insp_del + "]";
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

	public String getInsp_del() {
		return insp_del;
	}
	public void setInsp_del(String insp_del) {
		this.insp_del = insp_del;
	}
	

	
	
	
	

}
