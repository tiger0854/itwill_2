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

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.service.FactoryService;

@RequestMapping(value = "/foundation/factory/*")
@Controller
public class FactoryController {
	public static final Logger logger = LoggerFactory.getLogger(FactoryController.class);

	@Inject
	FactoryService service;

	// http://localhost:8088/foundation/factory/factoryList
	// 공장 목록 출력
	@RequestMapping(value = "/factoryList", method = RequestMethod.GET)
	public void factoryListGET(Model model, HttpServletRequest request, PageVO pageVO) {

		logger.debug("factoryListGET 호출");

		
//		List<FactoryVO> factoryList;
//		if (factory_code == null && factory_name == null) {
//			// 전체 조회
//			logger.debug("factoryList.jsp 전체 호출 ![]~(￣▽￣)~*");
//			factoryList = service.facList();
//
//		} else {
			// 검색 조회
//			logger.debug("factoryList.jsp 검색 호출 ![]~(￣▽￣)~*");
//				proOrderList = oService.proOrderList();
//			factoryList = service.factoryItemList(instrSearch, model);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
//		}
//		logger.debug("materialListGET 실행");
//
//		model.addAttribute("factoryList", factoryList);
		
		String factory_code = request.getParameter("factory_code");
		String factory_name = request.getParameter("factory_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("factory_code", factory_code);
		instrSearch.put("factory_name", factory_name);

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
		int count = service.factoryCount(instrSearch);
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
		List<FactoryVO> factoryList;
		if (factory_code == null) {
			// 공장 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			factoryList = service.facList(pageVO);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);

		} else {
			// 공장 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//					proOrderList = oService.proOrderList();
			factoryList = service.facList(pageVO, instrSearch, model);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);
		}

		model.addAttribute("Search", instrSearch);
		model.addAttribute("factoryList", factoryList);

	}


	// 공장 등록
	@RequestMapping(value = "/factoryUpload", method = RequestMethod.GET)
	public void factoryUploadGET() {
		logger.debug("factoryUploadGET 호출");
	}

	@RequestMapping(value = "/factoryUpload", method = RequestMethod.POST)
	public void factoryUploadPOST(FactoryVO vo) {

		logger.debug("factoryUploadPOST 호출");
		service.insertFac(vo);

	}

	// 창고 수정
	@RequestMapping(value = "/factoryUpdate", method = RequestMethod.GET)
	public void factoryUpdateGET(String factory_code, Model model) {

		logger.debug("factoryUpdateGET 호출");
		FactoryVO resultvo = service.selectFac(factory_code);
		logger.debug(resultvo + "");
		model.addAttribute("vo", resultvo);
	}

	@RequestMapping(value="/factoryUpdate", method=RequestMethod.POST)
	public String factoryUpdatePOST(FactoryVO vo) throws Exception {
		logger.debug("factoryUpdatePOST 호출");
		service.updateFac(vo);

	}

	
	//창고 삭제
	@RequestMapping(value="/factoryDelete", method=RequestMethod.GET)
	public String factoryDeleteGET(String factory_code) throws Exception {
		logger.debug("factoryDeleteGET 호출");
		service.deleteF(factory_code);
		return "redirect:/foundation/factory/factoryList?factory_name=&factory_code=";
	}

	// 상품목록(팝업)
	@RequestMapping(value = "/factoryItemList", method = RequestMethod.GET)
	public void factoryItemListGET(Model model, HttpServletRequest request) {

		String factory_code = request.getParameter("factory_code");
		String factory_name = request.getParameter("factory_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("factory_code", factory_code);
		instrSearch.put("factory_name", factory_name);
		List<FactoryVO> factoryList;
		if (factory_code == null && factory_name == null) {
			// 작업지시 전체 조회
			logger.debug("factoryItemList.jsp 전체 호출 ![]~(￣▽￣)~*");
			factoryList = service.factoryItemList();

		} else {
			// 작업지시 검색 조회
			logger.debug("factoryItemList.jsp 검색 호출 ![]~(￣▽￣)~*");
//					proOrderList = oService.proOrderList();
			factoryList = service.factoryItemList(instrSearch, model);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("factoryListGET 실행");

		model.addAttribute("factoryList", factoryList);
	}// /itemListGET() method end

}
