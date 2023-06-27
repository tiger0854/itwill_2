package com.ddosirak.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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

	@Override
	public Integer countEmpList() {
		logger.debug("countEmpList() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE+".countEmpList");
	}//countEmpList() method end

	@Override
	public Integer customerList() {
		logger.debug("countEmpList() 메서드 호출");
		return sqlSession.selectOne(NAMESPACE+".customerList");

	}
	
	

}// public class end
