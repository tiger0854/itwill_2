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
	
	// 진행중 출고 리스트
	@Override
	public List<OutboundVO> getOngoingOutList() {
		return odao.getOngoingOutList(); // out_state가 1인 진행중인 리스트 반환
	}

	// 완료된 출고 리스트
	@Override
	public List<OutboundVO> getCompletedOutList() {
		return odao.getCompletedOutList(); // out_state가 0인 완료된 리스트 반환
	}
	
	// 출고 상태 업데이트 (진행중, 출고 완료)
	@Override
	public void updateOutState(String outNum, int newState) {
		odao.updateOutState(outNum, newState);	
	}

	// 출고 번호에 따른 출고 상품 목록
	@Override
	public List<OutboundVO> getOutProductList(String outNum) {
		
		return odao.getOutProductList(outNum);
	}
	
	// 상품 이름 외 n건 
//	@Override
//    public int getOutNumCount(String outNum) {
//        return odao.getOutNumCount(outNum);
//    }
	
	@Override
    public int getOutNumCount(String outNum) {
		 int count = odao.getOutNumCount(outNum);
		    return count;
    }
	
//	public int calculateOutNumCount(String outNum) {
//	    // outNum을 사용하여 out_num 개수 계산 로직 구현
//	    // 예시로는 DAO 또는 데이터베이스 쿼리를 사용하여 out_num 개수를 가져오는 로직을 구현합니다.
//	    int count = odao.getOutNumCount(outNum);
//	    return count;
//	}
	
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
