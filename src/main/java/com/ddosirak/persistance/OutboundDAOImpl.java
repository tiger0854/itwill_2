package com.ddosirak.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.OutboundListVO;
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

	
	// 출고 전체 리스트
	@Override
	public List<OutboundVO> getOutList(PageVO pageVO) {		
		return sqlSession.selectList(NAMESPACE + ".outList",pageVO);
	}
	
	
	// 출고 진행중 리스트
	@Override
	public List<OutboundVO> getOngoingOutList(PageVO pageVO) {
		return sqlSession.selectList(NAMESPACE + ".getOngoingOutList",pageVO);
	}

	// 출고 완료 리스트
	@Override
	public List<OutboundVO> getCompletedOutList(PageVO pageVO) {
		return sqlSession.selectList(NAMESPACE + ".getCompletedOutList",pageVO);
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
	// 출고 번호에 따른 출고 상품 리스트
	
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
	
	
	




	


	
	

}
