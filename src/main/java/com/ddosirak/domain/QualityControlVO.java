package com.ddosirak.domain;

import java.sql.Date;

public class QualityControlVO {
	/** 품질현황 목록 출력 용 DTO **/
	private String wo_code; // 작업지시번호
	private String line_name; // 라인명
	private String line_code; // 라인코드
	private String item_name; // 품명
	private String item_code; // 품번코드
	private String employee_id; // 검수자
	private String employee_name; // 검수자
	private int oQTY; // 지시수량
	private int pQTY; // 생산수량
	private int total_error_QTY; // 불량수량
	private int total_QTY; // 총생산량
	private int error_rate; // 불량률
	private String error_status; // 처리상태
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
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public int getoQTY() {
		return oQTY;
	}
	public void setoQTY(int oQTY) {
		this.oQTY = oQTY;
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
				+ ", item_name=" + item_name + ", item_code=" + item_code + ", employee_id=" + employee_id
				+ ", employee_name=" + employee_name + ", oQTY=" + oQTY + ", pQTY=" + pQTY + ", total_error_QTY="
				+ total_error_QTY + ", total_QTY=" + total_QTY + ", error_rate=" + error_rate + ", error_status="
				+ error_status + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
