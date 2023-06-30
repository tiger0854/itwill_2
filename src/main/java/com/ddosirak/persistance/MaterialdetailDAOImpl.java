package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

@Repository
public class MaterialdetailDAOImpl implements MaterialdetailDAO {

	@Inject
	SqlSession sqlsession;

	private static final String NAMESPACE = "com.ddosirak.mapper.MaterialdetailMapper";

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(MaterialdetailDAOImpl.class);

	// 자재 기초 목록
	@Override
	public List<MaterialdetailVO> mdList(PageVO pageVO) {
		logger.debug("dao : 자재 기초 목록 실행");
		return sqlsession.selectList(NAMESPACE + ".MaterialDetailList", pageVO);
	}

	@Override
	public List<MaterialdetailVO> mdList(PageVO pageVO, Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : 자재 기초 검색 목록 실행");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		logger.debug("@@@@페이징 :" + instrSearch);
		return sqlsession.selectList(NAMESPACE + ".MaterialDetailListSearch", instrSearch);
	}

	// 자재 기초 등록
	@Override
	public Integer insertMD(MaterialdetailVO vo) {
		logger.debug("dao : 자재 기초 등록 실행");
		logger.debug(vo + "");
		return sqlsession.insert(NAMESPACE + ".insertMaterialDetail", vo);
	}

	// 자재 기초 수정
	@Override
	public Integer updateMD(MaterialdetailVO vo) {
		logger.debug("dao : 자재 기초 수정 실행(update)");
		return sqlsession.update(NAMESPACE + ".updateMaterialDetail", vo);
	}

	@Override
	public MaterialdetailVO selectMD(String material_code) {
		logger.debug("dao : 자재 기초 수정 실행(edit)");
		return sqlsession.selectOne(NAMESPACE + ".selectMaterialDetail", material_code);
	}

	// 자재 삭제
	@Override
	public void deleteM(String material_code) {
		logger.debug("dao : 자재 삭제 실행");
		sqlsession.delete(NAMESPACE + ".deleteMaterial", material_code);
	}

	@Override
	public String getMaxCode() {
		logger.debug("dao : getMaxCode 호출");
		return sqlsession.selectOne(NAMESPACE + ".getMaxCode");
	}
	
	// 상품목록 검색 (팝업창)
	@Override
	public List<MaterialdetailVO> materialItemList(PageVO pageVO) {
		logger.debug("dao : materialItemList 전체호출");
		List<MaterialdetailVO> materialItemList = sqlsession.selectList(NAMESPACE + ".materialItemList", pageVO);
		return materialItemList;
	}
	
	@Override
	public List<MaterialdetailVO> materialItemList(PageVO pageVO, Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : materialItemList 부분호출");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		List<MaterialdetailVO> materialItemList = sqlsession.selectList(NAMESPACE + ".materialItemSearch", instrSearch);
		return materialItemList;
	}

	@Override
	public Integer materialCount(Map<String, Object> instrSearch) {
		logger.debug("dao : materialCount 검색갯수 호출");
		return sqlsession.selectOne(NAMESPACE + ".matCount", instrSearch);
	}

}
