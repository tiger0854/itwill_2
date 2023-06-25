package com.ddosirak.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.OutboundVO;
import com.ddosirak.service.OutboundService;

@Controller
@RequestMapping(value = "/outbound/*")
public class OutboundController {

	private static final Logger logger = LoggerFactory.getLogger(OutboundController.class);
	
	@Inject
	private OutboundService oService;
	
	// 출고 상품 등록
	// http://localhost:8088/outbound/outboundInsert
	@RequestMapping(value = "/outboundInsert", method = RequestMethod.GET)
	public void outInsertGET() {
		logger.debug("outInsertGET() 호출");
		logger.debug("/outbound/outboundInsert.jsp 뷰 페이지 연결");	
	}
	
	@RequestMapping(value = "/outboundInsert", method = RequestMethod.POST)
	public String outInsertPOST(HttpServletRequest request, OutboundVO vo) throws Exception {
		logger.debug("outInsertPOST() 호출");
		
		logger.debug(vo+ "");
		oService.outInsert(vo);
	
		return "redirect:/outbound/outboundList";
		
	}// 출고 상품 등록
	
	
	// 거래처 리스트
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public void customerGET() {
		logger.debug("customertGET() 호출");
		logger.debug("/outbound/customer.jsp 뷰 페이지 연결");		
	} // 거래처 리스트
	
	// 사원 리스트
	@RequestMapping(value = "/outEmployee", method = RequestMethod.GET)
	public void outEmployeeGET() {
		logger.debug("outEmployeeGET() 호출");
		logger.debug("/outbound/outEmployee.jsp 뷰 페이지 연결");		
	} // 사원 리스트
	
	// 창고 리스트
	@RequestMapping(value = "/outWarehouse", method = RequestMethod.GET)
	public void outWarehouseGET() {
		logger.debug("outWarehouseGET() 호출");
		logger.debug("/outbound/outWarehouse.jsp 뷰 페이지 연결");		
	} // 창고 리스트

	// 상품 목록 리스트
	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public void outProductGET() {
		logger.debug("outProductGET() 호출");
		logger.debug("/outbound/productSearch.jsp 뷰 페이지 연결");		
	} // 상품 목록 리스트
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////	
	
	// 출고 현황 리스트
	// http://localhost:8088/outbound/outboundList
	@RequestMapping(value = "/outboundList", method = RequestMethod.GET)
	public String outListGET(@RequestParam(name="state", required = false) String state,
			@RequestParam(name = "out_num", required = false) String outNum,
			@RequestParam(name = "out_state", required = false) Integer newState, Model model) {
		logger.debug("outListGET() 호출");
		logger.debug("/outbound/outboundList.jsp 뷰페이지 연결");
		
		logger.info("#################outNum" + outNum +"########newState"+ newState);
		// 출고 상태 업데이트
	    if (outNum != null && newState != null) {
	        oService.updateOutState(outNum, newState);
	    }
		
		 // 출고 상태 업데이트
//	    if (outNum != null && newState != null) {
//	        // 취소 버튼인 경우
//	        if (newState == 0) {
//	            // 취소 로직 처리
//	        	logger.info("#################outNum" + outNum +"########newState"+ newState + "취소완");
//	            // 필요한 작업을 수행하거나 업데이트를 진행하지 않음
//	        } else {
//	            // 완료 버튼인 경우
//	            oService.updateOutState(outNum, newState);
//	            logger.info("#################outNum" + outNum +"########newState"+ newState + "출고완");
//	        }
//	    }
	
		// 상태에 따라 필터링된 리스트 가져오기
	    List<OutboundVO> outList;
	    if (state == null || state.isEmpty()) {
	        outList = oService.getOutList(); // 전체 리스트 가져오기
	    } else if (state.equals("ongoing")) {
	        outList = oService.getOngoingOutList(); // 진행중인 리스트 가져오기
	    } else if (state.equals("completed")) {
	        outList = oService.getCompletedOutList(); // 완료된 리스트 가져오기
	    } else {
	        outList = oService.getOutList(); // 기본적으로 전체 리스트 가져오기
	    }

		model.addAttribute("outList", outList);
		
		  // out_num 카운트하여 처리
	    List<OutboundVO> processedOutList = new ArrayList<>();
	    for (OutboundVO vo : outList) {
	        int count = oService.getOutNumCount(vo.getOut_num());
	        vo.setOutNumCount(count);

	        if (count > 1) {
	            vo.setItem_name(vo.getItem_name() + " 외 " + (count - 1) + " 건");
	        }
	        processedOutList.add(vo);
	    }
	    model.addAttribute("outList", processedOutList);
		 
		return "/outbound/outboundList";   

	}
	// 출고 현황 리스트
	
	
	// 출고번호 클릭시 해당 출고 리스트 출력
	@RequestMapping(value = "/outProductList", method = RequestMethod.GET)
	public String outProductListGET(@RequestParam(name = "out_num", required = false) String outNum, Model model) {
		logger.debug("outProductListGET() 호출");
		
		logger.debug("out_num : " + outNum);
		// DB에 저장된 글 정보를 가져오기
		List<OutboundVO> outList = oService.getOutProductList(outNum);
		logger.debug("outList : " + outList);
		// 연겨로딘 뷰페이지를 전달(뷰-출력)
		model.addAttribute("outList", outList);
		return "/outbound/outProductList";
	}
	
	
	// 출고 재고 
	@RequestMapping(value = "/outboundStock", method = RequestMethod.GET)
	public void outboundStockGET() {
		logger.debug("outboundStockGET() 호출");
		logger.debug("/outbound/outboundStock.jsp 뷰 페이지 연결");		
	}
	// 출고 재고 
	
	
	//출고 수정
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.GET )
	public void outboundUpdateGET() {
		logger.debug(" outboundUpdateGET() 호출!");
		logger.debug("outbound/outboundUpdate.jsp 뷰페이지로 연결");
	}
	
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.POST )
	public void outboundUpdatePOST(OutboundVO vo) {
		logger.debug(" outboundUpdatePOST(OutboundVO vo) 호출!");
		Integer result = oService.outboundUpdate(vo);
		logger.info("result="+result);
	}//출고 수정
	
	//출고 삭제
	@RequestMapping(value = "/outboundDelete",method=RequestMethod.GET )
	public String orderDeleteGET(String out_num) {
		logger.debug(" outboundDeleteGET(String out_num) 호출!");
		Integer result = oService.outboundDelete(out_num);
		logger.info("result="+result);
		
		return "redirect:/outbound/outboundList";	
	}//출고 삭제
}
