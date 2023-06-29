package com.ddosirak.controller;

import java.sql.Date;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.EmployeeListVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.OutboundListVO;
import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.OutboundService;
import com.ddosirak.service.PageService;

@Controller
@RequestMapping(value = "/outbound/*")
public class OutboundController {

	private static final Logger logger = LoggerFactory.getLogger(OutboundController.class);
	
	@Inject
	private OutboundService oService;
	
	@Inject
	private PageService pService;
	
	// http://localhost:8088/outbound/outboundInsert
	// 출고 상품 등록
	@RequestMapping(value = "/outboundInsert", method = RequestMethod.GET)
	public void outInsertGET() {
		logger.debug("outInsertGET() 호출");
	}
	
	@RequestMapping(value = "/outboundInsert", method = RequestMethod.POST)
	public String outInsertPOST(@ModelAttribute(value="OutboundListVO") OutboundListVO olVo) {
		logger.debug("outInsertPOST() 호출");
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22"+olVo + "");

		for(int i=0;i<olVo.getOutboundList().size();i++) {
			OutboundVO vo = olVo.getOutboundList().get(i);
			oService.outInsert(vo);
		}
		logger.debug(olVo + "");
		
		return "redirect:/outbound/outboundList";
	}
//	@RequestMapping(value = "/outboundInsert", method = RequestMethod.POST)
//	public String outInsertPOST(OutboundVO vo) throws Exception {
//		logger.debug("outInsertPOST() 호출");
//		oService.outInsert(vo);
//		return "redirect:/outbound/outboundList";
//	}

	
	// 거래처 리스트(pop)
	@RequestMapping(value = "/customerList", method = RequestMethod.GET)
	public void customerListGET() {
		logger.debug("customerListGET() 호출");
	}
	
	// 사원 리스트(pop)
	@RequestMapping(value = "/empList", method = RequestMethod.GET)
	public void empListGET() {
		logger.debug("empListGET() 호출");
	}
		
	// 창고 리스트(pop)
	@RequestMapping(value = "/factoryList", method = RequestMethod.GET)
	public void factoryListGET() {
		logger.debug("factoryListGET() 호출");
	} 

	// 상품 목록 리스트(pop)
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public void itemListGET() {
		logger.debug("itemListGET() 호출");
	}
	
	
	
	
	// http://localhost:8088/outbound/outboundList
	// 출고 현황 리스트
	@RequestMapping(value = "/outboundList", method = RequestMethod.GET)
	public String outListGET(@RequestParam(name="state", required = false) String state,
							 @RequestParam(name = "out_num", required = false) String out_num,
							 @RequestParam(name = "out_state", required = false) Integer out_state,
							 Model model, PageVO pageVO, HttpServletRequest request) {
		logger.debug("outListGET() 호출");
		logger.info("#################out_num" + out_num +"########out_state"+ out_state);
		
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
		int count = pService.countOutList(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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

		
		
		// 출고 상태 업데이트
	    if (out_num != null && out_state != null) {
	        oService.updateOutState(out_num, out_state);
	    }
			
		// 상태에 따라 필터링된 리스트 가져오기
	    List<OutboundVO> outList;
	    if (state == null || state.isEmpty()) {
	        outList = oService.getOutList(pageVO); // 전체 리스트 가져오기
	    } else if (state.equals("ongoing")) {
	        outList = oService.getOngoingOutList(pageVO); // 진행중인 리스트 가져오기
	    } else if (state.equals("completed")) {
	        outList = oService.getCompletedOutList(pageVO); // 완료된 리스트 가져오기
	    } else {
	        outList = oService.getOutList(pageVO); // 기본적으로 전체 리스트 가져오기
	    }

		model.addAttribute("outList", outList);
		
		  // out_num 카운트하여 처리
	    List<OutboundVO> processedOutList = new ArrayList<>();
	    for (OutboundVO vo : outList) {
	        int oCount = oService.getOutNumCount(vo.getOut_num());
	        vo.setOutNumCount(oCount);

	        if (oCount > 1) {
	            vo.setItem_name(vo.getItem_name() + " 외 " + (oCount - 1) + " 건");
	        }
	        processedOutList.add(vo);
	    }
	    model.addAttribute("outList", processedOutList);
		 
		return "/outbound/outboundList";   

	}
	
	
	
	// 출고번호 클릭시 해당 출고 리스트 출력
	@RequestMapping(value = "/outProductList", method = RequestMethod.GET)
	public String outProductListGET(@RequestParam(name = "out_num", required = false) String out_num, Model model) {
		logger.debug("outProductListGET() 호출");
		
		logger.debug("out_num : " + out_num);
		// DB에 저장된 글 정보를 가져오기
		List<OutboundVO> outList = oService.getOutProductList(out_num);
		logger.debug("outList : " + outList);
		// 연겨로딘 뷰페이지를 전달(뷰-출력)
		model.addAttribute("outList", outList);
		return "/outbound/outProductList";
	}
	
	
	
	// 출고 재고 
	@RequestMapping(value = "/outboundStock", method = RequestMethod.GET)
	public void outboundStockGET() {
		logger.debug("outboundStockGET() 호출");
		logger.debug("/outbound/outboundStock.jsp 뷰 페이지 연결");		
	}

	
	
	//출고 수정
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.GET )
	public void outboundUpdateGET(Model model, @RequestParam("out_num") String out_num) throws Exception {
		logger.debug(" outboundUpdateGET() 호출!");
		model.addAttribute("vo", oService.getOutProductList(out_num));	
	}
	
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.POST )
	public String outboundUpdatePOST(OutboundVO uvo) throws Exception {
		logger.debug(" outboundUpdatePOST(vo) 호출!");
		oService.outboundUpdate(uvo);
		
		return "redirect:/receive/receiveList";
		
	}
	
	//출고 삭제
	@RequestMapping(value = "/outboundDelete",method=RequestMethod.GET )
	public String orderDeleteGET(String out_num) {
		logger.debug(" outboundDeleteGET(String out_num) 호출!");
		Integer result = oService.outboundDelete(out_num);
		logger.info("result="+result);
		
		return "redirect:/outbound/outboundList";	
	}
}
