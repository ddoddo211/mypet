package kr.co.mypet.shopping.model;

public class CartVo {
	private String cart_id;
	private int cart_qty;
	private int cart_price;
	private String cart_prod;
	private String cart_mem;
	
	// 상품 프로필이미지
	private String prod_pimg;
	private int prod_price;
	private int prod_sprice;
	private String prod_name;
	
	
	//상품 옵션
	private String prodo_id;
	private String prodo_name;
	private String prodo_price;
	
	public CartVo() {
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

	public String getCart_prod() {
		return cart_prod;
	}

	public void setCart_prod(String cart_prod) {
		this.cart_prod = cart_prod;
	}

	public String getCart_mem() {
		return cart_mem;
	}

	public void setCart_mem(String cart_mem) {
		this.cart_mem = cart_mem;
	}
	

	
	// 상품꺼 좀 가져다 씀
	public String getProd_pimg() {
		return prod_pimg;
	}

	public void setProd_pimg(String prod_pimg) {
		this.prod_pimg = prod_pimg;
	}
	
	
	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	public int getProd_sprice() {
		return prod_sprice;
	}

	public void setProd_sprice(int prod_sprice) {
		this.prod_sprice = prod_sprice;
	}
	
	
	//상품 옵션 꺼
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

	public String getProdo_price() {
		return prodo_price;
	}

	public void setProdo_price(String prodo_price) {
		this.prodo_price = prodo_price;
	}

	@Override
	public String toString() {
		return "CartVo [cart_id=" + cart_id + ", cart_qty=" + cart_qty + ", cart_price=" + cart_price + ", cart_prod="
				+ cart_prod + ", cart_mem=" + cart_mem + ", prod_pimg=" + prod_pimg + ", prod_price=" + prod_price
				+ ", prod_sprice=" + prod_sprice + ", prod_name=" + prod_name + ", prodo_id=" + prodo_id
				+ ", prodo_name=" + prodo_name + ", prodo_price=" + prodo_price + "]";
	}
	

	
}
