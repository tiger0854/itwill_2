package com.ddosirak.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.PageVO;

@Repository
public class PageDAOImpl implements PageDAO {
	private static final Logger logger = LoggerFactory.getLogger(PageDAOImpl.class);
	private static final String NAMESPACE="com.ddosirak.mapper.pageMapper";
	@Inject
	private SqlSession sqlSession;
	
	// 게시판 페이징 처리
	@Override
	public Integer countBoard() {
		logger.debug("countBoard() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE+".countBoard");
	}// countBoard() method end

	// 사원정보조회 리스트 페이징 처리
	@Override
	public Integer countEmpList() {
		logger.debug("countEmpList() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE+".countEmpList");
	}//countEmpList() method end

	@Override
	public Integer countCustomerList(PageVO vo) {
		return sqlSession.selectOne(NAMESPACE+".countCusList",vo);
	}//거래처리스트

	@Override
	public Integer countInList(PageVO vo) {
		return sqlSession.selectOne(NAMESPACE+".countInbountList",vo);
	}//입고리스트

	@Override
	public Integer countRetOrdList(PageVO vo) {

		return sqlSession.selectOne(NAMESPACE+".countOrdList",vo);
	}//발주리스트
	
	@Override
	public Integer countRequestList() {
	
		return sqlSession.selectOne(NAMESPACE+".countRequest");
	}// 발주등록시 자재리스트
	


	// 수주목록 페이징
	@Override
	public Integer countReceiveList() {
		logger.debug("countReceiveList() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE + ".countReceiveList");
	}
	// 출근자 목록 페이징 처리
	@Override
	public Integer countInEmp() {
		return sqlSession.selectOne(NAMESPACE+".countInEmp");
	}// countInEmp() method end
	// 퇴근자 목록 페이징 처리
	@Override
	public Integer countOutEmp() {
		return sqlSession.selectOne(NAMESPACE+".countOutEmp");
	}// countOutEmp() method end
	
	
	
	
	
	// 출고목록 페이징
	@Override
	public Integer countOutList() {
		logger.debug("countOutList() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE + ".countOutList");
	}



}// public class end
