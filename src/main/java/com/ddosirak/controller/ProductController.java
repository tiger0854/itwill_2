package com.ddosirak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.service.ItemdetailService;
import com.ddosirak.service.LineService;
import com.ddosirak.service.ProOrderService;
import com.ddosirak.service.ProductionPerformanceService;

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
	private ProOrderService oService;
	
	@Inject
	private ItemdetailService iservice;
	
	@Inject
	private LineService lService;

	// 동작 구현 > 메서드 설계

///////////////////////////////////////////////////생산관리//////////////////////////////////////////////////////////////////////////////
	
// --------------------- 예웡  (｡･∀･)ﾉﾞﾞ -----------------------------	
	// http://localhost:8088/pro/oderList
	// 작업지시 목록
	@RequestMapping(value = "/oderList", method = RequestMethod.GET)
	public void productListGET(Model model,HttpServletRequest request) {
		logger.debug("productListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/oderList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
		String line_code = request.getParameter("line_code");
		String wo_date = request.getParameter("wo_date");
		String item_code = request.getParameter("item_code");
		String wo_status = request.getParameter("wo_status");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("line_code", line_code);
		instrSearch.put("wo_date", wo_date);
		instrSearch.put("item_code", item_code);
		instrSearch.put("wo_status", wo_status);
		
//		List<ProOrderVO> proOrderList = oService.proOrderList();
		List<ProOrderVO> proOrderList;
		if(line_code == null && wo_date == null && item_code == null && wo_status == null) {
			// 작업지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			proOrderList = oService.proOrderList();
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		
		} else {
			// 작업지시 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//			proOrderList = oService.proOrderList();
			proOrderList = oService.proOrderList(instrSearch, model);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		}

		model.addAttribute("oderList", proOrderList);
		model.addAttribute("instrSearch", instrSearch);
//		// 라인 이름 불러오기
		List<LineVO> lineList = lService.LineList();
		model.addAttribute("lineList", lineList);

	}// productListGET() method end


	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value = "/orderWrite", method = RequestMethod.GET)
	public void productWriteGET(ProOrderVO vo,Model model) {
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
	public void productEditGET(String wo_code, Model model) {

		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
		logger.debug("productWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// productEditGET() method end
//	 생산관리 - 작업지시글수정

	@RequestMapping(value = "/orderEdit", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
	public void eproductEditPOST(ProOrderVO vo ,RedirectAttributes rttr) { // (listPOST)
		logger.debug("productEditPOST() 호출![]~(￣▽￣)~*");
		logger.debug("vo > "+vo);
		oService.EditProOrder(vo);
		// 리스트로 정보를 전달 (rttr)
		rttr.addFlashAttribute("result", "CREATEOK");
//		return "redirect:/pro/orderEdit?wo_code="+vo.getWo_code();
	}// employeeUpdate() method end
	
	//작업지시 삭제
	@RequestMapping(value = "/proOrderDelete", method = RequestMethod.GET)
	public String deleteWhGET(String wo_code,RedirectAttributes rttr) {
		logger.debug("deleteWhGET 호출");
		oService.deleteProOrder(wo_code);
		rttr.addFlashAttribute("result", "CREATEOK");
		return "redirect:/pro/oderList";
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
	public void itemListGET(Model model,HttpServletRequest request) {
		
		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);
//		List<ItemdetailVO> itemList=iservice.idList();
		List<ItemdetailVO> itemList;
		if(item_code == null && item_name == null) {
			// 작업지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			itemList = oService.proitemList();
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		
		} else {
			// 작업지시 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//			proOrderList = oService.proOrderList();
			itemList = oService.proitemList(instrSearch, model);
//			int instrSearchCount = instructService.instrCount(instrSearch);
//			model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("idlistGET 실행");
		
		model.addAttribute("itemList", itemList);
	}// /itemListGET() method end
	
	
	
 // --------------------- 영신쿤  (｡･∀･)ﾉﾞﾞ -------------------------------------
	
	// http://localhost:8088/pro/etcstatusList
	@RequestMapping(value = "/etcstatusList", method = RequestMethod.GET)
	public void productEtclistGET(String wo_code, Model model) {
		logger.debug("productEtclistGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

		List<ProductionPerformanceVO> prodPerfList = ppService.prodPerfList(wo_code);
		model.addAttribute("prodPerfList", prodPerfList);
	}// productEtclistGET()
		// 생산관리 - 실적목록

	// http://localhost:8088/pro/etcWrite
	@RequestMapping(value = "/etcWrite", method = RequestMethod.GET)
	public void productEtcWriteGET(String wo_code,Model model) {
		logger.debug("etcWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo", pvo);
	}// productEtcWriteGET() method end
		// 생산관리 - 실적등록

	@RequestMapping(value = "/etcWrite", method = RequestMethod.POST)
	public void productEtcWritePOST(ProductionPerformanceVO ivo,String wo_code,ProOrderVO vo ) {
		logger.debug("etcWritePOST() 호출![]~(￣▽￣)~*");

		logger.debug(ivo + "");

		logger.debug(ivo.getPerf_id() + "@@@@");

		// 실적 등록 메서드 호출
		ppService.insertProdPerf(ivo);
		logger.debug("<ivo> : " + ivo);
		
		
		// 작업지시 상태 변경 메서드 호출
		logger.debug(vo.getWo_status() + "@@@@@@@@@@@");

//		oService.statusProOrder(wo_code,ivo);
		
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
	public String productEtcRemoveGET(ProductionPerformanceVO dvo,HttpServletRequest request) {
		logger.debug("productEtcRemoveGET() 호출![]~(￣▽￣)~*");
		String wo_code = request.getParameter("wo_code");
		ppService.perfDeleteBoard(dvo.getPerf_id());
		return "redirect:/pro/etcstatusList?wo_code="+wo_code;
	}// productEtcWriteGET() method end
		// 생산관리 - 실적 삭제
	
	
	

}// public class end
