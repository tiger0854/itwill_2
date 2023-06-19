package com.ddosirak.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.domain.SalaryVO;
import com.ddosirak.persistance.EmployeeDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	// DAO-Controller 연결
	
	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private EmployeeDAO edao; // 의존성 주입
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	// 사원 정보 등록
	@Override
	public void employeeInsert(EmployeeVO vo) {
		edao.insertEmployee(vo); // 사원정보 등록 동작	
	}// employeeInsert() method end
	// 사원 아이디비밀번호 부여
	@Override
	public void setEmployeeIDPW(EmployeeVO vo) {
		edao.setEmployeeIDPW(vo);
	}// setEmployeeIDPW() method end


	// 최대 사원번호 구하기
	@Override
	public Integer getMaxId() {
		int result = edao.getMaxId();
		return result;
	}// getMaxId() method end
	
	// 최대 사원번호 구하기 (일용직)
	@Override
	public Integer getMaxId_al() {
		int result = edao.getMaxId_al();
		return result;
	}// getMaxId_al() method end
	
	// 사원정보 조회
	@Override
	public EmployeeVO getEmployee(int employee_id) {
		EmployeeVO resultVO = edao.getEmployee(employee_id);
		return resultVO;
	}//getEmployee() method end

	// 사원목록 출력
	@Override
	public List<EmployeeVO> empList() {
		return edao.empList();
	}//empList() method end
	
	// 사원 정보 수정
	@Override
	public Integer updateEmployee(EmployeeVO vo) {
		return edao.updateEmployee(vo);
	}// updateEmployee() method end
	
	// 사원 수
	@Override
	public Integer empCount() {
		return edao.empCount();
	} // 임직원 수
	@Override
	public Integer alCount_all() {
		return edao.alCount_all();
	} // 일용직 수, 전일
	@Override
	public Integer alCount_am() {
		return edao.alCount_am();
	} // 일용직 수, 오전
	@Override
	public Integer alCount_pm() {
		return edao.alCount_pm();
	} // 일용직 수, 오후
/////////////////////////////////////////사원동작////////////////////////////////////////////////////

	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	// 급여정보 조회
	@Override
	public List<SalaryVO> getSalaryInfo(int employee_id) {
		return edao.getSalaryInfo(employee_id);
	}//getSalaryInfo() method end
	
	// 급여 등록
	@Override
	public void salaryInsert(EmployeeVO vo) {
		edao.salaryInsert(vo);	
	}// salaryInsert() method end

	// 급여 지급
	@Override
	public void salaryPay(int employee_id) {
		edao.salaryPay(employee_id);
	}// salaryPay() method end
	// 일용직 급여 지급
	@Override
	public void al_salaryPay(int employee_id) {
		edao.al_salaryPay(employee_id);
	}// al_salaryPay() method end
	
	// 사원 급여정보 조회
	@Override
	public SalaryVO getEmpSalaryInfo(SalaryVO vo) {
		return edao.getEmpSalaryInfo(vo);
	}//getEmpSalaryInfo() method end
	
	
	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	
/////////////////////////////////////////휴가 동작////////////////////////////////////////////////////
	
	// 사원목록 출력
	
	// 사원휴가 리스트 출력(관리자)
	@Override
	public List<EmployeevacationVO> vacationList() {
		return edao.vacationList();
	} // vacationList() method end

	// 사원휴가 신청
	@Override
	public void insertVacation(EmployeevacationVO vvo) {
		edao.insertVacation(vvo);
	}// insertVacation() method end

	
	// 나의 휴가 리스트 출력
	@Override
	public List<EmployeevacationVO> myvacationList() {	
		return edao.myvacationList();
	}// myvacationList() method end

	
	
	// 휴가 수정
	@Override
	public Integer vacationmodify(EmployeevacationVO vvo) {
		Integer result = edao.vacationmodify(vvo);
		return result;
	}

	
	// 휴가 수정 정보 조회
	@Override
	public EmployeevacationVO vacationim(Integer vacation_id) {
		EmployeevacationVO resultEVO = edao.vacationim(vacation_id);
		return resultEVO;
	}
	
/////////////////////////////////////////휴가 동작////////////////////////////////////////////////////	

	

} // public class end
