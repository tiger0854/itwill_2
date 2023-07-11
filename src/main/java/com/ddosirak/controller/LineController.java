package com.ddosirak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.service.FactoryService;
import com.ddosirak.service.LineService;
import com.ddosirak.service.ProductionPerformanceService;

@Controller
@RequestMapping(value = "/line/*")
public class LineController {

	private static final Logger logger = LoggerFactory.getLogger(LineController.class);

	@Inject
	private LineService lService;
	@Inject
	FactoryService Fservice;
	
	// --------------------- 예웡  (｡･∀･)ﾉﾞﾞ -----------------------------	
		// http://localhost:8088/line/lineList
		@RequestMapping(value = "/lineList", method = RequestMethod.GET)
		public String LineListGET(Model model,HttpServletRequest request,PageVO pageVO,HttpSession session) {
			logger.debug("LineListGET() 호출![]~(￣▽￣)~*");
			logger.debug("/line/linList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

			if(session.getAttribute("login_id") == null) {
				return "redirect:/public/login";
			} // session control	



			
			String line_code = request.getParameter("line_code");
			String line_name = request.getParameter("line_name");
			
			Map<String, Object> instrSearch = new HashMap<String, Object>();
			instrSearch.put("line_code", line_code);
			instrSearch.put("line_name", line_name);

			//================================페이징 처리를 위한 값 받아오기 동작========================================
			// 준비물 : Inject > PageVO , 파라미터값 PageVO pageVO, HttpServletRequest request
			//   		리스트를 반환하는 DAO - Service 메서드에 PageVO 추가, 쿼리에 LIMIT #{startRow}, #{pageSize} 추가.
			// 페이징 처리
			// 한 화면에 보여줄 글 개수 설정
			int pageSize = 5; // sql문에 들어가는 항목
			// 현페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) {
				pageNum="1";
			}
			// 페이지번호를 정수형으로 변경
			int currentPage=Integer.parseInt(pageNum);
			pageVO.setPageSize(pageSize);
			pageVO.setPageNum(pageNum);
			pageVO.setCurrentPage(currentPage);
			int startRow=(pageVO.getCurrentPage()-1)*pageVO.getPageSize()+1; // sql문에 들어가는 항목
			int endRow = startRow+pageVO.getPageSize()-1;
			
			pageVO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
			pageVO.setEndRow(endRow);
			int count = lService.getLinecount(instrSearch);
			logger.debug("글갯수 @@@@@@@@@@2"+count);
			// 게시글 개수 가져오기
			int pageBlock = 5; // 1 2 3 4 5 > 넣는 기준
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
			 	endPage = pageCount;
			 }
			pageVO.setCount(count);
			pageVO.setPageBlock(pageBlock);
			pageVO.setStartPage(startPage);
			pageVO.setEndPage(endPage);
			pageVO.setPageCount(pageCount);
			
			model.addAttribute("pageVO", pageVO);
			logger.debug("startRow @@@@@@@@@@2"+startRow);
			logger.debug("pageSize @@@@@@@@@@2"+pageSize);
			List<LineVO> lineList;
			if(line_code == null && line_name == null) {
				// 라인 전체조회
				logger.debug("lineList 전체 호출 ![]~(￣▽￣)~*");
				lineList = lService.LineList(pageVO);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
			
			}else {
				// 라인 검색조회
				logger.debug("lineList 검색 호출 ![]~(￣▽￣)~*");
				lineList = lService.LineList(instrSearch, model, pageVO);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
			}
			model.addAttribute("lineList", lineList);
//			logger.debug("lineList"+lineList);
			model.addAttribute("Search", instrSearch);
//			// 라인 이름 불러오기
//			List<LineDTO> lineList = lineService.lineList();
//			model.addAttribute("lineList", lineList);
			return "/line/lineList";
		}// productListGET() method end

		//라인추가
		// http://localhost:8088/line/lineAdd
		@RequestMapping(value = "/lineAdd", method = RequestMethod.GET)
		public void LineAddGET(LineVO vo) {
			logger.debug("LineAddGET(LineVO vo) 호출![]~(￣▽￣)~*");
			logger.debug(vo + "*********************************88 호출![]~(￣▽￣)~* ");

		}

		// http://localhost:8088/line/lineAdd
		@RequestMapping(value = "/lineAdd", method = RequestMethod.POST)
		public void LineAddPost(LineVO vo) {
			logger.debug("LineAddPost(LineVO vo) 호출![]~(￣▽￣)~*");
			logger.debug(vo+" ");
			lService.addLine(vo);

		}// 라인 등록
			

//		 http://localhost:8088/line/lineEdit
		@RequestMapping(value = "/lineEdit", method = RequestMethod.GET)
		public void lineEditGET(String line_code, Model model) {

			LineVO lvo = lService.getLine(line_code);
			model.addAttribute("lvo", lvo);
			logger.debug("lineEditGET() 호출![]~(￣▽￣)~*");
			logger.debug("/line/lineEdit.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.

		}// productEditGET() method end
//		 라인수정

		@RequestMapping(value = "/lineEdit", method = RequestMethod.POST) // 0609, 모르겠음. 일단 GET > POST로 시도 // 해결
		public void lineEditPOST(LineVO vo ,RedirectAttributes rttr) { // (listPOST)
			logger.debug("lineEditPOST() 호출![]~(￣▽￣)~*");
			logger.debug("vo > "+vo);
			lService.editline(vo);
			// 리스트로 정보를 전달 (rttr)
			rttr.addFlashAttribute("result", "CREATEOK");
//			return "redirect:/pro/orderEdit?wo_code="+vo.getWo_code();
		}// employeeUpdate() method end
		
		//라인 삭제
		@RequestMapping(value = "/lineDelete", method = RequestMethod.GET)
		public String deleteWhGET(String line_code,RedirectAttributes rttr) {
			logger.debug("lineDelet() 호출");
			lService.deleteLine(line_code);
			rttr.addFlashAttribute("result", "CREATEOK");
			return "redirect:/line/lineList";
		}
		
		//작업장 목록
		@RequestMapping(value = "/factoryList", method = RequestMethod.GET)
		public void factoryList(Model model,HttpServletRequest request,PageVO pageVO) throws Exception {
			logger.debug("factoryList 호출");
			String factory_code = request.getParameter("factory_code");
			String factory_name = request.getParameter("factory_name");
			Map<String, Object> instrSearch = new HashMap<String, Object>();
			instrSearch.put("factory_code", factory_code);
			instrSearch.put("factory_name", factory_name);

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
			int count = Fservice.factoryCount(instrSearch);
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
//					List<ProOrderVO> proOrderList = oService.proOrderList();
			List<FactoryVO> factoryList;
			if (factory_code == null) {
				// 공장 전체 조회
				logger.debug("productList 전체 호출 ![]~(￣▽￣)~*");
				factoryList = Fservice.facList(pageVO);
//						int instrSearchCount = instructService.instrCount(instrSearch);
//						model.addAttribute("instrSearchCount", instrSearchCount);

			} else {
				// 공장 검색 조회
				logger.debug("productList 검색 호출 ![]~(￣▽￣)~*");
//						proOrderList = oService.proOrderList();
				factoryList = Fservice.facList(pageVO, instrSearch);
//						int instrSearchCount = instructService.instrCount(instrSearch);
//						model.addAttribute("instrSearchCount", instrSearchCount);
			}

			model.addAttribute("Search", instrSearch);
			model.addAttribute("factoryList", factoryList);

		}
		
		
	
}
