package com.ddosirak.persistance;

public interface PageDAO {
	// 게시판 페이징 처리
	public Integer countBoard();
	// 사원목록 페이징 처리
	public Integer countEmpList();
	
	//거래처 페이징처리
	public Integer customerList();

}// public interface end
