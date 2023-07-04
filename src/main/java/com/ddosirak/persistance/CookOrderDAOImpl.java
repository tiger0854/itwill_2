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

import com.ddosirak.domain.CookAddVO;
import com.ddosirak.domain.CookVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

//@Repository : 스프링에 해당 파일이 DAO의 동작을 하는 객체라고 등록하는 것.

@Repository
public class CookOrderDAOImpl implements CookOrderDAO {
	// 1,2 DB 연결
	// 3, SQL작성, pstmt
	// 4. SQL 실행
	// 5. 데이터 처리 ... 기존에 DAO에서 하던 일!!
	
	// 1,2 DB 연결			> SqlSessionFactory 객체 주입
	@Inject
//	private SqlSessionFactory sqlFactory; // bean으로 인식된다.
	private SqlSession sqlSession; // sqlFactory는 select() 사용이 불가능하여 변경, 이후 다른 객체를 주입받아 사용할거임!
	// 3, SQL작성, pstmt	> memberMapper.xml에 작성하였음
	
	private static final String NAMESPACE="com.ddosirak.mapper.CookOrderMapper";
	// 상수는 final인데 왜 static 주나 ? > 관례적인것 ,,
	
	private static final Logger logger = LoggerFactory.getLogger(CookOrderDAOImpl.class);
	//조리지시 등록
	@Override
	public void cookOrder(CookVO cvo) {
		sqlSession.insert(NAMESPACE+".cookOrder", cvo); // ". 주의 !!"
		logger.debug("조리 등록 완료!");
		
	}

	// 조리지시목록
	@Override
	public List<CookVO> cookOrderList(PageVO pageVO) {
		logger.debug("CookOrderList()!");
		List<CookVO> cookOrderList = sqlSession.selectList(NAMESPACE+".cookOrderList",pageVO);
		return cookOrderList;
	}
	// 조리지시 검색 목록
	@Override
	public List<CookVO> cookOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO) {
		// 작업지시 조회 목록
		logger.debug("proOrderList()!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		logger.debug("CookOrderList()!");
		List<CookVO> cookOrderList = sqlSession.selectList(NAMESPACE+".cookSearchList",instrSearch);
		return cookOrderList;
	}
	// 조리지시 갯수
	@Override
	public Integer cookOrdercount(Map<String, Object> instrSearch) {
		logger.debug("cookCount");
		return sqlSession.selectOne(NAMESPACE+".cookcount",instrSearch);
	}

	// 조리지시 정보 조회
	@Override
	public CookVO getcookOrder(String co_code) {
		logger.debug("getcookorder()!");
		CookVO cvo = sqlSession.selectOne((NAMESPACE)+".getcookOrder", co_code);
		return cvo;
	}

	
	//조리지시 수정
	@Override
	public Integer EditcookOrder(CookVO cvo) {
		logger.debug("EditProOrder() !");
		Integer result = sqlSession.selectOne(NAMESPACE+".editcookOrder",cvo);
		return result;
	}
	
	//조리지시 삭제
	@Override
	public void deletecookOrder(String co_code){
		logger.debug("dao: 작업지시 삭제 호출");
		sqlSession.delete(NAMESPACE+".deletecookOrder",co_code);
	}
	
	// 조리지시 실적등록
	@Override
	public void insertcookPerf(CookAddVO cavo) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + ".insertcookPerf", cavo);
		logger.debug("실적 등록 완료");
	}
	
	//조리 실적등록갯수
	@Override
	public Integer cooketccount(String co_code) {
		
		return sqlSession.selectOne(NAMESPACE+".cooketccount",co_code);
	}
	
	//조리 실적 목록
	@Override
	public List<CookAddVO> cooketcList(Map<String, Object> instrSearch, PageVO pageVO,String co_code) {
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
		instrSearch.put("co_code",co_code);
		List<CookAddVO> cooketcList = sqlSession.selectList(NAMESPACE+".cooketcList",instrSearch);
		return cooketcList;
	}
	
	//조리실적 삭제
	@Override
	public void cooketcDel(String cook_id) {
		sqlSession.update(NAMESPACE + ".cooketcDel", cook_id);
		logger.debug("실적 삭제 완료");
		
	}
	
	
	// 조리실적 등록 - 생산수량 증가
	
	@Override
	public void addcpQTY(CookAddVO cavo) {
		sqlSession.selectOne(NAMESPACE+".addcpQTY",cavo);
		logger.debug("생산수량 증가" + cavo);
	}
	
	//지시상태
	@Override
	public String getcookstatus(String co_code) {

		return sqlSession.selectOne(NAMESPACE+".cookstatus",co_code);
	}


	@Override
	public void updateStart(String co_code) {
		sqlSession.update(NAMESPACE+".cookturnstart", co_code);
	}
	
	@Override
	public void updateClose(String co_code) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(NAMESPACE+".cookturnend", co_code);
	}
	
	@Override
	public void updateInstr(String co_code) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(NAMESPACE+".cookturninstr", co_code);
	}
	
	@Override
	public boolean checkY(String co_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".checkY", co_code);
	}
	

	@Override
	public CookAddVO getCooketc(String cook_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getcooketc", cook_id);
	}

	@Override
	public void cfQTYDel(CookAddVO cavo) {
		sqlSession.update(NAMESPACE + ".cpqtydel", cavo);
		logger.debug("실적 생산량 삭제 완료");
		
	}

	@Override
	public Integer getCrefCount(String co_code) {
		return sqlSession.selectOne(NAMESPACE+".getCrefcount", co_code);
	}
	
	// 조리실적 수동마감
	@Override
	public void codatatusEnd(String co_code) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(NAMESPACE+".cookturnend", co_code);
	}

	@Override
	public boolean checkrecode(String re_code) {
		return sqlSession.selectOne(NAMESPACE+".checkR", re_code);
	}




























	



}// public class end
