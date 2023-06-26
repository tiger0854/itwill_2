package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.service.FactoryService;

@RequestMapping(value = "/foundation/factory/*")
@Controller
public class FactoryController {
	public static final Logger logger = LoggerFactory.getLogger(FactoryController.class);
	
	@Inject
	FactoryService service;
	// http://localhost:8088/foundation/factory/factoryList
	// 공장 목록 출력
	@RequestMapping(value="/factoryList", method= RequestMethod.GET)
	public void factoryListGET(Model model) throws Exception {
		logger.debug("factoryListGET 호출");
		List<FactoryVO> resultlist= service.facList();
		logger.debug("목록 개수 : "+resultlist.size());
		model.addAttribute("factoryList", resultlist);
	}
	//공장 등록
	@RequestMapping(value="/factoryUpload",method = RequestMethod.GET )
	public void factoryUploadGET() throws Exception {
		logger.debug("factoryUploadGET 호출");
	}
	@RequestMapping(value="/factoryUpload",method = RequestMethod.POST )
	public String factoryUploadPOST(FactoryVO vo) throws Exception {
		logger.debug("factoryUploadPOST 호출");
		int result=service.insertFac(vo);
		
		if(result==0) {
			return "/foundation/factory/factoryUpload";
		}else {
			return "foundation/factory/factoryList";
		}
	}
	//창고 수정
	@RequestMapping(value="/factoryUpdate", method= RequestMethod.GET)
	public void factoryUpdateGET(String factory_code, Model model) throws Exception {
		logger.debug("factoryUpdateGET 호출");
		FactoryVO resultvo=service.selectFac(factory_code);
		logger.debug(resultvo+"");
		model.addAttribute("vo", resultvo);
	}
	@RequestMapping(value="/factoryUpdate", method=RequestMethod.POST)
	public String factoryUpdatePOST(FactoryVO vo) throws Exception {
		logger.debug("factoryUpdatePOST 호출");
		int result=service.updateFac(vo);
		if(result==0) {
			return "/foundation/factory/factoryUpdate";
		}else {
			return "redirect:/foundation/factory/factoryList";
		}
	}
	
	//창고 삭제
	@RequestMapping(value="/factoryDelete", method=RequestMethod.GET)
	public String factoryDeleteGET(String factory_code) throws Exception {
		logger.debug("factoryDeleteGET 호출");
		service.deleteF(factory_code);
		return "redirect:/foundation/factory/factoryList";
	}
	
}
