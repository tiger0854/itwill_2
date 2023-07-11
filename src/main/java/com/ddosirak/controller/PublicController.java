package com.ddosirak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.service.BoardService;
import com.ddosirak.service.EmployeeService;
import com.ddosirak.service.InboundService;
import com.ddosirak.service.OutboundService;
import com.ddosirak.service.PageService;
import com.ddosirak.service.ProOrderService;
import com.ddosirak.service.QualityService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/public/*")
public class PublicController {

	// logger
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// service
	@Inject
	private BoardService bService;
	@Inject
	private EmployeeService eService;
	@Inject
	private PageService pService;
	@Inject
	private ProOrderService oService;
	@Inject
	private InboundService iService;
	@Inject
	private OutboundService obService;
	@Inject
	private QualityService qService;
	
/////////////////////////////////게시판///////////////////////////////////
	// http://localhost:8088/public/write
	// 게시판 업로드 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void boardWriteGET() throws Exception{
		logger.debug("boardWriteGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/write.jsp로 이동!");
	}//boardWriteGET() method end
	//게시판 업로드 동작 C
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePOST(HttpSession session, BoardVO vo) throws Exception{
		logger.debug("boardWritePOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		EmployeeVO evo = eService.getEmployee(Integer.parseInt(session.getAttribute("login_id").toString()));
		vo.setEmployee_id((String)session.getAttribute("login_id"));
		vo.setEmployee_name(evo.getEmployee_name());
		vo.setPosition(evo.getPosition());
		vo.setDepartment_name(evo.getDepartment_name());
		
		bService.writeBoard(vo);
		
		return "redirect:/public/boardList";
	}//boardWriteGET() method end
	// http://localhost:8088/public/boardList
	// 게시판 리스트 페이지 R 
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardListGET(Model model, PageVO pageVO, HttpServletRequest request, HttpSession session) throws Exception{
		logger.debug("boardListGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		logger.debug("/public/boardList.jsp로 이동!");
		
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
		
		// 게시글 개수 가져오기
		int count = pService.countBoard(); // 요 동작만 각자 페이지에 맞게 수정하면 됨!!

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
		//================================페이징 처리를 위한 값 받아오기 동작========================================
		
		model.addAttribute("boardList", bService.getBoardList(pageVO)); // 리스트반환 동작에 pageVO 넣기.
		return null;
	}//boardListGET() method end
	
	// 게시판 글 조회
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public void contentGET(int emp_bno, Model model) throws Exception{
		logger.debug("contentGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/content?emp_bno="+emp_bno+"로 이동!");
		
		 bService.addReadCount(emp_bno); // 조회수 1 증가
		
		model.addAttribute("boardContent", bService.getContent(emp_bno));
	}// contentGET() method end
	// 게시판 글 수정 > POST
	@RequestMapping(value = "/content", method = RequestMethod.POST)
	public String contentPOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.debug("contentPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		bService.contentUpdate(vo);
		
		rttr.addFlashAttribute("result","UPDSUC");
		return "redirect:/public/boardList";
	}// contentPOST() method end
	// 게시판 글 삭제
	@RequestMapping(value = "/contentDelete")
	public String contentDelete(int emp_bno) throws Exception{
		logger.debug("contentDelete() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		bService.deleteContent(emp_bno);
		
		return "redirect:/public/boardList";
	}// contentDelete() method end
	
	
/////////////////////////////////게시판///////////////////////////////////
	
/////////////////////////////////로그인///////////////////////////////////
	// http://localhost:8088/public/login
	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception{
		logger.debug("loginGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/login.jsp로 이동!");
	}//loginGET() method end
	// 로그인 동작 실행
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, LoginVO lvo, RedirectAttributes rttr) throws Exception{
		logger.debug("loginPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("lvo: "+lvo);
		
		if(bService.checkIDPW(lvo) == null) {		
			logger.debug("로그인 실패!!!");
			rttr.addFlashAttribute("result","LOGFAIL");
			return "redirect:/public/login";
		}// if end
	
		session.setAttribute("login_id", lvo.getEmployee_id()); // 세션에 사원 id 저장
		EmployeeVO evo = eService.getEmployee(Integer.parseInt(session.getAttribute("login_id").toString()));
		session.setAttribute("dept_name", evo.getDepartment_name()); // 세션에 사원 부서 저장 >> 인사관리 권한 제어
		session.setAttribute("position_name", evo.getPosition()); // 세션에 사원 직급 저장
		
		
		logger.debug(session.getAttribute("dept_name")+"의 "+
				session.getAttribute("login_id")+"번 사원, 로그인 성공!!!");
		
		return "redirect:/public/dashBoard";
	}//loginGET() method end
	// 로그아웃 동작
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.debug("logout() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		rttr.addFlashAttribute("result", "LOGOUT");
		logger.debug(session.getAttribute("login_id")+" 번 사원 로그아웃!");
		session.invalidate();

		return "redirect:/public/login";
	}//logout() method end
	
	//비밀번호 찾기
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public void findPWGET() throws Exception{
		logger.debug("findPWGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		
	}//findPWGET() method end
	
	// 출근페이지
	@RequestMapping(value = "/in", method = RequestMethod.GET)
	public void inGET() throws Exception{
		logger.debug("inGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
	}//inGET() method end
	// 출근페이지 POST
	@RequestMapping(value = "/in", method = RequestMethod.POST)
	public String inPOST(EmployeeCheckVO vo,RedirectAttributes rttr) throws Exception{
		logger.debug("inPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		if(eService.getEmployee(vo.getEmployee_id()) == null) {
			rttr.addFlashAttribute("result", "INFAIL");
		}else {
			bService.employeeIn(vo);
			rttr.addFlashAttribute("result", "INSUCC");
		}// i-e end
		return "redirect:/public/login";
	}//inPOST() method end
	
	// 퇴근페이지
	@RequestMapping(value = "/out", method = RequestMethod.GET)
	public void outGET() throws Exception{
		logger.debug("outGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
	}//outGET() method end
	// 퇴근페이지 POST
	@RequestMapping(value = "/out", method = RequestMethod.POST)
	public String outPOST(EmployeeCheckVO vo,LoginVO lvo, RedirectAttributes rttr
			,HttpSession session) throws Exception{
		logger.debug("outPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		// 일용직 퇴근
		if(vo.getEmployee_id() > 10000) {
			int result = bService.al_out(vo.getEmployee_id());
			if(result == 1) {
				// 퇴근성공
				bService.employeeOut(vo);
				session.invalidate();
				rttr.addFlashAttribute("result", "EMPOUT");
			}else {
				// 퇴근 실패
				rttr.addFlashAttribute("result","OUTFAIL");
			}
		}// if end (일용직 체크)
		else {
			// 일반직원 퇴근
			if(bService.checkIDPW(lvo) == null) {		
				logger.debug("퇴근확인 실패!!!");
				rttr.addFlashAttribute("result","OUTFAIL");
			}// if end
			else {
				bService.employeeOut(vo);
				session.invalidate();
				rttr.addFlashAttribute("result", "EMPOUT");
			}// else end
		} // else end(일반직원 퇴근 체크)
		
		return "redirect:/public/login";
	}//outPOST() method end
/////////////////////////////////로그인///////////////////////////////////
	
/////////////////////////////////대시보드///////////////////////////////////
	// 대시보드 페이지
	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoardGET(Model model, HttpSession session) throws Exception{
		logger.debug("dashBoardGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");

		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control
		
		// -------------- 라인별 생산률 (예원)  0_< ----------------------
		List<Map<String, Object>> graphList = oService.graphList();
		logger.debug("graphList : " + graphList);
		ObjectMapper objectMapper = new ObjectMapper();
		String graphListJson = objectMapper.writeValueAsString(graphList);
		model.addAttribute("graphListJson", graphListJson);
		// -------------- 라인별 생산률 (예원)  0_< ----------------------

		
		// 임직원 수 리턴
		model.addAttribute("alCount_all", eService.alCount_all());// 전일반 근무자
		model.addAttribute("alCount_am", eService.alCount_am());// 오전근무자
		model.addAttribute("alCount_pm", eService.alCount_pm());// 오후근무자
		model.addAttribute("empCount", eService.empCount());// 임직원
		
		// 휴가자 수
	    model.addAttribute("vacationCount", eService.vacount()); // 현재 휴가 사원수
	    model.addAttribute("pvacationCount", eService.pvacount()); // 휴가예정 사원수
	    model.addAttribute("bvacountCount", eService.bvacount()); // 휴가복귀 사원 수
		
		// 입고 예정/완료
		model.addAttribute("selectNowIndate", iService.selectNowIndate()); //오늘 입고예정 수
		model.addAttribute("selectNowEdate", iService.selectNowEdate()); // 오늘 입고완료 수
		
		// 출고 예정/완료
		model.addAttribute("outScheduleToday", obService.outScheduleToday()); // 금일출고예정
		model.addAttribute("outCompleteToday", obService.outCompleteToday());
		
		// 전체 라인 불량률
		model.addAttribute("errQTY", qService.errorList().get(0).getTotal_error_QTY()); // 불량개수
		model.addAttribute("totalQTY", qService.errorList().get(0).getTotal_QTY()); // 총 생산량
		
		return null;
	}//dashBoardGET() method end
/////////////////////////////////대시보드///////////////////////////////////
	
/////////////////////////////////메신저///////////////////////////////////
	// http://localhost:8088/public/chatList
	@RequestMapping(value = "/chatList", method = RequestMethod.GET)
	public String chatListGET (Model model,HttpSession session) throws Exception{
		logger.debug("chatListGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		if(session.getAttribute("login_id") == null) {
			return "redirect:/public/login";
		} // session control

		// 채팅 시작을 위한 리스트
		List<EmployeeVO> empList = eService.empList();
		model.addAttribute("empList", empList);
		
		// 채팅방 리스트
		List<String> chatRoomList = bService.chatRoom((String)session.getAttribute("login_id"));
		model.addAttribute("chatRoomList", chatRoomList);
		
		return null;
	}// chatListGET() method end
	
	// http://localhost:8088/public/chat
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chatGET (@RequestParam("chat_receiver")String chat_receiver, @RequestParam("chat_sender")String chat_sender,
			RedirectAttributes rttr,Model model) throws Exception{
		logger.debug("chatGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("개설자: "+chat_sender);
		logger.debug("참여자: "+chat_receiver);
		if(chat_receiver.equals("noSelect")) {
			rttr.addFlashAttribute("selectCheck", "NOSELECT");
			return "redirect:/public/chatList";
		}// 값을 선택하지않을시 동작.
		
		String chatRoom_code = "";
		int sender = Integer.parseInt(chat_sender); // 나임.
		int receiver = Integer.parseInt(chat_receiver); // 상대방
		if( sender > receiver ){
			chatRoom_code = chat_sender+chat_receiver;
		}else{
			chatRoom_code = chat_receiver+chat_sender;
		}// i-e end

//		model.addAttribute("chats", bService.getChatList(chatRoom_code));
		model.addAttribute("receiverInfo", eService.getEmployee(receiver));
		return null;
	}// chat() method end
	
/////////////////////////////////메신저///////////////////////////////////	
	
}// public class end
