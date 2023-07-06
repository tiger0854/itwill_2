package com.ddosirak.domain;

import java.sql.Date;

public class QualityControlVO {
	/** 품질현황 목록 출력 용 DTO **/
	private String wo_code;
	private String line_name; 
	private String line_code;
	private String item_name;
	private String item_code;
	private String employee_id;
	private int sQTY; // 수주수량
	private int pQTY; // 생산수량
	private int total_error_QTY; // 불량수량
	private int total_QTY;
	private int error_rate;
	private String error_status;
	
	public String getWo_code() {
		return wo_code;
	}
	public void setWo_code(String wo_code) {
		this.wo_code = wo_code;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
	public String getLine_code() {
		return line_code;
	}
	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public int getsQTY() {
		return sQTY;
	}
	public void setsQTY(int sQTY) {
		this.sQTY = sQTY;
	}
	public int getpQTY() {
		return pQTY;
	}
	public void setpQTY(int pQTY) {
		this.pQTY = pQTY;
	}
	public int getTotal_error_QTY() {
		return total_error_QTY;
	}
	public void setTotal_error_QTY(int total_error_QTY) {
		this.total_error_QTY = total_error_QTY;
	}
	public int getTotal_QTY() {
		return total_QTY;
	}
	public void setTotal_QTY(int total_QTY) {
		this.total_QTY = total_QTY;
	}
	public int getError_rate() {
		return error_rate;
	}
	public void setError_rate(int error_rate) {
		this.error_rate = error_rate;
	}
	public String getError_status() {
		return error_status;
	}
	public void setError_status(String error_status) {
		this.error_status = error_status;
	}
	@Override
	public String toString() {
		return "QualityControlVO [wo_code=" + wo_code + ", line_name=" + line_name + ", line_code=" + line_code
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", employee_id=" + employee_id + ", sQTY="
				+ sQTY + ", pQTY=" + pQTY + ", total_error_QTY=" + total_error_QTY + ", total_QTY=" + total_QTY
				+ ", error_rate=" + error_rate + ", error_status=" + error_status + "]";
	}
	
	
	
	
	
}
