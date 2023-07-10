package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.OutboundVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.OutboundDAO;

@Service
public class OutboundServiceImpl implements OutboundService{

	@Inject
	private OutboundDAO odao;
	
	// 출고등록
	@Override
	public void outInsert(OutboundVO vo) {
		odao.outInsert(vo);
	}
	
	// 출고 리스트
	@Override
	public List<OutboundVO> getOutList(Map<String, Object> param) {
		return odao.getOutList(param);
	}
	
	// 출고 상태 업데이트 (진행중, 출고 완료)
	@Override
	public void updateOutState(String out_num, int out_state) {
		odao.updateOutState(out_num, out_state);	
	}

	// 출고 번호에 따른 출고 상품 목록
	@Override
	public List<OutboundVO> getOutProductList(String out_num) {
		
		return odao.getOutProductList(out_num);
	}
	
	// 재고 리스트
	@Override
	public List<OutboundVO> getStockList(String out_num) {
		return odao.getStockList(out_num);
	}

	// 외 n건
	@Override
    public int getOutNumCount(String out_num) {
		 int count = odao.getOutNumCount(out_num);
		    return count;
    }

	// 출고 수정
	@Override
	public Integer outboundUpdate(OutboundVO vo) {
		return odao.outboundUpdate(vo);
	}

	// 출고 삭제
	@Override
	public Integer outboundDelete(String out_num) {
		return odao.outboundDelete(out_num);
	}

	// 출고 처리
	@Override
	public Integer outProcessModify(OutboundVO vo) {
		return odao.outProcessModify(vo);
	}

	// re_code
	@Override
	public String recCd(String out_num) {
		return odao.recCd(out_num);
	}

	// 수주 상태 변경(0)
	@Override
	public void recStateUpdate(String re_code) throws Exception {
		odao.recStateUpdate(re_code);
		
	}
	
	//수주 상태 변경(2)
	@Override
	public void recStateUpdate2(String re_code) throws Exception {
		odao.recStateUpdate2(re_code);
		
	}

	// 당일 출고 현황
	@Override
	public List<Map<String, Object>> outGrp(OutboundVO vo) throws Exception {
		return odao.outGrp(vo);
	}

 

	




	


	
	
	
}
