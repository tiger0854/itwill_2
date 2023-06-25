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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialsListVO;
import com.ddosirak.domain.MaterialsVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.service.MaterialsService;

@Controller
@RequestMapping(value = "/materials/*")
public class MaterialsController {
	private static final Logger logger = LoggerFactory.getLogger(MaterialsController.class);

	@Inject
	private MaterialsService service;

	// 자재 입고 목록
	// http://localhost:8088/materials/materialsReceivingList
	@RequestMapping(value = "/materialsReceivingList", method = RequestMethod.GET)
	public void materialsReceivingListGET(Model model) throws Exception {
		logger.debug("mtReceivingListGET() 호출");
		logger.debug("materials/materialsReceivingList.jsp 뷰페이지로 연결");

		List<MaterialsVO> matInputList = service.matInputList();

		model.addAttribute("list", matInputList);
	}

	// 자재 입고 등록
	// http://localhost:8088/materials/materialsReceivingWrite
	@RequestMapping(value = "/materialsReceivingWrite", method = RequestMethod.GET)
	public void materialsWriteGET() throws Exception {
		logger.debug("materialsWriteGET() 호출!");
		logger.debug("materials/materialsReceivingWrite.jsp 뷰페이지로 연결");

	}

	@RequestMapping(value = "/materialsReceivingWrite", method = RequestMethod.POST)
	public void materialsWritePOST(MaterialsVO ivo) throws Exception {
		logger.debug("materialsWritePOST() 호출!");

		service.matInputInsert(ivo);

	}

	// 자재 입고 특정 게시물 조회
	@RequestMapping(value = "/materialsReceivingEdit", method = RequestMethod.GET)
	public void materialsEditGET(@RequestParam("material_code") String material_code, Model model) throws Exception {
		logger.debug("materialsEditGET() 호출!");
		logger.debug("materials/materialsReceivingEdit.jsp 뷰페이지로 연결");

		logger.debug("@@@@@@@@matCode : " + material_code);

		MaterialsVO gvo = service.getMatInput(material_code);

		logger.debug("@@@@@@@@@ gvo : " + gvo);
		model.addAttribute("gvo", gvo);
	}

	// 자재 입고 특정 게시물 수정
	@RequestMapping(value = "/materialsReceivingEdit", method = RequestMethod.POST)
	public void materialsEditPOST(MaterialsVO uvo) throws Exception {
		logger.debug("materialsEditPOST() 호출!");

		logger.debug("@@@@@@@@ uvo : " + uvo);

		service.matInputEdit(uvo);

	}

	// 자재입고 특정 게시물 삭제
	@RequestMapping(value = "/materialsReceivingRemove", method = RequestMethod.GET)
	public String materialsRemoveGET(@RequestParam("material_code") String material_code) throws Exception {
		logger.debug("materialsRemoveGET() 호출");
		service.RemoveMatInput(material_code);
		return "redirect:/materials/materialsReceivingList";
	}

	// 자재관리 - 상품목록(팝업)
	// http://localhost:8088/pro/itemList
	@RequestMapping(value = "/matItelList", method = RequestMethod.GET)
	public void matItelListGET(Model model, HttpServletRequest request) throws Exception {
		logger.debug("matItelListGET() 호출");
//		String item_code = request.getParameter("item_code");
//		String item_name = request.getParameter("item_name");
		String title = request.getParameter("title");
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
//		instrSearch.put("item_code", item_code);
//		instrSearch.put("item_name", item_name);

//			List<ItemdetailVO> itemList=iservice.idList();
		List<IntegrationCodeVO> itemList = null;
//		if (item_code == null && item_name == null) {
			// 작업지시 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			itemList = service.matInputItemList();
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);

//		} else {
			// 작업지시 검색 조회
//			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//				proOrderList = oService.proOrderList();
//			itemList = oService.proitemList(instrSearch, model);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
//		}
		logger.debug("idlistGET 실행");
		model.addAttribute("code", code);
		model.addAttribute("name", name);
		model.addAttribute("title", title);
		model.addAttribute("itemList", itemList);
	}// /itemListGET() method end

}
