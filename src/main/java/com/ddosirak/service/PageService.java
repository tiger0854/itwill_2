package com.ddosirak.service;

import com.ddosirak.domain.PageVO;

public interface PageService {
	// 게시판 페이징 처리
	public Integer countBoard();
	// 사원목록 페이징 처리
	public Integer countEmpList();
	
	
	///////////거래처 페이징////////////
	//거래처 페이징처리
	public Integer customerList();
	
	public Integer serchCusname(PageVO vo);
	
	///////////거래처 페이징////////////
	
}// public interface end
