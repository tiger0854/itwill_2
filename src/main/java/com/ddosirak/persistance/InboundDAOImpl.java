package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;

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
	public List<InboundVO> inboundAllList(PageVO vo) {

		logger.debug("입고리스트 불러오기 완료!");		
		return sqlSession.selectList(NAMESPACE+".inboundAllList",vo);
	}

	@Override
	public int updateOrderState(String order_number) {
		logger.debug("입고등록시 발주 상태변경 완료 (0-->1)!");
		return 	sqlSession.update(NAMESPACE+".updateOrderState",order_number);
	}

	@Override
	public int updateInProcess(InboundVO vo) {
		logger.debug("입고처리 완료!!@@");
		return sqlSession.update(NAMESPACE+".updateInProcess",vo);
	}

	@Override
	public int deleteInbound(String in_id) {
		logger.debug("입고서 삭제 완료!!!@@");
		return sqlSession.delete(NAMESPACE+".deleteInbound",in_id);
	}

	@Override
	public String getOrderNumber(String in_id) {
		logger.debug("발주번호 가져오기 완료!!");
		return sqlSession.selectOne(NAMESPACE+".selectOrderNumber",in_id);
	}

	@Override
	public int updateOrderStateToDefault(String order_number) {
		logger.debug("입고취소시 발주상태 변경!!");
		return sqlSession.update(NAMESPACE+".updateOrderStateToDefault",order_number);
	}

	@Override
	public void updateInbount(InboundVO vo) {
		logger.debug("입고서 수정 완료!!");
		 sqlSession.update(NAMESPACE+".updateInbound",vo);
	}

	@Override
	public void updateMatrial(Map param) {
		logger.debug("자재 수량 변경 완료!");
		sqlSession.update(NAMESPACE+".updateMatrial",param);
		
	}

	@Override
	public Integer selectNowIndate() {

		return sqlSession.selectOne(NAMESPACE+".selectNowIndate");
	}

	@Override
	public Integer selectNowEdate() {
		
		return sqlSession.selectOne(NAMESPACE+".selectNowEdate");
	}

}
