package com.ddosirak.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemRecipeListVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.persistance.ItemRecipeDAO;
import com.ddosirak.persistance.ProductionPerformanceDAO;

@Service
public class ProductionPerformanceServiceImpl implements ProductionPerformanceService {
	
	// DAO-Controller 연결
	public static final Logger logger = LoggerFactory.getLogger(ProductionPerformanceServiceImpl.class);

	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private ProductionPerformanceDAO ppdao; // 의존성 주입
	@Inject
	private ItemRecipeDAO rdao;
	
	// 실적 등록
	@Override
	public void insertProdPerf(ProductionPerformanceVO ivo) throws Exception {

		ppdao.insertProdPerf(ivo);
		
		
		List<ItemRecipeListVO> itemList = rdao.selectItemRecipe(ivo.getItem_code());
		for (ItemRecipeListVO item : itemList) {
		    // 수량을 빼는 로직을 구현합니다.
			String material_code = item.getMaterial_code();
			logger.debug("@@@@@@@@@@@@ meterial_code : "+material_code);
			String meterial_name = item.getMaterial_name();
		    int material_con = item.getMaterial_con()*ivo.getPfQTY();
		    // 수량을 빼는 처리를 수행합니다.
		    // 예: 해당 수량을 어떤 변수에서 차감하거나 다른 로직에 적용합니다.
		    Map<String, Object> params = new HashMap<>();
		    params.put("material_con", material_con);
		    params.put("material_code", material_code);
		    params.put("ivo", ivo);
		    ppdao.deltQTY(params);
		    
		}
		
		logger.debug("@@@@@@@@@@@@ getWo_code() : "+ivo.getWo_code());
		
		String wo_status = ppdao.getWoMap(ivo.getWo_code());
		logger.debug("@@@@@@@@@@@@ wo_status : "+wo_status);
		
		if(wo_status != null && !wo_status.isEmpty()) {
			if(wo_status.equals("지시")) { // 지시 상태면 
				ppdao.updateStart(ivo.getWo_code()); // 시작으로 변경
			}
		}
		
		
		if(ppdao.checkY(ivo.getWo_code())) { // 양품이 지시수량보다 같거나 많으면
			ppdao.updateClose(ivo.getWo_code()); // 마감으로 지시 상태 변경
		}


	}

	// 실적 현황
	@Override
	public List<ProductionPerformanceVO> prodPerfList(Map<String, Object> instrSearch,String wo_code,PageVO pageVO) {
		return ppdao.prodPerfList(instrSearch,wo_code, pageVO);
		
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

	@Override
	public Integer orderStatuscount(String wo_code) {
		return ppdao.orderStatuscount(wo_code);
	}

	@Override
	public String getWoMap(String wo_code) {
		return ppdao.getWoMap(wo_code);
	}

	
	
	
	
	
}
