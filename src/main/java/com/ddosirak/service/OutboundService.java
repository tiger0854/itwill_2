package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.OutboundVO;

public interface OutboundService {
	
	// 출고 예정 등록
	public void outInsert(OutboundVO vo);

	// 출고 리스트
	public List<OutboundVO> getOutList(Map<String, Object> param);
	
	// 출고 버튼 클릭시 out_state 업데이트
	public void updateOutState(String out_num, int out_state);
	
	// 출고 번호에 따른 출고 상품 리스트
	public List<OutboundVO> getOutProductList(String out_num);
	
	// 상품 이름 외 n건 
	public int getOutNumCount(String out_num);
	
	// 출고 수정
	public Integer outboundUpdate(OutboundVO vo);
	
	// 출고 삭제
	public Integer outboundDelete(String out_num);

	// 출고 처리
	public Integer outProcessModify(OutboundVO vo);
	

}
