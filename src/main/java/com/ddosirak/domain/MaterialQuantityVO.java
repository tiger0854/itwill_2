package com.ddosirak.domain;

import java.util.Arrays;

public class MaterialQuantityVO {
	
	  private String[] materialCodes;
	  private int[] materialQuantities;
	  
	  
	public String[] getMaterialCodes() {
		return materialCodes;
	}
	public void setMaterialCodes(String[] materialCodes) {
		this.materialCodes = materialCodes;
	}
	public int[] getMaterialQuantities() {
		return materialQuantities;
	}
	public void setMaterialQuantities(int[] materialQuantities) {
		this.materialQuantities = materialQuantities;
	}
	
	@Override
	public String toString() {
		return "MaterialQuantityVO [materialCodes=" + Arrays.toString(materialCodes) + ", materialQuantities="
				+ Arrays.toString(materialQuantities) + "]";
	}
	
	
	  
}
