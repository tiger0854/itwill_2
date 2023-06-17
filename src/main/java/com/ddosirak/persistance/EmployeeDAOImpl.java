package com.ddosirak.persistance;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.SalaryVO;

//@Repository : 스프링에 해당 파일이 DAO의 동작을 하는 객체라고 등록하는 것.

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	// 1,2 DB 연결
	// 3, SQL작성, pstmt
	// 4. SQL 실행
	// 5. 데이터 처리 ... 기존에 DAO에서 하던 일!!
	
	// 1,2 DB 연결			> SqlSessionFactory 객체 주입
	@Inject
//	private SqlSessionFactory sqlFactory; // bean으로 인식된다.
	private SqlSession sqlSession; // sqlFactory는 select() 사용이 불가능하여 변경, 이후 다른 객체를 주입받아 사용할거임!
	// 3, SQL작성, pstmt	> memberMapper.xml에 작성하였음
	
	private static final String NAMESPACE="com.ddosirak.mapper.EmployeeMapper";
	// 상수는 final인데 왜 static 주나 ? > 관례적인것 ,,
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeDAOImpl.class);
	
/////////////////////////////////////////사원동작////////////////////////////////////////////////////	
	// C - 사원등록
	@Override
	public void insertEmployee(EmployeeVO vo) {
		// 1,2 DB 연결
		// 3, SQL작성, pstmt
		// 4. SQL 실행
//		sqlSession.insert("com.itwillbs.mapper.MemberMapper"+".insertMember", parameter);
		sqlSession.insert(NAMESPACE+".insertEmployee", vo); // ". 주의 !!"
		logger.debug("사원 등록 완료!");

	}//insertMember() method end

	// 사원번호중 가장 큰 번호
	@Override
	public Integer getMaxId() {
		logger.debug("getMaxId()!");
		int result = 1000;
		if(sqlSession.selectOne((NAMESPACE)+".getMaxEmployee_id") != null) {
			result = sqlSession.selectOne((NAMESPACE)+".getMaxEmployee_id");
		}		
		return result+1;
	}// getMaxId() method end
	
	// 사원번호중 가장 큰 번호 (일용직) 
	@Override
	public Integer getMaxId_al() {
		logger.debug("getMaxId_al()!");
		int result = 10000;
		if(sqlSession.selectOne((NAMESPACE)+".getMaxEmployee_id_al") != null) {
			result = sqlSession.selectOne((NAMESPACE)+".getMaxEmployee_id_al");
		}		
		return result+1;
	}// getMaxId_al() method end

	// 사원정보 조회
	@Override
	public EmployeeVO getEmployee(int employee_id) {
		logger.debug("getEmployee()!");
		EmployeeVO resultVO = sqlSession.selectOne((NAMESPACE)+".getEmployee", employee_id);
		return resultVO;
	}// getEmployee() method end

	// 사원목록 출력
	@Override
	public List<EmployeeVO> empList() {
		logger.debug("empList()!");
		List<EmployeeVO> empList = sqlSession.selectList(NAMESPACE+".empList");
		return empList;
	}// empList() method end

	//사원정보 수정
	@Override
	public Integer updateEmployee(EmployeeVO vo) {
		logger.debug("updateEmployee() !");
		 Integer result = sqlSession.selectOne(NAMESPACE+".updateEmployee",vo);
		 return result;
	}// updateEmployee() method
	
	// 직원수 카운트
	@Override
	public Integer empCount() {
		return sqlSession.selectOne(NAMESPACE+".empCount");
	}// empCount() method end
	@Override
	public Integer alCount_all() {
		return sqlSession.selectOne(NAMESPACE+".alCount_all");
	}// alCount_all() method end
	@Override
	public Integer alCount_am() {
		return sqlSession.selectOne(NAMESPACE+".alCount_am");
	}// alCount_am() method end
	@Override
	public Integer alCount_pm() {
		return sqlSession.selectOne(NAMESPACE+".alCount_pm");
	}// alCount_pm() method end
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	
	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////	
	// 급여정보 조회
	@Override
	public List<SalaryVO> getSalaryInfo(int employee_id) {
		logger.debug("getSalaryInfo() !");
		List<SalaryVO> salaryList = sqlSession.selectList(NAMESPACE+".getSalaryinfo",employee_id);
		return salaryList;
	}// getSalaryInfo() method end
	
	// 급여 정보 등록
	@Override
	public void salaryInsert(EmployeeVO vo) {
		logger.debug("salaryInsert() !");
		sqlSession.update(NAMESPACE+".salaryInsert",vo);
	}// getSalaryInfo() method end
	
	// 급여 지급
	@Override
	public void salaryPay(int employee_id) {
		logger.debug("salaryPay() !");
		sqlSession.insert(NAMESPACE+".salaryPay",employee_id);
	}//salaryPay() method end
	// 일용직 급여 지급
	@Override
	public void al_salaryPay(int employee_id) {
		logger.debug("al_salaryPay() !");
		sqlSession.insert(NAMESPACE+".al_salaryPay",employee_id);
	}//al_salaryPay() method end
	
	// 사원 급여정보 조회
	@Override
	public SalaryVO getEmpSalaryInfo(SalaryVO vo) {
		logger.debug("getEmpSalaryInfo() !");
		SalaryVO svo = sqlSession.selectOne(NAMESPACE+".getEmpSalaryinfo",vo);
		return svo;
	}// getEmpSalaryInfo() method end
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	// R - 로그인
//	@Override
//	public EmployeeVO loginMember(EmployeeVO vo) {
//		logger.debug("테스트 > DAO 호출 : 로그인 동작 수행");
//		// sql구문 작성
//		logger.debug("DAO > mapper 사용 > sql 실행");
//		EmployeeVO resultVO 
//			= sqlSession.selectOne(NAMESPACE + ".login", vo); // id, pw (sql구문 실행)
//		// 데이터 전달
//		logger.debug("SQL 실행결과를 리턴! > 테스트로 전달");
//		logger.debug(resultVO+"");
//		return resultVO; // 결과가 없는경우 null을 리턴하는 메서드임.
//	}//loginMember() method end
	
	// 오버로딩된 메서드를 오버라이딩.
//	@Override
//	public EmployeeVO loginMember(String id, String pw) {
//		// 아이디, 비밀번호를 전달받아서 사용. 
//		// >> 1개 이상의 정보를 mapper에 각각 전달이 불가능 .. > VO객체에 저장하면 사용가능!
////		MemberVO vo = new MemberVO();
////		vo.setUser_id(user_id);
////		vo.setUser_pw(user_pw);
//		
//		// 만약 전달된 정보가 하나의 객체에 저장이 불가능한 경우는? > Map을 사용한다.
//		Map<String, Object> params = new HashMap<String, Object>();
//		
//		// params.put("mapper에 매핑된 이름", 전달되는 값)
//		params.put("user_id", id);
//		params.put("user_pw", pw);
//		
//		// SQL 호출, 실행
////		sqlSession.selectOne(NAMESPACE+".login",vo); 
//		sqlSession.selectOne(NAMESPACE+".login",params); // > 단일 객체에 담기 어려운 경우, Map을 활용하기! 
//		// > 가능은 하지만, 일을 두번하는 느낌 .. 그냥 DAO에서 미리 조정하여 객체단위로 가져오는것이 낫다!
//		return null;
//	}//loginMember() method end
	
	
	// U - 회원정보 수정
//	@Override
//	public Integer updateMember(EmployeeVO uvo) {
//		logger.debug("테스트 > DAO 호출 : 회원정보 수정!");
//		// 수정할 정보를 가져옴 (uvo)
//		logger.debug("DAO > mapper 호출 > SQL 실행!");
//		Integer result
//			= sqlSession.update(NAMESPACE+".update", uvo); // 업데이트된 rows(행)의 수를 리턴한다.
//		
//		logger.debug("SQL 실행결과를 리턴!");
//		
//		return result;
//	}// updateMember() method end

	// D - 회원정보 삭제
//	@Override
//	public Integer deleteMember(EmployeeVO dvo) {
//		logger.debug("테스트 > DAO 호출 : 회원정보 삭제!");
//		// 수정할 정보를 가져옴 (dvo)
//		logger.debug("DAO > mapper 호출 > SQL 실행!");
//		Integer result
//			= sqlSession.delete(NAMESPACE+".delete",dvo);
//		logger.debug("SQL 실행결과를 리턴!");
//		
//		return result;
//	}//deleteMember() method end


}// public class end
