package com.ddosirak.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

//@Repository : 스프링에 해당 파일이 DAO의 동작을 하는 객체라고 등록하는 것.

@Repository
public class ProOrderDAOImpl implements ProOrderDAO {
	// 1,2 DB 연결
	// 3, SQL작성, pstmt
	// 4. SQL 실행
	// 5. 데이터 처리 ... 기존에 DAO에서 하던 일!!
	
	// 1,2 DB 연결			> SqlSessionFactory 객체 주입
	@Inject
//	private SqlSessionFactory sqlFactory; // bean으로 인식된다.
	private SqlSession sqlSession; // sqlFactory는 select() 사용이 불가능하여 변경, 이후 다른 객체를 주입받아 사용할거임!
	// 3, SQL작성, pstmt	> memberMapper.xml에 작성하였음
	
	private static final String NAMESPACE="com.ddosirak.mapper.ProOrderMapper";
	// 상수는 final인데 왜 static 주나 ? > 관례적인것 ,,
	
	private static final Logger logger = LoggerFactory.getLogger(ProOrderDAOImpl.class);


	@Override
	public void insertOrder(ProOrderVO vo) {
		// 1,2 DB 연결
		// 3, SQL작성, pstmt
		// 4. SQL 실행
//		sqlSession.insert("com.itwillbs.mapper.MemberMapper"+".insertMember", parameter);
		sqlSession.insert(NAMESPACE+".insertOrder", vo); // ". 주의 !!"
		logger.debug("사원 등록 완료!");

	}//insertMember() method end
	
	//작업지시 목록
	@Override
	public List<ProOrderVO> proOrderList(PageVO pageVO) {
		logger.debug("proOrderList()!");
		List<ProOrderVO> proOrderList = sqlSession.selectList(NAMESPACE+".proOrderList",pageVO);
		return proOrderList;
	}
	
	// 작업지시 검색
	@Override
	public List<ProOrderVO> proOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO) {
		// 작업지시 조회 목록
		logger.debug("proOrderList()!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		System.out.println("작업지시 페이징 : " + instrSearch);
		List<ProOrderVO> proOrderList = sqlSession.selectList(NAMESPACE+".proOrderSearch",instrSearch);
		return proOrderList;
	}
	
	
	//작업지시 정보조회
	@Override
	public ProOrderVO getProOrder(String wo_code) {
		logger.debug("getProdoer()!");
		ProOrderVO resultVO = sqlSession.selectOne((NAMESPACE)+".getProOrder", wo_code);
		return resultVO;
	}
	
	//작업지시 수정
	@Override
	public Integer EditProOrder(ProOrderVO vo) {
		logger.debug("EditProOrder() !");
		Integer result = sqlSession.selectOne(NAMESPACE+".editProOrder",vo);
		return result;
	}
	
	//작업지시 삭제
	@Override
	public void deleteProOrder(String wo_code) {
		logger.debug("dao: 작업지시 삭제 호출");
		sqlSession.delete(NAMESPACE+".deleteProOrder",wo_code);
	}
	
	//작업지시 상태 변경
//	@Override
//	public Integer statusProOrder(ProductionPerformanceVO vo) {
//		logger.debug("dao: 작업지시 삭제 호출");
//		Integer result = sqlSession.selectOne(NAMESPACE+".statusProOrder",vo);
//		return result;
//	}
//	
	// 상품목록
	@Override
	public List<ItemdetailVO> proitemList() {
		logger.debug("proitemList()");
		List<ItemdetailVO> proitemList = sqlSession.selectList(NAMESPACE+".proitemList");
		return proitemList;
	}

	@Override
	public List<ItemdetailVO> proitemList(Map<String, Object> instrSearch, Model model) {
		logger.debug("proitemList()");
		List<ItemdetailVO> proitemList = sqlSession.selectList(NAMESPACE+".proitemSearch",instrSearch);
		return proitemList;
	}

	@Override
	public void addpQTY(ProductionPerformanceVO ivo) {
		logger.debug("addpQTY()");
		sqlSession.selectOne(NAMESPACE+".addQTY",ivo);
	}

	@Override
	public Integer ProOdercount(Map<String, Object> instrSearch) {
		logger.debug("procount");
		return sqlSession.selectOne(NAMESPACE+".procount",instrSearch);
	}





	



}// public class end
