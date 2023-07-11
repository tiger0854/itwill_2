package com.ddosirak.domain;

public class MaterialdetailVO {
	private String material_code;
    private String material_name;
    private String material_type;
    private String material_unit;
    private int tQTY;
    private String employee_name;
    
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
    
    
	public int gettQTY() {
		return tQTY;
	}
	public void settQTY(int tQTY) {
		this.tQTY = tQTY;
	}
	public String getMaterial_unit() {
		return material_unit;
	}
	public void setMaterial_unit(String material_unit) {
		this.material_unit = material_unit;
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
	public String getMaterial_type() {
		return material_type;
	}
	public void setMaterial_type(String material_type) {
		this.material_type = material_type;
	}
	@Override
	public String toString() {
		return "MaterialdetailVO [material_code=" + material_code + ", material_name=" + material_name
				+ ", material_type=" + material_type + "]";
	}
    
    
}
