package com.ddosirak.service;

import java.util.List;
import java.util.Map;


import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.MaterialdetailVO;

public interface ItemRecipeService {
	
	//레시피 목록 출력
	public List<ItemRecipeListVO> ItemRecipeList() throws Exception;
	
	//레시피 등록
	public void insertItemRecipe(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception;
	
	//레시피 수정
	public List<ItemRecipeVO> selectItemRecipe(String item_code) throws Exception;
	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception;
	
	//레시피 삭제
	public void deleteItemRecipe(String item_code) throws Exception;
	
	// 상품목록 검색
	public List<MaterialdetailVO> materialList(MaterialdetailVO vo) throws Exception;
}
