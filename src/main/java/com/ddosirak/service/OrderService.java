package com.ddosirak.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.OrderVO;


public interface OrderService {
	////발주서 작성 페이지////
	
	public void insertOrder(OrderVO vo);  //발주서 등록
	
	////발주서 작성 페이지////
	
	public List<OrderVO> orderAllList(); //발주서 불러오기
	
	public Integer updateOrder(OrderVO vo); //발주서 수정
	
	public Integer deleteOrder(String order_number); //발주서 삭제
}
