package com.ddosirak.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.OutboundVO;
import com.ddosirak.service.OutboundService;

@Controller
@RequestMapping(value = "/outbound/*")
public class OutboundController {

	
	private static final Logger logger = LoggerFactory.getLogger(OutboundController.class);
	
	@Inject
	private OutboundService oService;
	
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
		
	}
	
	
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public void customerGET() {
		logger.debug("customertGET() 호출");
		logger.debug("/outbound/customer.jsp 뷰 페이지 연결");
		
	}
	
	@RequestMapping(value = "/outEmployee", method = RequestMethod.GET)
	public void outEmployeeGET() {
		logger.debug("outEmployeeGET() 호출");
		logger.debug("/outbound/outEmployee.jsp 뷰 페이지 연결");
		
	}
	
	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public void outProductGET() {
		logger.debug("outProductGET() 호출");
		logger.debug("/outbound/productSearch.jsp 뷰 페이지 연결");		
	}
	
	@RequestMapping(value = "/outWarehouse", method = RequestMethod.GET)
	public void outWarehouseGET() {
		logger.debug("outWarehouseGET() 호출");
		logger.debug("/outbound/outWarehouse.jsp 뷰 페이지 연결");		
	}
	
	
	
//	@RequestMapping(value = "/customer", method = RequestMethod.GET)
//	public void customerGET(Model model) {
//		logger.debug("customerGET() 호출");
//		logger.debug("/outbound/customer.jsp 연결");
//		
//		List<OutboundVO> customerList = oService.getCustomerList();
//
//		model.addAttribute("customerList", customerList);
//	} 
	
	
///////////////////////////////////////////////////////////////////////////////////////////////	
	
	// http://localhost:8088/outbound/outboundList
	@RequestMapping(value = "/outboundList", method = RequestMethod.GET)
	public String outListGET(@RequestParam(name="state", required = false) String state,
			@RequestParam(name = "out_num", required = false) Integer outNum,
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
		
		// 출고 예정 리스트 가져오기
//		List<OutboundVO> outList = oService.getOutList();

		model.addAttribute("outList", outList);
		 
		return "/outbound/outboundList";   

	}
	
	
	
	
	
	
//	// http://localhost:8088/outbound/update
//	@RequestMapping(value = "/update", method = RequestMethod.GET)
//	public String outUpdateGET() {
//		logger.debug("outUpdateGET() 호출");
//		
//		return "/outbound/outboundUpdate";
//	}
//	
}
