package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.persistance.ItemRecipeDAO;


@Service
public class ItemRecipeServiceImpl implements ItemRecipeService {

	@Inject
	ItemRecipeDAO dao;

	Logger logger = LoggerFactory.getLogger(ItemRecipeServiceImpl.class);
	
	//레시피 목록 호출
	@Override
	public List<ItemRecipeListVO> ItemRecipeList() {
		logger.debug("service : 레시피 목록 호출");
		return dao.ItemRecipeList();
	}

	//레시피 등록
	@Override
	public void insertItemRecipe(ItemRecipeVO vo, ItemRecipeUploadVO uvo) {
		logger.debug("service : 레시피 등록");
		for(int i=0;i<uvo.getItemRecipeUploadvo().size();i++) {
			ItemRecipeVO item = uvo.getItemRecipeUploadvo().get(i);  // i번째 요소 가져오기
		    item.setItem_code(vo.getItem_code());  // 값을 설정
		    uvo.getItemRecipeUploadvo().set(i, item);  // 변경된 값을 다시 설정
		    dao.insertItemRecipe(vo);
		}
	}

	@Override
	public ItemRecipeVO selectItemRecipe(String item_code) {
		logger.debug("service : 레시피 수정 파라미터");
		return dao.selectItemRecipe(item_code);
	}

	@Override
	public Integer updateItemRecipe(ItemRecipeVO vo) {
		logger.debug("service : 레시피 수정");
		return dao.updateItemRecipe(vo);
	}

	@Override
	public void deleteItemRecipe(String item_code) {
		logger.debug("service: 레시피 삭제");
		dao.deleteItemRecipe(item_code);
	}

	@Override
	public List<MaterialdetailVO> materialList(MaterialdetailVO vo) {
		logger.debug("service : 자재 목록 조회");
		logger.debug("자재 목록 : 검색");
		if (vo.getMaterial_code()==null&&vo.getMaterial_name()==null&&vo.getMaterial_type()==null) {
			logger.debug("자재 목록 : 전체");
			return dao.materialList();
		} else {
			logger.debug("자재 목록 : 검색");
			return dao.materialList(vo);
		}
	}

}
