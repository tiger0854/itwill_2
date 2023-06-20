package com.ddosirak.controller;

import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.service.BoardService;

@Controller
@RequestMapping(value = "/public/*")
public class PublicController {

	// logger
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// service
	@Inject
	private BoardService bService;
	
/////////////////////////////////게시판///////////////////////////////////
	// http://localhost:8088/public/write
	// 게시판 업로드 페이지
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void boardWriteGET() {
		logger.debug("boardWriteGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/write.jsp로 이동!");
	}//boardWriteGET() method end
	//게시판 업로드 동작
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePOST(HttpSession session, BoardVO vo) {
		logger.debug("boardWritePOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		vo.setEmployee_id((String)session.getAttribute("login_id"));
		bService.writeBoard(vo);
		
		return "redirect:/public/boardList";
	}//boardWriteGET() method end
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
	public String loginPOST(HttpSession session, LoginVO lvo) throws Exception{
		logger.debug("loginPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("lvo: "+lvo);
		
		if(bService.checkIDPW(lvo) == null) {		
			logger.debug("로그인 실패!!!");
			return "redirect:/public/login";
		}// if end
		session.setAttribute("login_id", lvo.getEmployee_id());
		logger.debug(lvo.getEmployee_id()+"번 사원, 로그인 성공!!!");
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
