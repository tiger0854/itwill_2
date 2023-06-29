package com.ddosirak.persistance;

import java.util.List;


import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.OutboundListVO;
import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;

public interface OutboundDAO {
	
	// 출고 등록
	public void outInsert(OutboundVO vo);
	
	// 출고 리스트 출력(전체)
	public List<OutboundVO> getOutList(PageVO pageVO);
	
	// 출고 리스트 출력(진행중)
	public List<OutboundVO> getOngoingOutList(PageVO pageVO);
		
	// 출고 리스트 출력(완료)
	public List<OutboundVO> getCompletedOutList(PageVO pageVO);
	
	// 출고 버튼 클릭시 out_state 업데이트
	public void updateOutState(String out_num, int out_state);
	
	// 출고 번호에 따른 출고 상품 리스트
	public List<OutboundVO> getOutProductList(String out_num);
	
	// 상품 이름 외 n 건 
	public int getOutNumCount(String out_num);
	
	// 출고 수정
	public Integer outboundUpdate(OutboundVO vo);

	// 출고 삭제
	public Integer outboundDelete(String out_num); 
	

	

}
