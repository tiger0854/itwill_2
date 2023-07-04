package com.ddosirak.domain;

import java.sql.Date;

public class CookVO {
//	  co_code VARCHAR(30) NOT NULL PRIMARY KEY,
//	  employee_id INT NOT NULL,
//	  factory_code VARCHAR(40) NOT NULL,
//	  line_code VARCHAR(40) NOT NULL,
//	  line_name VARCHAR(45),
//	  item_code VARCHAR(40) NOT NULL,
//	  item_name VARCHAR(45),
//	  coQTY INT NOT NULL,
//	  cpQTY INT NOT NULL,
//	  delivery_date DATE,
//	  co_status String NOT NULL,
//	  co_date DATE NOT NULL,
//	  co_time TIME
	
	private String co_code;
	private int employee_id;
	private String factory_code;
	private String line_code;
	private String line_name;
	private String item_code;
	private String item_name;
	private int coQTY;
	private int cpQTY;
	private String co_status;
	private Date delivery_date;
	private String co_date;
	private String co_time;
	private String material_code;
	private String material_name;
	private String so_code;
	private String material_con;
	
	
	
	public String getMaterial_con() {
		return material_con;
	}
	public void setMaterial_con(String material_con) {
		this.material_con = material_con;
	}
	public String getSo_code() {
		return so_code;
	}
	public void setSo_code(String so_code) {
		this.so_code = so_code;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
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
	@Override
	public String toString() {
		return "CookVO [co_code=" + co_code + ", employee_id=" + employee_id + ", factory_code=" + factory_code
				+ ", line_code=" + line_code + ", line_name=" + line_name + ", item_code=" + item_code + ", item_name="
				+ item_name + ", coQTY=" + coQTY + ", cpQTY=" + cpQTY + ", co_status=" + co_status + ", delivery_date="
				+ delivery_date + ", co_date=" + co_date + ", co_time=" + co_time + ", material_code=" + material_code
				+ ", material_name=" + material_name + ", so_code=" + so_code + "]";
	}

	

	
	
}
