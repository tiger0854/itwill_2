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
import com.ddosirak.domain.PageVO;

@Repository
public class OutboundDAOImpl implements OutboundDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.ddosirak.mapper.outboundMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(OutboundDAOImpl.class);

	// 출고등록
	@Override
	public void outInsert(OutboundVO vo) {
		logger.debug("outInsert DAOImpl 시랳ㅇ~~~~~");
		sqlSession.insert(NAMESPACE + ".outInsert", vo);
		logger.debug("등록완료~");
	}

	
	// 출고 리스트
	@Override
	public List<OutboundVO> getOutList(Map<String, Object> param) {
		logger.debug("param DAO IMPL#########################33 : " + param);
		return sqlSession.selectList(NAMESPACE + ".outList", param);
	}
	
	
	// 출고 상태 수정
	@Override
	public void updateOutState(String out_num, int out_state) {
		  Map<String, Object> paramMap = new HashMap<>();
	        paramMap.put("out_num", out_num);
	        paramMap.put("out_state", out_state);
	        sqlSession.update(NAMESPACE + ".updateOutState", paramMap);	
	}

	
	// 출고 번호에 따른 출고 상품  리스트
	@Override
	public List<OutboundVO> getOutProductList(String out_num) {
	    return sqlSession.selectList(NAMESPACE + ".outProductList", out_num);	
	}

	
	// 상품이름 외 n 건 
	  @Override
	    public int getOutNumCount(String out_num) {
	        return sqlSession.selectOne(NAMESPACE + ".getOutNumCount", out_num);
	    }

	  // 출고 수정
	  @Override
	  public Integer outboundUpdate(OutboundVO vo) {
		  return sqlSession.update(NAMESPACE + ".outboundUpdate", vo);
	  }

	  // 출고 삭제
	  @Override
	  public Integer outboundDelete(String out_num) {
		  return sqlSession.delete(NAMESPACE + ".outboundDelete", out_num);
	  }


	  // 출고 처리
	  @Override
	  public Integer outProcessModify(OutboundVO vo) {
		  return sqlSession.update(NAMESPACE + ".outProcessModify", vo);
	  }


	  // rec_code
	  @Override
	  public String recCd(String out_num) {
	  	  return sqlSession.selectOne(NAMESPACE + ".recCd", out_num);
	  }

	  
	  // 수주 상태 수정(0)
	  @Override
	  public void recStateUpdate(String re_code) throws Exception {
	  	 logger.debug("수주 상태 수정 완룡 DAO지롱");
		 sqlSession.update(NAMESPACE + ".recStateUpdate", re_code);
      }

	  // 수주 상태 수정(2)
	  @Override
	  public void recStateUpdate2(String re_code) throws Exception {
		  logger.debug("수주 상태 수정 완룡 DAO지롱");
		  sqlSession.update(NAMESPACE + ".recStateUpdate2", re_code);
	  }


	  // 재고 리스트
	  @Override
	  public List<OutboundVO> getStockList(String out_num) {
		return sqlSession.selectList(NAMESPACE + ".getStockList", out_num);
	  }

		
	  public Integer outCompleteToday() {
		  return sqlSession.selectOne(NAMESPACE + ".outCompleteToday");
	  }
	  
	  public Integer outScheduleToday() {
		  return sqlSession.selectOne(NAMESPACE + ".outScheduleToday");
	  }

	
	
	
	




	


	
	

}
