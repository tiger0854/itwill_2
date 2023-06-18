package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.OrderVO;

@Repository
public class InboundDAOImpl implements InboundDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE="com.ddosirak.mapper.InboundMapper";

	private static final Logger logger = LoggerFactory.getLogger(InboundDAOImpl.class);

	@Override
	public void insertInbound(InboundVO vo) {
		
		sqlSession.insert(NAMESPACE+".insertInbound",vo);
		logger.debug("입고예정등록 완료!");
	}

	@Override
	public List<InboundVO> inboundAllList() {

		logger.debug("입고리스트 불러오기 완료!");		
		return sqlSession.selectList(NAMESPACE+".inboundAllList");
	}

	@Override
	public int updateOrderState(String order_number) {

		return 	sqlSession.update(NAMESPACE+".updateOrderState",order_number);
	}

	@Override
	public int updateInProcess(InboundVO vo) {
	
		return sqlSession.update(NAMESPACE+".updateInProcess",vo);
	}

	@Override
	public int deleteInbound(String in_id) {
		
		return sqlSession.delete(NAMESPACE+".deleteInbound",in_id);
	}

	@Override
	public String getOrderNumber(String in_id) {
		
		return sqlSession.selectOne(NAMESPACE+".selectOrderNumber",in_id);
	}

	@Override
	public int updateOrderStateToDefault(String order_number) {
		
		
		return sqlSession.update(NAMESPACE+".updateOrderStateToDefault",order_number);
	}

}
