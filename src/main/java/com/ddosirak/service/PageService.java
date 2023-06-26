package com.ddosirak.service;

public interface PageService {
	// 게시판 페이징 처리
	public Integer countBoard();
	// 사원목록 페이징 처리
	public Integer countEmpList();
	// 출근자 페이징 처리
	public Integer countInEmp();
	// 퇴근자 페이징 처리
	public Integer countOutEmp();
	
}// public interface end
