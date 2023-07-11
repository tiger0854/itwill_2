package com.ddosirak.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.ItemdetailService;

@Controller
@RequestMapping(value = "/foundation/itemdetail/*")
public class ItemdetailController {
	private static final Logger logger = LoggerFactory.getLogger(ItemdetailController.class);
	
	@Inject
	ItemdetailService service;
	
	@Inject
	HttpSession session;
	
	// http://localhost:8088/foundation/itemdetail/itemdetailList
	//상품 기초 목록 
	@RequestMapping(value="/itemdetailList", method=RequestMethod.GET)
	public String idlistGET(Model model, HttpServletRequest request, PageVO pageVO, @RequestParam(value ="pop",required = false) String pop) throws Exception {

		logger.debug("idlistGET 실행");
		
		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);

		// ================================페이징 처리를 위한 값 받아오기
		// 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		// 리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize}
		// 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow = (pageVO.getCurrentPage() - 1) * pageVO.getPageSize() + 1; // sql문에 들어가는 항목
		int endRow = startRow + pageVO.getPageSize() - 1;

		pageVO.setStartRow(startRow - 1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		int count = service.itemCount(instrSearch);
		logger.debug("글갯수 @@@@@@@@@@2" + count);
		// 게시글 개수 가져오기
		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);

		model.addAttribute("pageVO", pageVO);
		logger.debug("startRow @@@@@@@@@@2" + startRow);
		logger.debug("pageSize @@@@@@@@@@2" + pageSize);
//				List<ProOrderVO> proOrderList = oService.proOrderList();
		List<ItemdetailVO> itemList;
		if (item_code == null) {
			// 공장 전체 조회
			logger.debug("itemList 전체 호출 ![]~(￣▽￣)~*");
			itemList = service.idList(pageVO);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);

		} else {
			// 공장 검색 조회
			logger.debug("itemList 검색 호출 ![]~(￣▽￣)~*");
//					proOrderList = oService.proOrderList();
			itemList = service.idList(pageVO, instrSearch);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);
		}
		model.addAttribute("Search", instrSearch);
		model.addAttribute("itemList", itemList);
		
		if(pop != null && pop.equals("rec")) {
			return "/receive/productList";
		} if(pop != null && pop.equals("out")) {
			return "/outbound/itemList";
		}
		
		if(session.getAttribute("login_id")==null) {
			return "redirect:/public/login";
		}
		
		return null;
		
	}
	
	//상품 기초 등록
	@RequestMapping(value = "/itemdetailUpload", method=RequestMethod.GET)
	public void iduploadGET() throws Exception {
		logger.debug("idUploadGET 실행");
	}
	
	@RequestMapping(value = "/itemdetailUpload", method=RequestMethod.POST)
	public void idUploadPOST(ItemdetailVO vo) throws Exception {
		logger.debug("idUploadPOST 실행");
		service.insertID(vo);
//		int result=service.insertID(vo);
//		if(result==0) {
//			return "/foundation/itemdetail/itemdetailUpload";
//		}else {
//			return "redirect:/foundation/itemdetail/itemdetailList";
//		}
	}
	
	//상품 기초 수정
	@RequestMapping(value = "/itemdetailUpdate", method=RequestMethod.GET)
	public void idUpdateGET(String item_code, Model model) throws Exception {


		logger.debug("idUpdateGET 실행");
		ItemdetailVO vo =service.selectID(item_code);
		model.addAttribute("vo", vo);
	}
	@RequestMapping(value = "/itemdetailUpdate", method=RequestMethod.POST)

	public void idUpdatePOST(ItemdetailVO vo) throws Exception {

		logger.debug("idUpdatePOST 실행");
		service.updateID(vo);
		logger.debug("@@@@@@@vo : " + vo);
//		int result=service.updateID(vo);
//		if(result==0) {
//			return "/foundation/itemdetail/itemdetailUpdate";
//		}else {
//			return "redirect:/foundation/itemdetail/itemdetailList";
//		}
	}
	
	//상품 기초 삭제
	@RequestMapping(value="/itemdetailDelete", method=RequestMethod.GET)
	public String idDeleteGET(String item_code) throws Exception {

		logger.debug("idDeleteGET 호출");
		service.deleteI(item_code);
		return "redirect:/foundation/itemdetail/itemdetailList";
	}
	
}
