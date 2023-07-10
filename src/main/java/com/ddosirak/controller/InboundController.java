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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.InboundService;
import com.ddosirak.service.PageService;


@Controller
@RequestMapping(value="/inbound/*")
public class InboundController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private InboundService iService;
	@Inject
	private PageService pService;
	
	
	// http://localhost:8088/inbound
	//inboundWrite
	@RequestMapping(value="/inboundWrite",method=RequestMethod.GET)
	public void inboundWriteGET()  {
		logger.debug("inboundWriteGET() 호출!");
		logger.debug("inbound/inboundWrite.jsp 뷰페이지로 연결");
		
	}//입고예정 등록서로 이동
	
	@RequestMapping(value="/inboundWrite",method=RequestMethod.POST)
	public String inboundWritePOST(InboundVO vo) {
		logger.debug("inboundWritePOST() 호출!");
		logger.debug("입고서 정보 = "+vo);
		 
		iService.insertInbound(vo);
		
		int result = iService.updateOrderState(vo.getOrder_number());
		if(result == 1) {
			logger.info("입고예정등록 완료!! 입고리스트로 이동");
		}
		
		return "redirect:/inbound/inboundList";
	}//입고서 등록
	
	// http://localhost:8088/inbound/inboundList
	@RequestMapping(value="/inboundList",method=RequestMethod.GET)
	public void inboundListGET(Model model, HttpServletRequest request, PageVO pageVO) {
		logger.debug("inboundListGET() 호출!");
		logger.debug("inbound/inboundList.jsp 뷰페이지로 연결");
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
				int count = pService.countInList(pageVO); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		
		
		List<InboundVO> inboundList = iService.inboundAllList(pageVO);
		model.addAttribute("inboundList", inboundList);
		
	}//입고현황에서 입고목록 불러오기
	
	@RequestMapping(value="/InboundProcess",method=RequestMethod.GET)
	public void InboundProcessGET() {
		logger.debug("InboundProcessGET() 호출!");
		logger.debug("inbound/InboundProcess.jsp 뷰페이지로 연결");
	}//입고처리페이지 팝업띄우기
	
	@RequestMapping(value="/InboundProcess",method=RequestMethod.POST)
	public void InboundProcessPOST(InboundVO vo, HttpServletRequest req) throws Exception{
		logger.debug("InboundProcessGET() 호출!");
		int result = iService.updateInProcess(vo);
		
		Map param = new HashMap<>();
		
		param.put("in_Epiece", req.getParameter("Epiece"));
		param.put("material_code", req.getParameter("Code"));
		
		if(result == 1) {
			iService.updateMatrial(param);
			logger.info("입고처리 완료!! 입고리스트로 이동");
		}
		
		
	}//입고처리페이지 팝업띄우기
	
	@RequestMapping(value = "/InboundDelete",method = RequestMethod.POST)
	public String InboundDeletePOST(HttpServletRequest req) throws Exception {
		logger.info("@@@@@@@@@InboundDeletePOST() 호출!");
		String[] idArr = req.getParameterValues("valArr");
		
		Integer result = 0;
		
		for(int i=0;i<idArr.length;i++) {
			
					logger.info("@@@@@@@@@"+idArr[i]);
		String order_number = iService.getOrderNumber(idArr[i]); //선택된 in_id의 발주서 번호 선택
			iService.updateOrderStateToDefault(order_number); // 선택된 발주서 번호 발주상태 변경
			result = iService.deleteInbound(idArr[i]); //입고취소 
			
			logger.debug("입고취소 완료!!༼ つ ◕_◕ ༽つ");
	}
		return "redirect:/inbound/inboundList";
		
		
		
	}//입고삭제
	
	@RequestMapping(value = "/inbountModify")
	public void InboundModifyGET() {
		logger.info("@@@@@@@@@InboundModifyGET()호출!");
	}//입고수정get
	
	@RequestMapping(value = "/inbountModify",method = RequestMethod.POST)
	public void InboundModifyGET(InboundVO vo) {
		logger.info("@@@@@@@@@InboundModifyPOST()호출!");

		iService.updateInbound(vo);
		
		logger.info("입고서 수정완료!༼ つ ◕_◕ ༽つ");
	}
}