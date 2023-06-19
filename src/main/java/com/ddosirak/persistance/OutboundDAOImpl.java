package com.ddosirak.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.OutboundVO;

@Repository
public class OutboundDAOImpl implements OutboundDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.ddosirak.mapper.outboundMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(OutboundDAOImpl.class);


	@Override
	public void outInsert(OutboundVO vo) {
		sqlSession.insert(NAMESPACE + ".outInsert", vo);
		
		logger.debug("출고 예정 등록 완료");
	}


	@Override
	public List<OutboundVO> getOutList() {		
		return sqlSession.selectList(NAMESPACE + ".outList");
	}
	
	

	@Override
	public List<OutboundVO> getOngoingOutList() {
		return sqlSession.selectList(NAMESPACE + ".getOngoingOutList");
	}


	@Override
	public List<OutboundVO> getCompletedOutList() {
		return sqlSession.selectList(NAMESPACE + ".getCompletedOutList");
	}
	

	@Override
	public void updateOutState(Integer outNum, int newState) {
		  Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("outNum", outNum);
	        paramMap.put("newState", newState);
	        sqlSession.update(NAMESPACE + ".updateOutState", paramMap);	
	}

	
	
	
	
	
//	@Override
//	public List<OutboundVO> getCustomerList() {		
//		return sqlSession.selectList(NAMESPACE + ".customerList");
//	}

	// 페이징 목록 총 갯수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".count");
	}



	
	

}
