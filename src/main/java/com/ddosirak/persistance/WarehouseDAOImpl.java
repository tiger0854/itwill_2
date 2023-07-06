package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.WarehouseVO;

@Repository
public class WarehouseDAOImpl implements WarehouseDAO {
	
	
	@Inject
	SqlSession sqlsession;
	
	private static final String NAMESPACE="com.ddosirak.mapper.WarehouseMapper";
	
	
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(WarehouseDAOImpl.class);
	
	@Override
	public List<WarehouseVO> whList(PageVO pageVO) {
		logger.debug("dao:warehouselist 호출");
		return sqlsession.selectList(NAMESPACE+".WarehouseList", pageVO);
	}

	@Override
	public List<WarehouseVO> whList(PageVO pageVO, Map<String, Object> instrSearch) {
		logger.debug("dao:warehouselist 검색 호출");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		return sqlsession.selectList(NAMESPACE + ".WarehouseListSearch", instrSearch);
	}

	@Override
	public Integer insertWh(WarehouseVO vo) {
		logger.debug("dao: 창고 등록 호출");
		return sqlsession.insert(NAMESPACE+".insertWarehouse", vo);
		
	}

	@Override
	public Integer updateWh(WarehouseVO vo) {
		logger.debug("dao: 창고 수정 호출");
		return sqlsession.update(NAMESPACE+".updateWarehouse", vo);
	}

	@Override
	public WarehouseVO selectwh(String wh_code) {
		logger.debug("dao: 창고 수정 호출");
		return sqlsession.selectOne(NAMESPACE+".selectWarehouse", wh_code);
	}

	@Override
	public void deletewh(String wh_code) {
		logger.debug("dao: 창고 삭제 호출");
		sqlsession.delete(NAMESPACE+".deleteWarehouse",wh_code);
	}

	@Override
	public String getMaxCode(WarehouseVO vo) {
		logger.debug("dao : getMaxCode 호출");
		return sqlsession.selectOne(NAMESPACE+".getMaxCode",vo);
	}

	@Override
	public List<WarehouseVO> warehouseItemList() {
		logger.debug("dao : 창고 검색 전체 호출");
		return sqlsession.selectList(NAMESPACE + ".warehouseItemList");
	}

	@Override
	public List<WarehouseVO> warehouseItemList(Map<String, Object> instrSearch) {
		logger.debug("dao : 창고 검색 호출");
		List<WarehouseVO> warehouseItemList = sqlsession.selectList(NAMESPACE + ".warehouseItemSearch", instrSearch);
		return warehouseItemList;
	}

	@Override
	public Integer warehouseCount(Map<String, Object> instrSearch) {
		logger.debug("dao : 창고 검색 갯수 호출");
		return sqlsession.selectOne(NAMESPACE + ".wareCount", instrSearch);
	}
	
	
	
	

}
