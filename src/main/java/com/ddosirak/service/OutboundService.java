package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.OutboundVO;

public interface OutboundService {
	
	// 출고 예정 등록
	public void outInsert(OutboundVO vo);

	// 출고 예정 리스트
	public List<OutboundVO> getOutList();
	
	// 진행중 예정 리스트 출력
	public List<OutboundVO> getOngoingOutList();	
	
	// 완료된 예정 리스트 출력
	public List<OutboundVO> getCompletedOutList();
	
	// 출고 버튼 클릭시 out_state 업데이트
	public void updateOutState(Integer outNum, int newState);
	
	
	// 거래처 리스트
//	public List<OutboundVO> getCustomerList();
	
	// 페이징 목록 총 갯수 
	public int count() throws Exception;

}
