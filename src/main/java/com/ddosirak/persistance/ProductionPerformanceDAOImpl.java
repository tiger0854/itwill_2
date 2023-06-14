package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.ProductionPerformanceVO;

@Repository
public class ProductionPerformanceDAOImpl implements ProductionPerformanceDAO {
	
	// 1,2 DB 연결	> SqlSessionFactory 객체 주입
	@Inject
	private SqlSession sqlSession;
	
	// 3. SQL 작성 && pstmt	> memberMapper.xml에 작성하였음
	private static final String NAMESPACE="com.ddosirak.mapper.ProductionPerformanceMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeDAOImpl.class);
	
	// 실적등록
	public void insertProdPerf(ProductionPerformanceVO ivo) {
		
		// 1,2 DB 연결
		// 3. SQL 작성 && pstmt
		// 4. SQL 실행
		sqlSession.insert(NAMESPACE + ".insertProdPerf", ivo);
		logger.debug("실적 등록 완료");
		
	}
	
	// 실적 현황
	public List<ProductionPerformanceVO> prodPerfList() {
		// 1,2 DB 연결
		// 3. SQL 작성 && pstmt
		// 4. SQL 실행
		List<ProductionPerformanceVO> prodPerfList = sqlSession.selectList(NAMESPACE + ".prodPerfList");
		logger.debug("@@@@@@@ prodPerfList : " + prodPerfList);
		logger.debug("실적 조회 완료");
		return prodPerfList;
	}
	
}
