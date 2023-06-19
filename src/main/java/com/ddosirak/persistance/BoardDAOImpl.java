package com.ddosirak.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.LoginVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	private static final String NAMESPACE="com.ddosirak.mapper.PublicMapper";
	@Inject
	private SqlSession sqlSession;

	// 로그인 > IDPW Check
	@Override
	public LoginVO checkIDPW(LoginVO vo) {
		logger.debug("checkIDPW() 메서드 호출!");
		return sqlSession.selectOne(NAMESPACE+".checkIDPW", vo);
	}// checkIDPW() method end
	
	
	
}// public class end
