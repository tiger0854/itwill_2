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

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.service.MaterialdetailService;
import com.ddosirak.service.ProOrderService;

@Controller
@RequestMapping(value = "/foundation/materialdetail/*")
public class MaterialdetailController {
	private static final Logger logger = LoggerFactory.getLogger(MaterialdetailController.class);

	@Inject
	private MaterialdetailService service;
	

	// 자재 기초 목록
	// http://localhost:8088/foundation/materialdetail/materialdetailList
	@RequestMapping(value = "/materialdetailList", method = RequestMethod.GET)
	public void materialdetailListGET(Model model, HttpServletRequest request) {
		logger.debug("materialdetailListGET호출");
		
		
		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		String material_type = request.getParameter("material_type");
		
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);
		instrSearch.put("material_type", material_type);
		
		List<MaterialdetailVO> resultlist = null;
		if(material_code == null) {
			logger.debug("전체 조회");
			resultlist = service.mdList();
		} else {
			logger.debug("검색 조회");
			resultlist = service.materialItemList(instrSearch, model);
		}
		logger.debug("resultlist 개수 : " + resultlist.size());
		model.addAttribute("resultlist", resultlist);
		model.addAttribute("itemSearch", instrSearch);
	}

	// 자재 기초 등록
	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.GET)
	public void materialdetailUploadGET() {
		logger.debug("materialdetailUploadGET호출");
	}

	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.POST)
	public void materialdetailUploadPOST(MaterialdetailVO vo) {
		logger.debug("materialdetailUploadPOST호출");
		logger.debug(vo + "");
		service.insertMD(vo);

	}

	@RequestMapping(value = "/materialdetailUpdate", method = RequestMethod.GET)
	public void materialdetailupdateGET(String material_code, Model model) {
		logger.debug("materialdetailupdateGET 호출");
		MaterialdetailVO resultvo = service.selectMD(material_code);
		logger.debug(resultvo + "");
		model.addAttribute("resultvo", resultvo);

	}

	@RequestMapping(value = "/materialdetailUpdate", method = RequestMethod.POST)
	public void materialdetailupdatePOST(MaterialdetailVO vo) {
		logger.debug("materialdetailupdatePOST 호출");
		service.updateMD(vo);

	}

	@RequestMapping(value = "/materialdetailDelete", method = RequestMethod.GET)
	public String materialdetaildeleteGET(String material_code) {
		logger.debug("materialdetaildeleteGET 호출");
		logger.debug("material_code : " + material_code);
		service.deleteM(material_code);
		
		return "redirect:/foundation/materialdetail/materialdetailList";
	}

	// 상품목록(팝업)
	@RequestMapping(value = "/materialItemList", method = RequestMethod.GET)
	public void materialListGET(Model model, HttpServletRequest request) {

		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);
		List<MaterialdetailVO> materialList;
		if (material_code == null && material_name == null) {
			// 작업지시 전체 조회
			logger.debug("materialdetailList.jsp 전체 호출 ![]~(￣▽￣)~*");
			materialList = service.materialItemList();

		} else {
			// 작업지시 검색 조회
			logger.debug("materialdetailList.jsp 검색 호출 ![]~(￣▽￣)~*");
//				proOrderList = oService.proOrderList();
			materialList = service.materialItemList(instrSearch, model);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("materialListGET 실행");

		model.addAttribute("materialList", materialList);
	}// /itemListGET() method end

}
