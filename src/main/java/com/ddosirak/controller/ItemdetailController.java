package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void idlistGET(Model model) {
		logger.debug("idlistGET 실행");
		List<ItemdetailVO> resultlist=service.idList();
		model.addAttribute("resultlist", resultlist);
	}
	
	//상품 기초 등록
	@RequestMapping(value = "/itemdetailUpload", method=RequestMethod.GET)
	public void iduploadGET() {
		logger.debug("idUploadGET 실행");
	}
	
	@RequestMapping(value = "/itemdetailUpload", method=RequestMethod.POST)
	public String idUploadPOST(ItemdetailVO vo) {
		logger.debug("idUploadGET 실행");
		int result=service.insertID(vo);
		if(result==0) {
			return "/foundation/itemdetail/itemdetailUpload";
		}else {
			return "redirect:/foundation/itemdetail/itemdetailList";
		}
	}
	
	//상품 기초 수정
	@RequestMapping(value = "/itemdetailUpdate", method=RequestMethod.GET)
	public void idUpdateGET(String item_code, Model model) {
		logger.debug("idUploadGET 실행");
		ItemdetailVO vo =service.selectID(item_code);
		model.addAttribute("vo", vo);
	}
	@RequestMapping(value = "/itemdetailUpdate", method=RequestMethod.POST)
	public String idUpdatePOST(ItemdetailVO vo) {
		logger.debug("idUploadPOST 실행");
		int result=service.updateID(vo);
		if(result==0) {
			return "/foundation/itemdetail/itemdetailUpdate";
		}else {
			return "redirect:/foundation/itemdetail/itemdetailList";
		}
	}
	
	//상품 기초 삭제
	@RequestMapping(value="/itemdetailDelete",method=RequestMethod.GET)
	public String idDeleteGET(String item_code) {
		logger.debug("idDeleteGET 호출");
		service.deleteI(item_code);
		return "redirect:/foundation/itemdetail/itemdetailList";
	}
	
}
