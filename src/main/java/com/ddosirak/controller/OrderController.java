package com.ddosirak.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.service.OrderService;

@Controller
@RequestMapping(value="/ret/*")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private OrderService oService;
	
	// http://localhost:8088/ret/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.GET)
	public void orderWriteGET() {
		logger.debug("orderWriteGET() 호출!");
		logger.debug("ret/order_write.jsp 뷰페이지로 연결");
		
	}
	
	
	// http://localhost:8088/ret/orderList
	@RequestMapping(value="/orderList",method=RequestMethod.GET)
	public void orderListGET() {
		logger.debug("orderListGET() 호출!");
		logger.debug("ret/orderList.jsp 뷰페이지로 연결");
		
	}
	
	// http://localhost:8088/ret/productList
	@RequestMapping(value="/productList",method=RequestMethod.GET)
	public void productListGET() {
		logger.debug("productListGET() 호출!");
		logger.debug("ret/productList.jsp 뷰페이지로 연결");
		
	}
}
