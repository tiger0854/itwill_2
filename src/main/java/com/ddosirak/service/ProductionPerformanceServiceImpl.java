package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.persistance.ProductionPerformanceDAO;

@Service
public class ProductionPerformanceServiceImpl implements ProductionPerformanceService {
	
	// DAO-Controller 연결
	
	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private ProductionPerformanceDAO ppdao; // 의존성 주입

	// 실적 등록
	@Override
	public void insertProdPerf(ProductionPerformanceVO ivo) {
		
		ppdao.insertProdPerf(ivo);
		
	}

	// 실적 현황
	@Override
	public List<ProductionPerformanceVO> prodPerfList() {
		
		return ppdao.prodPerfList();
		
	}
	
	
	
	
	
}
