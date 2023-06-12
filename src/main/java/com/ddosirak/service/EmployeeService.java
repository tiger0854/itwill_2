package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.EmployeeVO;

public interface EmployeeService {
	
	// 사원정보 등록
	public void employeeInsert(EmployeeVO vo);
	
	// 최대 사원번호 구하기
	public Integer getMaxId();
	// 사원번호중 가장 높은 번호 (일용직)
	public Integer getMaxId_al();
	
	public Integer empCount(); 	// 임직원 수
	public Integer alCount();	// 일용직 수
	
	// 사원정보 조회
	public EmployeeVO getEmployee(int employee_id);
	
	// 사원 목록 출력
	public List<EmployeeVO> empList();
	
	// 사원 정보 수정
	public Integer updateEmployee(EmployeeVO vo);
	
	// 로그인
//	public EmployeeVO employeeLogin(EmployeeVO vo);// id,pw 들어감.

} // interface end
