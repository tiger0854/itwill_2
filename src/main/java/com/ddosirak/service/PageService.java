package com.ddosirak.service;

public interface PageService {
	// 게시판 페이징 처리
	public Integer countBoard();
	// 사원목록 페이징 처리
	public Integer countEmpList();
	
	// 수주목록 페이징 처리
	public Integer countReceiveList();
	
	// 출고목록 페이징 처리
	public Integer countOutList();
	
}// public interface end
