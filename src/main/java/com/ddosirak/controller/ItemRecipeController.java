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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.ItemRecipeUploadVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.ItemRecipeService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping(value = "/foundation/itemrecipe/*")
public class ItemRecipeController {
	Logger logger = LoggerFactory.getLogger(ItemRecipeController.class);

	@Inject
	ItemRecipeService service;

	// http://localhost:8088/foundation/itemrecipe/itemrecipeList
	@RequestMapping(value = "/itemrecipeList", method = RequestMethod.GET)
	public void ItemRecipeListGET(Model model, HttpServletRequest request, PageVO pageVO) throws Exception {

		logger.debug("ItemRecipeListGET 호출");

		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		String material_con = request.getParameter("material_con");

		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);
		instrSearch.put("material_con", material_con);

		// ================================페이징 처리를 위한 값 받아오기
		// 동작========================================
		// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
		// 리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize}
		// 추가.
		// 페이징 처리
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 페이지번호를 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		pageVO.setPageSize(pageSize);
		pageVO.setPageNum(pageNum);
		pageVO.setCurrentPage(currentPage);
		int startRow = (pageVO.getCurrentPage() - 1) * pageVO.getPageSize() + 1; // sql문에 들어가는 항목
		int endRow = startRow + pageVO.getPageSize() - 1;

		pageVO.setStartRow(startRow - 1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageVO.setEndRow(endRow);
		int count = service.itemrecipeCount(instrSearch);
		logger.debug("글갯수 @@@@@@@@@@2" + count);
		// 게시글 개수 가져오기
		int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		pageVO.setCount(count);
		pageVO.setPageBlock(pageBlock);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPageCount(pageCount);

		model.addAttribute("pageVO", pageVO);
		logger.debug("startRow @@@@@@@@@@2" + startRow);
		logger.debug("pageSize @@@@@@@@@@2" + pageSize);
		List<ItemRecipeListVO> resultlist = null;
		if (item_code == null) {
			// 공장 전체 조회
			logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
			resultlist = service.ItemRecipeList(pageVO);
		} else {
			// 공장 검색 조회
			logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
			resultlist = service.ItemRecipeList(pageVO, instrSearch, model);
		}
		model.addAttribute("Search", instrSearch);
		model.addAttribute("resultlist", resultlist);
	}

	// 레시피 등록
	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.GET)
	public void itemrecipeUploadGET() throws Exception {
		logger.debug("itemrecipeUploadGET 호출");
	}

	@RequestMapping(value = "/itemrecipeUpload", method = RequestMethod.POST)
	public void itemrecipeUploadPOST(ItemRecipeVO vo, ItemRecipeUploadVO uvo) throws Exception {
		logger.debug("itemrecipeUploadPOST 호출");
		logger.debug(vo + "");
		logger.debug(uvo + "");
		service.insertItemRecipe(vo, uvo);
//		return "redirect:/foundation/itemrecipe/itemrecipeList";
	}

	// 자재 검색
	// http://localhost:8088/foundation/itemrecipe/materialSerch
	@RequestMapping(value = "/materialSearch", method = RequestMethod.GET)

	public void materialSerchGET(Model model, MaterialdetailVO vo) throws Exception {


		logger.debug("idlistGET 실행");

		logger.debug(vo + "");
		List<MaterialdetailVO> materialList = service.materialList(vo);

		model.addAttribute("resultList", materialList);
	}

	// 상품 검색 시 자재를 가져오는 ajax
	@RequestMapping(value = "/getMaterials", method = RequestMethod.GET)
	@ResponseBody
	public String getMaterialsGET(@RequestParam("item_code") String itemCode) throws Exception {
		List<ItemRecipeListVO> itemList = service.selectItemRecipe(itemCode);
		logger.debug(itemList.size() + "");
		// ObjectMapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();

		// List를 JSON 문자열로 변환
		String jsonString = objectMapper.writeValueAsString(itemList);
		return jsonString;
	}

	// 레시피 개별 삭제
	@RequestMapping(value = "/deleteItemRecipeMaterial", method = RequestMethod.GET)
	public String deleteItemRecipeMaterialGET(ItemRecipeVO vo) throws Exception {
		logger.debug("deleteItemRecipeMaterialGET 실행");
		service.deleteItemRecipeMaterial(vo);
		return "redirect:/foundation/itemrecipe/itemrecipeList?item_name=&item_code=";
	}

	// 레시피 삭제
	@RequestMapping(value = "/deleteItemRecipe", method = RequestMethod.GET)
	public String deleteItemRecipeGET(String item_code) throws Exception {
		logger.debug("deleteItemRecipeGET 실행");
		service.deleteItemRecipe(item_code);
		return "redirect:/foundation/itemrecipe/itemrecipeList?item_name=&item_code=";
	}

	// 상품목록(팝업)
	@RequestMapping(value = "/itemrecipeItemList", method = RequestMethod.GET)
	public void itemrecipeListGET(Model model, HttpServletRequest request) throws Exception {

		String item_code = request.getParameter("item_code");
		String item_name = request.getParameter("item_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("item_name", item_name);
		List<ItemRecipeListVO> itemrecipeList;
		if (item_code == null && item_name == null) {
			// 전체 조회
			logger.debug("itemrecipeList.jsp 전체 호출 ![]~(￣▽￣)~*");
			itemrecipeList = service.itemrecipeItemList();

		} else {
			// 검색 조회
			logger.debug("itemrecipeList.jsp 검색 호출 ![]~(￣▽￣)~*");
//					proOrderList = oService.proOrderList();
			itemrecipeList = service.itemrecipeItemList(instrSearch, model);
//					int instrSearchCount = instructService.instrCount(instrSearch);
//					model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("itemrecipeList 실행");

		model.addAttribute("itemrecipeList", itemrecipeList);
	}// /itemListGET() method end

}
