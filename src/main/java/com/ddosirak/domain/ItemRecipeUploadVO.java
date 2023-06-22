package com.ddosirak.domain;

import java.util.List;

public class ItemRecipeUploadVO {
	private List<ItemRecipeVO> itemRecipeUploadvo;

	public List<ItemRecipeVO> getItemRecipeUploadvo() {
		return itemRecipeUploadvo;
	}

	public void setItemRecipeUploadvo(List<ItemRecipeVO> itemRecipeUploadvo) {
		this.itemRecipeUploadvo = itemRecipeUploadvo;
	}

	@Override
	public String toString() {
		return "ItemRecipeUploadVO [itemRecipeUploadvo=" + itemRecipeUploadvo + "]";
	}
	
}
