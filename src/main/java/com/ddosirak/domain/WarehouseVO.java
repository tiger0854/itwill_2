package com.ddosirak.domain;

public class WarehouseVO {
	private String wh_code;
	private String wh_name;
	private String retail_code;
	private String wh_type;
	private Integer wh_size;
	private Integer minsize;
	private Integer maxsize;
	private String employee_name;
    
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	
	
	public Integer getWh_size() {
		return wh_size;
	}
	public void setWh_size(Integer wh_size) {
		this.wh_size = wh_size;
	}
	public Integer getMinsize() {
		return minsize;
	}
	public void setMinsize(Integer minsize) {
		this.minsize = minsize;
	}
	public Integer getMaxsize() {
		return maxsize;
	}
	public void setMaxsize(Integer maxsize) {
		this.maxsize = maxsize;
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
