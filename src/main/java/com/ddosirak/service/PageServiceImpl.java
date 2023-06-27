package com.ddosirak.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.PageDAO;

@Service
public class PageServiceImpl implements PageService {
	
	private static final Logger logger = LoggerFactory.getLogger(PageServiceImpl.class);
	
	@Inject
	private PageDAO pdao;

	// 게시판 페이징 처리
	@Override
	public Integer countBoard() {
		logger.debug("service: countBoard()");
		return pdao.countBoard();
	}// countBoard() method end
	// 사원목록 페이징 처리
	@Override
	public Integer countEmpList() {
		logger.debug("service: countEmpList()");
		return pdao.countEmpList();
	}// countEmpList() method end
	
	@Override
	public Integer customerList() {
		logger.debug("service: customerList()");
		return pdao.customerList();
	}
	@Override
	public Integer serchCusname(PageVO vo) {
		// TODO Auto-generated method stub
		return pdao.serchCusname(vo);
	}
	
	
	
	

}// public class end
