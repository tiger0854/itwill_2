package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.service.EmployeeService;

// 컨트롤러 구현 전 정하면 좋은 것들.
// - 컨트롤러별 공통 주소 (URI) 설계
// - 각 기능별 주소(URI) 설계
// - 각 URI별 호출방식 설정(GET/POST) 
//		> 사용자의 정보입력,조회(GET)
//		> 데이터 처리, Db접근(POST)  >> 해당 분류가 일반적인 방식.
// - 결과처리, 페이지 이동 설계
// - 예외처리


@Controller
@RequestMapping(value="/emp/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스의 정보가 필요함. > 의존관계
	@Inject
	private EmployeeService eService;
	
	// 동작 구현 > 메서드 설계
	
	
////////////////////////////////////////////////////사원 관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/member/MemberJoin.me
	// http://localhost:8088/emp/insert
	// 회원가입 처리 - 정보 입력
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void employeeInsertGET() {
		logger.debug("employeeInsertGET() 호출![]~(￣▽￣)~*");
		logger.debug("/emp/insert.jsp로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
//		return "/emp/emp_add";
	}// employeeInsertGET() method end
	// 회원가입 처리 - 정보 처리
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String employeeInsertPOST(EmployeeVO vo) {	
		logger.debug("employeeInsertPOST() 호출![]~(￣▽￣)~*");
		logger.debug(vo+" ");
		// 사원번호 부여 동작
		logger.debug("!!!!"+vo.getPosition());
		if(vo.getPosition().equals("일용")) {
			// 일용직 사원의 직번
			vo.setEmployee_id(eService.getMaxId_al());
		}else {
			// 임직원의 직번
			vo.setEmployee_id(eService.getMaxId());
		}// i-e end
		// 서비스 > 사원 추가 메서드 호출
		// >> DAO > 사원 추가 메서드 호출
		eService.employeeInsert(vo);
		
		logger.debug(">> vo: "+vo);
		// 페이지 이동
		
		return "redirect:/emp/list"; // 주소를 변경하면서 페이지 이동
	}// employeeInsertPOST() method end수행할 수 
	// >> GET / POST 의 전달방식을 사용하여 하나의 메서드로 두가지 동작을 있다.
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void employeeInfoGET(int employee_id, Model model) {
		logger.debug("employeeInfoGET() 호출![]~(￣▽￣)~*");
		// 0609, 페이지 이동간에 정보전달 방법 찾아본 후 마저 코드 짜기. // 해결
		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
	}//employeeInfoGET() method end
	
	@RequestMapping(value = "/info", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
	public String employeeUpdate(EmployeeVO vo) { // (listPOST)
		logger.debug("employeeUpdate() 호출![]~(￣▽￣)~*");
		logger.debug("vo > "+vo);
		
		 eService.updateEmployee(vo);

		return "redirect:/emp/info?employee_id="+vo.getEmployee_id();
	}// employeeUpdate() method end
	
	// http://localhost:8088/emp/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(Model model) {
		logger.debug("listGET() 호출![]~(￣▽￣)~*");
		
		List<EmployeeVO> empList = eService.empList();
		int empCount = eService.empCount();
		int alCount = eService.alCount();
		model.addAttribute("empList",empList);
		model.addAttribute("empCount",empCount);
		model.addAttribute("alCount",alCount);
		
	}//listGET() method end
	
////////////////////////////////////////////////////사원 관리//////////////////////////////////////////////////////////////////////////////
	
////////////////////////////////////////////////////급여 관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/emp/salary
	// 급여관리 메인페이지
	@RequestMapping(value = "/salary", method = RequestMethod.GET)
	public void salaryGET(Model model) {
		logger.debug("salaryGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
		// 사원 목록 불러오기
		List<EmployeeVO> empList = eService.empList();
		model.addAttribute("empList",empList);
		
	}// salaryGET() method end
	
	// 사원 급여조회 페이지
	@RequestMapping(value = "/salaryInfo", method = RequestMethod.GET)
	public void salaryInfoGET(Model model, int employee_id) {
		logger.debug("salaryInfoGET() 호출![]~(￣▽￣)~*");

		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
		
	}//  salaryInfoGET() method end
	
	// 사원 급여 등록 및 수정 페이지
	@RequestMapping(value = "/salaryInsert", method = RequestMethod.GET)
	public void salaryInsertGET(Model model) {
		logger.debug("salaryInsertGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
	}// salaryInsertGET() method end
	
	
	
	
////////////////////////////////////////////////////급여 관리//////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
////////////////////////////////////////////////////휴가 관리/////////////////////////////////////////////////////////////////////////////	
	
//	 http://localhost:8088/emp/vacationlist
		// 휴가관리 리스트페이지(관리자)
		@RequestMapping(value = "/vacationlist", method = RequestMethod.GET)
		public void vacationGET(Model model) {
			logger.debug("vacationGET() 호출![]~(￣▽￣)~*");
			logger.debug("페이지 이동!");
			
			// 사원 목록 불러오기
			List<EmployeevacationVO> vacationList = eService.vacationList();
			model.addAttribute("vacationList",vacationList);
			
			
		}// vacationGET() method end
		
		// http://localhost:8088/emp/myvacationList
		// 나의 휴가내역 리스트 페이지
		@RequestMapping(value = "/myvacationList", method = RequestMethod.GET)
		public String myvacationList(Model model, @ModelAttribute("result")String result) {
			logger.debug("myvacation() 호출!");
			logger.debug("result :"+result);
			
			// 서비스 - DB에 저장된 글 정보를 가져오기
			List<EmployeevacationVO> myvacationList = eService.myvacationList();
			logger.debug("myvacationList", myvacationList);
			// 연결된 뷰페이지로 전달(뷰-출력)
			model.addAttribute("myvacationList", myvacationList);
			return "/emp/myvacationList";
		}
		
		
		
		// 나의 휴가내역 리스트 페이지
	
//	http://localhost:8088/emp/vacationregist
		// 휴가 신청 페이지	
		// 글쓰기 - /emp/regist (GET)
		@RequestMapping(value = "/vacationregist", method = RequestMethod.GET)
		public void vacationregist(Model model) throws Exception{
			logger.debug("vacationregist() 호출!");
			logger.debug("/emp/vacationregist.jsp페이지 이동");
		}
	
		// 글쓰기 - /emp/regist (POST)
		@RequestMapping(value= "/vacationregist",method = RequestMethod.POST)
		public String vacationregistPOST(EmployeevacationVO vvo, RedirectAttributes rttr) throws Exception {
			
			logger.debug("registPOST() 호출!");
			// 한글처리(필터를 만들어 놓아서 생략)
			// 페이지 전달 데이터 저장
			logger.debug("evo :",vvo);
			
			// 서비스 - 글쓰기 동작 호출
			eService.insertVacation(vvo);
			
			// 리시트로 정보를 전달 (rttr)
			rttr.addFlashAttribute("result", "CREATEOK");
			
			// 나의휴가 내역페이지로 이동
			
			
			return "redirect:/emp/myvacationList";
			
		}
		
		// 휴가 수정하기
		@RequestMapping(value = "/vacationmodify", method = RequestMethod.GET)
		public void vacationmodify(Model model, Integer vacation_id) throws Exception {
			// 수정하기 - /emp/modify (GET)
			logger.debug("vacationmodify() 호출!");
			logger.debug("/emp/vacationmodify.jsp페이지 이동");
			
			// 사원 휴가 정보 불러오기
			EmployeevacationVO vvo = eService.vacationim(vacation_id);
			model.addAttribute("vvo", vvo);
		}
		
		@RequestMapping(value= "/vacationmodify",method = RequestMethod.POST)
		public String vacationmodify(EmployeevacationVO vvo, RedirectAttributes rttr,Integer vacation_id) throws Exception {
			
			logger.debug("vacationmodify() 호출!");
			// 한글처리(필터를 만들어 놓아서 생략)
			// 페이지 전달 데이터 저장
			logger.debug("vvo :",vvo);
			
			// 서비스 - 휴가수정 동작 호출
			eService.vacationmodify(vvo);
			
			// 리시트로 정보를 전달 (rttr)
			rttr.addFlashAttribute("result", "CREATEOK");
			
			// 나의휴가 내역페이지로 이동
			
			return "redirect:/emp/vacationmodify?vacation_id="+vvo.getVacation_id();
		}
		    // 수정하기 - /emp/modify (POST)
		
		
		
		
	
/////////////////////////////////////////////////////휴가 관리/////////////////////////////////////////////////////////////////////////////	
	
//	// 로그인 > 정보입력 (GET)
//	@RequestMapping(value="/login", method=RequestMethod.GET)
//	public void loginGET() {
//		logger.debug("loginGET() 호출![]~(￣▽￣)~*"); 
//		logger.debug("연결된 뷰페이지로 이동! (/member/login.jsp)"); 
//	}// loginGET() method end
//	
//	// 로그인 > 정보처리(POST)
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String loginPOST(MemberVO vo) { //@ModelAttribute ,,, vo로 대체 가능
//		logger.debug("loginPOST() 호출![]~(￣▽￣)~*");
//		// 전달정보(id,pw 저장)
//		logger.debug(vo+""); // 프레임워크에서 대신해주는 일이 많다보니 데이터 놓치는 경우 많음.
//							 // 항상 데이터가 잘 넘어오는지 확인하는 과정이 중요함!
//		// DB에서 정보 체크(Service에서 실행)
//		MemberVO resultVO = mService.memberLogin(vo);
//		// 로그인 여부에 따라서 페이지 이동
//		logger.debug(resultVO+"");
//		
//		// 로그인 성공 > 메인(redirect) + session에 id저장
//		// 로그인 실패 > 뒤로가기
//		
//		return "";
//	}// loginPOST() method end
	
	

}// public class end


































