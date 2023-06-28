package com.ddosirak.persistance;

import com.ddosirak.domain.PageVO;

public interface PageDAO {
	// 게시판 페이징 처리
	public Integer countBoard();
	// 사원목록 페이징 처리
	public Integer countEmpList();
	
	///////////거래처 페이징////////////
	public Integer countCustomerList(PageVO vo);
	
	///////////입고리스트 페이징////////////
	public Integer countInList(PageVO vo);
	
	///////////발주리스트 페이징////////////
	public Integer countRetOrdList(PageVO vo);

	
}// public interface end
