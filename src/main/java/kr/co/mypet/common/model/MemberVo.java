package kr.co.mypet.common.model;

public class MemberVo {
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_addr;
	private String mem_addr2;
	private String mem_hp;
	private int mem_exit;
	private int mem_admin;
	private int mem_sit;
	private int mem_shop;
	private int mem_hair;
	private int mem_point;
	private int mem_black;
	
	
	
	@Override
	public String toString() {
		return "MemberVo [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_name=" + mem_name + ", mem_addr="
				+ mem_addr + ", mem_addr2=" + mem_addr2 + ", mem_hp=" + mem_hp + ", mem_exit=" + mem_exit
				+ ", mem_admin=" + mem_admin + ", mem_sit=" + mem_sit + ", mem_shop=" + mem_shop + ", mem_hair="
				+ mem_hair + ", mem_point=" + mem_point + ", mem_black=" + mem_black + "]";
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public int getMem_exit() {
		return mem_exit;
	}
	public void setMem_exit(int mem_exit) {
		this.mem_exit = mem_exit;
	}
	public int getMem_admin() {
		return mem_admin;
	}
	public void setMem_admin(int mem_admin) {
		this.mem_admin = mem_admin;
	}
	public int getMem_sit() {
		return mem_sit;
	}
	public void setMem_sit(int mem_sit) {
		this.mem_sit = mem_sit;
	}
	public int getMem_shop() {
		return mem_shop;
	}
	public void setMem_shop(int mem_shop) {
		this.mem_shop = mem_shop;
	}
	public int getMem_hair() {
		return mem_hair;
	}
	public void setMem_hair(int mem_hair) {
		this.mem_hair = mem_hair;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public int getMem_black() {
		return mem_black;
	}
	public void setMem_black(int mem_black) {
		this.mem_black = mem_black;
	}
	
	
	
	
	
}
