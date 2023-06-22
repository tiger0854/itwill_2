package com.ddosirak.domain;

public class ItemRecipeListVO {
	/** 레시피 목록 출력 용 DTO **/
	private String item_code;
	private String material_code;
	private int material_con;
	private String item_name;
	private String material_name;
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
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	@Override
	public String toString() {
		return "ItemRecipeListVO [item_code=" + item_code + ", material_code=" + material_code + ", material_con="
				+ material_con + ", item_name=" + item_name + ", material_name=" + material_name + "]";
	}
	
	
}
