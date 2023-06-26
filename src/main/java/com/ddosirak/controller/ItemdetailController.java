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

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.service.ItemdetailService;

@Controller
@RequestMapping(value = "/foundation/itemdetail/*")
public class ItemdetailController {
	private static final Logger logger = LoggerFactory.getLogger(ItemdetailController.class);
	
	@Inject
	ItemdetailService service;
	
	// http://localhost:8088/foundation/itemdetail/itemdetailList
	//상품 기초 목록 
	@RequestMapping(value="/itemdetailList", method=RequestMethod.GET)
	public void idlistGET(Model model, HttpServletRequest request) throws Exception {
		logger.debug("idlistGET 실행");
		
		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);
		
		List<ItemdetailVO> resultlist = null;
		if(item_code == null) {
			logger.debug("전체 조회");
			resultlist = service.idList();
		} else {
			logger.debug("검색 조회");
			resultlist = service.idList(instrSearch, model);
		}
		model.addAttribute("resultlist", resultlist);
		model.addAttribute("itemSearch", instrSearch);
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
	public void idUpdateGET(@RequestParam("item_code") String item_code, Model model) throws Exception {
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
