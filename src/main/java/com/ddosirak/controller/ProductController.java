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
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.service.EmployeeService;
import com.ddosirak.service.ProOrderService;

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
	@Inject
	private ProOrderService oService;
	
	// 동작 구현 > 메서드 설계
	
///////////////////////////////////////////////////생산관리//////////////////////////////////////////////////////////////////////////////
	// http://localhost:8088/pro/oderList
	// 회원가입 처리 - 정보 입력
	@RequestMapping(value="/oderList",method=RequestMethod.GET)
	public void productListGET(Model model) {
		logger.debug("productListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/oderList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		List<ProOrderVO> proOrderList = oService.proOrderList();
		model.addAttribute("oderList",proOrderList);
		
	}// productListGET() method end

	
	
	
	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.GET)
	public void productWriteGET(ProOrderVO vo) {
		logger.debug("orderWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug(vo+" ");
		// >> DAO > 사원 추가 메서드 호출
    
   
//		return "redirect:/emp/list"; // 주소를 변경하면서 페이지 이동
	}
	// http://localhost:8088/pro/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.POST)
	public void productWritePost(ProOrderVO vo) {
		logger.debug("orderWritePOST() 호출![]~(￣▽￣)~*");
		logger.debug(vo+" ");
		
		oService.orderInsert(vo);

//		return "redirect:/emp/list"; // 주소를 변경하면서 페이지 이동
	}// productWriteGET() method end
	// 생산관리 - 작업지시글작성
	
//	 http://localhost:8088/pro/orderEdit
	@RequestMapping(value="/orderEdit",method=RequestMethod.GET)
	public void productEditGET(String wo_code, Model model) {
		
		ProOrderVO pvo = oService.getProOder(wo_code);
		model.addAttribute("pvo",pvo);
		logger.debug("productWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
	}// productEditGET() method end
//	 생산관리 - 작업지시글수정
	
	@RequestMapping(value = "/orderEdit", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
	public String eproductEditPOST(ProOrderVO vo) { // (listPOST)
		logger.debug("productEditPOST() 호출![]~(￣▽￣)~*");
		logger.debug("vo > "+vo);
		 oService.EditProOrder(vo);

		return "redirect:/pro/orderEdit?wo_code="+vo.getWo_code();
	}// employeeUpdate() method end
	
	
	// http://localhost:8088/pro/orderstatusList
	@RequestMapping(value="/orderstatusList",method=RequestMethod.GET)
	public void productStatusGET() {
		logger.debug("productStatusGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/orderstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
		
		
	}// productStatusGET() method end
	// 생산관리 - 작업지시현황
	
	// http://localhost:8088/pro/etcstatusList
	@RequestMapping(value="/etcstatusList",method=RequestMethod.GET)
	public void productEtclistGET() {
		logger.debug("oetcstatusListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcstatusList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// productEtclistGET()
	// 생산관리 - 실적목록
	
	// http://localhost:8088/pro/etcWrite
	@RequestMapping(value="/etcWrite",method=RequestMethod.GET)
	public void productEtcWriteGET() {
		logger.debug("oetcstatusListGET() 호출![]~(￣▽￣)~*");
		logger.debug("/pro/etcWrite.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

	}// productEtcWriteGET() method end
	// 생산관리 - 실적등록
	
	
	

}// public class end







