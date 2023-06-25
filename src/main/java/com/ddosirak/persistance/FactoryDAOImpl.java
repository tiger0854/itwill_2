package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.FactoryVO;

@Repository
public class FactoryDAOImpl implements FactoryDAO {
	
	public static final String NAMESPACE = "com.ddosirak.mapper.factoryMapper";
	Logger logger = LoggerFactory.getLogger(FactoryDAOImpl.class);
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<FactoryVO> facList() throws Exception {
		logger.debug("dao : 공장 목록 출력");
		return sqlsession.selectList(NAMESPACE+".factoryList");
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

}
