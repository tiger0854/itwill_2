package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

@Repository
public class ItemRecipeDAOImpl implements ItemRecipeDAO {
	private static final String NAMESPACE = "com.ddosirak.mapper.ItemRecipeMapper";

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ItemRecipeDAOImpl.class);

	@Inject
	SqlSession sqlsession;

	// 레시피 목록
	@Override
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO) throws Exception {
		logger.debug("DAO: 레시피 목록 전체 출력");
		return sqlsession.selectList(NAMESPACE+".itemRecipeList", pageVO);
	}
	
	@Override
	public List<ItemRecipeListVO> ItemRecipeList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception {
		logger.debug("DAO: 레시피 목록 부분 출력");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		return sqlsession.selectList(NAMESPACE + ".itemRecipeSearchList", instrSearch);
	}
	
	//레시피 등록
	@Override
	public Integer insertItemRecipe(ItemRecipeVO vo) throws Exception {
		logger.debug("DAO :  레시피 등록");
		return sqlsession.insert(NAMESPACE+".insertItemRecipe",vo);
	}
	
	//레시피 수정
	@Override
	public List<ItemRecipeListVO> selectItemRecipe(String item_code) throws Exception {
		logger.debug("DAO : 레시피 파라미터");
		return sqlsession.selectList(NAMESPACE+".selectItemRecipe",item_code);
	}

	@Override
	public Integer updateItemRecipe(ItemRecipeVO vo) throws Exception {
		logger.debug("DAO : 레시피 수정");
		return sqlsession.update(NAMESPACE+".updateItemRecipe", vo);
	}
	
	//레시피 삭제
	@Override
	public void deleteItemRecipe(String item_code) throws Exception {
		logger.debug("DAO : 레시피 삭제");
		sqlsession.delete(NAMESPACE+".deleteItemRecipe", item_code);
	}
	
	//아이템 코드 출력
	@Override
	public List<ItemdetailVO> ItemdetailList() throws Exception {
		logger.debug("DAO : 아이템 코드 출력");
		return sqlsession.selectList(NAMESPACE+".itemlist");
	}

	@Override
	public List<MaterialdetailVO> materialListSearch(Map<String, Object> materialMap) throws Exception {
		logger.debug("DAO : 자재 목록 조회 : 검색");
		return sqlsession.selectList(NAMESPACE+".materialSearch",materialMap);
	}

	@Override
	public List<MaterialdetailVO> materialListAll(Map<String, Object> materialMap) throws Exception {
		logger.debug("DAO : 자재 목록 조회 : 전체");
		return sqlsession.selectList(NAMESPACE+".materialList", materialMap);
	}

	@Override
	public Integer insertOrUpdateItemRecipe(ItemRecipeVO vo) throws Exception {
		logger.debug("DAO : 자재 등록 및 수정");
		return sqlsession.insert(NAMESPACE+".insertOrUpdateItemRecipe",vo);
	}

	@Override
	public void deleteItemRecipeMaterial(ItemRecipeVO vo) throws Exception {
		logger.debug("DAO : 레시피 삭제 - 자재만 ");
		sqlsession.delete(NAMESPACE+".deleteItemRecipeMaterial", vo);
	}
	
	@Override
	public Integer itemrecipeCount(Map<String, Object> instrSearch) {
		logger.debug("DAO : 레시피 검색 갯수 ");
		int result = sqlsession.selectOne(NAMESPACE + ".recipeCount", instrSearch);
		logger.debug("@@@@result" + result);
		return result;
	}

	@Override
	public List<ItemRecipeListVO> itemrecipeItemList(PageVO pageVO) throws Exception {
		logger.debug("DAO : 상품목록 검색 ");
		return sqlsession.selectList(NAMESPACE + ".itemrecipeItemList", pageVO);
	}

	@Override
	public List<ItemRecipeListVO> itemrecipeItemList(Map<String, Object> instrSearch, PageVO pageVO) throws Exception {

		logger.debug("DAO : 상품목록 부분검색 ");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		return sqlsession.selectList(NAMESPACE + ".itemrecipeItemSearchList", instrSearch);
	}
	
	
	
	
	
	
}
