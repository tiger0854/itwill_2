package com.ddosirak.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionController { // 컨트롤러의 역할을 하지는 않고, 보조기능인 예외처리 역할을 수행한다.

		
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionController.class);
	
	// http://localhost:8088/board/read?bno=a
	@ExceptionHandler(Exception.class)
	public String common(Model model, Exception e) {
		logger.debug("예외발생!!!!");
		
		model.addAttribute("err", e);
		
		return "/err/errorPage";
	}// common() method end
	
//	@ExceptionHandler(NullPointerException.class)
//	public ModelAndView common2(Exception e) {
//		logger.debug("예외 발생!");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/err/myError");
//		mav.addObject(e);
//		return mav; // 특별한 이유가 없다면 사용하지 않는다.
//	}// common2() method end
	
}// public class end
