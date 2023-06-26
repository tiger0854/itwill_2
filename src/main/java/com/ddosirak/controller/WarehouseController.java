package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.WarehouseVO;
import com.ddosirak.service.WarehouseService;

@Controller
@RequestMapping(value = "/foundation/warehouse/*")
public class WarehouseController {
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService service;
	
	// http://localhost:8088/foundation/warehouse/warehouseList
	//창고 목록
	@RequestMapping(value="/warehouseList", method=RequestMethod.GET)
	public void warehouseListGET(Model model) throws Exception {
		logger.debug("warehouseListGET호출");
		List<WarehouseVO> whList=service.warehouseList();
		logger.debug("whlist 개수 : "+whList.size());
		model.addAttribute("whList", whList);
	}
	
	//창고 등록
	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.GET)
	public void insertWhGET() throws Exception {
		logger.debug("insertWhGET 호출");
	}
	
	@RequestMapping(value = "/warehouseUpload", method = RequestMethod.POST)
	public String insertWhPOST(WarehouseVO vo) throws Exception {
		logger.debug("insertWhPOSt 호출");
		int result=service.insertwh(vo);
	
		if(result==0) {
			return "/foundation/warehouse/warehouseUpload";
		}else {
			return "redirect:/foundation/warehouse/warehouseList";
		}
	}
	//창고 수정
	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.GET)
	public void updateWhGET(String wh_code, Model model) throws Exception {
		logger.debug("updateWhget 호출");
		WarehouseVO resultvo=service.selectwh(wh_code);
		model.addAttribute("resultvo", resultvo);
	}
	@RequestMapping(value = "/warehouseUpdate", method = RequestMethod.POST)
	public String updateWhPOST(WarehouseVO vo) throws Exception {
		logger.debug("updateWhpost 호출");
		int result=service.updatewh(vo);
		
		if(result==0) {
			return "/foundation/warehouse/warehouseUpdate";
		}else {
			return "redirect:/foundation/warehouse/warehouseList";
		}
	}
	@RequestMapping(value = "/warehouseDelete", method = RequestMethod.GET)
	public String deleteWhGET(String wh_code) throws Exception {
		logger.debug("deleteWhGET 호출");
		service.deletewh(wh_code);
		return "redirect:/foundation/warehouse/warehouseList";
	}
}
