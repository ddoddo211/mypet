package kr.co.mypet.shopping.model;

public class ProdVo {
	private String prod_id;
	private String prod_name;
	private int prod_price;
	private int prod_sprice;
	private String prod_bd;
	private int prod_qty;
	private String prod_pimg;
	private String prod_img;
	private String prod_page;
	private String prod_date;
	private String prod_size;
	private String prod_mem;
	
	public ProdVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_sprice() {
		return prod_sprice;
	}
	public void setProd_sprice(int prod_sprice) {
		this.prod_sprice = prod_sprice;
	}
	public String getProd_bd() {
		return prod_bd;
	}
	public void setProd_bd(String prod_bd) {
		this.prod_bd = prod_bd;
	}
	public int getProd_qty() {
		return prod_qty;
	}
	public void setProd_qty(int prod_qty) {
		this.prod_qty = prod_qty;
	}
	public String getProd_pimg() {
		return prod_pimg;
	}
	public void setProd_pimg(String prod_pimg) {
		this.prod_pimg = prod_pimg;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_page() {
		return prod_page;
	}
	public void setProd_page(String prod_page) {
		this.prod_page = prod_page;
	}
	public String getProd_date() {
		return prod_date;
	}
	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}
	public String getProd_size() {
		return prod_size;
	}
	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}
	public String getProd_mem() {
		return prod_mem;
	}
	public void setProd_mem(String prod_mem) {
		this.prod_mem = prod_mem;
	}
	@Override
	public String toString() {
		return "ProdVo [prod_id=" + prod_id + ", prod_name=" + prod_name + ", prod_price=" + prod_price
				+ ", prod_sprice=" + prod_sprice + ", prod_bd=" + prod_bd + ", prod_qty=" + prod_qty + ", prod_pimg="
				+ prod_pimg + ", prod_img=" + prod_img + ", prod_page=" + prod_page + ", prod_date=" + prod_date
				+ ", prod_size=" + prod_size + ", prod_mem=" + prod_mem + "]";
	}
	
}
