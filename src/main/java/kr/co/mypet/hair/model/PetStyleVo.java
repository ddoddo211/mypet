package kr.co.mypet.hair.model;

public class PetStyleVo {
	private String pts_id;
	private String pts_name;
	private String pts_kind;
	private int pts_price;
	private String pts_has;
	private String pts_img;
	private String pts_del;
	
	
	
	public String getPts_del() {
		return pts_del;
	}
	public void setPts_del(String pts_del) {
		this.pts_del = pts_del;
	}
	public String getPts_id() {
		return pts_id;
	}
	public void setPts_id(String pts_id) {
		this.pts_id = pts_id;
	}
	public String getPts_name() {
		return pts_name;
	}
	public void setPts_name(String pts_name) {
		this.pts_name = pts_name;
	}
	public String getPts_kind() {
		return pts_kind;
	}
	public void setPts_kind(String pts_kind) {
		this.pts_kind = pts_kind;
	}
	public int getPts_price() {
		return pts_price;
	}
	public void setPts_price(int pts_price) {
		this.pts_price = pts_price;
	}
	public String getPts_has() {
		return pts_has;
	}
	public void setPts_has(String pts_has) {
		this.pts_has = pts_has;
	}
	public String getPts_img() {
		return pts_img;
	}
	public void setPts_img(String pts_img) {
		this.pts_img = pts_img;
	}
	@Override
	public String toString() {
		return "PetStyleVo [pts_id=" + pts_id + ", pts_name=" + pts_name + ", pts_kind=" + pts_kind + ", pts_price="
				+ pts_price + ", pts_has=" + pts_has + ", pts_img=" + pts_img + "]";
	}
	
	
	
	

}
