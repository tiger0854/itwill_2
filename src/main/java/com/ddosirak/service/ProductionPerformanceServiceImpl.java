package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.persistance.ProductionPerformanceDAO;

@Service
public class ProductionPerformanceServiceImpl implements ProductionPerformanceService {
	
	// DAO-Controller 연결
	public static final Logger logger = LoggerFactory.getLogger(ProductionPerformanceServiceImpl.class);

	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private ProductionPerformanceDAO ppdao; // 의존성 주입
	
	// 실적 등록
	@Override
	public void insertProdPerf(ProductionPerformanceVO ivo) {
		
		ppdao.insertProdPerf(ivo);
		
		if(ppdao.checkY(ivo.getWo_code())) { // 양품이 지시수량보다 같거나 많으면
			ppdao.updateClose(ivo.getWo_code()); // 마감으로 지시 상태 변경
		}
		String wo_status = ppdao.getWoMap(ivo.getWo_code());
		logger.debug("@@@@@@@@@@@@ wo_status : "+wo_status);
		if(wo_status.equals("지시")) { // 지시 상태면 
			ppdao.updateStart(ivo.getWo_code()); // 시작으로 변경
		}

	}

	// 실적 현황
	@Override
	public List<ProductionPerformanceVO> prodPerfList(String wo_code) {
		return ppdao.prodPerfList(wo_code);
		
	}

	// 실적 수정 조회
	@Override
	public ProductionPerformanceVO perfUpdateList(int perf_id) {
		return ppdao.perfUpdateList(perf_id);
	}

	// 실적 수정 동작
	@Override
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo) {
		return ppdao.perfUpdateBoard(uvo);
	}

	// 실적 삭제 동작
	@Override
	public void perfDeleteBoard(int perf_id) {
		
		
		ProductionPerformanceVO pvo = ppdao.perfUpdateList(perf_id);
		logger.debug("pvo : "+pvo);
		String wo_code = pvo.getWo_code();
		String perf_gobd = pvo.getPerf_gobd();;
		logger.debug("perf_gobd : "+perf_gobd);
		// 불량이 아닐때만 생산수량에서 실적수량 감소
		if(perf_gobd.equals("n")) {
			ppdao.pfQTYDel(pvo);
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@ ppdao.pfQTYDel(pvo); "+perf_gobd);
		}
		
		ppdao.perfDeleteBoard(perf_id);
		
		if(ppdao.checkY(wo_code)==false) { // 양품이 지시수량보다 적으면
			ppdao.updateStart(wo_code); // 시작상태로 변경
			if(ppdao.getPrefCount(wo_code)==0) { // 실적이 하나도 없으면
				ppdao.updateInstr(wo_code); // 지시상태로 변경
			}
		}
		
		
	}

	@Override
	public void wostatusEnd(String wo_code) {
		ppdao.updateClose(wo_code);
	}

	
	
	
	
	
	
	
	
	
}
