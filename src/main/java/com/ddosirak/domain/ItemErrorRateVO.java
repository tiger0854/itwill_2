package com.ddosirak.domain;

public class ItemErrorRateVO {
	private String wo_code; 
	private String item_code;
	private int total_QTY;
	private int total_error_QTY;
	private int error_rate;
	public String getWo_code() {
		return wo_code;
	}
	public void setWo_code(String wo_code) {
		this.wo_code = wo_code;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public int getTotal_QTY() {
		return total_QTY;
	}
	public void setTotal_QTY(int total_QTY) {
		this.total_QTY = total_QTY;
	}
	public int getTotal_error_QTY() {
		return total_error_QTY;
	}
	public void setTotal_error_QTY(int total_error_QTY) {
		this.total_error_QTY = total_error_QTY;
	}
	public int getError_rate() {
		return error_rate;
	}
	public void setError_rate(int error_rate) {
		this.error_rate = error_rate;
	}
	@Override
	public String toString() {
		return "ItemErrorRateVO [wo_code=" + wo_code + ", item_code=" + item_code + ", total_QTY=" + total_QTY
				+ ", total_error_QTY=" + total_error_QTY + ", error_rate=" + error_rate + "]";
	}
	
	
	
}
