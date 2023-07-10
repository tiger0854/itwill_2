package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;

public interface OutboundService {
	
	// 출고 예정 등록
	public void outInsert(OutboundVO vo);

	// 출고 리스트
	public List<OutboundVO> getOutList(Map<String, Object> param);

	// 재고 리스트
	public List<OutboundVO> getStockList(String out_num);
	
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

	// re_code
	public String recCd(String out_num);
	
	// 수주 상태 0으로 변경
	public void recStateUpdate(String re_code) throws Exception;
	
	// 수주 상태 2로 변경
	public void recStateUpdate2(String re_code) throws Exception;
	
	// 당일 출고 완료
	public Integer outCompleteToday() throws Exception;

	// 당일 출고 예정 
	public Integer outScheduleToday() throws Exception;
	
}
