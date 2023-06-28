package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

@Repository
public class FactoryDAOImpl implements FactoryDAO {
	
	public static final String NAMESPACE = "com.ddosirak.mapper.factoryMapper";
	Logger logger = LoggerFactory.getLogger(FactoryDAOImpl.class);
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<FactoryVO> facList(PageVO pageVO) throws Exception {
		logger.debug("dao : 공장 목록 출력");
		return sqlsession.selectList(NAMESPACE+".factoryList", pageVO);
	}
	
	

	@Override
	public List<FactoryVO> facList(PageVO pageVO, Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : 공장 검색 목록 출력");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		logger.debug("@@@@페이징 :" + instrSearch);
		List<FactoryVO> factoryList = sqlsession.selectList(NAMESPACE + ".factoryListSearch", instrSearch);
		return factoryList;
	}



	@Override
	public Integer insertFac(FactoryVO vo) throws Exception {
		logger.debug("dao : 공장 등록 ");
		return sqlsession.insert(NAMESPACE+".insertFactory", vo);
	}

	@Override
	public Integer updateFac(FactoryVO vo) throws Exception {
		logger.debug("dao : 공장 수정");
		return sqlsession.update(NAMESPACE+".updateFactory", vo);
	}

	@Override
	public FactoryVO selectFac(String factory_code) throws Exception {
		logger.debug("dao : 공장 수정 파라미터 들고 가기");
		return sqlsession.selectOne(NAMESPACE+".selectFactory", factory_code);
	}

	@Override
	public void deleteF(String factory_code) throws Exception {
		logger.debug("dao : 공장 삭제");
		sqlsession.delete(NAMESPACE+".deleteFactory",factory_code);
	}

	@Override
	public String getMaxCode() throws Exception {
		logger.debug("dao : getMaxCode 호출");
		return sqlsession.selectOne(NAMESPACE+".getMaxCode");
	}

	@Override
	public List<FactoryVO> factoryItemList() {
		logger.debug("dao : 공장 검색 전체");
		List<FactoryVO> factoryItemList = sqlsession.selectList(NAMESPACE + ".factoryItemList");
		return factoryItemList;
	}

	@Override
	public List<FactoryVO> factoryItemList(Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : 공장 검색 부분");
		List<FactoryVO> factoryItemList = sqlsession.selectList(NAMESPACE + ".factoryItemSearch", instrSearch);
		return factoryItemList;
	}

	@Override
	public Integer factoryCount(Map<String, Object> instrSearch) {
		logger.debug("dao : 공장 검색 갯수");
		return sqlsession.selectOne(NAMESPACE + ".facCount", instrSearch);
	}
	
	
	
	

}
