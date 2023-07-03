package com.ddosirak.domain;

import java.sql.Date;

public class ReceiveVO {
	
	private int rec_id; // 수주아이디(PK용)
	private String re_code; // 수주 코드 
	private String item_code; // 품목 코드
	private String customer_code; // 거래처 코드
	private Date re_date; // 수주 날짜
	private int employee_id; // 담당자
	private int re_qty; // 수주 수량
	
	
	
	public int getRe_id() {
		return rec_id;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public String getRe_code() {
		return re_code;
	}
	public void setRe_code(String re_code) {
		this.re_code = re_code;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public int getRe_qty() {
		return re_qty;
	}
	public void setRe_qty(int re_qty) {
		this.re_qty = re_qty;
	}
	
	
	@Override
	public String toString() {
		return "ReceiveVO [rec_id=" + rec_id + ", re_code=" + re_code + ", item_code=" + item_code + ", customer_code="
				+ customer_code + ", re_date=" + re_date + ", employee_id=" + employee_id + ", re_qty=" + re_qty + "]";
	}
	
	
	
	
	
	

}
