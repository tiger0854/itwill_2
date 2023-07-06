package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.QualityControlVO;

//@Repository : 스프링에 해당 파일이 DAO의 동작을 하는 객체라고 등록하는 것.

@Repository
public class QualityDAOImpl implements QualityDAO {
	// 1,2 DB 연결
	// 3, SQL작성, pstmt
	// 4. SQL 실행
	// 5. 데이터 처리 ... 기존에 DAO에서 하던 일!!

	// 1,2 DB 연결 > SqlSessionFactory 객체 주입
	@Inject
//	private SqlSessionFactory sqlFactory; // bean으로 인식된다.
	private SqlSession sqlSession; // sqlFactory는 select() 사용이 불가능하여 변경, 이후 다른 객체를 주입받아 사용할거임!
	// 3, SQL작성, pstmt > memberMapper.xml에 작성하였음

	private static final String NAMESPACE = "com.ddosirak.mapper.QualityMapper";
	// 상수는 final인데 왜 static 주나 ? > 관례적인것 ,,

	private static final Logger logger = LoggerFactory.getLogger(QualityDAOImpl.class);

	// 품질현황 목록
	@Override
	public List<QualityControlVO> qualityList(PageVO pageVO) throws Exception {
		logger.debug("qualityList()!");
		return sqlSession.selectList(NAMESPACE + ".qualityList", pageVO);
	}
	
	@Override
	public List<QualityControlVO> qualityList(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception {
		logger.debug("qualityList(PageVO pageVO, Map<String, Object> instrSearch, Model model)!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		List<QualityControlVO> qualityList = sqlSession.selectList(NAMESPACE + ".qualitySearchList", instrSearch);
		return qualityList;
	}

	@Override
	public String getMaxCode() throws Exception {
		logger.debug("getMaxCode()!");
		return sqlSession.selectOne(NAMESPACE + ".getMaxCode");
	}

	@Override
	public Integer itemCount(Map<String, Object> instrSearch) throws Exception {
		logger.debug("itemCount()!");
		return sqlSession.selectOne(NAMESPACE + ".itemCount", instrSearch);
	}

	@Override
	public void insertQualityInspection(QualityControlVO vo) throws Exception {
		logger.debug("insertQualityInspection()!");
		sqlSession.insert(NAMESPACE + ".insertInspection", vo);
		
		
	}

	// 품질검사 목록
	@Override
	public List<QualityControlVO> qualityInspection(PageVO pageVO) throws Exception {
		logger.debug("qualityInspection()!");
		return sqlSession.selectList(NAMESPACE + ".inspectionList", pageVO);
	}

	@Override
	public List<QualityControlVO> qualityInspection(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception {
		logger.debug("qualityInspection()!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		return sqlSession.selectList(NAMESPACE + ".inspectionSearchList", instrSearch);
	}

	@Override
	public Integer inspectionCount(Map<String, Object> instrSearch) throws Exception {
		logger.debug("inspectionCount()!");
		return sqlSession.selectOne(NAMESPACE + ".inspectionCount", instrSearch);
	}

	// 불량 리스트
	@Override
	public List<QualityControlVO> errorList(PageVO pageVO) throws Exception {
		logger.debug("errorList(PageVO pageVO)!");
		return sqlSession.selectList(NAMESPACE + ".errorList", pageVO);
	}

	@Override
	public List<QualityControlVO> errorList(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception {
		logger.debug("errorList(PageVO pageVO, Map<String, Object> instrSearch, Model model)!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		return sqlSession.selectList(NAMESPACE + ".errorSearchList", instrSearch);
	}
	
	@Override
	public Integer insertStatus(QualityControlVO ivo) {
		logger.debug("insertStatus(QualityControlVO vo)!");
		return sqlSession.insert(NAMESPACE + ".insertStatus", ivo);
	}

	@Override
	public Integer errorCount(Map<String, Object> instrSearch) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".errorCount", instrSearch);
	}
	
	
	
	
	
	
	
	
	

}// public class end
