package com.ddosirak.domain;

public class ItemRecipeVO {
	private String item_code;
	private String material_code;
	private int material_con;
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getMaterial_code() {
		return material_code;
	}
	public void setMaterial_code(String material_code) {
		this.material_code = material_code;
	}
	public int getMaterial_con() {
		return material_con;
	}
	public void setMaterial_con(int material_con) {
		this.material_con = material_con;
	}
	@Override
	public String toString() {
		return "ItemRecipeVO [item_code=" + item_code + ", material_code=" + material_code + ", material_con="
				+ material_con + "]";
	}
	
	
}
