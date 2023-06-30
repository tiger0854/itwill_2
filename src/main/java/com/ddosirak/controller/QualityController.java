package com.ddosirak.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ddosirak.service.BoardService;

@Controller
@RequestMapping("/quality/*")
public class QualityController {
	// logger
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// service
	@Inject
	private BoardService service;

	///////////////////////////////// 게시판///////////////////////////////////
	// http://localhost:8088/public/write
	// 게시판 업로드 페이지
	@RequestMapping(value = "/qualitytest", method = RequestMethod.GET)
	public void qualitytestListGET() {
		logger.debug("qualitytestListGET() 호출!(((o(*ﾟ▽ﾟ*)o)))");
	}
}
