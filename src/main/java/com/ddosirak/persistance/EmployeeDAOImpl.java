package com.ddosirak.persistance;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;
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
	
	// 사원 프로필사진 등록
	@Override
	public void setEmployee_photo_URL(int employee_id, String finalURL) {
		EmployeeVO vo = new EmployeeVO();
		vo.setEmployee_id(employee_id);
		vo.setEmployee_photo(finalURL);
		sqlSession.update(NAMESPACE+".setEmployee_photo_URL", vo); 
	}// setEmployee_photo_URL() method end

	// 사원 아이디비밀번호 설정
	@Override
	public void setEmployeeIDPW(EmployeeVO vo) {
		LoginVO lvo = new LoginVO();
		lvo.setEmployee_id(Integer.toString(vo.getEmployee_id()));
		lvo.setEmployee_pw(Integer.toString(vo.getEmployee_id()));
		lvo.setEmployee_name(vo.getEmployee_name());
		sqlSession.insert(NAMESPACE+".setEmployeeIDPW", lvo); 
	}// setEmployeeIDPW() method end

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
		List<EmployeeVO> empList = sqlSession.selectList(NAMESPACE+".empListAll");
		return empList;
	}//empList() method end
	
	// 사원목록 출력 (페이징)
	@Override
	public List<EmployeeVO> empList(PageVO pageVO) {
		logger.debug("empList()!");
		List<EmployeeVO> empList = sqlSession.selectList(NAMESPACE+".empList",pageVO);
		return empList;
	}// empList() method end
	
	// 퇴사자 수
	@Override
	public Integer countExpEmp() {
		logger.debug("countExpEmp()!");
		return sqlSession.selectOne(NAMESPACE+".countExpEmp");
	}// countExpEmp() method end

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
		return sqlSession.selectList(NAMESPACE+".getSalaryinfo",employee_id);
	}// getSalaryInfo() method end
	// 급여정보 조회(월별)
	@Override
	public List<SalaryVO> getSalaryInfo(SalaryVO vo) {
		logger.debug("getSalaryInfo_MONTH() !");
		return sqlSession.selectList(NAMESPACE+".getSalaryinfo_ajax",vo);
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
/////////////////////////////////////////급여동작////////////////////////////////////////////////////	
	
/////////////////////////////////////////휴가동작////////////////////////////////////////////////////	
	
	// 사원 휴가 리스트 출력(관리자)
		@Override
		public List<EmployeevacationVO> vacationList(PageVO pageVO) {
			logger.debug("vacationList()!");
			List<EmployeevacationVO> vacationList = sqlSession.selectList(NAMESPACE+".vacationList",pageVO);
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
	
	// 나의 휴가 리스트 출력
	@Override
	public List<EmployeevacationVO> myvacationList(int employee_id) {
		logger.debug("@@@@@implmyvacationList(int employee_id)!"+employee_id);
		List<EmployeevacationVO> myvacationList = sqlSession.selectList(NAMESPACE+".myvacationList",employee_id);
		return myvacationList;
	}// myvacationList() method end

	// 휴가 수정
	@Override
	public Integer vacationmodify(EmployeevacationVO vvo) {
		
		logger.debug("vvo"+vvo);
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
	
	// 휴가 삭제
		@Override
		public void vacationdelete(Integer vacation_id) {
			logger.debug("vacationdelete()!");
			sqlSession.delete(NAMESPACE + ".vacationdelete", vacation_id);
		}// vacationdelete() method end
	
	// 휴가 승인
		@Override
		public Integer vacationapprove(Integer vacation_id, int id) {
			String vacationfind=sqlSession.selectOne(NAMESPACE+".vacationfind", id);
			Map<String, Object> vacationmap=new HashMap<String, Object>();
			vacationmap.put("vacation_id", vacation_id);
			vacationmap.put("approve_emp", vacationfind);
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vacationmap);
			Integer result = sqlSession.update(NAMESPACE+".vacationapprove",vacationmap);
			return result;
		}
		
	// 휴가 반려
		@Override
		public Integer vacationreturn(Integer vacation_id, int id) {
			String vacationfind=sqlSession.selectOne(NAMESPACE+".vacationfind", id);
			Map<String, Object> vacationmap=new HashMap<String, Object>();
			vacationmap.put("vacation_id", vacation_id);
			vacationmap.put("approve_emp", vacationfind);
			Integer result = sqlSession.update(NAMESPACE+".vacationreturn",vacationmap);
			return result;
		}
	// 아이디 찾기
		@Override
		public String vacationfind(int id) {
			
			return sqlSession.selectOne(NAMESPACE+".vacationfind", id);
		}
		
	// 사원 휴가관리 페이지 페이징
		@Override
		public Integer countRetOrdList(PageVO pageVO) {
			logger.debug("countRetOrdList()!!");
			return sqlSession.selectOne(NAMESPACE+".vacationcount",pageVO);
		}
		
	// 휴가 개수 출력
		@Override
		public Integer vacount() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(NAMESPACE+".vacount");
		}
		
	// 휴가 예정자 사원 개수 출력 
		@Override
		public Integer pvacount() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(NAMESPACE+".pvacount");
		}
		
	// 휴가 복귀자 사원 개수 출력
		@Override
		public Integer bvacount() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(NAMESPACE+".bvacount");
		}
		
	
/////////////////////////////////////////휴가동작////////////////////////////////////////////////////	

	
/////////////////////////////////////////AJAX동작////////////////////////////////////////////////////
	
	// 일자별 사원 출근 현황 출력
	@Override
	public List<EmployeeCheckVO> getCheckList(Timestamp date_time, int employee_id) {
		logger.debug("getCheckList()!!");
		EmployeeCheckVO vo = new EmployeeCheckVO();
		vo.setDate_time(date_time);
		vo.setEmployee_id(employee_id);
		return sqlSession.selectList(NAMESPACE+".getCheckList", vo);
	}// getCheckList() method end


	


	



	// 출근인원 조회
	@Override
	public List<EmployeeCheckVO> getInEmp() {
		logger.debug("getInEmp()!!");
		return sqlSession.selectList(NAMESPACE+".getInEmp");
	}// getInEmp() method end
	// 퇴근인원 조회
	@Override
	public List<EmployeeCheckVO> getOutEmp() {
		logger.debug("getOutEmp()!!");
		return sqlSession.selectList(NAMESPACE+".getOutEmp");
	}// getOutEmp() method end
	
	// 출근인원 조회 페이징
	@Override
	public List<EmployeeCheckVO> getInEmp(PageVO vo) {
		logger.debug("getInEmp()!!");
		return sqlSession.selectList(NAMESPACE+".getInEmpPage",vo);
	}// getInEmp() method end
	// 퇴근인원 조회 페이징
	@Override
	public List<EmployeeCheckVO> getOutEmp(PageVO vo) {
		logger.debug("getOutEmp()!!");
		return sqlSession.selectList(NAMESPACE+".getOutEmpPage",vo);
	}// getOutEmp() method end

	
	// 필터링
	// 부서
	@Override
	public List<EmployeeVO> getEmpList_department_name(String department_name) {
		logger.debug("getEmpList_department_name()!!");
		return sqlSession.selectList(NAMESPACE+".getEmpList_department_name",department_name);
	}// getEmpList_department_name() method end
	// 직위
	@Override
	public List<EmployeeVO> getEmpList_position(String position) {
		logger.debug("getEmpList_position()!!");
		return sqlSession.selectList(NAMESPACE+".getEmpList_position",position);
	}// getEmpList_position() method end
	// 재직현황
	@Override
	public List<EmployeeVO> getEmpList_employee_status(String employee_status) {
		logger.debug("getEmpList_employee_status()!!");
		return sqlSession.selectList(NAMESPACE+".getEmpList_employee_status",employee_status);
	}// getEmpList_employee_status() method end
	// 이름
	@Override
	public List<EmployeeVO> getEmpList_employee_name(String employee_name) {
		logger.debug("getEmpList_employee_name()!!");
		return sqlSession.selectList(NAMESPACE+".getEmpList_employee_name",employee_name);
	}// getEmpList_employee_name() method end
	

/////////////////////////////////////////AJAX동작////////////////////////////////////////////////////



	





	
	
	
	
	

	

/////////////////////////////////////////사원휴가////////////////////////////////////////////////////
}// public class end
