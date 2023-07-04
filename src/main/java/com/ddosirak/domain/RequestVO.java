package com.ddosirak.domain;

public class RequestVO {
	private int request_id;
	private String material_code;
	private String material_name;
	private int material_con;
	private int re_qty;
	private int state;
	public int getRequest_id() {
		return request_id;
	}
	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
	public String getMaterial_code() {
		return material_code;
	}
	public void setMaterial_code(String material_code) {
		this.material_code = material_code;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	public int getMaterial_con() {
		return material_con;
	}
	public void setMaterial_con(int material_con) {
		this.material_con = material_con;
	}
	public int getRe_qty() {
		return re_qty;
	}
	public void setRe_qty(int re_qty) {
		this.re_qty = re_qty;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	
}
