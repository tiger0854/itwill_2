package com.ddosirak.domain;

import java.sql.Date;

public class MaterialsVO {
	private String material_code; // 품목코드
	private String material_name; // 품목명
	private int tQTY; // 현재수량
	private int rvQTY; // 입고수량
	private int rvBOX; // 입고박스
	private Date rvDate; // 입고일자
	private Date expi_date; // 유통기한
	private String wh_code; // 창고코드
	private String wh_name; // 창고명
	private String wo_code; // 생산관리 코드
	private int employee_id; // 사원코드
	private String cus_code; // 업체코드
	private String cus_name; // 업체명
	private String remark; // 비고
	
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public int gettQTY() {
		return tQTY;
	}
	public int getRvBOX() {
		return rvBOX;
	}
	public void setRvBOX(int rvBOX) {
		this.rvBOX = rvBOX;
	}
	public void settQTY(int tQTY) {
		this.tQTY = tQTY;
	}
	public int getRvQTY() {
		return rvQTY;
	}
	public void setRvQTY(int rvQTY) {
		this.rvQTY = rvQTY;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public Date getExpi_date() {
		return expi_date;
	}
	public void setExpi_date(Date expi_date) {
		this.expi_date = expi_date;
	}
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getWo_code() {
		return wo_code;
	}
	public void setWo_code(String wo_code) {
		this.wo_code = wo_code;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public String getCus_code() {
		return cus_code;
	}
	public void setCus_code(String cus_code) {
		this.cus_code = cus_code;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	@Override
	public String toString() {
		return "MaterialsVO [material_code=" + material_code + ", material_name=" + material_name + ", tQTY=" + tQTY
				+ ", rvQTY=" + rvQTY + ", rvBOX=" + rvBOX + ", rvDate=" + rvDate + ", expi_date=" + expi_date
				+ ", wh_code=" + wh_code + ", wh_name=" + wh_name + ", wo_code=" + wo_code + ", employee_id="
				+ employee_id + ", cus_code=" + cus_code + ", cus_name=" + cus_name + ", remark=" + remark + "]";
	}
	
	
	
	
	
	
	
	
}
