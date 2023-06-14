package com.ddosirak.persistance;

import java.sql.Date;
import java.util.List;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.SalaryVO;

// persistance 영속성 > DB관련 처리

public interface EmployeeDAO {
	// 필요한 동작들을 추상메서드를 사용하여 정의! (만들어두기만 한다.)
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	// C - 사원정보 등록
	public void insertEmployee(EmployeeVO vo); 
	
	// 사원번호중 가장 높은 번호
	public Integer getMaxId();
	// 사원번호중 가장 높은 번호 (일용직)
	public Integer getMaxId_al();
	
	public Integer empCount(); 	// 임직원 수
	public Integer alCount();	// 일용직 수
	
	// 사원정보 조회
	public EmployeeVO getEmployee(int employee_id);
	
	// 사원 리스트 출력
	public List<EmployeeVO> empList();
	
	// 사원정보 수정
	public Integer updateEmployee(EmployeeVO vo);
/////////////////////////////////////////사원동작////////////////////////////////////////////////////
	
	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	// 급여정보 조회
	public List<SalaryVO> getSalaryInfo(int employee_id);
	// 급여정보 등록
	public void salaryInsert(EmployeeVO vo);
	// 급여 지급
	public void salaryPay(int employee_id);
	// 사원 급여 지급 정보 조회 (개인)
	public SalaryVO getEmpSalaryInfo(SalaryVO vo);
	
	
/////////////////////////////////////////급여동작////////////////////////////////////////////////////
	// R - 로그인
//	public EmployeeVO loginMember(EmployeeVO vo);
//	public EmployeeVO loginMember(String id, String pw); // 메서드 오버로딩 (기존 방식, VO객체를 가능하면 항상 사용해야 한다.)
	
	// U - 회원정보 수정
//	public Integer updateMember(EmployeeVO uvo); // 참조를 위해서 Integer으로 입력
	
	// D - 회원정보 삭제
//	public Integer deleteMember(EmployeeVO dvo); // 참조를 위해서 Integer으로 입력
	
}// public interface end
