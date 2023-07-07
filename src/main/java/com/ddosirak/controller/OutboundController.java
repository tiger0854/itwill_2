package com.ddosirak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.OutboundListVO;
import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ReceiveVO;
import com.ddosirak.service.OutboundService;
import com.ddosirak.service.PageService;
import com.ddosirak.service.ReceiveService;


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
							 @RequestParam(name="search", required = false) String search,
							 Model model, PageVO pageVO, HttpServletRequest request) {
		logger.debug("outListGET() 호출");
		logger.info("#################out_num" + out_num +"########out_state"+ out_state);
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		Map<String, Object> param = new HashMap<String, Object>(); // hyo
		
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
		pageVO.setSearch(search); // hyo
		
		param.put("pageVO", pageVO); //hyo
		param.put("state", state); //hyo
		
		// 게시글 개수 가져오기
		int count = pService.countOutList(param); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!
		logger.debug("count : " + count);
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
			
	    // 출고 리스트 가져오기
	    List<OutboundVO> outList;
	    outList = oService.getOutList(param);

		model.addAttribute("outList", outList);
		model.addAttribute("state", state);
		model.addAttribute("search", search);

		 
		return "/outbound/outboundList";   

	}
	
	
	
	// 출고번호 클릭시 해당 출고 리스트 출력
		@RequestMapping(value = "/outProductList", method = RequestMethod.GET)
		public String outProductListGET(@RequestParam(name = "out_num", required = false) String out_num, Model model) {
			logger.debug("outProductListGET() 호출");
			
			logger.debug("out_num : " + out_num);

			List<OutboundVO> outList = oService.getOutProductList(out_num);
			logger.debug("outList : " + outList);

			model.addAttribute("outList", outList);
			return "/outbound/outProductList";
		}
	
	
	
	// 출고 재고 
	@RequestMapping(value = "/outboundStock", method = RequestMethod.GET)
	public String outboundStockGET(@RequestParam(name = "out_num", required = false) String out_num, Model model) throws Exception {
		logger.debug("outboundStockGET() 호출");
		logger.debug("out_num @@@@@@@@@@@@@@@@@@@@: " + out_num);
		List<OutboundVO> outList = oService.getStockList(out_num);
		logger.debug("outList : " + outList);

		model.addAttribute("outList", outList);
		return "/outbound/outboundStock";	
	}
	
	// 출고 처리
//	@RequestMapping(value = "/outProcess", method = RequestMethod.GET)
//	public void outProcessGET() {
//		logger.debug("outProcessGET() 호출");
//	}
//	
//	@RequestMapping(value="/outProcess",method=RequestMethod.POST)
//	public void outProcessPOST(OutboundVO vo) {
//		logger.debug("outProcessGET() 호출!");
//		int result = oService.outProcessModify(vo);
//		
//		if(result == 1) {
//			logger.info("출고완료");
//		}
//	}
	
	
	// 출고 처리
	@RequestMapping(value = "/outProcess", method = RequestMethod.GET)
	public void outProcessGET() {
		logger.debug("outProcessGET() 호출");
	}
	
	@RequestMapping(value="/outProcess",method=RequestMethod.POST)
	public void outProcessPOST(OutboundVO vo, @RequestParam(name = "out_num", required = false) String out_num) throws Exception {
		logger.debug("outProcessGET() 호출!");
		
		oService.outProcessModify(vo);
		
		String re_code = oService.recCd(out_num);
		logger.debug("re_code !~~~~~~~~~~~~~~~~~~~~~~~~~#@#!@#$@$: " + re_code);
		oService.recStateUpdate(re_code);
	
		logger.debug("수주 상태 수정 완료");
		
	}

	
	
	//출고 수정
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.GET )
	public void outboundUpdateGET() throws Exception {
		logger.debug(" outboundUpdateGET() 호출!");
	}
	
	@RequestMapping(value = "/outboundUpdate",method=RequestMethod.POST )
	public void outboundUpdatePOST(OutboundVO uvo) throws Exception {
		logger.debug(" outboundUpdatePOST(vo) 호출!");
		Integer result = oService.outboundUpdate(uvo);
	}
	
	//출고 삭제
	@RequestMapping(value = "/outboundDelete",method=RequestMethod.POST )
	public String outboundDeletePOST(String out_num, HttpServletRequest req, OutboundVO vo) throws Exception {
		logger.debug(" outboundDeletePOST(String out_num) 호출!");
		String[] checkArr = req.getParameterValues("valArr");

		int result = 0;
		for(int i = 0 ; i < checkArr.length ; i++) {
			result = oService.outboundDelete(checkArr[i]);
			
			logger.debug("출고 취소 완료");
		}
		
		return "redirect:/outbound/outboundList";	
	}
	
	
	
	
}
