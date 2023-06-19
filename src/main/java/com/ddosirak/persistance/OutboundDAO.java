package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.OutboundVO;

public interface OutboundDAO {
	
	// 출고 등록
	public void outInsert(OutboundVO vo);
	// 출고 등록
	
	// 출고 리스트 출력
	public List<OutboundVO> getOutList();
	// 출고 리스트 출력
	
	// 출고 리스트 출력(진행중)
	public List<OutboundVO> getOngoingOutList();
	// 출고 리스트 출력(진행중)
		
	// 출고 리스트 출력(완료)
	public List<OutboundVO> getCompletedOutList();
	// 출고 리스트 출력(완료)
	
	// 출고 버튼 클릭시 out_state 업데이트
	public void updateOutState(Integer outNum, int newState);
	// 출고 버튼 클릭시 out_state 업데이트
	
	
	
	
	
	
	// 거래처 리스트 출력
//	public List<OutboundVO> getCustomerList();
	// 거래처 리스트 출력
	
	
	
	// 페이징 (총 갯수)
	public int count() throws Exception;
	// 페이징 (총 갯수)
	

}
