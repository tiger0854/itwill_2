package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ReceiveVO;

@Repository
public class ReceiveDAOImpl implements ReceiveDAO {
	

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.ddosirak.mapper.receiveMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(OutboundDAOImpl.class);

	// 수주 등록
	@Override
	public void receiveInsert(ReceiveVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".receiveInsert", vo);
	}

	// 수주 목록
	@Override
	public List<ReceiveVO> receiveList(PageVO pageVO) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".receiveList", pageVO);
	}

	// 수주 상세
	@Override
	public ReceiveVO receiveDetail(String re_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".receiveDetail", re_code);
	}
	
	// 수주 수정
	@Override
	public void receiveUpdate(ReceiveVO uvo) throws Exception {
		sqlSession.update(NAMESPACE + ".receiveUpdate", uvo);
	}

	// 수주 삭제
	@Override
	public void receiveRemove(String re_code) throws Exception {
		sqlSession.delete(NAMESPACE + ".receiveRemove", re_code);	
	}
	
	

	

}
