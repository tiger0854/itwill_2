package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.service.EmployeeService;

// 컨트롤러 구현 전 정하면 좋은 것들.
// - 컨트롤러별 공통 주소 (URI) 설계
// - 각 기능별 주소(URI) 설계
// - 각 URI별 호출방식 설정(GET/POST) 
//		> 사용자의 정보입력,조회(GET)
//		> 데이터 처리, Db접근(POST)  >> 해당 분류가 일반적인 방식.
// - 결과처리, 페이지 이동 설계
// - 예외처리


@Controller
@RequestMapping(value="/pro/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	// 서비스의 정보가 필요함. > 의존관계
//	@Inject
//	private ProductService eService;
	
	// 동작 구현 > 메서드 설계
	
///////////////////////////////////////////////////생산관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/pro/oderList
	// 회원가입 처리 - 정보 입력
	@RequestMapping(value="/oderList",method=RequestMethod.GET)
	public void productListGET() {
		logger.debug("productListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/oderList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productListGET() method end
	// 생산관리 - 작업지시목록
	
	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.GET)
	public void productWriteGET() {
		logger.debug("productWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productWriteGET() method end
	// 생산관리 - 작업지시글작성
	
	// http://localhost:8088/pro/orderEdit
	@RequestMapping(value="/orderEdit",method=RequestMethod.GET)
	public void productEditGET() {
		logger.debug("productWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productWriteGET() method end
	// 생산관리 - 작업지시글작성
	
	// http://localhost:8088/pro/orderstatusList
	@RequestMapping(value="/orderstatusList",method=RequestMethod.GET)
	public void productStatusGET() {
		logger.debug("productStatusGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
		
	}// productWriteGET() method end
	

	

}// public class end







