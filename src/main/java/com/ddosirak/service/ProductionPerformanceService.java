package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceService {
	
	// 실적등록
	public void insertProdPerf(ProductionPerformanceVO ivo) throws Exception;
	
	// 실적현황
	public List<ProductionPerformanceVO> prodPerfList(Map<String, Object> instrSearch, String wo_code, PageVO pageVO);
	
	// 실적수정 조회
	public ProductionPerformanceVO perfUpdateList(int perf_id);
	
	// 실적수정 동작
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo);
	
	// 실적삭제 동작
	public void perfDeleteBoard(int perf_id);

	public void wostatusEnd(String wo_code);

	public Integer orderStatuscount(String wo_code);
	
	public String getWoMap(String wo_code);

}
