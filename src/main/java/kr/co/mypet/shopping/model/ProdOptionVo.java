package kr.co.mypet.shopping.model;

public class ProdOptionVo {
	private String prodo_id;
	private String prodo_name;
	private int prodo_price;
	private int prodo_qty;
	private String prodo_prod;
	
	public ProdOptionVo() {
	}

	public String getProdo_id() {
		return prodo_id;
	}

	public void setProdo_id(String prodo_id) {
		this.prodo_id = prodo_id;
	}

	public String getProdo_name() {
		return prodo_name;
	}

	public void setProdo_name(String prodo_name) {
		this.prodo_name = prodo_name;
	}

	public int getProdo_price() {
		return prodo_price;
	}

	public void setProdo_price(int prodo_price) {
		this.prodo_price = prodo_price;
	}

	public int getProdo_qty() {
		return prodo_qty;
	}

	public void setProdo_qty(int prodo_qty) {
		this.prodo_qty = prodo_qty;
	}

	public String getProdo_prod() {
		return prodo_prod;
	}

	public void setProdo_prod(String prodo_prod) {
		this.prodo_prod = prodo_prod;
	}

	@Override
	public String toString() {
		return "ProdOptionVo [prodo_id=" + prodo_id + ", prodo_name=" + prodo_name + ", prodo_price=" + prodo_price
				+ ", prodo_qty=" + prodo_qty + ", prodo_prod=" + prodo_prod + "]";
	}
	
}
