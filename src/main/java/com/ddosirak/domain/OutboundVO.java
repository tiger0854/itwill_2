package com.ddosirak.domain;

import java.sql.Date;

public class OutboundVO {

	private int out_id; // 출고아이디
	private String out_num; // 출고번호 
	private String customer_code; // 거래처 
	private int employee_id; // 사원번호
	private String item_code; // 상품코드 
	private String item_name; // 상품명
	private String out_notes; // 적요
	private String standard; // 규격
	private int out_qty; // 수량
	private int price; // 가격
	private String stock_code; // 재고코드
	private String factory_code; // 공장코드
	private int out_state; // 출고상태 default 1 (진행중)
	private Date due_date; // 납기일자
	private Date out_date; // 출고일자
	private Date create_date; // 작성일자

	

	public int getOut_id() {
		return out_id;
	}
	public void setOut_id(int out_id) {
		this.out_id = out_id;
	}
	public String getOut_num() {
		return out_num;
	}
	public void setOut_num(String out_num) {
		this.out_num = out_num;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
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
	public String getOut_notes() {
		return out_notes;
	}
	public void setOut_notes(String out_notes) {
		this.out_notes = out_notes;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public int getOut_qty() {
		return out_qty;
	}
	public void setOut_qty(int out_qty) {
		this.out_qty = out_qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStock_code() {
		return stock_code;
	}
	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}
	public String getFactory_code() {
		return factory_code;
	}
	public void setFactory_code(String factory_code) {
		this.factory_code = factory_code;
	}
	public int getOut_state() {
		return out_state;
	}
	public void setOut_state(int out_state) {
		this.out_state = out_state;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public Date getOut_date() {
		return out_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
	@Override
	public String toString() {
		return "OutboundVO [out_id=" + out_id + ", out_num=" + out_num + ", customer_code=" + customer_code
				+ ", employee_id=" + employee_id + ", item_code=" + item_code + ", item_name=" + item_name
				+ ", out_notes=" + out_notes + ", standard=" + standard + ", out_qty=" + out_qty + ", price=" + price
				+ ", stock_code=" + stock_code + ", factory_code=" + factory_code + ", out_state=" + out_state
				+ ", due_date=" + due_date + ", out_date=" + out_date + ", create_date=" + create_date +  "]";
	}
	
	
	
	
	
	
	
	
	
	
}
