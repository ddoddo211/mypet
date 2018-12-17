package kr.co.mypet.hair.model;

public class ZipVo {
	private String zip_no;
	private String zip_high;
	private String zip_low;
	
	
	
	
	@Override
	public String toString() {
		return "ZipVo [zip_no=" + zip_no + ", zip_high=" + zip_high + ", zip_low=" + zip_low + "]";
	}
	public String getZip_no() {
		return zip_no;
	}
	public void setZip_no(String zip_no) {
		this.zip_no = zip_no;
	}
	public String getZip_high() {
		return zip_high;
	}
	public void setZip_high(String zip_high) {
		this.zip_high = zip_high;
	}
	public String getZip_low() {
		return zip_low;
	}
	public void setZip_low(String zip_low) {
		this.zip_low = zip_low;
	}
	
	
}
