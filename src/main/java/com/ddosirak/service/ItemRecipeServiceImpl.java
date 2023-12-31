package com.ddosirak.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ItemRecipeDAO;


@Service
public class ItemRecipeServiceImpl implements ItemRecipeService {

	@Inject
	private ItemRecipeDAO dao;
	
	@Inject 
	private HttpSession session;
	
	@Inject
	private EmployeeDAO edao;
	
	Logger logger = LoggerFactory.getLogger(ItemRecipeServiceImpl.class);
	
	//레시피 목록 호출
	@Override
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO) throws Exception {
		logger.debug("service : 레시피 목록 호출");
		return dao.ItemRecipeList(pageVO);
	}

	@Override
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception {
		logger.debug("service : 레시피 목록 호출");
		return dao.ItemRecipeList(pageVO, instrSearch);
	}

	@Override
	public void insertItemRecipe(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception {
	    logger.debug("service: 레시피 등록");
	    List<ItemRecipeVO> itemRecipeUploadvo = uvo.getItemRecipeUploadvo(); // ItemRecipeUploadVO 객체에서 리스트를 가져옴
	    List<ItemRecipeListVO> existingRecipe = dao.selectItemRecipe(vo.getItem_code());
	    List<ItemRecipeVO> removeList = new ArrayList<>(); // 없는 값들을 담을 리스트
	    
		// 자재가 없으면 레시피 전체 삭제
		if (itemRecipeUploadvo == null || itemRecipeUploadvo.isEmpty()) {
			dao.deleteItemRecipe(vo.getItem_code());
		} else {
				for (ItemRecipeListVO existingItem : existingRecipe) {
					boolean found = false;
					for (ItemRecipeVO item : itemRecipeUploadvo) {

						if (existingItem.getMaterial_code().equals(item.getMaterial_code())) {
							found = true;
							break;
						}
					}
					if (!found) {
						ItemRecipeVO removeItem = new ItemRecipeVO();
						removeItem.setItem_code(vo.getItem_code());
						removeItem.setMaterial_code(existingItem.getMaterial_code());
						removeList.add(removeItem); // 기존 레시피에는 있지만 업로드하는 레시피에 없는 아이템을 추가
					}
				}

				for (ItemRecipeVO item : itemRecipeUploadvo) {
					item.setItem_code(vo.getItem_code()); // 값을 설정
					int id = Integer.valueOf((String) session.getAttribute("login_id"));
					item.setEmployee_name(edao.vacationfind(id));
					dao.insertOrUpdateItemRecipe(item); // 변경된 ItemRecipeVO 객체를 사용하여 레시피 등록
				}

				for (ItemRecipeVO item : removeList) {
					dao.deleteItemRecipeMaterial(item);
				}
			}
		}
	


	@Override
	public List<ItemRecipeListVO> selectItemRecipe(String item_code) throws Exception {
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
	public List<MaterialdetailVO> materialList(HashMap<String, Object> requestMap) throws Exception {
		logger.debug("service : 자재 목록 조회");
		logger.debug("자재 목록 : 검색");
		if (requestMap.get("material_code")==null&&requestMap.get("material_name")==null&&requestMap.get("material_type")==null) {
			logger.debug("자재 목록 : 전체");
			return dao.materialListAll(requestMap);
		} else {
			logger.debug("자재 목록 : 검색");
			return dao.materialListSearch(requestMap);
		}
	}

	@Override
	public void deleteItemRecipeMaterial(ItemRecipeVO vo) throws Exception {
		logger.debug("service : 레시피 개별 삭제");
		dao.deleteItemRecipeMaterial(vo);
	}

	@Override
	public Integer itemrecipeCount(Map<String, Object> instrSearch) {
		logger.debug("service : 레시피 검색 갯수");
		return dao.itemrecipeCount(instrSearch);
	}

	@Override
	public List<ItemRecipeListVO> itemrecipeItemList(PageVO pageVO) throws Exception {
		logger.debug("service : 상품 목록 검색");
		return dao.itemrecipeItemList(pageVO);
	}

	@Override
	public List<ItemRecipeListVO> itemrecipeItemList(Map<String, Object> instrSearch,PageVO pageVO) throws Exception {
		logger.debug("service : 상품 목록 부분 검색");
		return dao.itemrecipeItemList(instrSearch,pageVO);

	}

	@Override
	public List<ItemdetailVO> itemCodeDis() throws Exception {
		
		return dao.itemCodeDis(5);
	}

	@Override
	public String getItemName(String item_code) throws Exception {
		return dao.getItemName(item_code);
	}

	
}
