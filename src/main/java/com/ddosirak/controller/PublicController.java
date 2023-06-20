package com.ddosirak.controller;

import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.service.BoardService;
import com.ddosirak.service.EmployeeService;

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
	
/////////////////////////////////게시판///////////////////////////////////
	// http://localhost:8088/public/write
	// 게시판 업로드 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void boardWriteGET() {
		logger.debug("boardWriteGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/write.jsp로 이동!");
	}//boardWriteGET() method end
	//게시판 업로드 동작 C
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePOST(HttpSession session, BoardVO vo) {
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
	public void boardListGET(Model model) {
		logger.debug("boardListGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/boardList.jsp로 이동!");
		model.addAttribute("boardList", bService.getBoardList());
	}//boardListGET() method end
	
	// 게시판 글 조회
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public void contentGET(int emp_bno, Model model) {
		logger.debug("contentGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/content?emp_bno="+emp_bno+"로 이동!");
		
		model.addAttribute("boardContent", bService.getContent(emp_bno));
	}// contentGET() method end
	
	
/////////////////////////////////게시판///////////////////////////////////
	
/////////////////////////////////로그인///////////////////////////////////
	// http://localhost:8088/public/login
	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
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
		session.setAttribute("login_id", lvo.getEmployee_id());
		logger.debug(session.getAttribute("login_id")+"번 사원, 로그인 성공!!!");
		return "redirect:/emp/list";
		
	}//loginGET() method end
	// 로그아웃 동작
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.debug("logout() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug(session.getAttribute("login_id")+" 번 사원 로그아웃!");
		
		rttr.addFlashAttribute("result", "LOGOUT");
		session.invalidate();

		return "redirect:/public/login";
		
	}//logout() method end
/////////////////////////////////로그인///////////////////////////////////
	
}// public class end
