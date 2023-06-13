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
@RequestMapping(value="/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	// 서비스의 정보가 필요함. > 의존관계
//	@Inject
//	private ProductService eService;
	
	// 동작 구현 > 메서드 설계
	
///////////////////////////////////////////////////관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/warehouse/warehouseList
	@RequestMapping(value="/warehouseList",method=RequestMethod.GET)
	public void warehouseListGET() {
		logger.debug("warehouseListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/warehouse/warehouseList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productListGET() method end
	// 상품관리 - 상품목록
	
	@RequestMapping(value="/warehouseWrite",method=RequestMethod.GET)
	public void stockWritetGET() {
		logger.debug("warehouseWriteGET()GET() 호출![]~(￣▽￣)~*");
		logger.debug("/stock/stockWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// itemWritetGET() method end
	// 상품관리 - 상품등록
	
	@RequestMapping(value="/warehouseEdit",method=RequestMethod.GET)
	public void stockEditGET() {
		logger.debug("stockEditGET() 호출![]~(￣▽￣)~*");
		logger.debug("/stock/stockEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// itemEditGET() method end
	// 상품관리 - 상품수정
	
	

}// public class end







