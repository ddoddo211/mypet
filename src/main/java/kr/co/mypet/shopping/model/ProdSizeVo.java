package kr.co.mypet.shopping.model;

public class ProdSizeVo {
	private String size_id;
	private String size_name;
	public ProdSizeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSize_id() {
		return size_id;
	}
	public void setSize_id(String size_id) {
		this.size_id = size_id;
	}
	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	@Override
	public String toString() {
		return "ProdSizeVo [size_id=" + size_id + ", size_name=" + size_name + "]";
	}
	
	
}
