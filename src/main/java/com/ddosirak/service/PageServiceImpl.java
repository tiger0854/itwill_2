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
	// 출근자 페이징처리
	@Override
	public Integer countInEmp() {
		logger.debug("service: countInEmp()");
		return pdao.countInEmp();
	}// countInEmp() method end
	// 퇴근자 페이징처리
	@Override
	public Integer countOutEmp() {
		logger.debug("service: countOutEmp()");
		return pdao.countOutEmp();
	}// countOutEmp() method end
	
	@Override
	public Integer countCusList(PageVO vo) {
		logger.debug("service: countCusList(PageVO vo)");
		return pdao.countCustomerList(vo);
	}//거래처목록 페이징
	
	@Override
	public Integer countInList(PageVO vo) {
		logger.debug("service: countInList(PageVO vo)");
		return pdao.countInList(vo);
	}//입고리스트 페이징

	@Override
	public Integer countRetOrdList(PageVO vo) {
		logger.debug("service: countRetOrdList(PageVO vo)");
		return pdao.countRetOrdList(vo);
	}//발주리스트 페이징

	

	// 수주 목록 페이징
	@Override
	public Integer countReceiveList() {
		logger.debug("service: countReceiveList()");
		return pdao.countReceiveList();
	}
	
	// 출고목록 페이징
	@Override
	public Integer countOutList() {
		logger.debug("service: countOutList()");
		return pdao.countOutList();
	}
	
	
	
	
	

}// public class end
