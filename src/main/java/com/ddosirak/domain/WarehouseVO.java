package com.ddosirak.domain;

public class WarehouseVO {
	private String wh_code;
	private String wh_name;
	private String retail_code;
	private String wh_type;
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public String getRetail_code() {
		return retail_code;
	}
	public void setRetail_code(String retail_code) {
		this.retail_code = retail_code;
	}
	public String getWh_type() {
		return wh_type;
	}
	public void setWh_type(String wh_type) {
		this.wh_type = wh_type;
	}
	@Override
	public String toString() {
		return "WarehouseVO [wh_code=" + wh_code + ", wh_name=" + wh_name + ", retail_code=" + retail_code
				+ ", wh_type=" + wh_type + "]";
	}
	
	
}
