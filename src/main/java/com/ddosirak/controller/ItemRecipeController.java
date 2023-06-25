package com.ddosirak.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.service.ItemRecipeService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping(value = "/foundation/itemrecipe/*")
public class ItemRecipeController {
	Logger logger = LoggerFactory.getLogger(ItemRecipeController.class);
	
	@Inject
	ItemRecipeService service;
	
	// http://localhost:8088/foundation/itemrecipe/itemrecipeList
	@RequestMapping(value="/itemrecipeList", method = RequestMethod.GET)
	public void ItemRecipeListGET(Model model) throws Exception {
		logger.debug("ItemRecipeListGET 호출");
		model.addAttribute("resultlist", service.ItemRecipeList());
	}
	
	//레시피 등록
	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.GET)
	public void itemrecipeUploadGET() throws Exception {
		logger.debug("itemrecipeUploadGET 호출");
	}
	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.POST)
	public String itemrecipeUploadPOST(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception {
		logger.debug("itemrecipeUploadPOST 호출");
		logger.debug(vo+"");
		logger.debug(uvo+"");
		service.insertItemRecipe(vo, uvo);
		return "redirect:/foundation/itemrecipe/itemrecipeList";
	}

	// 자재 검색
	// http://localhost:8088/foundation/itemrecipe/materialSerch
	@RequestMapping(value = "/materialSearch", method = RequestMethod.GET)
	public void materialSerchGET(Model model,MaterialdetailVO vo) throws Exception {
		
		logger.debug("idlistGET 실행");
		
		logger.debug(vo+"");
		List<MaterialdetailVO> materialList = service.materialList(vo);		
		
		model.addAttribute("resultList", materialList);
	}
	
	//상품 검색 시 자재를 가져오는 ajax
	@RequestMapping(value="/getMaterials", method = RequestMethod.GET)
	@ResponseBody
	public String getMaterialsGET(@RequestParam("item_code") String itemCode) throws Exception {
	    List<ItemRecipeVO> itemList = service.selectItemRecipe(itemCode);
	    logger.debug(itemList.size()+"");
	    // ObjectMapper 객체 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // List를 JSON 문자열로 변환
        String jsonString = objectMapper.writeValueAsString(itemList);
	    
	    return jsonString;
	}
	
}
