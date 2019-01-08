package kr.co.mypet.shopping.model;

public class DeliveryAddrVo {
	private int daddr_chk;
	private String daddr_title;
	private String daddr_id;
	private String daddr_name;
	private String daddr_addr;
	private String daddr_addr2;
	private String daddr_tel;
	private String daddr_mem;

	public DeliveryAddrVo() {
	}
	
	public int getDaddr_chk() {
		return daddr_chk;
	}

	public void setDaddr_chk(int daddr_chk) {
		this.daddr_chk = daddr_chk;
	}

	public String getDaddr_id() {
		return daddr_id;
	}

	public void setDaddr_id(String daddr_id) {
		this.daddr_id = daddr_id;
	}

	public String getDaddr_name() {
		return daddr_name;
	}

	public void setDaddr_name(String daddr_name) {
		this.daddr_name = daddr_name;
	}

	public String getDaddr_addr() {
		return daddr_addr;
	}

	public void setDaddr_addr(String daddr_addr) {
		this.daddr_addr = daddr_addr;
	}
	public String getDaddr_addr2() {
		return daddr_addr2;
	}

	public void setDaddr_addr2(String daddr_addr2) {
		this.daddr_addr2 = daddr_addr2;
	}

	public String getDaddr_tel() {
		return daddr_tel;
	}

	public void setDaddr_tel(String daddr_tel) {
		this.daddr_tel = daddr_tel;
	}

	public String getDaddr_mem() {
		return daddr_mem;
	}

	public void setDaddr_mem(String daddr_mem) {
		this.daddr_mem = daddr_mem;
	}
	public String getDaddr_title() {
		return daddr_title;
	}

	public void setDaddr_title(String daddr_title) {
		this.daddr_title = daddr_title;
	}

	@Override
	public String toString() {
		return "DeliveryAddrVo [daddr_chk=" + daddr_chk + ", daddr_title=" + daddr_title + ", daddr_id=" + daddr_id
				+ ", daddr_name=" + daddr_name + ", daddr_addr=" + daddr_addr + ", daddr_addr2=" + daddr_addr2
				+ ", daddr_tel=" + daddr_tel + ", daddr_mem=" + daddr_mem + "]";
	}
	
}
