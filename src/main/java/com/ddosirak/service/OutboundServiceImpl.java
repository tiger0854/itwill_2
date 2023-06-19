package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.OutboundVO;
import com.ddosirak.persistance.OutboundDAO;

@Service
public class OutboundServiceImpl implements OutboundService{

	@Inject
	private OutboundDAO odao;
	
	
	@Override
	public void outInsert(OutboundVO vo) {
		odao.outInsert(vo);
	}

	@Override
	public List<OutboundVO> getOutList() {
		return odao.getOutList();
	}
	
	// 진행중 출고 예정 리스트
	@Override
	public List<OutboundVO> getOngoingOutList() {
		return odao.getOngoingOutList(); // out_state가 1인 진행중인 리스트 반환
	}

	// 완료된 출고 예정 리스트
	@Override
	public List<OutboundVO> getCompletedOutList() {
		return odao.getCompletedOutList(); // out_state가 0인 완료된 리스트 반환
	}
	
	
	@Override
	public void updateOutState(Integer outNum, int newState) {
		odao.updateOutState(outNum, newState);	
	}

	
	
	
	

//	@Override
//	public List<OutboundVO> getCustomerList() {
//		return odao.getCustomerList();
//	}
	
	// 페이징 목록 총 갯수
	@Override
	public int count() throws Exception {
		return odao.count();
	}

	


	
	
	
}
