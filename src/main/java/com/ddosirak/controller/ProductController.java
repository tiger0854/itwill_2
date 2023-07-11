package com.ddosirak.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.CookAddVO;
import com.ddosirak.domain.CookListVO;
import com.ddosirak.domain.CookVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.GraphVO;
import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.MaterialQuantityVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.domain.ReceiveVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ProductionPerformanceDAO;
import com.ddosirak.service.CookOrderService;
import com.ddosirak.service.EmployeeService;
import com.ddosirak.service.ItemRecipeService;
import com.ddosirak.service.ItemdetailService;
import com.ddosirak.service.LineService;
import com.ddosirak.service.MaterialdetailService;
import com.ddosirak.service.MaterialsService;
import com.ddosirak.service.PageService;
import com.ddosirak.service.ProOrderService;
import com.ddosirak.service.ProductionPerformanceService;
import com.ddosirak.service.ReceiveService;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.ObjectMapper;

// 컨트롤러 구현 전 정하면 좋은 것들.
// - 컨트롤러별 공통 주소 (URI) 설계
// - 각 기능별 주소(URI) 설계
// - 각 URI별 호출방식 설정(GET/POST) 
//		> 사용자의 정보입력,조회(GET)
//		> 데이터 처리, Db접근(POST)  >> 해당 분류가 일반적인 방식.
// - 결과처리, 페이지 이동 설계
// - 예외처리

@Controller
@RequestMapping(value = "/pro/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ProductionPerformanceService ppService;

	// 서비스의 정보가 필요함. > 의존관계
	@Inject
	private EmployeeService eService;
	@Inject
	private ProOrderService oService;
	@Inject
	private ItemdetailService iservice;
	@Inject
	private LineService lService;
	@Inject
	private CookOrderService cService;
	@Inject
	private MaterialdetailService mservice;
	// 동작 구현 > 메서드 설계
	@Inject
	private ItemRecipeService Rservice;
	@Inject
	private PageService pService;
	
	@Inject
	private ReceiveService rService;
	
	
///////////////////////////////////////////////////생산관리//////////////////////////////////////////////////////////////////////////////
	
// --------------------- 예웡  (｡･∀･)ﾉﾞﾞ -----------------------------	
	// http://localhost:8088/pro/orderList
	// 작업지시 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String productListGET(Model model,HttpServletRequest request,PageVO pageVO,HttpSession session) {
		logger.debug("productListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/oderList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
//		String employeeIdString = (String) session.getAttribute("login_id");
//		int employee_id = Integer.parseInt(employeeIdString);
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@ employee_id  :  "+employee_id);
//		dept_name 
//		String dept_name = (String) session.getAttribute("dept_name");
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@ dept_name  :  "+dept_name);
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		
		
		
		String line_code = request.getParameter("line_code");
		String wo_date = request.getParameter("wo_date");
		String item_code = request.getParameter("item_code");
		String wo_status = request.getParameter("wo_status");
//		Integer employee_id = Integer.parseInt(request.getParameter("employee_id"));
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("line_code", line_code);
		instrSearch.put("wo_date", wo_date);
		instrSearch.put("item_code", item_code);
		instrSearch.put("wo_status", wo_status);
//		instrSearch.put("employee_id", employee_id);
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
		int count = oService.ProOrdercount(instrSearch); 
		logger.debug("글갯수 @@@@@@@@@@2"+count);
		// 게시글 개수 가져오기
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
		logger.debug("startRow @@@@@@@@@@"+startRow);
		logger.debug("pageSize @@@@@@@@@@"+pageSize);
//		List<ProOrderVO> proOrderList = oService.proOrderList();
		List<ProOrderVO> proOrderList;

		if(line_code == null && wo_date == null && item_code == null && wo_status == null ) {
			// 작업지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			proOrderList = oService.proOrderList(pageVO);
		} else {
			// 작업지시 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//			proOrderList = oService.proOrderList();
			proOrderList = oService.proOrderList(instrSearch, model,pageVO);
		}

		model.addAttribute("oderList", proOrderList);
		model.addAttribute("Search", instrSearch);
//		// 라인 이름 불러오기
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
		return "/pro/orderList";
	}// productListGET() method end


	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value = "/orderWrite", method = RequestMethod.GET)
	public void productWriteGET(ProOrderVO vo,Model model,PageVO pageVO) {
		logger.debug("orderWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug(vo + " ");
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
	}

	//작업지시 글작성
	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value = "/orderWrite", method = RequestMethod.POST)
	public void productWritePost(ProOrderVO vo) {
		logger.debug("orderWritePOST() 호출![]~(￣▽￣)~*");
		logger.debug(vo+" ");
		oService.orderInsert(vo);
	}// productWriteGET() method end
		// 생산관리 - 작업지시글작성

//	 http://localhost:8088/pro/orderEdit
	@RequestMapping(value = "/orderEdit", method = RequestMethod.GET)
	public void productEditGET(String wo_code, Model model) throws Exception {
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
		logger.debug("productWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// productEditGET() method end
//	 생산관리 - 작업지시글수정

	@RequestMapping(value = "/orderEdit", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
	public void eproductEditPOST(ProOrderVO vo) throws Exception { // (listPOST)
		logger.debug("productEditPOST() 호출![]~(￣▽￣)~*");
		logger.debug("vo > "+vo);
		oService.EditProOrder(vo);
		// 리스트로 정보를 전달 (rttr)
//		rttr.addFlashAttribute("result", "CREATEOK");
//		return "redirect:/pro/orderEdit?wo_code="+vo.getWo_code();
	}// employeeUpdate() method end
	
	//작업지시 삭제
	@RequestMapping(value = "/proOrderDelete", method = RequestMethod.GET)
	public String deleteWhGET(String wo_code,RedirectAttributes rttr) {
		logger.debug("deleteWhGET 호출");
		oService.deleteProOrder(wo_code);
		rttr.addFlashAttribute("result", "CREATEOK");
		return "redirect:/pro/orderList";
	}
	
	
	// http://localhost:8088/pro/orderstatusList
	@RequestMapping(value = "/orderstatusList", method = RequestMethod.GET)
	public void productStatusGET() {
		logger.debug("productStatusGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// productStatusGET() method end
		// 생산관리 - 작업지시현황

	
	// 생산관리 - 상품목록(팝업)
	// http://localhost:8088/pro/itemList
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public void itemListGET(Model model,HttpServletRequest request,PageVO pageVO) {
		
		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);
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
		int count = oService.itemcount(instrSearch); 

		logger.debug("글갯수 @@@@@@@@@@2"+count);
		// 게시글 개수 가져오기
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
		

//		List<ItemdetailVO> itemList=iservice.idList();
		List<ItemdetailVO> itemList;
		if(item_code == null && item_name == null) {
			// 작업지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			itemList = oService.proitemList(pageVO);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		
		} else {
			// 작업지시 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//			proOrderList = oService.proOrderList();
			itemList = oService.proitemList(pageVO,instrSearch, model);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("idlistGET 실행");
		model.addAttribute("Search", instrSearch);
		model.addAttribute("itemList", itemList);
	}// /itemListGET() method end
	
	
	
 // --------------------- 영신쿤  (｡･∀･)ﾉﾞﾞ -------------------------------------
	
	// http://localhost:8088/pro/etcstatusList
	@RequestMapping(value = "/etcstatusList", method = RequestMethod.GET)
	public String productEtclistGET(String wo_code, Model model, PageVO pageVO, HttpServletRequest request,HttpSession session) {
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
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
		int count = ppService.orderStatuscount(wo_code); 

		logger.debug("글갯수 @@@@@@@@@@2"+count);
		// 게시글 개수 가져오기
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
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wo_code", wo_code);

//		Map<String, Object> instrSearch, String wo_code, PageVO pageVO
		logger.debug("productEtclistGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		List<ProductionPerformanceVO> prodPerfList = ppService.prodPerfList(instrSearch,wo_code,pageVO);
		model.addAttribute("prodPerfList", prodPerfList);
		
		return "/pro/etcstatusList";
	}// productEtclistGET()
		// 생산관리 - 실적목록

	// http://localhost:8088/pro/etcWrite
	@RequestMapping(value = "/etcWrite", method = RequestMethod.GET)
	public void productEtcWriteGET(String wo_code,Model model,ProductionPerformanceVO ivo){
//		String wo_status = ppService.getWoMap(ivo.getWo_code());
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
		logger.debug("etcWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productEtcWriteGET() method end
		// 생산관리 - 실적등록

	@RequestMapping(value = "/etcWrite", method = RequestMethod.POST)
	public void productEtcWritePOST(ProductionPerformanceVO ivo,String wo_code,Model model ) throws Exception {
		logger.debug("etcWritePOST() 호출![]~(￣▽￣)~*");
		logger.debug(ivo + "");
		logger.debug(ivo.getPerf_id() + "@@@@");
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
		// 작업지시 생산수량 증가
		oService.addpQTY(ivo);
		// 실적 등록 메서드 호출
		ppService.insertProdPerf(ivo);
		logger.debug("<ivo> : " + ivo);
	
//		logger.debug(vo.getWo_status() + "@@@@@@@@@@@");
//		return "redirect:/pro/etcstatusList?wo_code=" + ivo.getWo_code();
		
	}// productEtcWritePost() method end
		// 생산관리 - 실적등록

	// http://localhost:8088/pro/etcEdit
	@RequestMapping(value = "/etcEdit", method = RequestMethod.GET)
	public void productEtcEditGET(Model model, int perf_id) {
		logger.debug("productEtcEditGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

		ProductionPerformanceVO updatePerfList = ppService.perfUpdateList(perf_id);

		logger.debug("@@@@@@@@ updatelist" + updatePerfList);

		model.addAttribute("updatelist", updatePerfList);
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 수정 조회

	@RequestMapping(value = "/etcEdit", method = RequestMethod.POST)
	public String productEtcEditPOST(Model model, int perf_id, ProductionPerformanceVO uvo, RedirectAttributes rttr) {
		logger.debug("productEtcEditPOST() 호출![]~(￣▽￣)~*");

		ppService.perfUpdateBoard(uvo);

		rttr.addFlashAttribute("result", "CREATEOK");

		model.addAttribute("updatelist", uvo);

		return "redirect:/pro/etcEdit?perf_id=" + uvo.getPerf_id();
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 수정 동작

	// http://localhost:8088/pro/etcRemove
	@RequestMapping(value = "/etcRemove", method = RequestMethod.GET)
	public String productEtcRemoveGET(ProductionPerformanceVO dvo,HttpServletRequest request) throws Exception {
		logger.debug("productEtcRemoveGET() 호출![]~(￣▽￣)~*");
		String wo_code = request.getParameter("wo_code");
		ppService.perfDeleteBoard(dvo.getPerf_id());
		return "redirect:/pro/etcstatusList?wo_code="+wo_code;
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 삭제
	
	
	// http://localhost:8088/pro/wostatusEnd
	@RequestMapping(value = "/wostatusEnd", method = RequestMethod.GET)
	public String wostatusEndGET(HttpServletRequest request) {
		logger.debug("productEtcRemoveGET() 호출![]~(￣▽￣)~*");
		String wo_code = request.getParameter("wo_code");
		ppService.wostatusEnd(wo_code);
		return "redirect:/pro/etcstatusList?wo_code="+wo_code;
	}// productEtcWriteGET() method end
	

	
	
	// ---------------------- 조리 지시 관리 ☆⌒(*＾-゜)v ヾ(^▽^*))) --------------------
	
	//조리지시 글작성
	// http://localhost:8088/pro/cookorderWrite
	@RequestMapping(value = "/cookorderWrite", method = RequestMethod.GET)
	public void proCookOrderWriteGET(CookVO cvo,Model model) {
		logger.debug("proCookOrderWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug(" "+ cvo );
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
	}
	
	//조리지시 글작성
	// http://localhost:8088/pro/cookorderWrite
	@RequestMapping(value = "/cookorderWrite", method = RequestMethod.POST)
	public void proCookOrderWritePost(CookVO cvo,CookListVO lcvo) throws Exception {
		logger.debug("proCookOrderWritePOST 호출![]~(￣▽￣)~*");
		logger.debug(cvo+" "+lcvo);

		cService.cookorderInsert(cvo,lcvo);
	}// productWriteGET() method end
		// 생산관리 - 조리지시글작성
	
	// http://localhost:8088/pro/cookorderList
	// 조리지시 목록
	@RequestMapping(value = "/cookorderList", method = RequestMethod.GET)
	public String cookListGET(Model model,HttpServletRequest request,PageVO pageVO,HttpSession session) {
		
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		
		logger.debug("productListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/oderList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
	
		String line_code = request.getParameter("line_code");
		String co_date = request.getParameter("co_date");
		String so_code = request.getParameter("so_code");
		String co_status = request.getParameter("co_status");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("line_code", line_code);
		instrSearch.put("co_date", co_date);
		instrSearch.put("so_code", so_code);
		instrSearch.put("co_status", co_status);
		
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
		int count = cService.cookOrdercount(instrSearch); 
		logger.debug("글갯수 @@@@@@@@@@2"+count);
		// 게시글 개수 가져오기
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
		logger.debug("startRow @@@@@@@@@@"+startRow);
		logger.debug("pageSize @@@@@@@@@@"+pageSize);
//		List<ProOrderVO> proOrderList = oService.proOrderList();
		List<CookVO> cookOrderList;
		if(line_code == null && co_date == null && so_code == null && co_status == null) {
			// 조리지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			cookOrderList = cService.cookOrderList(pageVO);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		} else {
			// 조리지시 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//			proOrderList = oService.proOrderList();
			cookOrderList = cService.cookOrderList(instrSearch, model,pageVO);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		}

		model.addAttribute("cookoderList", cookOrderList);
		model.addAttribute("Search", instrSearch);
//		// 라인 이름 불러오기
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
		return "/pro/cookorderList";
	}// productListGET() method end

//	 http://localhost:8088/pro/cookorderEdit
	@RequestMapping(value = "/cookorderEdit", method = RequestMethod.GET)
	public void procookEditGET(String co_code, Model model) {

		CookVO cvo = cService.getcookOder(co_code);
		model.addAttribute("cvo", cvo);
		logger.debug("cokkorderEdit() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/cookorderEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);
	}// productEditGET() method end
//	 생산관리 - 작업지시글수정

	@RequestMapping(value = "/cookorderEdit", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
	public void eprocookEditPOST(CookVO cvo ,RedirectAttributes rttr,Model model) { // (listPOST)
		logger.debug("cookorderEditPOST() 호출![]~(￣▽￣)~*");
		logger.debug("cvo > "+cvo);
		cService.EditcookOrder(cvo);

//		return "redirect:/pro/orderEdit?wo_code="+vo.getWo_code();
	}// employeeUpdate() method end
	
	//작업지시 삭제
	@RequestMapping(value = "/cookOrderDelete", method = RequestMethod.GET)
	public String deleteWhGET(String co_code) {
		logger.debug("deleteWhGET 호출");
		cService.deletecookOrder(co_code);
		return "redirect:/pro/cookorderList";
	}
	
	// ------------------------ 조리지시 실적등록 ----------------------------------
	
	
	// http://localhost:8088/pro/cooketcWrite
	@RequestMapping(value = "/cooketcWrite", method = RequestMethod.GET)
	public void cooketcWriteGET(String co_code,Model model){
//		String wo_status = ppService.getWoMap(ivo.getWo_code());
		CookVO cvo = cService.getcookOder(co_code);
		model.addAttribute("cvo", cvo);
		logger.debug("etcWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productEtcWriteGET() method end
		// 생산관리 - 실적등록

	@RequestMapping(value = "/cooketcWrite", method = RequestMethod.POST)
	public void cooketcWritePOST(CookAddVO cavo,Model model ) throws Exception {
		logger.debug("etcWritePOST() 호출![]~(￣▽￣)~*");
		logger.debug(cavo + "");
//		ProOrderVO pvo = oService.getProOder(wo_code);
//		model.addAttribute("pvo", pvo);
		// 작업지시 생산수량 증가
//		cService.addcpQTY(cavo);
		// 실적 등록 메서드 호출
		cService.insertcookPerf(cavo);
	}// productEtcWritePost() method end
		// 생산관리 - 실적등록
	
	
	// http://localhost:8088/pro/cooketcstatusList
	@RequestMapping(value = "/cooketcstatusList", method = RequestMethod.GET)
	public String cooketcListGET(String co_code, Model model, PageVO pageVO, HttpServletRequest request,HttpSession session) {
		CookVO cvo = cService.getcookOder(co_code);
		model.addAttribute("cvo", cvo);
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		
		
		
		
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
		int count = cService.cooketccount(co_code); 

		logger.debug("글갯수 @@@@@@@@@@"+count);
		// 게시글 개수 가져오기
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
		Map<String, Object> instrSearch = new HashMap<String, Object>();
//		Map<String, Object> instrSearch, String wo_code, PageVO pageVO
		logger.debug("productEtclistGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/cooketcstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		List<CookAddVO> cookEtcList = cService.cookEtcList(instrSearch,co_code,pageVO);
		model.addAttribute("cookEtcList", cookEtcList);
		return "/pro/cooketcstatusList";
	}// productEtclistGET()
	
	
	// http://localhost:8088/pro/cooketcRemove
	@RequestMapping(value = "/cooketcRemove", method = RequestMethod.GET)
	public String cookEtcRemoveGET(HttpServletRequest request,String co_code,String cook_id) throws Exception {
		logger.debug("productEtcRemoveGET() 호출![]~(￣▽￣)~*");
		cService.cooketcDelete(cook_id);
		return "redirect:/pro/cooketcstatusList?co_code="+co_code;
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 삭제
	
	
	// http://localhost:8088/pro/costatusEnd
	@RequestMapping(value = "/costatusEnd", method = RequestMethod.GET)
	public String costatusEndGET(HttpServletRequest request) {
		logger.debug("productEtcRemoveGET() 호출![]~(￣▽￣)~*");
		String co_code = request.getParameter("co_code");
		cService.costatusEnd(co_code);
		return "redirect:/pro/cooketcstatusList?co_code="+co_code;
	}// productEtcWriteGET() method end
	
	
	
	
	// ------------------------ materialList(자재목록) -------------------------------
	
	// 	// http://localhost:8088/pro/materialList
	@RequestMapping(value = "/materialList", method = RequestMethod.GET)
	public void materialList(HttpServletRequest request, Model model,PageVO pageVO) throws Exception {

		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		String material_type = request.getParameter("material_type");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);
		instrSearch.put("material_type", material_type);

		// ================================페이징 처리를 위한 값 받아오기
		// 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		// 리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize}
		// 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow = (pageVO.getCurrentPage() - 1) * pageVO.getPageSize() + 1; // sql문에 들어가는 항목
		int endRow = startRow + pageVO.getPageSize() - 1;

		pageVO.setStartRow(startRow - 1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		int count = mservice.materialCount(instrSearch);
		logger.debug("글갯수 @@@@@@@@@@2" + count);
		// 게시글 개수 가져오기
		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);

		model.addAttribute("pageVO", pageVO);
		logger.debug("startRow @@@@@@@@@@2" + startRow);
		logger.debug("pageSize @@@@@@@@@@2" + pageSize);

		List<MaterialdetailVO> materialList = null;
		if (material_code == null) {
			logger.debug("전체 조회");
			materialList = mservice.mdList(pageVO);
		} else {
			logger.debug("검색 조회");
			materialList = mservice.mdList(pageVO, instrSearch);
		}
		logger.debug("resultlist 개수 : " + materialList.size());
		model.addAttribute("Search", instrSearch);
		model.addAttribute("materialList", materialList);
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 삭제
	
	// ------------------- 레시피 --------------------------------
	 
//	/pro/itemrecipeList
	
	// 상품 검색 시 자재를 가져오는 ajax
	@RequestMapping(value = "/itemrecipeList", method = RequestMethod.GET)
	@ResponseBody
	public String getMaterialsGET(@RequestParam("item_code") String itemCode) throws Exception {
		List<ItemRecipeListVO> itemList = Rservice.selectItemRecipe(itemCode);
		logger.debug(itemList.size() + "");
		// ObjectMapper 객체 생성
//		ObjectMapper objectMapper = new ObjectMapper();
		// ObjectMapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper().configure(JsonGenerator.Feature.ESCAPE_NON_ASCII, true);
		String jsonString = objectMapper.writeValueAsString(itemList);
//		String jsonString = objectMapper.writeValueAsString(itemList);
		return jsonString;
	}
	
// 	 http://localhost:8088/pro/suList
	@RequestMapping(value = "/suList", method = RequestMethod.GET)
	public void suList(HttpServletRequest request, Model model,PageVO pageVO) throws Exception {

		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
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
		int count = pService.countReceiveList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		
		
		List<ReceiveVO> receiveList = rService.receiveList(pageVO);
		logger.debug("receiveList : " + receiveList);
		
		model.addAttribute("receiveList", receiveList);
		
	}// p
	
//	 http://localhost:8088/pro/cosuList
	@RequestMapping(value = "/cosuList", method = RequestMethod.GET)
	public void cosuList(HttpServletRequest request, Model model,PageVO pageVO) throws Exception {

		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
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
		int count = pService.countReceiveList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		
		
		List<ReceiveVO> receiveList = rService.receiveList(pageVO);
		logger.debug("receiveList : " + receiveList);
		
		model.addAttribute("receiveList", receiveList);
		
	}// p
	
	
//	/pro/checkrecode
	
	@RequestMapping(value = "/checkrecode", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checkrecode(@RequestParam("re_code") String re_code) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@ re_code : " + re_code);
		Boolean result = cService.checkrechod(re_code);
		logger.debug("@@@@@@@@@@@@@@@@@@@@ result : " + result);
		return result;
	}
	
//	/pro/checksuList
	@RequestMapping(value = "/checksuList", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checksuList(@RequestParam("re_code") String re_code) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@ re_code : " + re_code);
		Boolean result = cService.checksuList(re_code);
		logger.debug("@@@@@@@@@@@@@@@@@@@@ result : " + result);
		return result;
	}
	
//	/pro/checkcooksuList
	@RequestMapping(value = "/checkcooksuList", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checkcooksuList(@RequestParam("re_code") String re_code) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@@@@ re_code : " + re_code);
		Boolean result = cService.checksucookList(re_code);
		logger.debug("@@@@@@@@@@@@@@@@@@@@ result : " + result);
		return result;
	}
	
	
//	/pro/searchsuList	
	
	@RequestMapping(value = "/searchsuList", method = RequestMethod.GET)
	public void searchsuList(HttpServletRequest request, Model model,PageVO pageVO) throws Exception {

		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
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
		int count = pService.countReceiveList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		
		
		List<ReceiveVO> receiveList = rService.receiveList(pageVO);
		logger.debug("receiveList : " + receiveList);
		
		model.addAttribute("receiveList", receiveList);
		
	}// p
	
	// http://localhost:8088/pro/graph
	@RequestMapping(value = "/graph", method = RequestMethod.GET)
//	@ResponseBody
	public void graph(Model model) throws Exception {
		List<Map<String, Object>> graphList = oService.graphList();
		logger.debug("graphList : " + graphList);
		ObjectMapper objectMapper = new ObjectMapper();
		String graphListJson = objectMapper.writeValueAsString(graphList);
		model.addAttribute("graphListJson", graphListJson);
	}
	
	
	
	// http://localhost:8088/pro/empList
	@RequestMapping(value = "/empList", method = RequestMethod.GET)
	public String emplistGET(Model model,PageVO pageVO, HttpServletRequest request,@RequestParam(value ="pop",required = false) String pop) throws Exception{
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
		
		List<EmployeeVO> empList = eService.empList(); // 리스트를 반환하는 메서드의 파라미터 값으로 pageVO 넣기
		
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
		return "/pro/empList";
	}//l
	
//	/pro/checkMaterialQuantity
	@RequestMapping(value = "/pro/checkMaterialQuantity", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkMaterialQuantity(@RequestBody MaterialQuantityVO request) {
	    String[] materialCodes = request.getMaterialCodes();
	    int[] materialQuantities = request.getMaterialQuantities();

	    boolean available = oService.checkMaterial(materialCodes, materialQuantities, null);

	    return available;
	}
	
}// public class end
