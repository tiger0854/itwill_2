package com.ddosirak.domain;

import java.sql.Date;

public class CookAddVO {
//	perf_id int AI PK 
//	item_code varchar(30) 
//	item_name varchar(30) 
//	perf_gobd char(1) 
//	err_reason varchar(50) 
//	remark varchar(500) 
//	pfQTY int 
//	perf_date date 
//	wo_code varchar(30) 
//	unit varchar(45)
	
	private int cook_id;
	private String item_code;
	private String item_name;
	private String cerf_gobd;
	private String err_reason;
	private int cfQTY;
	private String co_code;
	private Date cerf_date;
	private String unit;
	private String material_code;
	private String material_name;
	private int employee_id;
	private String factory_code;
	private String line_code;
	private String line_name;
	private int coQTY;
	private int cpQTY;
	private String co_status;
	private Date delivery_date;
	private String co_date;
	private String co_time;
	
	
	public int getCook_id() {
		return cook_id;
	}
	public void setCook_id(int cook_id) {
		this.cook_id = cook_id;
	}
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
	public String getCerf_gobd() {
		return cerf_gobd;
	}
	public void setCerf_gobd(String cerf_gobd) {
		this.cerf_gobd = cerf_gobd;
	}
	public String getErr_reason() {
		return err_reason;
	}
	public void setErr_reason(String err_reason) {
		this.err_reason = err_reason;
	}
	public int getCfQTY() {
		return cfQTY;
	}
	public void setCfQTY(int cfQTY) {
		this.cfQTY = cfQTY;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public Date getCerf_date() {
		return cerf_date;
	}
	public void setCerf_date(Date cerf_date) {
		this.cerf_date = cerf_date;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getFactory_code() {
		return factory_code;
	}
	public void setFactory_code(String factory_code) {
		this.factory_code = factory_code;
	}
	public String getLine_code() {
		return line_code;
	}
	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
	public int getCoQTY() {
		return coQTY;
	}
	public void setCoQTY(int coQTY) {
		this.coQTY = coQTY;
	}
	public int getCpQTY() {
		return cpQTY;
	}
	public void setCpQTY(int cpQTY) {
		this.cpQTY = cpQTY;
	}
	public String getCo_status() {
		return co_status;
	}
	public void setCo_status(String co_status) {
		this.co_status = co_status;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getCo_date() {
		return co_date;
	}
	public void setCo_date(String co_date) {
		this.co_date = co_date;
	}
	public String getCo_time() {
		return co_time;
	}
	public void setCo_time(String co_time) {
		this.co_time = co_time;
	}

	
	
	
}
