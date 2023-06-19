package com.ddosirak.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void boardWriteGET() {
		logger.debug("boardWriteGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/write.jsp로 이동!");
		
	}//boardWriteGET() method end
/////////////////////////////////게시판///////////////////////////////////
	
/////////////////////////////////로그인///////////////////////////////////
	// http://localhost:8088/public/login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		logger.debug("loginGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		logger.debug("/public/login.jsp로 이동!");
		
	}//loginGET() method end
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, LoginVO lvo) {
		logger.debug("loginPOST() 호출!(((o(*ﾟ▽ﾟ*)o)))");
		
		if(bService.checkIDPW(lvo) == null) {
			logger.debug("로그인 실패!!!");
			return "redirect:/public/login";
		}// if end
		
		logger.debug("로그인 성공!!!");
		return "redirect:/emp/list";
	}//loginGET() method end
/////////////////////////////////로그인///////////////////////////////////
	
}// public class end
