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

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.QualityControlVO;
import com.ddosirak.service.QualityService;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	// logger
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// service
	@Inject
	private QualityService service;

	// http://localhost:8088/qc/qualityList
	// 품질현황 목록
	@RequestMapping(value = "/qualityList", method = RequestMethod.GET)
	public void qualityControlListGET(Model model, HttpServletRequest request, PageVO pageVO) throws Exception {
		logger.debug("qualityControlListGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");

		String wo_code = request.getParameter("wo_code");
		String line_name = request.getParameter("line_name");
		String item_name = request.getParameter("item_name");
		String employee_id = request.getParameter("employee_id");

		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("wo_code", wo_code);
		instrSearch.put("line_name", line_name);
		instrSearch.put("item_name", item_name);
		instrSearch.put("employee_id", employee_id);

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
		int count = service.itemCount(instrSearch);
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
		List<QualityControlVO> qualityList = null;
		if (wo_code == null && line_name == null && item_name == null && employee_id == null) {
			// 품질현황 전체 조회
			logger.debug("qualityList 전체 호출 ![]~(￣▽￣)~*");
			qualityList = service.qualityList(pageVO);
		} else {
			// 품질현황 검색 조회
			logger.debug("qualityList 검색 호출 ![]~(￣▽￣)~*");
			qualityList = service.qualityList(pageVO, instrSearch, model);
		}

		model.addAttribute("qualityList", qualityList);
		model.addAttribute("Search", instrSearch);
	}

	// http://localhost:8088/qc/qualityInspection
	// 품질검사 목록
	@RequestMapping(value = "/qualityInspection", method = RequestMethod.GET)
	public void qualityInspectionGET(Model model, HttpServletRequest request, PageVO pageVO) throws Exception {
		logger.debug("qualityInspectionGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");

		String item_name = request.getParameter("item_name");
		String inspection_result = request.getParameter("inspection_result");
		String inspection_date = request.getParameter("inspection_date");

		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_name", item_name);
		instrSearch.put("inspection_result", inspection_result);
		instrSearch.put("inspection_date", inspection_date);

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
		int count = service.inspectionCount(instrSearch);
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
		List<QualityControlVO> qualityInspection = null;
		if (item_name == null && inspection_date == null) {
			// 품질현황 전체 조회
			logger.debug("qualityInspection 전체 호출 ![]~(￣▽￣)~*");
			qualityInspection = service.qualityInspection(pageVO);
		} else {
			// 품질현황 검색 조회
			logger.debug("qualityInspection 검색 호출 ![]~(￣▽￣)~*");
			qualityInspection = service.qualityInspection(pageVO, instrSearch, model);
		}

		model.addAttribute("qualityInspection", qualityInspection);
		model.addAttribute("Search", instrSearch);

	}

	// 품질검사 등록
	// http://localhost:8088/qc/qualityInspectionWrite
	@RequestMapping(value = "/qualityInspectionWrite", method = RequestMethod.GET)
	public void qualityInspectionWriteGET(QualityControlVO vo) throws Exception {
		logger.debug("qualityInspectionWriteGET() 호출![]~(￣▽￣)~*");
		logger.debug(vo + " ");
	}

	// http://localhost:8088/qc/qualityInspectionWrite
	@RequestMapping(value = "/qualityInspectionWrite", method = RequestMethod.POST)
	public void qualityInspectionWritePOST(QualityControlVO vo) throws Exception {
		logger.debug("qualityInspectionWritePOST() 호출![]~(￣▽￣)~*");
		logger.debug(vo + " ");
		service.insertQualityInspection(vo);
	}

	// 불량률 페이지
	// http://localhost:8088/qc/errorRate
	@RequestMapping(value = "/errorRate", method = RequestMethod.GET)
	public void errorRateListGET(Model model, HttpServletRequest request, PageVO pageVO, QualityControlVO vo)
			throws Exception {
		logger.debug("errorRateListGET() 호출![]~(￣▽￣)~*");

		String item_code = request.getParameter("item_code");
		String error_status = request.getParameter("error_status");
		Map<String, Object> instrSearch = new HashMap<String, Object>();
		instrSearch.put("item_code", item_code);
		instrSearch.put("error_status", error_status);

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
		int count = service.errorCount(instrSearch);
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
		logger.debug("startRow @@@@@@@@@@@" + startRow);
		logger.debug("pageSize @@@@@@@@@@@" + pageSize);
		List<QualityControlVO> errorList = null;

		if (item_code == null && error_status == null) {
			// 품질현황 전체 조회
			logger.debug("erorrRateList 전체 호출 ![]~(￣▽￣)~*");
			errorList = service.errorList(pageVO);
		} else {
			// 품질현황 검색 조회
			logger.debug("erorrRateList 검색 호출 ![]~(￣▽￣)~*");
			errorList = service.errorList(pageVO, instrSearch, model);
		}

		logger.debug("@@@@@@errorList : " + errorList);

		model.addAttribute("errorList", errorList);
		model.addAttribute("Search", instrSearch);

	}

	@RequestMapping(value = "/errorStatus", method = RequestMethod.POST)
	public String errorRateListPOST(Model model, QualityControlVO ivo) throws Exception {
		logger.debug("errorStatus() 호출![]~(￣▽￣)~*");
		logger.debug("@@@@item_code : " + ivo.getItem_code());

		service.insertStatus(ivo);
		logger.debug("@@@@ivo" + ivo);

		return "redirect:/qc/errorRate";
	}

}
