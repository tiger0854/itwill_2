package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.persistance.EmployeeDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	// DAO-Controller 연결
	
	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private EmployeeDAO edao; // 의존성 주입
	
	// 사원 정보 등록
	@Override
	public void employeeInsert(EmployeeVO vo) {
		edao.insertEmployee(vo); // 사원정보 등록 동작	
	}// employeeInsert() method end
	
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
	public Integer alCount() {
		return edao.alCount();
	} // 일용직 수
	
	
	
	
	
	
	
	
	

	
	
	
	

//	@Override
//	public EmployeeVO employeeLogin(EmployeeVO vo) {
//		EmployeeVO resultVO = mdao.loginEmployee(vo);
//		return resultVO;
//	}// employeeLogin() method end
	
	
	

} // public class end
