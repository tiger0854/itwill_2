package com.ddosirak.service;

import java.util.List;

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
	
	// 전체 리스트
	@Override
	public List<OutboundVO> getOutList(PageVO pageVO) {
		return odao.getOutList(pageVO);
	}
	
	// 진행중 출고 리스트
	@Override
	public List<OutboundVO> getOngoingOutList(PageVO pageVO) {
		return odao.getOngoingOutList(pageVO); // out_state가 1인 진행중인 리스트 반환
	}

	// 완료된 출고 리스트
	@Override
	public List<OutboundVO> getCompletedOutList(PageVO pageVO) {
		return odao.getCompletedOutList(pageVO); // out_state가 0인 완료된 리스트 반환
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




	


	
	
	
}
