package com.ddosirak.domain;

import java.sql.Date;

public class ProductionPerformanceVO {
	private String wo_code;
	private String so_code;
	private String factory_code;
	private String line_code;
	private String item_code;
	private int oQTY;
	private int pQTY;
	private int wo_status;
	private Date wo_date;
	private String remark;
	private int perf_id;
	private int err_code;
	private int iQTY;
	private char perf_gobd;
	private int pfQTY;
	private int employee_id;
	private Date perf_date;
	private String err_reason;
	private String item_name;
	private int item_price;
	private String unit;
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
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
	public int getWo_status() {
		return wo_status;
	}
	public void setWo_status(int wo_status) {
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
	public int getPerf_id() {
		return perf_id;
	}
	public void setPerf_id(int perf_id) {
		this.perf_id = perf_id;
	}
	public int getErr_code() {
		return err_code;
	}
	public void setErr_code(int err_code) {
		this.err_code = err_code;
	}
	public int getiQTY() {
		return iQTY;
	}
	public void setiQTY(int iQTY) {
		this.iQTY = iQTY;
	}
	public char getPerf_gobd() {
		return perf_gobd;
	}
	public void setPerf_gobd(char perf_gobd) {
		this.perf_gobd = perf_gobd;
	}
	public int getPfQTY() {
		return pfQTY;
	}
	public void setPfQTY(int pfQTY) {
		this.pfQTY = pfQTY;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getPerf_date() {
		return perf_date;
	}
	public void setPerf_date(Date perf_date) {
		this.perf_date = perf_date;
	}
	public String getErr_reason() {
		return err_reason;
	}
	public void setErr_reason(String err_reason) {
		this.err_reason = err_reason;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	
	@Override
	public String toString() {
		return "ProductionPerformanceVO [wo_code=" + wo_code + ", so_code=" + so_code + ", factory_code=" + factory_code
				+ ", line_code=" + line_code + ", item_code=" + item_code + ", oQTY=" + oQTY + ", pQTY=" + pQTY
				+ ", wo_status=" + wo_status + ", wo_date=" + wo_date + ", remark=" + remark + ", perf_id=" + perf_id
				+ ", err_code=" + err_code + ", iQTY=" + iQTY + ", perf_gobd=" + perf_gobd + ", pfQTY=" + pfQTY
				+ ", employee_id=" + employee_id + ", perf_date=" + perf_date + ", err_reason=" + err_reason
				+ ", item_name=" + item_name + ", item_price=" + item_price + ", unit=" + unit + "]";
	}
	
	
	
	
	
}
