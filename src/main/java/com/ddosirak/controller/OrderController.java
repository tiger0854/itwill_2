package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.OrderVO;
import com.ddosirak.service.OrderService;

@Controller
@RequestMapping(value="/inbound/*")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private OrderService oService;
	
	// http://localhost:8088/inbound/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.GET)
	public void orderWriteGET() {
		logger.debug("orderWriteGET() 호출!");
		logger.debug("ret/order_write.jsp 뷰페이지로 연결");
		
	}//발주서 페이지로 이동
	
	@RequestMapping(value="/orderWrite",method=RequestMethod.POST)
	public String orderWritePOST(OrderVO vo) {
		logger.debug("orderWriteGET() 호출!");
		logger.debug("발주서 정보 = "+vo);
		
		oService.insertOrder(vo);
		logger.info("발주서 등록 완료.!!발주현황 페이지로 이동!!!");
		return "redirect:/inbound/orderList";
	}//발주서 등록
	
	
	// http://localhost:8088/inbound/orderList
	@RequestMapping(value="/orderList",method=RequestMethod.GET)
	public void orderListGET(Model model) {
		logger.debug("orderListGET() 호출!");
		logger.debug("ret/orderList.jsp 뷰페이지로 연결");
		
		List<OrderVO> orderList = oService.orderAllList();
		model.addAttribute("orderList", orderList);
		
	}//발주현황에서 발주목록 불러오기
	
	
	
	// http://localhost:8088/inbound/productList
	@RequestMapping(value="/productList",method=RequestMethod.GET)
	public void productListGET() {
		logger.debug("productListGET() 호출!");
		logger.debug("ret/productList.jsp 뷰페이지로 연결");
		
	}
}
