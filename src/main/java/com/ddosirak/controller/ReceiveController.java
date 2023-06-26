package com.ddosirak.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.ReceiveVO;
import com.ddosirak.service.ReceiveService;


@Controller
@RequestMapping(value = "/receive/*")
public class ReceiveController {

	
	private static final Logger logger = LoggerFactory.getLogger(OutboundController.class);
	
	@Autowired
	private ReceiveService rService;
	
	
	// http://localhost:8088/receive/receiveInsert
	// 수주 등록 - C
	@RequestMapping(value = "/receiveInsert", method = RequestMethod.GET)
	public void receiveInsertGET() throws Exception {
		logger.debug("receiveInsertGET() 호출");
		logger.debug("/receive/receiveInsert.jsp 뷰 페이지 연결");
		
	}
	
	@RequestMapping(value = "/receiveInsert", method = RequestMethod.POST)
	public String receiveInsertPOST(ReceiveVO vo) throws Exception {
		logger.debug("receiveInsertPOST() 호출");
		logger.debug("vo : " + vo);
		
		rService.receiveInsert(vo);
		
		return "redirect:/receive/receiveList";
	}

	// http://localhost:8088/receive/receiveList
	// 수주 리스트 
	@RequestMapping(value = "/receiveList", method = RequestMethod.GET)
	public String receiveListGET() throws Exception {
		logger.debug("receiveListGET() 호출");
		logger.debug("/receive/receiveList.jsp 뷰 페이지 연결");
		
		List<ReceiveVO> receiveList = rService.receiveList();
		logger.debug("receiveList : " + receiveList);
		
		return "receive/receiveList";
	}
	
	
	// http://localhost:8088/receive/receiveDetail
	// 수주 상세 - R
	@RequestMapping(value = "/receiveDetail", method = RequestMethod.GET)
	public void receiveDetailGET() {
		logger.debug("receiveDetailGET() 호출");
		logger.debug("/receive/receiveDetail.jsp 뷰 페이지 연결");
		
	}
	

	// http://localhost:8088/receive/receiveUpdate
	// 수주 수정 - U
	@RequestMapping(value = "/receiveUpdate", method = RequestMethod.GET)
	public void receiveUpdateGET() {
		logger.debug("receiveUpdateGET() 호출");
		logger.debug("/receive/receiveUpdate.jsp 뷰 페이지 연결");
		
	}
	
		
		


}
