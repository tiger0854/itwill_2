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

import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.service.ItemRecipeService;


@Controller
@RequestMapping(value = "/foundation/itemrecipe/*")
public class ItemRecipeController {
	Logger logger = LoggerFactory.getLogger(ItemRecipeController.class);
	
	@Inject
	ItemRecipeService service;
	
	// http://localhost:8088/foundation/itemrecipe/itemrecipeList
	@RequestMapping(value="/itemrecipeList", method = RequestMethod.GET)
	public void ItemRecipeListGET(Model model) {
		logger.debug("ItemRecipeListGET 호출");
		model.addAttribute("resultlist", service.ItemRecipeList());
	}
	
	//레시피 등록
	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.GET)
	public void itemrecipeUploadGET() {
		logger.debug("itemrecipeUploadGET 호출");
	}
	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.POST)
	public String itemrecipeUploadPOST(ItemRecipeVO vo, ItemRecipeUploadVO uvo) {
		logger.debug("itemrecipeUploadPOST 호출");
//		service.insertItemRecipe();
		return null;
	}

	// 자재 검색
	// http://localhost:8088/foundation/itemrecipe/materialSerch
	@RequestMapping(value = "/materialSearch", method = RequestMethod.GET)
	public void materialSerchGET(Model model,MaterialdetailVO vo) {
		
		logger.debug("idlistGET 실행");
		
		logger.debug(vo+"");
		List<MaterialdetailVO> materialList = service.materialList(vo);		
		
		model.addAttribute("resultList", materialList);
	}
	
	
}
