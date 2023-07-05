package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;


public interface InboundService {
	
	public void insertInbound(InboundVO vo); //입고예정등록
	
	public List<InboundVO> inboundAllList(PageVO vo); //입고리스트  불러오기
	
	public int updateOrderState(String order_number); //입고등록시, 발주상태 변경
	
	public int updateInProcess(InboundVO vo); //입고처리하기
	
	public int deleteInbound(String in_id);
	
	public String getOrderNumber (String in_id); //in_id로 발주번호 가져오기
	
	public int updateOrderStateToDefault(String order_number); //입고취소시, 발주상태 변경
	
	public void updateInbound(InboundVO vo);// 입고수정
	
	public void updateMatrial(Map param); //입고시 자재수량 업뎃
}
