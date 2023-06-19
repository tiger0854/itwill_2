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
import com.ddosirak.domain.EmployeevacationVO;
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

	// 사원 휴가 리스트 출력(관리자)
	@Override
	public List<EmployeevacationVO> vacationList() {
		logger.debug("vacationList()!");
		List<EmployeevacationVO> vacationList = sqlSession.selectList(NAMESPACE+".vacationList");
		return vacationList;
	}// vacationList() method end

	// 사원휴가 신청
	@Override
	public void insertVacation(EmployeevacationVO vvo) {
		// 1,2 DB 연결
		// 3, SQL작성, pstmt
		// 4. SQL 실행
		sqlSession.insert(NAMESPACE+".insertVacation", vvo);
		
		logger.debug("휴가 신청 완료!");
		logger.debug("휴가 신청 완료!"+vvo);
	}// insertVacation() method end

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
	
	
	
	
	// 나의 휴가 리스트 출력
	@Override
	public List<EmployeevacationVO> myvacationList() {
		logger.debug("myvacationList()!");
		List<EmployeevacationVO> myvacationList = sqlSession.selectList(NAMESPACE+".vacationList");
		return myvacationList;
	}// myvacationList() method end


	
	
	// 휴가 수정
	@Override
	public Integer vacationmodify(EmployeevacationVO vvo) {
		Integer result = sqlSession.selectOne(NAMESPACE+".vacationmodify",vvo);
		return result;
	}// vacationmodify() method end

	
	//휴가수정 정보 조회
	@Override
	public EmployeevacationVO vacationim(Integer vacation_id) {
		logger.debug("vacationim()!");
		EmployeevacationVO resultEVO = sqlSession.selectOne((NAMESPACE)+".vacationim", vacation_id);
		return resultEVO;
	}



}// public class end
