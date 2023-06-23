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
import com.ddosirak.domain.MaterialdetailVO;
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
	public void warehouseListGET(Model model, HttpServletRequest request) {
		logger.debug("warehouseListGET호출");
		
		String wh_code = request.getParameter("wh_code");
		String wh_name = request.getParameter("wh_name");
		String retail_code = request.getParameter("retail_code");
		String wh_type = request.getParameter("wh_type");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wh_code", wh_code);
		instrSearch.put("wh_name", wh_name);
		instrSearch.put("retail_code", retail_code);
		instrSearch.put("wh_type", wh_type);
		
		List<WarehouseVO> whList = null;
		if(wh_code == null) {
			logger.debug("전체 조회");
			whList = service.warehouseList();
			logger.debug(whList+"");
		} else {
			logger.debug("검색 조회");
			whList = service.warehouseItemList(instrSearch, model);
			logger.debug(whList+"");
		}
		logger.debug("whlist 개수 : " + whList.size());
		model.addAttribute("whList", whList);
		model.addAttribute("itemSearch", instrSearch);
	}

	// 창고 등록
	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.GET)
	public void insertWhGET() {
		logger.debug("insertWhGET 호출");
	}

	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.POST)
	public void insertWhPOST(WarehouseVO vo) {
		logger.debug("insertWhPOSt 호출");
		service.insertwh(vo);

	}

	// 창고 수정
	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.GET)
	public void updateWhGET(String wh_code, Model model) {
		logger.debug("updateWhget 호출");
		WarehouseVO resultvo = service.selectwh(wh_code);
		model.addAttribute("resultvo", resultvo);
	}

	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.POST)
	public void updateWhPOST(WarehouseVO vo) {
		logger.debug("updateWhpost 호출");
		service.updatewh(vo);

	}

	// 창고 삭제
	@RequestMapping(value = "/warehouseDelete", method = RequestMethod.GET)
	public String deleteWhGET(String wh_code) {
		logger.debug("deleteWhGET 호출");
		service.deletewh(wh_code);
		return "redirect:/foundation/warehouse/warehouseList";
	}

	// 상품목록(팝업)
	@RequestMapping(value = "/warehouseItemList", method = RequestMethod.GET)
	public void warehouseItemListGET(Model model, HttpServletRequest request) {

		String wh_code = request.getParameter("wh_code");
		String wh_name = request.getParameter("wh_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wh_code", wh_code);
		instrSearch.put("wh_name", wh_name);
		List<WarehouseVO> warehouseList;
		if (wh_code == null && wh_name == null) {
			// 작업지시 전체 조회
			logger.debug("warehouseItemList.jsp 전체 호출 ![]~(￣▽￣)~*");
			warehouseList = service.warehouseList();

		} else {
			// 작업지시 검색 조회
			logger.debug("warehouseItemList.jsp 검색 호출 ![]~(￣▽￣)~*");
//						proOrderList = oService.proOrderList();
			warehouseList = service.warehouseItemList(instrSearch, model);
//						int instrSearchCount = instructService.instrCount(instrSearch);
//						model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("warehouseItemListGET 실행");

		model.addAttribute("warehouseList", warehouseList);
	}// /itemListGET() method end
}
