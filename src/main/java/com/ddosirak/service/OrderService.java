package com.ddosirak.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.RequestVO;


public interface OrderService {
	////발주서 작성 페이지////
	
	public void insertOrder(OrderVO vo);  //발주서 등록
	
	////발주서 작성 페이지////
	
	public List<OrderVO> orderAllList(PageVO vo); //발주서 불러오기
	
	public Integer updateOrder(OrderVO vo); //발주서 수정
	
	public Integer deleteOrder(String order_number); //발주서 삭제
	
	public List<RequestVO> getRequestList(PageVO vo);  // 수주요청한 품목의 레시피를 가져옴
	
	public int updateRequestStat(RequestVO vo); //수주요청 목록 상태변경
}
