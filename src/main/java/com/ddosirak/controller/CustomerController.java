package com.ddosirak.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.service.CustomerService;

@Controller
@RequestMapping(value="/customer/*")
public class CustomerController {
		 
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Inject
	private CustomerService cService;
	
//	http://localhost:8088/customer/customerList
	@RequestMapping(value = "/customerList",method=RequestMethod.GET) 
	public void customerGET(Model model)throws Exception {
		logger.debug("customerGET() 호출!");
		model.addAttribute("customerList",cService.customerList());
	}//거래처 리스트로 이동
	
	
//	http://localhost:8088/customer/customerWrite
	@RequestMapping(value = "/customerWrite",method=RequestMethod.GET) 
	public void customerWriteGET(Model model)throws Exception {
		logger.debug("customerWriteGET() 호출!");
		logger.debug("customerWrite.jsp 페이지로 이동");
		
		
	}//거래처 리스트로 이동
	
	
//	http://localhost:8088/customer/customerWrite
	@RequestMapping(value = "/customerWrite",method=RequestMethod.POST) 
	public String customerWritePOST(RedirectAttributes rttr,CustomerVO vo)throws Exception {
		logger.debug("customerWritePOST() 호출!");
		
		cService.insertCustomer(vo);
		
		logger.debug("거래처등록 성공!");
		
		rttr.addFlashAttribute("result","INSERTOK");
		return "redirect:/customer/customerWrite";

	}//거래처 리스트로 이동
	

	@RequestMapping(value = "/customerDelete",method = RequestMethod.POST)
	public String InboundDeletePOST(HttpServletRequest req) throws Exception {
		logger.info("@@@@@@@@@customerDeletePOST() 호출!");
		String[] idArr = req.getParameterValues("valArr");
		
		for(int i=0;i<idArr.length;i++) {
		
			 cService.deleteCustomer(idArr[i]); //입고취소 
	}
		return "redirect:/customer/customerList";
		
		
		
	}
	
	
	
	
}
