package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceService {
	
	// 실적등록
	public void insertProdPerf(ProductionPerformanceVO ivo);
	
	// 실적현황
	public List<ProductionPerformanceVO> prodPerfList();
}
