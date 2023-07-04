package com.ddosirak.service;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.SalaryVO;
import com.ddosirak.persistance.EmployeeDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
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
	
	// 사원 프로필사진 등록
	@Override
	public void setEmployee_photo(int employee_id, 
			MultipartFile file, HttpServletRequest request) throws Exception{
	//  ====================사진 업로드 동작=============================
		logger.debug("controller" + file.getOriginalFilename());
		String saveName = Integer.toString(employee_id)+".png";
//		UUID uuid = UUID.randomUUID();
		
//		String picURL = uuid+"_"+saveName;
		String picURL = saveName;
		
		// 현재 프로젝트 경로 가져오기
		String absolutePath = request.getSession().getServletContext().getRealPath("/"); // 서버경로 ..
		String picPath = absolutePath+"resources\\";
		
		logger.debug("picURL: "+picURL);
		logger.debug("picPath: "+picPath);
		
		String finalURL = picPath+picURL;
		File file_send = new File(finalURL);
		file.transferTo(file_send);
		
		edao.setEmployee_photo_URL(employee_id,finalURL);
	//  ====================사진 업로드 동작============================= >> 중복사용이 있기때문에 서비스단 구현으로 변경하였음.
	}// setEmployee_photo() method end
	
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
	}// empList() method
	// 사원목록 출력 (페이징)
	@Override
	public List<EmployeeVO> empList(PageVO pageVO) {
		return edao.empList(pageVO);
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
	
	// 급여정보 조회_월별
	@Override
	public List<SalaryVO> getSalaryInfo(SalaryVO vo) {
		return edao.getSalaryInfo(vo);
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
	public List<EmployeevacationVO> myvacationList(int employee_id) {	
		System.out.println("service.employee_id"+employee_id);
		return edao.myvacationList(employee_id);
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
	
/////////////////////////////////////////AJAX동작////////////////////////////////////////////////////
	
	// 일자별 사원 출근 현황 출력
	@Override
	public List<EmployeeCheckVO> getCheckList(Timestamp date_time, int employee_id) {
		return edao.getCheckList(date_time, employee_id);
	}// getCheckList() method end
	
	// 출근자 수
	@Override
	public List<EmployeeCheckVO> getInEmp() {
		return edao.getInEmp();
	}// getInEmp() method end
	// 퇴근자 수
	@Override
	public List<EmployeeCheckVO> getOutEmp() {
		return edao.getOutEmp();
	}// getOutEmp() method end
	
	// 출근자 리스트 (페이징)
	@Override
	public List<EmployeeCheckVO> getInEmp(PageVO vo) {
		return edao.getInEmp(vo);
	}// getInEmp() method end
	// 퇴근자 리스트 (페이징)
	@Override
	public List<EmployeeCheckVO> getOutEmp(PageVO vo) {
		return edao.getOutEmp(vo);
	}// getOutEmp() method end
	
	// 필터링
	// 부서
	@Override
	public List<EmployeeVO> getEmpList_department_name(String department_name) {
		return edao.getEmpList_department_name(department_name);
	}// getEmpList_department_name() method end
	// 직위
	@Override
	public List<EmployeeVO> getEmpList_position(String position) {
		return edao.getEmpList_position(position);
	}// getEmpList_position() method end
	// 재직현황
	@Override
	public List<EmployeeVO> getEmpList_employee_status(String employee_status) {
		return edao.getEmpList_employee_status(employee_status);
	}// getEmpList_employee_status() method end
	// 사원이름
	@Override
	public List<EmployeeVO> getEmpList_employee_name(String employee_name) {
		return edao.getEmpList_employee_name(employee_name);
	}// getEmpList_employee_name() method end
	// 필터링	
	
	
		

/////////////////////////////////////////AJAX동작////////////////////////////////////////////////////
	// 휴가 삭제
	@Override
	public void vacationdelete(Integer vacation_id) {
		edao.vacationdelete(vacation_id);
	}

	
	
	
	
	
	
	
/////////////////////////////////////////휴가동작////////////////////////////////////////////////////

} // public class end
