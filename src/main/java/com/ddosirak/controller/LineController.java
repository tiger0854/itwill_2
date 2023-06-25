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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.service.LineService;
import com.ddosirak.service.ProductionPerformanceService;

@Controller
@RequestMapping(value = "/line/*")
public class LineController {

	private static final Logger logger = LoggerFactory.getLogger(LineController.class);

	@Inject
	private LineService lService;

	
	// --------------------- 예웡  (｡･∀･)ﾉﾞﾞ -----------------------------	
		// http://localhost:8088/line/linList
		@RequestMapping(value = "/lineList", method = RequestMethod.GET)
		public void LineListGET(Model model,HttpServletRequest request) {
			logger.debug("LineListGET() 호출![]~(￣▽￣)~*");
			logger.debug("/line/linList.jsp 로 뷰페이지 연결!"); // 자동으로 연결, 리턴타입이 void 이기때문.
			
			String line_code = request.getParameter("line_code");
			String line_name = request.getParameter("line_name");
			
			Map<String, Object> instrSearch = new HashMap<String, Object>();
			instrSearch.put("line_code", line_code);
			instrSearch.put("line_name", line_name);
			
			List<LineVO> lineList;
			if(line_code == null && line_name == null) {
				// 라인 전체조회
				logger.debug("lineList 전체 호출 ![]~(￣▽￣)~*");
				lineList = lService.LineList();
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
			
			}else {
				// 라인 검색조회
				logger.debug("lineList 검색 호출 ![]~(￣▽￣)~*");
				lineList = lService.LineList(instrSearch, model);
//				int instrSearchCount = instructService.instrCount(instrSearch);
//				model.addAttribute("instrSearchCount", instrSearchCount);
			}

			model.addAttribute("lineList", lineList);
//			logger.debug("lineList"+lineList);
//			model.addAttribute("instrSearch", instrSearch);
//			// 라인 이름 불러오기
//			List<LineDTO> lineList = lineService.lineList();
//			model.addAttribute("lineList", lineList);

		}// productListGET() method end

		//라인추가
		// http://localhost:8088/line/lineAdd
		@RequestMapping(value = "/lineAdd", method = RequestMethod.GET)
		public void LineAddGET(LineVO vo) {
			logger.debug("LineAddGET(LineVO vo) 호출![]~(￣▽￣)~*");
			logger.debug(vo + " ");

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
		
	
}
