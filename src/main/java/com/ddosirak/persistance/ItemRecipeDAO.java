package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;

public interface ItemRecipeDAO {
	
	//아이템 코드 출력
	public List<ItemdetailVO> ItemdetailList() throws Exception;
	
	//레시피 목록 출력
	public List<ItemRecipeListVO> ItemRecipeList() throws Exception;
	
	//레시피 등록
	public Integer insertItemRecipe(ItemRecipeVO vo) throws Exception;
	
	//등록 및 수정
	public Integer insertOrUpdateItemRecipe(ItemRecipeVO vo) throws Exception;
	
	//레시피 수정
	public List<ItemRecipeVO> selectItemRecipe(String item_code) throws Exception;
	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception;
	
	//레시피 삭제
	public void deleteItemRecipe(String item_code) throws Exception;
	
	// 상품목록 검색
	public List<MaterialdetailVO> materialList() throws Exception;
	public List<MaterialdetailVO> materialList(MaterialdetailVO vo) throws Exception;
}
