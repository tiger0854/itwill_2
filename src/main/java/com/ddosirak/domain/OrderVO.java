package com.ddosirak.domain;

import java.sql.Date;

public class OrderVO {
	
	private int order_id;
    private String order_number;
    private String material_code;
    private String material_name;
    private int order_piece;
    private int material_price;
    private Date order_date;
    private Date pay_date;
    private String order_resp;
    private String order_trade;
    private int order_state;
   

	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
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
	
	public int getOrder_piece() {
		return order_piece;
	}
	public void setOrder_piece(int order_piece) {
		this.order_piece = order_piece;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getOrder_resp() {
		return order_resp;
	}
	public void setOrder_resp(String order_resp) {
		this.order_resp = order_resp;
	}
	public String getOrder_trade() {
		return order_trade;
	}
	public void setOrder_trade(String order_trade) {
		this.order_trade = order_trade;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	
	public int getMaterial_price() {
		return material_price;
	}
	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}
	
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", order_number=" + order_number + ", material_code=" + material_code
				+ ", material_name=" + material_name + ", order_piece=" + order_piece + ", material_price="
				+ material_price + ", order_date=" + order_date + ", pay_date=" + pay_date + ", order_resp="
				+ order_resp + ", order_trade=" + order_trade + ", order_state=" + order_state + "]";
	}
	
	
	
	
    	
	
    
}
