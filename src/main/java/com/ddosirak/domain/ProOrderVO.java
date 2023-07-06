package com.ddosirak.domain;

import java.sql.Date;

public class ProOrderVO {

//	  `wo_code` VARCHAR(30) NOT NULL,
//	  `so_code` VARCHAR(45) NULL,
//	  `employee_id` INT NULL,
//	  `factory_code` VARCHAR(45) NULL,
//	  `line_code` VARCHAR(45) NULL,
//	  `item_code` VARCHAR(45) NULL,
//	  `oQTY` INT NULL,
//	  `pQTY` INT NULL,
//	  `wo_status` VARCHAR(45) NULL,
//	  `wo_date` DATE NULL,
//	  `remark` VARCHAR(45) NULL,
//	delivery_date
//	ADD COLUMN `sQTY` INT NULL AFTER `delivery_date`;
	
	
	private String wo_code;
	private String so_code;
	private int employee_id;
	private String factory_code;
	private String line_code;
	private String item_code;
	private String oQTY; // 지시수량
	private String pQTY; // 생산수량
	private String wo_status;
	private Date wo_date;
	private String remark;
	private Date delivery_date;
	private int sQTY;
	private String item_name;
	private String line_name;
	public String getWo_code() {
		return wo_code;
	}
	public void setWo_code(String wo_code) {
		this.wo_code = wo_code;
	}
	public String getSo_code() {
		return so_code;
	}
	public void setSo_code(String so_code) {
		this.so_code = so_code;
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
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getoQTY() {
		return oQTY;
	}
	public void setoQTY(String oQTY) {
		this.oQTY = oQTY;
	}
	public String getpQTY() {
		return pQTY;
	}
	public void setpQTY(String pQTY) {
		this.pQTY = pQTY;
	}
	public String getWo_status() {
		return wo_status;
	}
	public void setWo_status(String wo_status) {
		this.wo_status = wo_status;
	}
	public Date getWo_date() {
		return wo_date;
	}
	public void setWo_date(Date wo_date) {
		this.wo_date = wo_date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public int getsQTY() {
		return sQTY;
	}
	public void setsQTY(int sQTY) {
		this.sQTY = sQTY;
	}
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	@Override
	public String toString() {
		return "ProOrderVO [wo_code=" + wo_code + ", so_code=" + so_code + ", employee_id=" + employee_id
				+ ", factory_code=" + factory_code + ", line_code=" + line_code + ", item_code=" + item_code + ", oQTY="
				+ oQTY + ", pQTY=" + pQTY + ", wo_status=" + wo_status + ", wo_date=" + wo_date + ", remark=" + remark
				+ ", delivery_date=" + delivery_date + ", sQTY=" + sQTY + ", item_name=" + item_name + ", line_name="
				+ line_name + "]";
	}
	
	
	



	
	
	
}
