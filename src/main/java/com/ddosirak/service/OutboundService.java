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
	public void updateOutState(String outNum, int newState);
	
	// 출고 번호에 따른 출고 상품 리스트
	public List<OutboundVO> getOutProductList(String outNum);
	
	// 상품 이름 외 n건 
	public int getOutNumCount(String outNum);
	
	// 출고 수정
	public Integer outboundUpdate(OutboundVO vo);
	
	// 출고 삭제
	public Integer outboundDelete(String out_num);
	
	
	// 거래처 리스트
//	public List<OutboundVO> getCustomerList();
	
	// 페이징 목록 총 갯수 
	public int count() throws Exception;

}
