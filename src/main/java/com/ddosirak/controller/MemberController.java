package com.ddosirak.controller;


import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.EmployeeListVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.EmployeevacationVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.SalaryVO;
import com.ddosirak.service.BoardService;
import com.ddosirak.service.EmployeeService;
import com.ddosirak.service.PageService;


@Controller
@RequestMapping(value="/emp/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스의 정보가 필요함. > 의존관계
	@Inject
	private EmployeeService eService;
	@Inject
	private PageService pService;
	@Inject
	private BoardService bService;
 	
	// 동작 구현 > 메서드 설계
	
	
////////////////////////////////////////////////////사원 관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/emp/insert
	// 사원등록 - 정보 입력
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public void employeeInsertGET() {
		logger.debug("employeeInsertGET() 호출![]~(￣▽￣)~*");
		logger.debug("/emp/insert.jsp로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
//		return "/emp/emp_add";
	}// employeeInsertGET() method end
	// 사원등록 - 정보 처리
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String employeeInsertPOST(EmployeeVO vo,@RequestParam("employee_photo_link")MultipartFile file ,HttpServletRequest request) throws Exception{	
		logger.debug("employeeInsertPOST() 호출![]~(￣▽￣)~*");
		
		logger.debug(vo+" ");
		// =====================사원번호 부여 동작===========================
		logger.debug("!!!!"+vo.getPosition());
		if(vo.getPosition().equals("일용")) {
			// 일용직 사원의 직번
			vo.setEmployee_id(eService.getMaxId_al());
		}else {
			// 임직원의 직번
			vo.setEmployee_id(eService.getMaxId());
		}// i-e end
		// ====================사원번호 부여 동작=============================
		
		eService.employeeInsert(vo);// 사원정보 DB 저장 동작
		
		// ====================사원 IDPW 부여 동작=============================
		// 임직원인 경우만 추가된다.
		if(vo.getEmployee_id() < 10000) {
			eService.setEmployeeIDPW(vo); // 사원 추가간 아이디 / 비밀번호 추가 메서드
		}// if end
		// ====================사원 IDPW 부여 동작=============================
		
		// ====================사원 사진 동작=============================
		eService.setEmployee_photo(vo.getEmployee_id(), file, request);
		// ====================사원 사진 동작=============================
		
		logger.debug(">> vo: "+vo);
		// 페이지 이동	
		return "redirect:/emp/list"; // 주소를 변경하면서 페이지 이동
	}// employeeInsertPOST() method end
	
	// 일용직 일괄등록 > 페이지 이동
	@RequestMapping(value="/insert_al",method=RequestMethod.GET)
	public void alInsertGET() {
		logger.debug("alInsertGET() 호출![]~(￣▽￣)~*");
		logger.debug("/emp/emp_add.jsp로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// alInsertGET() method end
	// 일용직 일괄등록 > 동작
	@RequestMapping(value="/insert_al",method=RequestMethod.POST)	
	public String alInsertPOST(@ModelAttribute(value="EmployeeListVO") EmployeeListVO voList, Date emp_date) {	 // List로 여러 내용을 받아오는 방법.
		logger.debug("alInsertPOST() 호출![]~(￣▽￣)~*");
		// 사원번호 부여 동작
		for(int i=0;i<voList.getEmployeelist().size();i++) {
			EmployeeVO emp = voList.getEmployeelist().get(i);
			emp.setEmp_date(emp_date);
			logger.debug("!!!!"+emp.getPosition());
			if(emp.getPosition().equals("일용")) {
				emp.setEmployee_id(eService.getMaxId_al());// 일용직 사원의 직번
				// 일용직 직원의 일급을 나누기 위한 제어문
				if(emp.getWorking_hours().equals("전일반")) {
					emp.setYear_sal(10);
				}else if(emp.getWorking_hours().equals("오전반")){
					emp.setYear_sal(5);
				}else if(emp.getWorking_hours().equals("오후반")) {
					emp.setYear_sal(5);
				} // i-e-e end
			}else {
				// 직번
				emp.setEmployee_id(eService.getMaxId());
			}// i-e end
			eService.employeeInsert(emp); // 일용직 사원 정보 DB 등록
		}// for end
		logger.debug(">> vo: "+voList);
		// 페이지 이동
		
		return "redirect:/emp/list"; // 주소를 변경하면서 페이지 이동
	}// alInsertPOST() method end

	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void employeeInfoGET(int employee_id, Model model) throws Exception{
		logger.debug("employeeInfoGET() 호출![]~(￣▽￣)~*");
		EmployeeVO evo = eService.getEmployee(employee_id);
		List<EmployeeCheckVO> chkVO = bService.getInOutList(employee_id);
		
		model.addAttribute("chkVO",chkVO);
		model.addAttribute("evo",evo);
		employee_id = evo.getEmployee_id();
		
		// 주석처리
		// 서비스 - DB에 저장된 글 정보를 가져오기
//		List<EmployeevacationVO> myvacationList = eService.myvacationList(employee_id);
//		logger.debug("myvacationList", myvacationList);
		// 연결된 뷰페이지로 전달(뷰-출력)
//		model.addAttribute("myvacationList", myvacationList);
		
	}//employeeInfoGET() method end
	
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String employeeUpdate(EmployeeVO vo) { // (listPOST)
		logger.debug("employeeUpdate() 호출![]~(￣▽￣)~*");
		logger.debug("vo > "+vo);
		
		 eService.updateEmployee(vo);
		 
		return "redirect:/emp/info?employee_id="+vo.getEmployee_id();
	}// employeeUpdate() method end
	
	// http://localhost:8088/emp/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listGET(Model model,PageVO pageVO, HttpServletRequest request,@RequestParam(value ="pop",required = false) String pop) throws Exception{
		logger.debug("listGET() 호출![]~(￣▽￣)~*");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countEmpList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		List<EmployeeVO> empList = eService.empList(pageVO); // 리스트를 반환하는 메서드의 파라미터 값으로 pageVO 넣기
		
		int empCount = eService.empCount();
		int alCount_all = eService.alCount_all();
		int alCount_am = eService.alCount_am();
		int alCount_pm = eService.alCount_pm();
		int alCount = alCount_all+alCount_am+alCount_pm;
		model.addAttribute("empList",empList);
		model.addAttribute("empCount",empCount);
		model.addAttribute("alCount_all",alCount_all);
		model.addAttribute("alCount_am",alCount_am);
		model.addAttribute("alCount_pm",alCount_pm);
		model.addAttribute("alCount",alCount);
		
		if(pop != null && pop.equals("rec")) {
			return "/receive/empList";
		} else if(pop != null && pop.equals("out")) {
			return "/outbound/empList";
		} else if(pop != null && pop.equals("ok")) {
			return "/inbound/empList";
		} else if(pop != null && pop.equals("rec2")) {
			return "/receive/empList2";
		}
			return "/emp/list";
	}//listGET() method end
	
	// 출퇴근 조회
	// 출근자 리스트
	@RequestMapping(value = "/inEmp_list")
	public void In_empList(Model model, PageVO pageVO, HttpServletRequest request) {
		logger.debug("In_empList() 호출![]~(￣▽￣)~*");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countInEmp(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		List<EmployeeCheckVO> inList = eService.getInEmp(pageVO);
		model.addAttribute("inList", inList);
	}// In_empList() method end
	// 퇴근자 리스트
	@RequestMapping(value = "/outEmp_list")
	public void OutEmp_list(Model model, PageVO pageVO, HttpServletRequest request) {
		logger.debug("OutEmp_list() 호출![]~(￣▽￣)~*");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countOutEmp(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		List<EmployeeCheckVO> outList = eService.getOutEmp(pageVO);
		model.addAttribute("outList", outList);
	}// Out_empList() method end
	
	// 엑셀동작 (0707, 안되면 엎을거임)
	//엑셀다운받기 동작
	@RequestMapping(value = "/excelDown", method = RequestMethod.GET)
    public void excelDownload(HttpServletResponse response) throws IOException {
//        Workbook wb = new HSSFWorkbook();
		LocalDate now = LocalDate.now();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("또시락 사원 정보"+now);
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        sheet.setColumnWidth(5, 8000);
        sheet.setColumnWidth(6, 4000);
        sheet.setColumnWidth(7, 5000);
        sheet.setColumnWidth(8, 4000);
        
        CellStyle hs = wb.createCellStyle();
        hs.setBorderTop(BorderStyle.THIN);
        hs.setBorderBottom(BorderStyle.THIN);
        hs.setBorderLeft(BorderStyle.THIN);
        hs.setBorderRight(BorderStyle.THIN);
        hs.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
        hs.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        CellStyle bs = wb.createCellStyle();
        bs.setBorderTop(BorderStyle.THIN);
        bs.setBorderBottom(BorderStyle.THIN);
        bs.setBorderLeft(BorderStyle.THIN);
        bs.setBorderRight(BorderStyle.THIN);
        
        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellStyle(hs);
        cell.setCellValue("사번");
        cell = row.createCell(1);
        cell.setCellStyle(hs);
        cell.setCellValue("성명");
        cell = row.createCell(2);
        cell.setCellStyle(hs);
        cell.setCellValue("부서");
        cell = row.createCell(3);
        cell.setCellStyle(hs);
        cell.setCellValue("직급");
        cell = row.createCell(4);
        cell.setCellStyle(hs);
        cell.setCellValue("재직현황");
        cell = row.createCell(5);
        cell.setCellStyle(hs);
        cell.setCellValue("주소");
        cell = row.createCell(6);
        cell.setCellStyle(hs);
        cell.setCellValue("전화번호");
        cell = row.createCell(7);
        cell.setCellStyle(hs);
        cell.setCellValue("이메일");
        cell = row.createCell(8);
        cell.setCellStyle(hs);
        cell.setCellValue("입사일");
        
        
        // Body
        List<EmployeeVO> eList = eService.empList();
        for (int i=0; i<eList.size(); i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getEmployee_id());
            cell = row.createCell(1);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getEmployee_name());
            cell = row.createCell(2);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getDepartment_name());
            cell = row.createCell(3);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getPosition());
            cell = row.createCell(4);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getEmployee_status());
            cell = row.createCell(5);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getAddress());
            cell = row.createCell(6);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getPhone_num());
            cell = row.createCell(7);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getEmail());
            cell = row.createCell(8);
            cell.setCellStyle(bs);
            cell.setCellValue(eList.get(i).getEmp_date().toString());
        } // for end

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=DDOSIRAK_employee_INFO_"+now+".xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
        logger.debug("excel end");
    }// excelDownload() method end
	
	
	
	
////////////////////////////////////////////////////사원 관리//////////////////////////////////////////////////////////////////////////////
	
////////////////////////////////////////////////////급여 관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/emp/salary
	// 급여관리 메인페이지
	@RequestMapping(value = "/salary", method = RequestMethod.GET)
	public void salaryGET(Model model, PageVO pageVO, HttpServletRequest request) {
		logger.debug("salaryGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countEmpList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		// 사원 목록 불러오기
		List<EmployeeVO> empList = eService.empList(pageVO);
		model.addAttribute("empList",empList);
		
	}// salaryGET() method end
	
	// 사원 급여조회 페이지 GET
	@RequestMapping(value = "/salaryInfo", method = RequestMethod.GET)
	public void salaryInfoGET(Model model, int employee_id) {
		logger.debug("salaryInfoGET() 호출![]~(￣▽￣)~*");

		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
		List<SalaryVO> salaryList = eService.getSalaryInfo(employee_id);
		model.addAttribute("salaryList",salaryList);
		
	}//  salaryInfoGET() method end
	
	// 사원 급여 등록 및 수정 페이지 GET
	@RequestMapping(value = "/salaryInsert", method = RequestMethod.GET)
	public void salaryInsertGET(Model model, int employee_id) {
		logger.debug("salaryInsertGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
		
	}// salaryInsertGET() method end
	// 사원 급여 등록 및 수정 페이지 POST
	@RequestMapping(value = "/salaryInsert", method = RequestMethod.POST)
	public String salaryInsertPOST(Model model, int employee_id,EmployeeVO vo) {
		logger.debug("salaryInsertPOST() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		eService.salaryInsert(vo);
		
		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
		
		return "redirect:/emp/salaryInfo?employee_id="+employee_id;
	}// salaryInsertPOST() method end
	
	// 사원 급여 명세서 조회 페이지
	@RequestMapping(value = "/salaryDetail", method = RequestMethod.GET)
	public void salaryDetailGET(Model model, int employee_id ,SalaryVO vo) {
		logger.debug("salaryDetailGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
		EmployeeVO evo = eService.getEmployee(employee_id);
		model.addAttribute("evo",evo);
		SalaryVO svo = eService.getEmpSalaryInfo(vo);
		model.addAttribute("svo",svo);
		
		// 급여정보 가져오는 메서드 있어야함
		
	}// salaryDetailGET() method end
	
	// 급여 지급 페이지 GET
	@RequestMapping(value = "/salaryPay", method = RequestMethod.GET)
	public void salaryPayGET(Model model,SalaryVO vo, PageVO pageVO, HttpServletRequest request) {
		logger.debug("salaryPayGET() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countEmpList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		// 사원 목록 불러오기
		List<EmployeeVO> empList = eService.empList(pageVO);
		model.addAttribute("empList",empList);
		// 최종 급여지급일 정보 가져오는 메서드 필요.
		SalaryVO svo = eService.getEmpSalaryInfo(vo);
		model.addAttribute("svo",svo);
		
	}// salaryPayGET() method end
	// 급여 지급 페이지 POST
	@RequestMapping(value = "/salaryPay", method = RequestMethod.POST)
	public String salaryPayPOST(Model model, int[] employee_id) {
		logger.debug("salaryPayPOST() 호출![]~(￣▽￣)~*");
		logger.debug("페이지 이동!");
		if(employee_id != null) {
			for(int i=0;i<employee_id.length;i++) {
				logger.debug(employee_id[i]+"번 사원에게 급여 지급!");
				
				int idLength = Integer.toString(employee_id[i]).length();
				logger.debug("employee_id - length : "+ idLength);
				
				if(idLength <= 4) { // 임직원, 코드 4자리
					// 급여지급 동작
					eService.salaryPay(employee_id[i]);
				}else if(idLength >= 4) { // 일용직, 코드 5자리
					// 일용직 급여지급 동작
					eService.al_salaryPay(employee_id[i]);
				}// i-ei end
			}// for end
		}else {
			logger.debug("ids에 값 없음!");
		} // i-e end
		return "redirect:/emp/salary";
	}// salaryPayPOST() method end
	
	
	
	
	
	
	
////////////////////////////////////////////////////급여 관리//////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
////////////////////////////////////////////////////휴가 관리/////////////////////////////////////////////////////////////////////////////	
	
//	 http://localhost:8088/emp/vacationlist
		// 휴가관리 리스트페이지(관리자)
		@RequestMapping(value = "/vacationlist", method = RequestMethod.GET)
		public void vacationGET(Model model, PageVO pageVO, HttpServletRequest request) {
			logger.debug("vacationGET() 호출![]~(￣▽￣)~*");
			logger.debug("페이지 이동!");
			//================================페이징 처리를 위한 값 받아오기 동작========================================
			// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
			//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
			// 페이징 처리
			// 한 화면에 보여줄 글 개수 설정
			int pageSize = 10; // sql문에 들어가는 항목
			
			// 현페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			// 페이지번호를 정수형으로 변경
			int currentPage=Integer.parseInt(pageNum);
			pageVO.setPageSize(pageSize);
			pageVO.setPageNum(pageNum);
			pageVO.setCurrentPage(currentPage);
			int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
			int endRow = startRow+pageVO.getPageSize()-1;
			
			pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
			pageVO.setEndRow(endRow);
			
			// 게시글 개수 가져오기
			int count = eService.countRetOrdList(pageVO); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

			int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
			 	endPage = pageCount;
			 }
			pageVO.setCount(count);
			pageVO.setPageBlock(pageBlock);
			pageVO.setStartPage(startPage);
			pageVO.setEndPage(endPage);
			pageVO.setPageCount(pageCount);
			
			model.addAttribute("pageVO", pageVO);
			//================================페이징 처리를 위한 값 받아오기 동작========================================
			// 사원 목록 불러오기
			List<EmployeevacationVO> vacationList = eService.vacationList(pageVO);
			model.addAttribute("vacationList",vacationList);
			
			
		}// vacationGET() method end
		
//	 http://localhost:8088/emp/vacationcheck
		// 휴가신청 승인/반려 페이지(관리자)
		@RequestMapping(value = "/vacationcheck", method = RequestMethod.GET)
		public String vacationcheck(@RequestParam("vacation_id")Integer vacation_id, HttpSession session,
				@RequestParam("approve")String approve, RedirectAttributes rttr, Date approve_date, String approve_emp) {
			logger.debug("vacationcheck() 호출![]~(￣▽￣)~*");
			logger.debug("페이지 이동!");
			// 페이지 전달 데이터 저장
			int id=Integer.valueOf((String) session.getAttribute("login_id"));
			logger.debug("vacation_id :",vacation_id,id);
			if (approve.equals("승인")) {
			    eService.vacationapprove(vacation_id,id);
			} else if (approve.equals("반려")) {
			    eService.vacationreturn(vacation_id,id);
			}
		
			
			// 리시트로 정보를 전달 (rttr)
			rttr.addFlashAttribute("result", "CREATEOK");
			rttr.addFlashAttribute("vacation_id", vacation_id);
			rttr.addFlashAttribute("approve", approve);
			rttr.addFlashAttribute("approve_date", approve_date);
			rttr.addFlashAttribute("approve_emp", approve_emp);
			
			return "redirect:/emp/vacationlist";
			
		}// vacationGET() method end
		
		// 사원휴가 정보
		@RequestMapping(value = "/vacationinf", method = RequestMethod.GET)
		public void vacationinf(int employee_id, Model model, Integer vacation_id) {
			logger.debug("employeeInfoGET() 호출![]~(￣▽￣)~*");
			// 0609, 페이지 이동간에 정보전달 방법 찾아본 후 마저 코드 짜기. // 해결
			EmployeeVO evo = eService.getEmployee(employee_id);
			model.addAttribute("evo",evo);
			employee_id = evo.getEmployee_id();
			EmployeevacationVO vvo = eService.vacationim(vacation_id);
			
			// 서비스 - DB에 저장된 글 정보를 가져오기
			List<EmployeevacationVO> myvacationList = eService.myvacationList(employee_id);
			logger.debug("myvacationList", myvacationList);
			// 연결된 뷰페이지로 전달(뷰-출력)
			model.addAttribute("myvacationList", myvacationList);
			
		}//employeeInfoGET() method end
		
		@RequestMapping(value = "/vacationinf", method = RequestMethod.POST)
		public String vacationinf(EmployeeVO vo) { 
			logger.debug("employeeUpdate() 호출![]~(￣▽￣)~*");
			logger.debug("vo > "+vo);
			
			 eService.updateEmployee(vo);
			 
			return "redirect:/emp/vacationinf?employee_id="+vo.getEmployee_id();
		}// employeeUpdate() method end
		
		
		// http://localhost:8088/emp/myvacationList
		// 나의 휴가내역 리스트 페이지
		@RequestMapping(value = "/myvacationList", method = RequestMethod.GET)
		public String myvacationList(Model model, @ModelAttribute("result")String result, Integer vacation_id) {
			logger.debug("myvacation() 호출!");
			logger.debug("result :"+result);
			
//			 서비스 - DB에 저장된 글 정보를 가져오기
			List<EmployeevacationVO> myvacationList = eService.myvacationList(vacation_id);
			logger.debug("myvacationList", myvacationList);
			// 연결된 뷰페이지로 전달(뷰-출력)
			model.addAttribute("myvacationList", myvacationList);
			
			
		return "/emp/vacationList";
		}
		
		
		
		// 나의 휴가내역 리스트 페이지
	
//	http://localhost:8088/emp/vacationregist
		// 휴가 신청 페이지	
		// 글쓰기 - /emp/regist (GET)
		@RequestMapping(value = "/vacationregist", method = RequestMethod.GET)
		public String vacationregist(Model model,EmployeevacationVO vvo) throws Exception{
			logger.debug("vacationregist() 호출!");
			logger.debug("/emp/vacationregist.jsp페이지 이동");
			logger.debug("@@@@@@@@@@@@@@@@@@@" + vvo);
			
			model.addAttribute("vvo", vvo);
			model.addAttribute("employee_id", vvo.getEmployee_id());
			
			return "/emp/vacationregist";
			
		}
	
		// 글쓰기 - /emp/regist (POST)
		@RequestMapping(value= "/vacationregist",method = RequestMethod.POST)
		public String vacationregistPOST(EmployeevacationVO vvo, RedirectAttributes rttr) throws Exception {
			
			logger.debug("registPOST() 호출!");
			// 한글처리(필터를 만들어 놓아서 생략)
			// 페이지 전달 데이터 저장
			logger.debug("evo :",vvo);
			vvo.setVacation_date((int) Math.ceil((vvo.getVacation_finish().getTime() - vvo.getVacation_start().getTime()) / (1000.0 * 60 * 60 * 24)) + 1);
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
		
		// 휴가 삭제하기
		@RequestMapping(value = "/vacationdelete", method = RequestMethod.GET)
		public String vacationdelete(Model model,Integer vacation_id,int employee_id) throws Exception {
			// 수정하기 - /emp/modify (GET)
			
			logger.debug("vacationdelete() 호출!");
			logger.debug("@@@@@@@@@@@@vacation_id"+vacation_id);
			logger.debug("/emp/vacationdelete.jsp페이지 이동");
			
			// 서비스 - 휴가 삭제 동작 호출
			eService.vacationdelete(vacation_id);
			return "redirect:/emp/vacationinf?employee_id="+employee_id;
		}
		
		
		
	
/////////////////////////////////////////////////////휴가 관리/////////////////////////////////////////////////////////////////////////////	
	
	

}// public class end


































