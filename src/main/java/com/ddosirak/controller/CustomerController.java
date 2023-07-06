package com.ddosirak.controller;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.CustomerService;
import com.ddosirak.service.PageService;

@Controller
@RequestMapping(value="/customer/*")
public class CustomerController {
		 
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Inject
	private CustomerService cService;
	
	@Inject
	private PageService pService;
	
//	http://localhost:8088/customer/customerList?pop=no
	@RequestMapping(value = "/customerList",method=RequestMethod.GET) 
	public String customerGET(Model model,PageVO pageVO, HttpServletRequest request,@RequestParam(value ="pop",required = false) String pop)throws Exception {
		
		logger.debug("customerGET() 호출!");
		
		
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 8; // sql문에 들어가는 항목
		
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
		int count = pService.countCusList(pageVO); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		model.addAttribute("customerList",cService.customerList(pageVO));
		
		if(pop != null && pop.equals("ok")) {
			return "/inbound/tradeList";
		} else if(pop != null && pop.equals("rec")) {
			return "/receive/customerList";
		} else if(pop != null && pop.equals("out")) {
			return "/outbound/customerList";
		}
			return "/customer/customerList";
		
	}//거래처 리스트로 이동

	
	
	@RequestMapping(value = "/customerDetail",method=RequestMethod.GET) 
	public void customerDetailGET(@RequestParam("cus_id") String cus_id, Model model)throws Exception {
		logger.debug("customerDetailGET() 호출!");
		
		model.addAttribute("cus",cService.customerDetail(cus_id));
		
		
		
	}//거래처 상세목록으로 이동
	
	
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
	public String InboundDeletePOST(HttpServletRequest req,RedirectAttributes rttr) throws Exception {
		logger.info("@@@@@@@@@customerDeletePOST() 호출!");
		String[] idArr = req.getParameterValues("valArr");
		
		for(int i=0;i<idArr.length;i++) {
		
			 cService.deleteCustomer(idArr[i]); //거래처 삭제서비스 
	}
		rttr.addFlashAttribute("result","DELETEOK");
		return "redirect:/customer/customerList";

	}//거래처삭제
	
	@RequestMapping(value = "/customerModify",method = RequestMethod.GET)
	public void IcustomerModifyGET(@RequestParam("cus_id") String cus_id, Model model) throws Exception {
		logger.debug("@@@@@@@@@IcustomerModifyGET() 호출!");
		logger.debug("@@@@@@@@@ customer/customerModify.jsp 페이지로 이동!");
		
		model.addAttribute("cus",cService.customerDetail(cus_id));

	}//거래처수정페이지로
	
	@RequestMapping(value = "/customerModify",method = RequestMethod.POST)
	public String IcustomerModifyPOST(CustomerVO vo,RedirectAttributes rttr) throws Exception {
		logger.debug("@@@@@@@@@IcustomerModifyPOST() 호출!");
		
		cService.updateCustomer(vo);
		logger.debug("거래처 수정 성공!");
		rttr.addFlashAttribute("result","UPDATEOK");
		return "redirect:/customer/customerModify?cus_id="+vo.getCus_id();

	}//거래처수정
	
	
	@RequestMapping(value = "/NumberCheck",method = RequestMethod.POST)
	@ResponseBody
	public Integer NumberCheckPOST(@RequestParam String cus_number) throws Exception {
		logger.debug("@@@@@@@@@IcustomerModifyPOST() 호출!");
		
		return cService.selectCusNumber(cus_number);
		

	}//사업자번호 조회

	
	
}
