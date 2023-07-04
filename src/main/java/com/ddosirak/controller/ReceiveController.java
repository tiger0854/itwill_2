package com.ddosirak.controller;

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

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ReceiveVO;
import com.ddosirak.service.PageService;
import com.ddosirak.service.ReceiveService;


@Controller
@RequestMapping(value = "/receive/*")
public class ReceiveController {

	
	private static final Logger logger = LoggerFactory.getLogger(OutboundController.class);
	
	@Autowired
	private ReceiveService rService;
	
	@Inject
	private PageService pService;
	
	
	// http://localhost:8088/receive/receiveInsert
	// 수주 등록 - C
	@RequestMapping(value = "/receiveInsert", method = RequestMethod.GET)
	public void receiveInsertGET() throws Exception {
		logger.debug("receiveInsertGET() 호출");		
	}
	
	@RequestMapping(value = "/receiveInsert", method = RequestMethod.POST)
	public String receiveInsertPOST(ReceiveVO vo) throws Exception {
		logger.debug("receiveInsertPOST() 호출");
		logger.debug(vo+"");
		
		rService.receiveInsert(vo);
		rService.receiveRequest();
		
		return "redirect:/receive/receiveList";
	} 
	
	
	// 거래처 리스트(pop)
		@RequestMapping(value = "/customerList", method = RequestMethod.GET)
		public void customerListGET() {
			logger.debug("customertListGET() 호출");
	} 
		
		
	// 사원 리스트(pop)
	@RequestMapping(value = "/empList", method = RequestMethod.GET)
	public void empListGET() {
		logger.debug("empListGET() 호출");
	} 
	
	
	// 상품 목록 리스트(pop)
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public void outProductGET() {
		logger.debug("productListGET() 호출");
	} 
		
	

	// http://localhost:8088/receive/receiveList
	// 수주 리스트 
	@RequestMapping(value = "/receiveList", method = RequestMethod.GET)
	public String receiveListGET(PageVO pageVO, Model model, HttpServletRequest request) throws Exception {
		logger.debug("receiveListGET() 호출");
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
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
		int count = pService.countReceiveList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		
		
		List<ReceiveVO> receiveList = rService.receiveList(pageVO);
		logger.debug("receiveList : " + receiveList);
		
		model.addAttribute("receiveList", receiveList);
		
		return "receive/receiveList";
	}
	

	// http://localhost:8088/receive/receiveDetail
	// 수주 상세 - R
	@RequestMapping(value = "/receiveDetail", method = RequestMethod.GET)
	public void receiveDetailGET(@RequestParam("re_code") String re_code, Model model ) throws Exception {
		logger.debug("receiveDetailGET() 호출");
		logger.debug("re_code : " + re_code);
		
		model.addAttribute("vo", rService.receiveDetail(re_code));
	}
	

	// http://localhost:8088/receive/receiveUpdate
	// 수주 수정 - U
	@RequestMapping(value = "/receiveUpdate", method = RequestMethod.GET)
	public void receiveUpdateGET(Model model, @RequestParam("re_code") String re_code) throws Exception {
		logger.debug("receiveUpdateGET() 호출");
		model.addAttribute("vo", rService.receiveDetail(re_code));	
	}
	
	@RequestMapping(value = "/receiveUpdate", method = RequestMethod.POST)
	public String receiveUpdatePOST(ReceiveVO uvo) throws Exception {
		logger.debug("receiveUpdatePOST() 호출");
		logger.debug("uvo : " + uvo);
		rService.receiveUpdate(uvo);
		return "redirect:/receive/receiveList";
	}
	
	
	// 수주 삭제 - D
	@RequestMapping(value = "/receiveRemove", method = RequestMethod.POST)
	public String receiveRemovePOST(@RequestParam("re_code") String re_code) throws Exception {
		logger.debug("receiveRemovePOST() 호출");
		logger.debug("re_code : " + re_code);
		rService.receiveRemove(re_code);
		
		return "redirect:/receive/receiveList";
	}
	
		
		


}
