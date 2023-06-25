package com.ddosirak.domain;

public class IntegrationCodeVO {
	
	private String item_code;
	private String item_name;
	private String material_code;
	private String material_name;
	private String cus_code;
	private String cus_name;
	private String wh_code;
	private String wh_name;
	
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
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
	public String getCus_code() {
		return cus_code;
	}
	public void setCus_code(String cus_code) {
		this.cus_code = cus_code;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
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
	
	@Override
	public String toString() {
		return "IntegrationCodeVO [item_code=" + item_code + ", item_name=" + item_name + ", material_code="
				+ material_code + ", material_name=" + material_name + ", cus_code=" + cus_code + ", cus_name="
				+ cus_name + ", wh_code=" + wh_code + ", wh_name=" + wh_name + "]";
	}
	
	
	
	
}
