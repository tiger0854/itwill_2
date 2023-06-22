package com.ddosirak.domain;

import java.sql.Date;

public class MaterialsListVO {
	private String material_code;
	private int iQTY;
	private int rvQTY;
	private String wh_code;
	private String wh_name;
	private int in_Epiece;
	private int in_number;
	private Date in_Edate;
	
	public String getMaterial_code() {
		return material_code;
	}
	public void setMaterial_code(String material_code) {
		this.material_code = material_code;
	}
	public int getiQTY() {
		return iQTY;
	}
	public void setiQTY(int iQTY) {
		this.iQTY = iQTY;
	}
	public int getRvQTY() {
		return rvQTY;
	}
	public void setRvQTY(int rvQTY) {
		this.rvQTY = rvQTY;
	}
	public String getWh_code() {
		return wh_code;
	}
	public void setWh_code(String wh_code) {
		this.wh_code = wh_code;
	}
	public String getWh_name() {
		return wh_name;
	}
	public void setWh_name(String wh_name) {
		this.wh_name = wh_name;
	}
	public int getIn_Epiece() {
		return in_Epiece;
	}
	public void setIn_Epiece(int in_Epiece) {
		this.in_Epiece = in_Epiece;
	}
	public int getIn_number() {
		return in_number;
	}
	public void setIn_number(int in_number) {
		this.in_number = in_number;
	}
	public Date getIn_Edate() {
		return in_Edate;
	}
	public void setIn_Edate(Date in_Edate) {
		this.in_Edate = in_Edate;
	}
	
	@Override
	public String toString() {
		return "MaterialsListVO [material_code=" + material_code + ", iQTY=" + iQTY + ", rvQTY=" + rvQTY + ", wh_code="
				+ wh_code + ", wh_name=" + wh_name + ", in_Epiece=" + in_Epiece + ", in_number=" + in_number
				+ ", in_Edate=" + in_Edate + "]";
	}
	
	
	
	
	
	
    
    
}
