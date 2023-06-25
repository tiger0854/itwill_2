package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.WarehouseVO;

@Repository
public class WarehouseDAOImpl implements WarehouseDAO {
	
	
	@Inject
	SqlSession sqlsession;
	
	private static final String NAMESPACE="com.ddosirak.mapper.WarehouseMapper";
	
	
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(WarehouseDAOImpl.class);
	
	@Override
	public List<WarehouseVO> whList() {
		logger.debug("dao:warehouselist 호출");
		return sqlsession.selectList(NAMESPACE+".WarehouseList");
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

}
