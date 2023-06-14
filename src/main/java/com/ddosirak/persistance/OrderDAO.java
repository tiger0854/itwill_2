package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.OrderVO;

public interface OrderDAO {
	// 필요한 동작들을 추상메서드를 사용하여 정의! (만들어두기만 한다.)
	
	////발주서 작성 페이지////
	
	public void insertOrder(OrderVO vo);  //발주서 등록
	
	////발주서 작성 페이지////
	
	public List<OrderVO> orderAllList(); //발주서 불러오기
	
	

	
	
	
	
}
