package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceService {
	
	// 실적등록
	public void insertProdPerf(ProductionPerformanceVO ivo);
	
	// 실적현황
	public List<ProductionPerformanceVO> prodPerfList(String wo_code);
	
	// 실적수정 조회
	public ProductionPerformanceVO perfUpdateList(int perf_id);
	
	// 실적수정 동작
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo);
	
	// 실적삭제 동작
	public Integer perfDeleteBoard(int perf_id);
}
