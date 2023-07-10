package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;

public interface OutboundDAO {
	
	// 출고 등록
	public void outInsert(OutboundVO vo);

	// 출고 리스트
	public List<OutboundVO> getOutList(Map<String, Object> param); 
	
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
	
	// 출고 처리
	public Integer outProcessModify(OutboundVO vo);
	
	// rec_code
	public String recCd(String out_num);

	// 수주 상태 수정(0)
	public void recStateUpdate(String re_code) throws Exception;

	// 수주 상태 수정(2)
	public void recStateUpdate2(String re_code) throws Exception;
	

	// 재고 리스트
	public List<OutboundVO> getStockList(String out_num);
	
	public Integer outCompleteToday() throws Exception;
	
	public Integer outScheduleToday() throws Exception;
	
}
