package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface ItemRecipeDAO {

	// 아이템 코드 출력
	public List<ItemdetailVO> ItemdetailList() throws Exception;

	// 레시피 목록 출력
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO) throws Exception;
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception;

	// 레시피 등록
	public Integer insertItemRecipe(ItemRecipeVO vo) throws Exception;

	// 등록 및 수정
	public Integer insertOrUpdateItemRecipe(ItemRecipeVO vo) throws Exception;

	// 레시피 수정
	public List<ItemRecipeListVO> selectItemRecipe(String item_code) throws Exception;

	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception;

	// 레시피 삭제
	public void deleteItemRecipe(String item_code) throws Exception;

	// 레피시 개별 삭제
	public void deleteItemRecipeMaterial(ItemRecipeVO vo) throws Exception;

	// 상품목록 검색
	public List<MaterialdetailVO> materialListAll(Map<String, Object> materialMap) throws Exception;

	public List<MaterialdetailVO> materialListSearch(Map<String, Object> materialMap) throws Exception;
	
	
	public List<ItemRecipeListVO> itemrecipeItemList(PageVO pageVO) throws Exception; 
	public List<ItemRecipeListVO> itemrecipeItemList(Map<String, Object> instrSearch,PageVO pageVO) throws Exception; 


	// 레시피 검색 갯수
	public Integer itemrecipeCount(Map<String, Object> instrSearch);

	//대시보드
	public List<ItemdetailVO> itemCodeDis(int pageSize) throws Exception;
	public String getItemName(String item_code) throws Exception;
}
