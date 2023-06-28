package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface ItemRecipeService {

	// 레시피 목록 출력
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO) throws Exception;

	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception;

	// 레시피 등록
	public void insertItemRecipe(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception;

	// 레시피 수정
	public List<ItemRecipeVO> selectItemRecipe(String item_code) throws Exception;

	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception;

	// 레시피 삭제
	public void deleteItemRecipe(String item_code) throws Exception;

	// 레피시 개별 삭제
	public void deleteItemRecipeMaterial(ItemRecipeVO vo) throws Exception;

	// 상품목록 검색
	public List<MaterialdetailVO> materialList(MaterialdetailVO vo) throws Exception;

	// 상품목록 검색
	public List<ItemRecipeListVO> itemrecipeItemList() throws Exception;
	public List<ItemRecipeListVO> itemrecipeItemList(Map<String, Object> instrSearch, Model model) throws Exception;

	// 레시피 검색 갯수
	public Integer itemrecipeCount(Map<String, Object> instrSearch) throws Exception;
}
