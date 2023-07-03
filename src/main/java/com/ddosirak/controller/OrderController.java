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

import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.OrderService;
import com.ddosirak.service.PageService;

@Controller
@RequestMapping(value="/inbound/*")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private OrderService oService;
	
	@Inject
	private PageService pService;
	
	// http://localhost:8088/inbound/orderWrite
	@RequestMapping(value="/orderWrite",method=RequestMethod.GET)
	public void orderWriteGET() {
		logger.debug("orderWriteGET() 호출!");
		logger.debug("inbound/order_write.jsp 뷰페이지로 연결");
		
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
	public void orderListGET(Model model, HttpServletRequest request, PageVO pageVO) {
		logger.debug("orderListGET() 호출!");
		logger.debug("inbound/orderList.jsp 뷰페이지로 연결");
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countRetOrdList(pageVO); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		List<OrderVO> orderList = oService.orderAllList(pageVO);
		model.addAttribute("orderList", orderList);
		
	}//발주현황에서 발주목록 불러오기
	
	
	
	// http://localhost:8088/inbound/requestList
	@RequestMapping(value="/requestList",method=RequestMethod.GET)
	public void requestListGET(Model model,HttpServletRequest request, PageVO pageVO ) {
		logger.debug("requestListGET() 호출!");
		
		// 페이징 처리
				// 한 화면에 보여줄 글 개수 설정
				int pageSize = 10; // sql문에 들어가는 항목
				
				// 현페이지 번호 가져오기
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null) {
					pageNum="1";
				}
				// 페이지번호를 정수형으로 변경
				int currentPage=Integer.parseInt(pageNum);
				pageVO.setPageSize(pageSize);
				pageVO.setPageNum(pageNum);
				pageVO.setCurrentPage(currentPage);
				int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
				int endRow = startRow+pageVO.getPageSize()-1;
				
				pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
				pageVO.setEndRow(endRow);
				
				// 게시글 개수 가져오기
				int count = pService.countRequestList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

				int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
				int startPage=(currentPage-1)/pageBlock*pageBlock+1;
				int endPage=startPage+pageBlock-1;
				int pageCount=count/pageSize+(count%pageSize==0?0:1);
				if(endPage > pageCount){
				 	endPage = pageCount;
				 }
				pageVO.setCount(count);
				pageVO.setPageBlock(pageBlock);
				pageVO.setStartPage(startPage);
				pageVO.setEndPage(endPage);
				pageVO.setPageCount(pageCount);
				
				model.addAttribute("pageVO", pageVO);
				//================================페이징 처리를 위한 값 받아오기 동작========================================
				model.addAttribute("requestList",oService.getRequestList(pageVO));
				logger.debug("###########"+oService.getRequestList(pageVO).size());
				
		logger.debug("inbound/requestList.jsp 뷰페이지로 연결");
		
	}//productList팝업창
	
	// http://localhost:8088/inbound/tradeList
	@RequestMapping(value="/tradeList",method=RequestMethod.GET)
	public void tradeListGET() {
		logger.debug("tradeListGET() 호출!");
		logger.debug("inbound/tradeList.jsp 뷰페이지로 연결");
		
	}//tradeList팝업창
	
	@RequestMapping(value="/empList",method=RequestMethod.GET)
	public void empListGET() {
		logger.debug("empListGET() 호출!");
		logger.debug("inbound/empList.jsp 뷰페이지로 연결");
		
	}//empList팝업창
	
	// http://localhost:8088/inbound/popOrderList
	@RequestMapping(value="/popOrderList",method=RequestMethod.GET)
	public void popOrderListGET(Model model,HttpServletRequest request, PageVO pageVO) {
		logger.debug("popOrderListGET() 호출!");
		logger.debug("inbound/popOrderList.jsp 뷰페이지로 연결");
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 10; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageVO.getPageSize()-1;
		
		pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		
		// 게시글 개수 가져오기
		int count = pService.countRetOrdList(pageVO); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);
		
		model.addAttribute("pageVO", pageVO);
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		List<OrderVO> orderList = oService.orderAllList(pageVO);
		model.addAttribute("orderList", orderList);
		
	}//발주현황에서 발주목록 불러오기(입고등록페이지에서 팝업창 띄움)
	
	@RequestMapping(value = "/orderModify",method=RequestMethod.GET )
	public void orderModifyGET() {
		logger.debug(" orderModifyGET() 호출!");
		logger.debug("inbound/orderModify.jsp 뷰페이지로 연결");
	}//발주수정 페이지로
	
	@RequestMapping(value = "/orderModify",method=RequestMethod.POST )
	public void orderModifyPOST(OrderVO vo) {
		logger.debug(" orderModifyPOST() 호출!");
		Integer result = oService.updateOrder(vo);
		logger.info("result="+result);
		
		
		
	}//발주수정기능
	
	@RequestMapping(value = "/orderDelete",method=RequestMethod.GET )
	public String orderDeleteGET(String order_number) {
		logger.debug(" orderModifyGET() 호출!");
		Integer result = oService.deleteOrder(order_number);
		logger.info("result="+result);
		return "redirect:/inbound/orderList";
		
	}//발주삭제
	
	

}
