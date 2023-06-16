package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.service.MaterialdetailService;

@Controller
@RequestMapping(value = "/foundation/materialdetail/*")
public class MaterialdetailController {
private static final Logger logger = LoggerFactory.getLogger(MaterialdetailController.class);
	
	@Inject
	private MaterialdetailService service;
	
	//자재 기초 목록
	// http://localhost:8088/foundation/materialdetail/materialdetailList
	@RequestMapping(value = "/materialdetailList", method = RequestMethod.GET)
	public void materialdetailListGET(Model model) {
		logger.debug("materialdetailListGET호출");
		List<MaterialdetailVO> mdList=service.mdList();
		logger.debug("mdlist 개수 : "+mdList.size());
		model.addAttribute("mdList", mdList);
	} 
	
	//자재 기초 등록
	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.GET)
	public void materialdetailUploadGET() {
		logger.debug("materialdetailUploadGET호출");
	}
	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.POST)
	public String materialdetailUploadPOST(MaterialdetailVO vo) {
		logger.debug("materialdetailUploadPOST호출");
		logger.debug(vo+"");
		int result=service.insertMD(vo);
		
		if(result==0) {
			return "/foundation/materialdetail/materialdetailUpload";
		}else {
			return "redirect:/foundation/materialdetail/materialdetailList";
		}
	}
	
	@RequestMapping(value = "/materialdetailUpdate", method= RequestMethod.GET)
	public void materialdetailupdateGET(String material_code, Model model) {
		logger.debug("materialdetailupdateGET 호출");
		MaterialdetailVO resultvo=service.editMD(material_code);
		logger.debug(resultvo+"");
		model.addAttribute("resultvo", resultvo);
	}
	@RequestMapping(value = "/materialdetailUpdate", method= RequestMethod.POST)
	public String materialdetailupdatePOST( MaterialdetailVO vo) {
		logger.debug("materialdetailupdatePOST 호출");
		int result=service.updateMD(vo);
		
		if(result==0) {
			return "/foundation/materialdetail/materialdetailUpdate";
		}else {
			return "redirect:/foundation/materialdetail/materialdetailList";
		}
	}
	
	@RequestMapping(value = "/materialdetailDelete", method = RequestMethod.GET)
	public String materialdetaildeleteGET(String material_code) {
		logger.debug("materialdetaildeleteGET 호출");
		logger.debug("material_code : "+material_code);
		service.deleteM(material_code);
		return "redirect:/foundation/materialdetail/materialdetailList";
	}
	
}
