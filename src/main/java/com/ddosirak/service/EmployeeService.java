package com.ddosirak.service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.domain.SalaryVO;

public interface EmployeeService {
	
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	// 사원정보 등록
	public void employeeInsert(EmployeeVO vo);
	// 사원정보 등록간 사원 아이디 비밀번호 설정
	public void setEmployeeIDPW(EmployeeVO vo);
	// 사원 사진 등록
	public void setEmployee_photo(int employee_id, MultipartFile employee_photo_link, HttpServletRequest request) throws Exception;
	
	// 최대 사원번호 구하기
	public Integer getMaxId();
	// 사원번호중 가장 높은 번호 (일용직)
	public Integer getMaxId_al();
	
	public Integer empCount(); 	// 임직원 수
	public Integer alCount_all();	// 일용직 수, 전일
	public Integer alCount_am();	// 일용직 수, 오전
	public Integer alCount_pm();	// 일용직 수, 오후
	
	// 사원정보 조회
	public EmployeeVO getEmployee(int employee_id);
	
	// 사원 목록 출력
	public List<EmployeeVO> empList();
	
	// 사원 정보 수정
	public Integer updateEmployee(EmployeeVO vo);
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	// 급여정보 조회
	public List<SalaryVO> getSalaryInfo(int employee_id);
	// 급여정보 등록
	public void salaryInsert(EmployeeVO vo);
	// 급여 지급
	public void salaryPay(int employee_id);
	// 일용직 급여 지급
	public void al_salaryPay(int employee_id);
	// 사원 급여 지급 정보 조회 (개인)
	public SalaryVO getEmpSalaryInfo(SalaryVO vo);

/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	
	// 사원 휴가 목록 출력(관리자)
	public List<EmployeevacationVO> vacationList();
	
	// 사원휴가 신청
	public void insertVacation(EmployeevacationVO vvo);
	
	// 나의 휴가 리스트 출력
	public List<EmployeevacationVO> myvacationList();
	
	// 휴가 수정
	public Integer vacationmodify(EmployeevacationVO vvo);
	
	// 휴가 수정 정보 조회
	public EmployeevacationVO vacationim(Integer vacation_id);

} // interface end
