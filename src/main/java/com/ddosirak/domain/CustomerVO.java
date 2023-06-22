package com.ddosirak.domain;

public class CustomerVO {
	private int customer_id;
	private String customer_code;
	private String customer_name;
	private int customer_stat;
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_code() {
		return customer_code;
	}
	public void setCustomer_code(String customer_code) {
		this.customer_code = customer_code;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getCustomer_stat() {
		return customer_stat;
	}
	public void setCustomer_stat(int customer_stat) {
		this.customer_stat = customer_stat;
	}
	
	@Override
	public String toString() {
		return "CustomerVO [customer_id=" + customer_id + ", customer_code=" + customer_code + ", customer_name="
				+ customer_name + ", customer_stat=" + customer_stat + "]";
	}
	
	
}
