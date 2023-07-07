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
import com.ddosirak.domain.PageVO;
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
	public void materialdetailListGET(Model model, HttpServletRequest request, PageVO pageVO) throws Exception {
		logger.debug("materialdetailListGET호출");

		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		String material_type = request.getParameter("material_type");

		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);
		instrSearch.put("material_type", material_type);

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
		int count = service.materialCount(instrSearch);
		logger.debug("글갯수 @@@@@@@@@@@" + count);
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

		List<MaterialdetailVO> resultlist = null;
		if (material_code == null) {
			logger.debug("전체 조회");
			resultlist = service.mdList(pageVO);
		} else {
			logger.debug("검색 조회");
			resultlist = service.mdList(pageVO, instrSearch);
		}
		logger.debug("resultlist 개수 : " + resultlist.size());
		model.addAttribute("Search", instrSearch);
		model.addAttribute("resultlist", resultlist);
	}

	// 자재 기초 등록
	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.GET)
	public void materialdetailUploadGET() throws Exception {
		logger.debug("materialdetailUploadGET호출");
	}

	@RequestMapping(value = "/materialdetailUpload", method = RequestMethod.POST)

	public void materialdetailUploadPOST(MaterialdetailVO vo) throws Exception {

		logger.debug("materialdetailUploadPOST호출");
		logger.debug(vo + "");
		service.insertMD(vo);

	}

	@RequestMapping(value = "/materialdetailUpdate", method = RequestMethod.GET)

	public void materialdetailupdateGET(String material_code, Model model) throws Exception {
		logger.debug("materialdetailupdateGET 호출");
		MaterialdetailVO resultvo = service.selectMD(material_code);

		logger.debug(resultvo + "");
		model.addAttribute("resultvo", resultvo);

	}

	@RequestMapping(value = "/materialdetailUpdate", method = RequestMethod.POST)

	public void materialdetailupdatePOST(MaterialdetailVO vo) throws Exception {
		logger.debug("materialdetailupdatePOST 호출");
		service.updateMD(vo);

	}

	@RequestMapping(value = "/materialdetailDelete", method = RequestMethod.GET)
	public String materialdetaildeleteGET(String material_code) throws Exception {
		logger.debug("materialdetaildeleteGET 호출");
		logger.debug("material_code : " + material_code);
		service.deleteM(material_code);

		return "redirect:/foundation/materialdetail/materialdetailList";

	}

	// 상품목록(팝업)
	@RequestMapping(value = "/materialItemList", method = RequestMethod.GET)

	public void materialListGET(Model model, HttpServletRequest request, PageVO pageVO) throws Exception {

		String material_code = request.getParameter("material_code");
		String material_name = request.getParameter("material_name");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("material_code", material_code);
		instrSearch.put("material_name", material_name);

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
		int count = service.materialCount(instrSearch);
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

		List<MaterialdetailVO> materialList;
		if (material_code == null && material_name == null) {

			logger.debug("materialdetailList.jsp 전체 호출 ![]~(￣▽￣)~*");
			materialList = service.materialItemList(pageVO);

		} else {

			logger.debug("materialdetailList.jsp 검색 호출 ![]~(￣▽￣)~*");
//				proOrderList = oService.proOrderList();
			materialList = service.materialItemList(instrSearch,pageVO);

//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
		}
		logger.debug("materialListGET 실행");
		
		model.addAttribute("Search", instrSearch);
		model.addAttribute("materialList", materialList);
	}// /itemListGET() method end

}
