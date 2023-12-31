package com.ddosirak.persistance;

import java.util.Map;

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
	
	///////////발주등록시 수주&레시피 조인 목록 페이징////////////
	public Integer countRequestList();
	
	// 수주목록 페이징처리
	public Integer countReceiveList();
	
	// 출고목록 페이징처리
	public Integer countOutList(Map<String, Object> param);
	
	// 출근자 페이징 처리
	public Integer countInEmp();
	// 퇴근자 페이징 처리
	public Integer countOutEmp();

	
}// public interface end
