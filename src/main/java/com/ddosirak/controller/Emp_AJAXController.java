package com.ddosirak.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.SalaryVO;
import com.ddosirak.service.EmployeeService;

@Controller
@RequestMapping(value="/emp_ajax/*")
public class Emp_AJAXController {
	
	private static final Logger logger = LoggerFactory.getLogger(Emp_AJAXController.class);
	
	@Inject
	private EmployeeService eService;
 	
	// 사원 개인별 일별 출퇴근 현황 확인
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public Object empCheckAjax(@RequestParam("date_time")Timestamp date_time, @RequestParam("employee_id")int employee_id) throws Exception{
		logger.debug("empCheckAjax() 호출! Σ(っ °Д °;)っ");
		EmployeeCheckVO vo = new EmployeeCheckVO();
		vo.setDate_time(date_time);
		vo.setEmployee_id(employee_id);
		
		// 날짜에 따른 값 반환
		List<EmployeeCheckVO> voList = eService.getCheckList(date_time, employee_id);
		logger.debug("voList > "+ voList);
//		// 값 전달, 방법 다를수도 있음 !!
//		model.addAttribute("checkList", voList); // model 사용 X
		
		return voList;
	}// empCheckAjax() method end
	
	// 전체 임직원 출근 현황
	@RequestMapping(value = "/inCheck", method = RequestMethod.POST)
	@ResponseBody
	public int empInCheckAjax() throws Exception{
		logger.debug("empInCheckAjax() 호출! Σ(っ °Д °;)っ");	
		int in_emp = eService.getInEmp().size();
		return in_emp;
	}// empInCheckAjax() method end
	// 전체 임직원 퇴근 현황
	@RequestMapping(value = "/outCheck", method = RequestMethod.POST)
	@ResponseBody
	public int empOutCheckAjax() throws Exception{
		logger.debug("empOutCheckAjax() 호출! Σ(っ °Д °;)っ");	
		int out_emp = eService.getOutEmp().size();
		return out_emp;
	}// empOutCheckAjax() method end
	
	// 필터링
	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	@ResponseBody
	public List<EmployeeVO> filterAJAX(@RequestParam("department_name")String department_name, @RequestParam("position")String position, 
			@RequestParam("employee_status")String employee_status, @RequestParam("employee_name")String employee_name) throws Exception{
		logger.debug("filterAJAX() 호출! Σ(っ °Д °;)っ");	
			List<EmployeeVO> filterList_sum = new ArrayList<EmployeeVO>();
			int checkCount = 0;
			boolean listSizeCheck = true;
		// --------------1. 전달받은 값이 있는지 체크하고 각 값마다 검색리스트 반환 !!!!!!!!!!------------------
		// 부서 체크
		if(!department_name.equals("선택없음")) {
			List<EmployeeVO> filterList_department_name = eService.getEmpList_department_name(department_name);
//			logger.debug("부서 > "+filterList_department_name);
			
			for(EmployeeVO vo:filterList_department_name) {
				filterList_sum.add(vo);
			} // for_add end
			
			if(filterList_department_name.size() != 0) {
				checkCount++;
			} // count if end
			else {
				// 리스트 사이즈가 0인경우
				listSizeCheck = false;
			}
			logger.debug("반환한 부서 리스트 크기: "+filterList_department_name.size());
		}else {
			logger.debug("부서 정보 없음");
		} // 부서 i-e end
		
		// 직위 체크
		if(!position.equals("선택없음")) {
			List<EmployeeVO> filterList_position = eService.getEmpList_position(position);
//			logger.debug("직위 > "+filterList_position);
			
			for(EmployeeVO vo:filterList_position) {
				filterList_sum.add(vo);
			} // for_add end
			
			if(filterList_position.size() != 0) {
				checkCount++;
			} // count if end
			else {
				// 리스트 사이즈가 0인경우
				listSizeCheck = false;
			}
			logger.debug("반환한 직위 리스트 크기: "+filterList_position.size());
		}else {
			logger.debug("직위 정보 없음");
		}// 직위 i-e end
		
		// 재직현황 체크
		if(!employee_status.equals("선택없음")) {
			List<EmployeeVO> filterList_employee_status = eService.getEmpList_employee_status(employee_status);
//			logger.debug("재직현황 > "+filterList_employee_status);
			
			for(EmployeeVO vo:filterList_employee_status) {
				filterList_sum.add(vo);
			} // for_add end
			
			if(filterList_employee_status.size() != 0) {
				checkCount++;
			} // count if end
			else {
				// 리스트 사이즈가 0인경우
				listSizeCheck = false;
			}
			logger.debug("반환한 재직현황 리스트 크기: "+filterList_employee_status.size());
		}else {
			logger.debug("재직현황 정보 없음");
		}// 재직현황 i-e end
		
		// 이름 체크
		employee_name = employee_name.trim();
		if(employee_name != "") {
			List<EmployeeVO> filterList_employee_name = eService.getEmpList_employee_name(employee_name);
//			logger.debug("이름 > "+filterList_employee_name);
			
			for(EmployeeVO vo:filterList_employee_name) {
				filterList_sum.add(vo);
			} // for_add end 
			
			if(filterList_employee_name.size() != 0) {
				checkCount++;
			} // count if end
			else {
				// 리스트 사이즈가 0인경우
				listSizeCheck = false;
			}
			
			logger.debug("반환한 이름 리스트 크기: "+filterList_employee_name.size());
		}else {
			logger.debug("이름 정보 없음");
		}// 이름 i-e end
		// --------------1. 전달받은 값이 있는지 체크하고 각 값마다 검색리스트 반환 !!!!!!!!!!------------------
		
		// --------------2. 리스트끼리 중복값 대조하고 중복값 삭제 !!!!!!!!!!------------------
		List<EmployeeVO> filtetList_dupVal = new ArrayList<EmployeeVO>();
		logger.debug("조건의 수: "+checkCount);
//		logger.debug("검색결과 리스트 (중복값 있음)" + filterList_sum);
		if(listSizeCheck) {
			// 반환되는 모든 리스트의 사이즈가 0 이상인 경우
			for(int i=0;i<filterList_sum.size();i++) {
//			logger.debug("불러와진 사원번호"+filterList_sum.get(i).getEmployee_id());
				int countVal = 0;
				for(int j=0;j<i;j++) {
					if(filterList_sum.get(i).getEmployee_id() == filterList_sum.get(j).getEmployee_id()) {
						countVal++;
					}// if end
				}// dup_for end
				
				if(countVal == checkCount-1 ) {
					filtetList_dupVal.add(filterList_sum.get(i));
				}// if end
				
			}// for end
		}else {
			// 반환되는 리스트중 하나라도 사이즈가 0인 경우 (중복값이 존재하지 않는 경우)
			logger.debug("필터링결과 없음!");
		}// else end
		
		// --------------2. 리스트끼리 중복값 대조하고 중복값 삭제!!!!!!!!!!------------------
		
		// --------------3. 리스트 반환------------------

		return filtetList_dupVal;
	}// filterAJAX() method end
	
	// 월별 급여정보 
	@RequestMapping(value = "/salaryInfoAJAX", method = RequestMethod.POST)
	@ResponseBody
	public List<SalaryVO> salaryInfoGET(@RequestParam("dateData")Date dateData, @RequestParam("employee_id")int employee_id) throws Exception{
		logger.debug("salaryInfoGET() 호출! Σ(っ °Д °;)っ");
		SalaryVO vo = new SalaryVO();
		vo.setEmployee_id(employee_id);
		vo.setSal_date(dateData);
		
		logger.debug("vo: "+vo);
		
		return eService.getSalaryInfo(vo);
	}// salaryInfoGET() method end



}// public class end
