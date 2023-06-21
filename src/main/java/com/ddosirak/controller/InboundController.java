package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.service.InboundService;


@Controller
@RequestMapping(value="/inbound/*")
public class InboundController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private InboundService iService;
	
	
	// http://localhost:8088/inbound/inboundWrite
	@RequestMapping(value="/inboundWrite",method=RequestMethod.GET)
	public void inboundWriteGET()  {
		logger.debug("inboundWriteGET() 호출!");
		logger.debug("inbound/inboundWrite.jsp 뷰페이지로 연결");
		
	}//입고예정 등록서로 이동
	
	@RequestMapping(value="/inboundWrite",method=RequestMethod.POST)
	public String inboundWritePOST(InboundVO vo) {
		logger.debug("inboundWritePOST() 호출!");
		logger.debug("입고서 정보 = "+vo);
		 
		iService.insertInbound(vo);
		
		int result = iService.updateOrderState(vo.getOrder_number());
		if(result == 1) {
			logger.info("입고예정등록 완료!! 입고리스트로 이동");
		}
		
		return "redirect:/inbound/inboundList";
	}//입고서 등록
	
	// http://localhost:8088/inbound/inboundList
	@RequestMapping(value="/inboundList",method=RequestMethod.GET)
	public void orderListGET(Model model) {
		logger.debug("inboundListGET() 호출!");
		logger.debug("inbound/inboundList.jsp 뷰페이지로 연결");
		
		List<InboundVO> inboundList = iService.inboundAllList();
		model.addAttribute("inboundList", inboundList);
		
	}//발주현황에서 발주목록 불러오기
	
	@RequestMapping(value="/InboundProcess",method=RequestMethod.GET)
	public void InboundProcessGET() {
		logger.debug("InboundProcessGET() 호출!");
		logger.debug("inbound/InboundProcess.jsp 뷰페이지로 연결");
	}//입고처리페이지 팝업띄우기
	
	@RequestMapping(value="/InboundProcess",method=RequestMethod.POST)
	public void InboundProcessPOST(InboundVO vo) {
		logger.debug("InboundProcessGET() 호출!");
		int result = iService.updateInProcess(vo);
		
		if(result == 1) {
			logger.info("입고처리 완료!! 입고리스트로 이동");
		}
		
		
	}//입고처리페이지 팝업띄우기
	
	@RequestMapping(value = "/InboundDelete",method = RequestMethod.POST)
	public String InboundDeletePOST(HttpServletRequest req) throws Exception {
		logger.info("@@@@@@@@@InboundDeletePOST() 호출!");
		String[] idArr = req.getParameterValues("valArr");
		
		Integer result = 0;
		
		for(int i=0;i<idArr.length;i++) {
			
					logger.info("@@@@@@@@@"+idArr[i]);
		String order_number = iService.getOrderNumber(idArr[i]); //선택된 in_id의 발주서 번호 선택
			iService.updateOrderStateToDefault(order_number); // 선택된 발주서 번호 발주상태 변경
			result = iService.deleteInbound(idArr[i]); //입고취소 
	}
		return "redirect:/inbound/inboundList";
		
		
		
	}
	
}//컨트롤러 끝 
