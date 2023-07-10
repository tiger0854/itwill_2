package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.PageVO;
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
	public List<ProductionPerformanceVO> prodPerfList(Map<String, Object> instrSearch,String wo_code,PageVO pageVO) {
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		instrSearch.put("wo_code",wo_code);
		List<ProductionPerformanceVO> prodPerfList = sqlSession.selectList(NAMESPACE + ".prodPerfList", instrSearch);
		logger.debug("@@@@@@@ prodPerfList : " + prodPerfList);
		logger.debug("실적 조회 완료");
		return prodPerfList;
	}

	// 실적 수정(조회)
	@Override
	public ProductionPerformanceVO perfUpdateList(int perf_id) {
		// 1,2 DB 연결
		// 3. SQL 작성 && pstmt
		// 4. SQL 실행
		
		ProductionPerformanceVO perfUpdateList = sqlSession.selectOne(NAMESPACE + ".perfUpdateList", perf_id);
		logger.debug("@@@@@@@ perfUpdateList : " + perfUpdateList);
		logger.debug("실적 수정 조회 완료");
		return perfUpdateList;
	}

	// 실적 수정 동작
	@Override
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo) {
		
		Integer perfUpdate = sqlSession.update(NAMESPACE + ".perfUpdate", uvo);
		logger.debug("@@@@@@@ perfUpdateList : " + perfUpdate);
		logger.debug("실적 수정 조회 완료");
		return perfUpdate;
		
	}

	// 실적 삭제 동작
	@Override
	public void perfDeleteBoard(int perf_id) {
		sqlSession.update(NAMESPACE + ".perfDelete", perf_id);
		logger.debug("실적 삭제 완료");
	}

	@Override
	public boolean checkY(String  wo_code) {
		System.out.println("ProductionPerformanceDAOImpl checkY()");
		return sqlSession.selectOne(NAMESPACE+".checkY", wo_code);
	}

	@Override
	public void updateClose(String wo_code) { // 지시수량 채우면 상태 마감으로 변경
		System.out.println("PerformDAOImpl updateClose()");
		sqlSession.update(NAMESPACE+".turnclose", wo_code);
		
	}

	@Override
	public void updateStart(String  wo_code) { // 실적 등록 시작하면 상태 시작으로 변경
		System.out.println("PerformDAOImpl updateStart()");
		sqlSession.update(NAMESPACE+".turnstart", wo_code);
	}
	
	@Override
	public void updateInstr(String wo_code) { // 실적전부 삭제하면 상태 지시로 변경
		System.out.println("PerformDAOImpl updateStart()");
		sqlSession.update(NAMESPACE+".turnwork", wo_code);
	}

	@Override
	public String getWoMap(String wo_code) { // 실적등록에 보여지는 지시 목록 하나 불러오기
		System.out.println("PerformDAOImpl getPfLiMap()");
		return sqlSession.selectOne(NAMESPACE+".getInstrMap",wo_code);
	}

	@Override
	public Integer getPrefCount(String wo_code) {
		Integer result = sqlSession.selectOne(NAMESPACE+".prefcount", wo_code);
		return result;
	}

	@Override
	public void pfQTYDel(ProductionPerformanceVO pvo) {
		sqlSession.update(NAMESPACE + ".pqtydel", pvo);
		logger.debug("실적 생산량 삭제 완료");
	}

	@Override
	public Integer orderStatuscount(String wo_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".etccount", wo_code);
	}

	@Override
	public void deltQTY(Map<String, Object> params) {
		sqlSession.update(NAMESPACE + ".qtydel", params);
		logger.debug("자재 감소 완료 @@@@@@@@@ "+params);
	}






	

	
	
	
	
}
