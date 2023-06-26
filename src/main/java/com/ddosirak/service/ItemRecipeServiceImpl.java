package com.ddosirak.service;

import java.util.Iterator;
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
	public List<ItemRecipeListVO> ItemRecipeList() throws Exception {
		logger.debug("service : 레시피 목록 호출");
		return dao.ItemRecipeList();
	}

	//레시피 등록
	@Override
	public void insertItemRecipe(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception {
		logger.debug("service : 레시피 등록");
		 List<ItemRecipeVO> itemRecipeUploadvo = uvo.getItemRecipeUploadvo(); // ItemRecipeUploadVO 객체에서 리스트를 가져옴
		 Iterator<ItemRecipeVO> iterator = itemRecipeUploadvo.iterator(); // Iterator 객체 생성

		    while (iterator.hasNext()) {
		        ItemRecipeVO item = iterator.next();
		        item.setItem_code(vo.getItem_code()); // 값을 설정
		        if (item.getMaterial_code() == null) {
		            iterator.remove(); // material_code가 null인 아이템 제거
		        } else {
		            dao.insertOrUpdateItemRecipe(item); // 변경된 ItemRecipeVO 객체를 사용하여 레시피 등록
		        }
		    }
	}

	@Override
	public List<ItemRecipeVO> selectItemRecipe(String item_code) throws Exception {
		logger.debug("service : 레시피 수정 파라미터");
		return dao.selectItemRecipe(item_code);
	}

	@Override
	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception {
		logger.debug("service : 레시피 수정");
		return dao.updateItemRecipe(vo);
	}

	@Override
	public void deleteItemRecipe(String item_code) throws Exception {
		logger.debug("service: 레시피 삭제");
		dao.deleteItemRecipe(item_code);
	}

	@Override
	public List<MaterialdetailVO> materialList(MaterialdetailVO vo) throws Exception {
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

	@Override
	public void deleteItemRecipeMaterial(ItemRecipeVO vo) throws Exception {
		logger.debug("service : 레시피 개별 삭제");
		dao.deleteItemRecipeMaterial(vo);
	}

}
