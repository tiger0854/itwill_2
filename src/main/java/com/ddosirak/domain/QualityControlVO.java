package com.ddosirak.domain;

import java.sql.Date;

public class QualityControlVO {
	/** 품질현황 목록 출력 용 DTO **/
	private String inspection_number;
	private String wo_code;
	private String line_name; 
	private String line_code;
	private String item_name;
	private String item_code;
	private String employee_id;
	private int sQTY; // 수주수량
	private int pQTY; // 생산수량
	private int iQTY; // 검수수량
	private int total_error_QTY; // 불량수량
	private Date inspection_date;
	private String inspection_status;
	private String inspection_result;
	private String inspection_comment;
	
	public String getInspection_number() {
		return inspection_number;
	}
	public void setInspection_number(String inspection_number) {
		this.inspection_number = inspection_number;
	}
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
	public int getiQTY() {
		return iQTY;
	}
	public void setiQTY(int iQTY) {
		this.iQTY = iQTY;
	}
	public int getTotal_error_QTY() {
		return total_error_QTY;
	}
	public void setTotal_error_QTY(int total_error_QTY) {
		this.total_error_QTY = total_error_QTY;
	}
	public Date getInspection_date() {
		return inspection_date;
	}
	public void setInspection_date(Date inspection_date) {
		this.inspection_date = inspection_date;
	}
	public String getInspection_status() {
		return inspection_status;
	}
	public void setInspection_status(String inspection_status) {
		this.inspection_status = inspection_status;
	}
	public String getInspection_result() {
		return inspection_result;
	}
	public void setInspection_result(String inspection_result) {
		this.inspection_result = inspection_result;
	}
	public String getInspection_comment() {
		return inspection_comment;
	}
	public void setInspection_comment(String inspection_comment) {
		this.inspection_comment = inspection_comment;
	}
	
	@Override
	public String toString() {
		return "QualityControlVO [inspection_number=" + inspection_number + ", wo_code=" + wo_code + ", line_name="
				+ line_name + ", line_code=" + line_code + ", item_name=" + item_name + ", item_code=" + item_code
				+ ", employee_id=" + employee_id + ", sQTY=" + sQTY + ", pQTY=" + pQTY + ", iQTY=" + iQTY
				+ ", total_error_QTY=" + total_error_QTY + ", inspection_date=" + inspection_date
				+ ", inspection_status=" + inspection_status + ", inspection_result=" + inspection_result
				+ ", inspection_comment=" + inspection_comment + "]";
	}
	
	
	
	
	
	
	
	
}
