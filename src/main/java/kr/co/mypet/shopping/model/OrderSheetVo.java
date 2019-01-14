package kr.co.mypet.shopping.model;

public class OrderSheetVo {
	private String ords_id;
	private int ords_qty;
	private String ords_stat;
	private String ords_mem;
	private String ords_prod;
	private String ords_daddr;
	private int ords_price;
	private String ords_date;
	private String ords_rea;
	
	//db로 prod 내용 받아올 변수
	private String prod_name;
	private String prod_pimg;
	
	public OrderSheetVo() {
	}

	public String getOrds_id() {
		return ords_id;
	}

	public void setOrds_id(String ords_id) {
		this.ords_id = ords_id;
	}

	public int getOrds_qty() {
		return ords_qty;
	}

	public void setOrds_qty(int ords_qty) {
		this.ords_qty = ords_qty;
	}

	public String getOrds_stat() {
		return ords_stat;
	}

	public void setOrds_stat(String ords_stat) {
		this.ords_stat = ords_stat;
	}

	public String getOrds_mem() {
		return ords_mem;
	}

	public void setOrds_mem(String ords_mem) {
		this.ords_mem = ords_mem;
	}

	public String getOrds_prod() {
		return ords_prod;
	}

	public void setOrds_prod(String ords_prod) {
		this.ords_prod = ords_prod;
	}

	public String getOrds_daddr() {
		return ords_daddr;
	}

	public void setOrds_daddr(String ords_daddr) {
		this.ords_daddr = ords_daddr;
	}

	public int getOrds_price() {
		return ords_price;
	}

	public void setOrds_price(int ords_price) {
		this.ords_price = ords_price;
	}

	public String getOrds_date() {
		return ords_date;
	}

	public void setOrds_date(String ords_date) {
		this.ords_date = ords_date;
	}
	
	public String getOrds_rea() {
		return ords_rea;
	}

	public void setOrds_rea(String ords_rea) {
		this.ords_rea = ords_rea;
	}

	
	
	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_pimg() {
		return prod_pimg;
	}

	public void setProd_pimg(String prod_pimg) {
		this.prod_pimg = prod_pimg;
	}

	@Override
	public String toString() {
		return "OrderSheetVo [ords_id=" + ords_id + ", ords_qty=" + ords_qty + ", ords_stat=" + ords_stat
				+ ", ords_mem=" + ords_mem + ", ords_prod=" + ords_prod + ", ords_daddr=" + ords_daddr + ", ords_price="
				+ ords_price + ", ords_date=" + ords_date + ", ords_rea=" + ords_rea + ", prod_name=" + prod_name
				+ ", prod_pimg=" + prod_pimg + "]";
	}


}
