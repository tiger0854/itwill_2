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
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.WarehouseVO;
import com.ddosirak.service.WarehouseService;

@Controller
@RequestMapping(value = "/foundation/warehouse/*")
public class WarehouseController {
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);

	@Inject
	private WarehouseService service;

	// http://localhost:8088/foundation/warehouse/warehouseList
	// 창고 목록
	@RequestMapping(value = "/warehouseList", method = RequestMethod.GET)
	public String warehouseListGET(Model model, HttpServletRequest request, PageVO pageVO,@RequestParam( value = "pop", required = false) String pop) throws Exception {

		logger.debug("warehouseListGET호출");

		String wh_code = request.getParameter("wh_code");
		String wh_name = request.getParameter("wh_name");
		String retail_code = request.getParameter("retail_code");
		String wh_type = request.getParameter("wh_type");
		String minsize=request.getParameter("minsize");
		String maxsize=request.getParameter("maxsize");
		
		if(minsize=="") {
			minsize="0";
		}
		if(maxsize=="") {
			maxsize="999999";
		}
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wh_code", wh_code);
		instrSearch.put("wh_name", wh_name);
		instrSearch.put("retail_code", retail_code);
		instrSearch.put("wh_type", wh_type);
		
		instrSearch.put("minsize",minsize);
		instrSearch.put("maxsize",maxsize);
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
		int count = service.warehouseCount(instrSearch);
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

		List<WarehouseVO> whList = null;
		if (wh_code == null) {
			logger.debug("전체 조회");
			whList = service.warehouseList(pageVO);
			logger.debug(whList + "");
		} else {
			logger.debug("검색 조회");
			whList = service.warehouseList(pageVO, instrSearch);
			logger.debug(whList + "");
		}
		logger.debug("whlist 개수 : " + whList.size());
		model.addAttribute("Search", instrSearch);
		model.addAttribute("whList", whList);
		
		if(pop!=null && pop.equals("ok")) {
			return "/inbound/warehouseList";
		}else {
			return "/foundation/warehouse/warehouseList";
		}
		
	}

	// 창고 등록
	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.GET)
	public void insertWhGET() throws Exception {
		logger.debug("insertWhGET 호출");
	}

	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.POST)
	public void insertWhPOST(WarehouseVO vo) throws Exception {
		logger.debug("insertWhPOSt 호출");
		service.insertwh(vo);

	}

	// 창고 수정
	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.GET)
	public void updateWhGET(String wh_code, Model model) throws Exception {
		logger.debug("updateWhget 호출");
		WarehouseVO resultvo = service.selectwh(wh_code);
		model.addAttribute("resultvo", resultvo);
	}

	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.POST)
	public void updateWhPOST(WarehouseVO vo) throws Exception {
		logger.debug("updateWhpost 호출");
		service.updatewh(vo);

	}

	// 창고 삭제
	@RequestMapping(value = "/warehouseDelete", method = RequestMethod.GET)
	public String deleteWhGET(String wh_code) throws Exception {
		logger.debug("deleteWhGET 호출");
		service.deletewh(wh_code);
		return "redirect:/foundation/warehouse/warehouseList";
	}

	// 상품목록(팝업)
	@RequestMapping(value = "/warehouseItemList", method = RequestMethod.GET)
	public void warehouseItemListGET(Model model, HttpServletRequest request, PageVO pageVO) {

		String wh_code = request.getParameter("wh_code");
		String wh_name = request.getParameter("wh_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wh_code", wh_code);
		instrSearch.put("wh_name", wh_name);
		List<WarehouseVO> warehouseList;
		if (wh_code == null && wh_name == null) {
			// 작업지시 전체 조회
			logger.debug("warehouseItemList.jsp 전체 호출 ![]~(￣▽￣)~*");
			warehouseList = service.warehouseItemList();

		} else {
			// 작업지시 검색 조회
			logger.debug("warehouseItemList.jsp 검색 호출 ![]~(￣▽￣)~*");
//						proOrderList = oService.proOrderList();
			warehouseList = service.warehouseItemList(instrSearch);
//						int instrSearchCount = instructService.instrCount(instrSearch);
//						model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("warehouseItemListGET 실행");

		model.addAttribute("warehouseList", warehouseList);
	}// /itemListGET() method end
}
