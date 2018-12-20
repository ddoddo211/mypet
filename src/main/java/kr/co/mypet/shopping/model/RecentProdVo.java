package kr.co.mypet.shopping.model;

public class RecentProdVo {
	private String recp_id;
	private String recp_mem;
	private String recp_prod;
	private String recp_date;
	
	public RecentProdVo() {
	}

	public String getRecp_id() {
		return recp_id;
	}

	public void setRecp_id(String recp_id) {
		this.recp_id = recp_id;
	}

	public String getRecp_mem() {
		return recp_mem;
	}

	public void setRecp_mem(String recp_mem) {
		this.recp_mem = recp_mem;
	}

	public String getRecp_prod() {
		return recp_prod;
	}

	public void setRecp_prod(String recp_prod) {
		this.recp_prod = recp_prod;
	}

	public String getRecp_date() {
		return recp_date;
	}

	public void setRecp_date(String recp_date) {
		this.recp_date = recp_date;
	}

	@Override
	public String toString() {
		return "RecentProdVo [recp_id=" + recp_id + ", recp_mem=" + recp_mem + ", recp_prod=" + recp_prod
				+ ", recp_date=" + recp_date + "]";
	}
	
	
}
